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
    $name = $_GET['name'];
    $sql = "INSERT INTO server (name, owner)
    VALUES ('".$name."', '".$owner."')";
    if (mysqli_query($conn, $sql)) {
        echo "sucess";
    } else{
        echo "error";
    }
}
}

//'".$owner."', '".$id_server."', '".$mensagem."''