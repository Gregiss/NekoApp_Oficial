<?php
$nekoapp = '404';
include('../../assets/includes/app_start.php');
header('Content-Type: application/json');

if(isset($_COOKIE['iduser'],$_COOKIE['cry'])){
    $mysqli = new mysqli($sql_db_host, $sql_db_user, $sql_db_pass, $sql_db_name);
    $server_id = $_GET['id'];
    $myArray = array();
    // if ($result1 = $mysqli->query("SELECT * FROM server")) {
    //     while($row = $result1->fetch_array(MYSQLI_ASSOC)) {
    //             $myArray[] = $row;          
    //     }
    // }

    if ($result = $mysqli->query("SELECT * FROM mensagem_server where id_server = '$server_id' inner join user on user.id = mensagem_server.id_user  "  )) {
        while($row = $result->fetch_array(MYSQLI_ASSOC)) {
                $myArray[] = $row;
        }
    }
    echo json_encode($myArray);

}