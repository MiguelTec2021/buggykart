<?php

date_default_timezone_set('America/Mexico_City');
$fecha  = date("Y-m-d");
$hora = date("g:i a");

$letras = '1234567890qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM';
$codigo = '';

for($i=0; $i<03; $i++){
    $codigo .= substr($letras, rand(0,62), 1);
}

$new_image_name = $codigo.".jpg";

$file_name = $new_image_name;
$final = 'jpg';
$file_tmp = $_FILES["file"]["tmp_name"];

$dir = 'fotos/'.$new_image_name;
$copiar = move_uploaded_file($_FILES["file"]["tmp_name"], $dir);

if ($copiar) {
    echo $new_image_name;
}else{
    echo 'Error';
}




?>