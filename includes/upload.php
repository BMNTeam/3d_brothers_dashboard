<?php
/**
 * Created by PhpStorm.
 * User: Максим
 * Date: 15.01.2017
 * Time: 15:15
 */

$ds          = DIRECTORY_SEPARATOR;  //1

$storeFolder = 'uploads';   //2

$prefix_name = $_POST['prefix'];
$useAsPrefix = $_POST['checked'];
$package_name = $_POST['package_name'];



if (!empty($_FILES)) {

    $tempFile = $_FILES['file']['tmp_name'];          //3

    $targetPath = dirname( __FILE__ ) . $ds. $storeFolder . $ds;  //4


    if( empty($prefix_name))
    {
        $targetFile =  $targetPath. $_FILES['file']['name'];  //5
    }
    elseif( !empty($prefix_name) && $useAsPrefix == 0 )
    {
        $targetFile =  $targetPath. $prefix_name. '.zip';
    }
    elseif(! empty($useAsPrefix) && $useAsPrefix == 1 )
    {
        $targetFile =  $targetPath. $prefix_name."_".$_FILES['file']['name'];
    }

    move_uploaded_file($tempFile,$targetFile); //6

    print_r($package_name);

}
?>