<?php
$nekoapp = '404';
include('../../assets/includes/app_start.php');
if(isset($_COOKIE['iduser'],$_COOKIE['cry'])){
    $owner = $_COOKIE['iduser'];
    $id_server = $_GET['server'];
    $mensagem = $_GET['mensagem'];
    if(isset($_GET['mencionando'])){
        $idMenc = $_GET['mencionando'];
    } else{
        $idMenc = -1;
    }
    $sql = "INSERT INTO mensagem_server (id_user, id_server, mensagem, mencionar)
    VALUES ('".$owner."', '".$id_server."', '".$mensagem."', '".$idMenc."')";
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
                    echo "Mensagem deleted :D";
                }
            } else {
                echo "Error deleting record: " . $conn->error;
            }
        }
        }
    } else{
        echo "error";
    }
}

//'".$owner."', '".$id_server."', '".$mensagem."''