package main

import (
	"bytes"
	"flag"
	"fmt"
	"io/ioutil"
	"log"
	"os"
	"os/exec"
	"os/user"
	"path"
	"runtime"
	"strings"
	"syscall"
	"time"
)

// Project variables
const projectName = "cgifarm-dashboard"

var (
	verbose    = flag.Bool("v", false, "be more verbose")
	quiet      = flag.Bool("quiet", false, "only print failures")
	clean      = flag.Bool("clean", false, "clean build files and exit")
	docker     = flag.String("docker", "", "if non-empty, a docker container will be build with this name")
	dockerPush = flag.Bool("docker-push", false, "push buit docker image")
	notDev     = flag.Bool("not-dev", false, "don't add dev suffix to version on a dirty cwd or non-tagged commit")

	buildDate time.Time

	projectRoot         string
	nodeModulesPath     string
	bowerComponentsPath string
	buildPath           string

	version  string
	revision string
	dev      bool
)

func usage() {
	fmt.Fprintf(os.Stderr, "Usage: go run make.go [options]\n")
	fmt.Fprint(os.Stderr, "options:\n")
	flag.PrintDefaults()
	os.Exit(2)
}

func main() {
	log.SetFlags(0)
	flag.Usage = usage
	flag.Parse()

	// Make sure we're being run by go run
	checkGoRun()

	// Resolve absolute paths
	resolvePaths()

	// Determine the version of the project
	determineVersion()

	log.Print(projectName, " version ", version)

	if *clean {
		cleanBuild()
		return
	}

	buildDate = time.Now()
	log.Printf("build started at %s", buildDate)

	// Build the project
	build()

	log.Printf("build complete after %s", time.Now().Sub(buildDate))

	if *docker == "" {
		return
	}

	// Build docker container
	buildContainer()
	if *dockerPush {
		pushContainer()
	}

	log.Printf("done after %s", time.Now().Sub(buildDate))
}

// checkGoRun checks if this file was run with go run, if not, it fatals
func checkGoRun() {
	parentPID := os.Getppid()
	parentCmdLine, err := ioutil.ReadFile(fmt.Sprintf("/proc/%d/cmdline", parentPID))
	if err != nil {
		log.Fatal("Couldn't read parent cmdline: ", err)
	}

	if !bytes.HasPrefix(parentCmdLine, []byte("go\x00run\x00")) {
		log.Fatal("make.go should not be build, but with `go run make.go`")
	}
}

// resolvePaths generates all the paths needed for building
func resolvePaths() {
	_, file, _, ok := runtime.Caller(0)
	if !ok {
		log.Fatal("Couldn't get project root path")
	}

	projectRoot = path.Dir(file)

	nodeModulesPath = path.Join(projectRoot, "node_modules")
	bowerComponentsPath = path.Join(projectRoot, "bower_components")
	buildPath = path.Join(projectRoot, "build")
}

// determineVersion determines the version and revision of the project being built
func determineVersion() {
	lastCommit, lastTag, commitsSinceTag, dirty := gitInfo()

	version = "0.0.0"
	revision = lastCommit
	if lastTag != "" {
		version = strings.TrimPrefix(lastTag, "v")
		revision = lastTag
		if commitsSinceTag > 0 {
			revision = fmt.Sprintf("%s-%d-%s", lastTag, commitsSinceTag, lastCommit)
		}
	}

	if (commitsSinceTag > 0 || dirty) && !*notDev {
		dev = true
		version += "-dev"
	}

	if dirty {
		revision += "-dirty"
	}
}

// gitInfo gets the current git revision in a somewhat readable form
func gitInfo() (string, string, int, bool) {
	// Get last tag
	lastTag, err := cmdOut("git", "describe", "--tags", "--abbrev=0")
	if err != nil && *verbose {
		log.Print("Couldn't get last tag: ", err)
	}

	tagRange := "HEAD"
	if lastTag != "" {
		tagRange = lastTag + "..HEAD"
	}

	// Get commits since last tag
	commitLines, err := cmdOut("git", "log", "--pretty=format:%h", tagRange)
	if err != nil {
		log.Fatal("Couldn't get commits since last tag: ", err)
	}

	var commitsSinceTag int
	var lastCommit string
	if len(commitLines) != 0 {
		commitsSinceTag = strings.Count(commitLines, "\n") + 1

		commits := strings.Split(commitLines, "\n")
		lastCommit = commits[len(commits)-1]
	} else {
		lastCommit, err = cmdOut("git", "log", "--pretty=format:%h", "-n", "1")
		if err != nil {
			log.Fatal("Couldn't get last commit id: ", err)
		}
	}

	changes, _ := cmdOut("git", "status", "--porcelain")
	dirty := len(changes) > 0

	return lastCommit, lastTag, commitsSinceTag, dirty
}

