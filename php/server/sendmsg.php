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
    $id_server = $_GET['server'];
    $mensagem = "";
    if(isset($_GET['mensagem'])){
        $mensagem = $_GET['mensagem'];
    }
    $gif = "";
    if(isset($_GET['gif'])){
        $gif = $_GET['gif'];
    }

    if(isset($_GET['mencionando'])){
        $idMenc = $_GET['mencionando'];
    } else{
        $idMenc = -1;
    }
    $memeImg = "";
    if($mensagem === "/nokpop"){
        $memeImg = "/images/memes/1.jpg";
        $sql = "INSERT INTO mensagem_server (id_user, id_server, mensagem, mencionar, imagem)
    VALUES (100000, '".$id_server."', '', '".$idMenc."' , '".$memeImg."' )";
    if (mysqli_query($conn, $sql)) {

    }
    } else if($mensagem === "/yeskpop"){
        $memeImg = "/images/memes/2.png";
        $sql = "INSERT INTO mensagem_server (id_user, id_server, mensagem, mencionar, imagem)
    VALUES (100000, '".$id_server."', '', '".$idMenc."' , '".$memeImg."' )";
    if (mysqli_query($conn, $sql)) {

    }
    } else if($mensagem === "/realshit"){
        $memeImg = "/images/memes/3.png";
        $sql = "INSERT INTO mensagem_server (id_user, id_server, mensagem, mencionar, imagem)
    VALUES (100000, '".$id_server."', '', '".$idMenc."' , '".$memeImg."' )";
    if (mysqli_query($conn, $sql)) {

    }
    }    
    if($memeImg === ""){
    $sql = "INSERT INTO mensagem_server (id_user, id_server, mensagem, mencionar, imagem)
    VALUES ('".$owner."', '".$id_server."', '".$mensagem."' , '".$idMenc."' , '".$gif."')";
    if (mysqli_query($conn, $sql)) {
        echo "sucess";
        if($mensagem === "/clear"){
            $result_usuario = "SELECT * FROM server WHERE id = '$id_server' and owner = '$owner' LIMIT 1";
            $resultado_usuario = mysqli_query($conn, $result_usuario);
            $resultado = mysqli_fetch_assoc($resultado_usuario);
            $mysqli = new mysqli($sql_db_host, $sql_db_user, $sql_db_pass, $sql_db_name);
            $result_usuario2= "SELECT * FROM user WHERE id = '$owner' LIMIT 1";
            $resultado_usuario2 = mysqli_query($conn, $result_usuario2);
            $resultado2 = mysqli_fetch_assoc($resultado_usuario2);
            if(isset($resultado) || $resultado2['admin'] == 1){
            $sql = "DELETE FROM mensagem_server WHERE id_server = '$id_server'";
            if ($conn->query($sql) === TRUE) {
                $sql = "INSERT INTO mensagem_server (id_user, id_server, mensagem)
                VALUES ('".$owner."', '".$id_server."', 'As mensagems foram apagadas')";
                if (mysqli_query($conn, $sql)) {
                    echo "";
                }
            } else {
                echo "Error deleting record: " . $conn->error;
            }
        } else{
            echo "not_perm";
        }
        }
    } else{
        echo "error";
    }
}
}
}

//'".$owner."', '".$id_server."', '".$mensagem."''