<?php
$nekoapp = '404';
include('../../assets/includes/app_start.php');
if(isset($_COOKIE['iduser'],$_COOKIE['cry'])){
    $owner = $_COOKIE['iduser'];
    $name = $_GET['name'];
    $sql = "INSERT INTO server (name, owner)
    VALUES ('".$name."', '".$owner."')";
    if (mysqli_query($conn, $sql)) {
        echo "sucess";
    } else{
        echo "error";
    }
}

//'".$owner."', '".$id_server."', '".$mensagem."''