// utsString transforms a [65]int8 from syscall.Uname into a string
func utsString(val [65]int8) string {
	var byteStr []byte

	for _, b := range val {
		if b == 0 {
			break
		}
		byteStr = append(byteStr, byte(b))
	}

	return string(byteStr)
}

// buildHost gets the current host's info
func buildHost() (string, string) {
	username := "unknown"
	if user, err := user.Current(); err == nil {
		username = user.Username
	}

	var uname syscall.Utsname
	err := syscall.Uname(&uname)
	if err != nil {
		return username, ""
	}
	hostname := utsString(uname.Nodename)
	release := utsString(uname.Release)
	domain := utsString(uname.Domainname)

	if len(domain) > 0 && domain[0] != '(' {
		hostname += "." + domain
	}

	return username + "@" + hostname, fmt.Sprintf("%s/%s %s", runtime.GOOS, runtime.GOARCH, release)
}

// cleanBuild removes all build files
func cleanBuild() {
	log.Print("cleaning build files")

	for _, path := range []string{nodeModulesPath, bowerComponentsPath, buildPath} {
		err := os.RemoveAll(path)
		if err != nil {
			log.Fatalf("Couldn't delete build directory: %v", err)
		}
	}
}

// build builds the project
func build() {
	//host, hostOS := buildHost()
	//ldFlags := []string{
	//	fmt.Sprintf("-X \"%s/pkg/buildinfo.Version=%s\"", projectImportPath, version),
	//	fmt.Sprintf("-X \"%s/pkg/buildinfo.GitRevision=%s\"", projectImportPath, revision),
	//	fmt.Sprintf("-X \"%s/pkg/buildinfo.BuildDate=%s\"", projectImportPath, buildDate),
	//	fmt.Sprintf("-X \"%s/pkg/buildinfo.BuildHost=%s\"", projectImportPath, host),
	//	fmt.Sprintf("-X \"%s/pkg/buildinfo.BuildOS=%s\"", projectImportPath, hostOS),
	//}

	runCmd(true, nil, "docker", "run", "--rm", "-v", projectRoot+":/frontend", "node:latest",
		"sh", "-c", "cd /frontend; npm install; node_modules/.bin/bower --allow-root install; node_modules/.bin/brunch b")
}

// runCmd runs a command with the provided environment and arguments
func runCmd(silent bool, env []string, cmd string, args ...string) {
	ecmd := exec.Command(cmd, args...)
	if env != nil {
		ecmd.Env = env
	}

	if *verbose {
		log.Printf("running %s %q", cmd, args)
	}

	var output bytes.Buffer
	if *quiet || (silent && !*verbose) {
		ecmd.Stdout = &output
		ecmd.Stderr = &output
	} else {
		ecmd.Stdout = os.Stdout
		ecmd.Stderr = os.Stderr
	}

	if err := ecmd.Run(); err != nil {
		if *quiet {
			log.Fatalf("error running %s %q: %v\n%s", cmd, args, err, output.String())
		} else {
			log.Fatalf("error running %s %q: %v\n", cmd, args, err)
		}
	}
}

// cmdOut runs a command and returns its output
func cmdOut(cmd string, args ...string) (string, error) {
	if *verbose {
		log.Printf("running %s %q", cmd, args)
	}

	out, err := exec.Command(cmd, args...).CombinedOutput()
	if err != nil {
		return "", err
	}
	return string(bytes.TrimSpace(out)), nil
}

// buildContainer builds a docker container for the resulting build
func buildContainer() {
	log.Print("building docker image ", *docker)
	runCmd(true, nil, "docker", "build", "--no-cache", "-t", *docker, projectRoot)

	tags := dockerTags()

	log.Print("applying tags to docker image: ", strings.Join(tags, ", "))
	for _, tag := range tags {
		runCmd(true, nil, "docker", "tag", *docker, *docker+":"+tag)
	}

}

// dockerTags finds the tags that need to be applied to the docker container
func dockerTags() []string {
	nameParts := strings.SplitN(version, "-", 2)
	versionParts := strings.Split(nameParts[0], ".")

	var tags []string
	if len(nameParts) == 2 {
		tags = append(tags, nameParts[1])
	}

	var tag string
	for _, part := range versionParts {
		if tag == "" {
			tag = "v" + part
		} else {
			tag = tag + "." + part
		}

		currentTag := tag
		if len(nameParts) == 2 {
			currentTag = tag + "-" + nameParts[1]
		}

		tags = append(tags, currentTag)
	}

	return tags
}

// pushContainer pushes the built container
func pushContainer() {
	log.Print("pushing docker container")

	if !dev {
		runCmd(true, nil, "docker", "push", *docker)
	}

	for _, tag := range dockerTags() {
		runCmd(true, nil, "docker", "push", *docker+":"+tag)
	}
}
