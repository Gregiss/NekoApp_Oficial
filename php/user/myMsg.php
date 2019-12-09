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
$eu = $_COOKIE['iduser'];
if ($result = $mysqli->query("SELECT * FROM msg where id_quem = '$eu' group by id_user")) {
            while($row = $result->fetch_array(MYSQLI_ASSOC)) {
                    $myArray[] = $row;
            }
            echo json_encode($myArray);
}
}
}