<?php
$nekoapp = '404';
include('../../assets/includes/app_start.php');
if(isset($_COOKIE['iduser'],$_COOKIE['cry'])){
    $owner = $_COOKIE['iduser'];
    $id_quem = $_GET['id'];
    $mensagem = $_GET['mensagem'];
    $mensagem = "";
    if(isset($_GET['mensagem'])){
        $mensagem = $_GET['mensagem'];
    }
    $gif = "";
    if(isset($_GET['gif'])){
        $gif = $_GET['gif'];
    }
    $sql = "INSERT INTO msg (id_user, id_quem, mensagem, imagem)
    VALUES ('".$owner."', '".$id_quem."', '".$mensagem."', '".$gif."')";
    if (mysqli_query($conn, $sql)) {
        echo "sucess";
    } else{
        echo "error";
    }
}