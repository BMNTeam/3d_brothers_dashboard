pixelAdmin = require './vendor/pixel-admin/pixel-admin'

exports.config =
  paths:
    public: 'build'
    watched: ['app', 'vendor']

  conventions:
    ignored: (path) ->
      switch
        # Ignore files which start with a _
        when /(^_|\/_)/.test path
          true

        # Only load specific pixel-admin files
        when path.indexOf('vendor/pixel-admin/javascripts') == 0
          path[31..] not in pixelAdmin.javascripts

        when path.indexOf('vendor/pixel-admin/stylesheets') == 0
          path[31..] not in pixelAdmin.stylesheets

        else
          false

  files:
    javascripts:
      joinTo:
        'javascripts/application.js': /^app/
        'javascripts/vendor.js': (path) ->
          switch
            # Load everything from bower_components
            when path.indexOf('bower_components') == 0
              true

            # Only load specific pixel-admin javascripts
            when path.indexOf('vendor/pixel-admin/') == 0
              path[31..] in pixelAdmin.javascripts

            # Load everything else from the vendor directory
            when path.indexOf('vendor/') == 0
              true

            else false

        # Internet explorer specific javascripts
        'javascripts/ie.js': (path) ->
          pixelAdmin.ieJS.indexOf path[31..] >= 0

      order:
        # Make sure we load the pixel-admin javascripts in the right order
        after: pixelAdmin.javascripts.map((script) ->
          'vendor/pixel-admin/javascripts/' + script
        ).concat [
          'vendor/jq-fileupload/jquery.iframe-transport.js'
          'vendor/jq-fileupload/jquery.fileupload.js'
        ]
    stylesheets:
      joinTo:
        'stylesheets/application.css': /^app/
        'stylesheets/vendor.css': (path) ->
          switch
            # Load everything from bower_components
            when path.indexOf('bower_components') == 0
              true

            # Only load specific pixel-admin stylesheets
            when path.indexOf('vendor/pixel-admin/') == 0
              path[31..] in pixelAdmin.stylesheets

            # Load everything else from the vendor directory
            when path.indexOf('vendor/') == 0
              true

            else
              false

    templates:
      joinTo: 'javascripts/application.js'

  overrides:
    production:
      paths:
        public: 'release'

      optimize: true
      sourceMap: false

      plugins:
        uglify:
          mangle: false
          compress:
            global_defs:
              DEBUG: false

        cleancss:
          keepSpecialComments: 0
          removeEmpty: true

        autoReload:
          enabled: false

exports.config
