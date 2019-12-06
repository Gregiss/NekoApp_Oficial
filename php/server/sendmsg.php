<?php
$nekoapp = '404';
include('../../assets/includes/app_start.php');
if(isset($_COOKIE['iduser'],$_COOKIE['cry'])){
    $owner = $_COOKIE['iduser'];
    $id_server = $_GET['server'];
    $mensagem = $_GET['mensagem'];
    $sql = "INSERT INTO mensagem_server (id_user, id_server, mensagem)
    VALUES ('".$owner."', '".$id_server."', '".$mensagem."')";
    if (mysqli_query($conn, $sql)) {
        echo "sucess";
    } else{
        echo "error";
    }
}

//'".$owner."', '".$id_server."', '".$mensagem."''