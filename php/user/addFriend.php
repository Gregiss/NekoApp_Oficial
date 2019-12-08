<?php
$nekoapp = '404';
include('../../assets/includes/app_start.php');

if(isset($_COOKIE['iduser'],$_COOKIE['cry'])){
    $mysqli = new mysqli($sql_db_host, $sql_db_user, $sql_db_pass, $sql_db_name);
    $owner = $_COOKIE['iduser'];
    $quem = $_GET['quem'];
    $result_usuario = "SELECT * FROM notifications where id_quem = '$quem' and id_user = '$owner'";
    $resultado_usuario = mysqli_query($conn, $result_usuario);
    $user = mysqli_fetch_assoc($resultado_usuario);
    if ($user) {
        $sql = "DELETE FROM notifications WHERE id_user = '$owner' and id_quem = '$quem'";
        if ($conn->query($sql) === TRUE) {
            echo "delete";
        } else {
            echo "Error deleting record: " . $conn->error;
        }
    } 
    else{
    if ($result = $mysqli->query("SELECT id, nome, admin, status,avatar FROM user where id = '$owner'")) {
    $sql = "INSERT INTO notifications (id_user, id_quem, tipo, ativo, aceito)
    VALUES ('".$owner."', '".$quem."', 1, 1, 0)";
    if (mysqli_query($conn, $sql)) {
        echo "sucess";
    } else{
        echo "error";
    }
}
}
}