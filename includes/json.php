<?php

if($_GET['graph'] == 1) {
    $firstArray = [rand(1,40),rand(1,40),rand(1,40),rand(1,40),rand(1,40),rand(1,40),rand(1,40),rand(1,40),rand(1,40)];
    $secondArray = [rand(1,40),rand(1,40),rand(1,40),rand(1,40),rand(1,40),rand(1,40),rand(1,40),rand(1,40),rand(1,40)];
    $multipleArray = ["array1"=> $firstArray, "array2" => $secondArray];
    print_r(json_encode($multipleArray));

}

if($_GET['graph'] == 2){
    $secondGraph = [3,6,7,8,6,4,7,10,12,7,4,9,12,13,11,12];
    $multipleArray = ["array1"=> $secondGraph];
    print_r(json_encode($multipleArray));
}
