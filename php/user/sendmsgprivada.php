<?php
$nekoapp = '404';
include('../../assets/includes/app_start.php');
if(isset($_COOKIE['iduser'],$_COOKIE['cry'])){
    $iduser = $_COOKIE['iduser'];
$cry = $_COOKIE['cry'];
$result_usuario = "SELECT * FROM user WHERE id = '$iduser' and idcry = '$cry' LIMIT 1";
$resultado_usuario = mysqli_query($conn, $result_usuario);
$user = mysqli_fetch_assoc($resultado_usuario);
if(isset($user)){
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
}