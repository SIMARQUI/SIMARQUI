<?php
require_once '../librerias/conexion.php';
$conexion = conectar();

$id_doc = $_REQUEST['id_doc'];

$registros = mysqli_query($conexion, "select * from documento where id_doc = '$id_doc'");
$fila = mysqli_fetch_array($registros);

echo json_encode($fila);
?>
