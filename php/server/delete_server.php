<?php
$nekoapp = '404';
include('../../assets/includes/app_start.php');
header('Content-Type: application/json');

if(isset($_COOKIE['iduser'],$_COOKIE['cry'])){
    $iduser = $_COOKIE['iduser'];
    $idServer = $_GET['server'];
    $result_usuario = "SELECT * FROM server WHERE id = '$idServer' and owner = '$iduser' LIMIT 1";
    $resultado_usuario = mysqli_query($conn, $result_usuario);
    $resultado = mysqli_fetch_assoc($resultado_usuario);
    $mysqli = new mysqli($sql_db_host, $sql_db_user, $sql_db_pass, $sql_db_name);
    if(isset($resultado)){
        // sql to delete a record
        $sql = "DELETE FROM server WHERE id= '$idServer'";

        if ($conn->query($sql) === TRUE) {
            echo "Server sucess deleted";
        } else {
            echo "Error deleting record: " . $conn->error;
        }
    }
}
   