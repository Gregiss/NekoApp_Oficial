<?php
$nekoapp = '404';
include('../../assets/includes/app_start.php');

if(isset($_COOKIE['iduser'],$_COOKIE['cry'])){
    $mysqli = new mysqli($sql_db_host, $sql_db_user, $sql_db_pass, $sql_db_name);
    $owner = $_COOKIE['iduser'];
    $quem = $_GET['quem'];
    $result_usuario = "SELECT * FROM notifications where id_user = '$quem' and id_quem = '$owner'";
    $resultado_usuario = mysqli_query($conn, $result_usuario);
    $user = mysqli_fetch_assoc($resultado_usuario);
    if ($user) {
        $sql = "UPDATE notifications SET aceito = 1 where id_quem = '$owner' and id_user = '$quem'";
        if ($conn->query($sql) === TRUE) {
            echo "delete";
        } else {
            echo "Error deleting record: " . $conn->error;
        }
    } 
}

