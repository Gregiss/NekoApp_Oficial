<?php
$nekoapp = '404';
include('../../assets/includes/app_start.php');
if(isset($_COOKIE['iduser'],$_COOKIE['cry'])){
    $owner = $_COOKIE['iduser'];
    $id_quem = $_GET['id'];
    $mensagem = $_GET['mensagem'];
    $sql = "INSERT INTO msg (id_user, id_quem, mensagem)
    VALUES ('".$owner."', '".$id_quem."', '".$mensagem."')";
    if (mysqli_query($conn, $sql)) {
        echo "sucess";
    } else{
        echo "error";
    }
}