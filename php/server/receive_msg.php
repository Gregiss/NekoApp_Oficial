<?php
$nekoapp = '404';
include('../../assets/includes/app_start.php');
header('Content-Type: application/json');

$server_id = 0;
if(isset($_GET['id'])){
    $server_id = $_GET['id'];
}
$iduser = 0;

if(isset($_GET['iduser'])){
    $iduser = $_GET['iduser'];
}

if(isset($_COOKIE['iduser'],$_COOKIE['cry'])){
    $mysqli = new mysqli($sql_db_host, $sql_db_user, $sql_db_pass, $sql_db_name);
    $eu = $_COOKIE['iduser'];
    $myArray = array();
    if(isset($_GET['iduser'])) {
        if ($result = $mysqli->query("SELECT * FROM msg where id_user = '$eu' and id_quem = '$iduser' or id_quem = '$eu' and id_user = '$iduser'")) {
            while($row = $result->fetch_array(MYSQLI_ASSOC)) {
                    $myArray[] = $row;
            }
            echo json_encode($myArray);
        }
    } else{
    if ($result = $mysqli->query("SELECT * FROM mensagem_server where id_server = '$server_id'")) {
        while($row = $result->fetch_array(MYSQLI_ASSOC)) {
                $myArray[] = $row;
        }
        echo json_encode($myArray);
    }
}
}