<?php
$nekoapp = '404';
include('../../assets/includes/app_start.php');
header('Content-Type: application/json');
if(isset($_COOKIE['iduser'],$_COOKIE['cry'])){
$iduser = $_COOKIE['iduser'];
$cry = $_COOKIE['cry'];
$result_usuario = "SELECT * FROM user WHERE id = '$iduser' and idcry = '$cry' LIMIT 1";
$resultado_usuario = mysqli_query($conn, $result_usuario);
$user = mysqli_fetch_assoc($resultado_usuario);
if(isset($user)){
$mysqli = new mysqli($sql_db_host, $sql_db_user, $sql_db_pass, $sql_db_name);
    $userId = $_COOKIE['iduser'];
    $myArray = array();
    if ($result = $mysqli->query("SELECT id, nome, admin, status,avatar FROM user where id = '$userId'")) {
        while($row = $result->fetch_array(MYSQLI_ASSOC)) {
        $myArray = $row;
        }
        echo json_encode($myArray);
}
} else{
    $error = array();
    $error = "404";
    echo json_encode($error);
}
}