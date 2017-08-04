<?php
require_once '../librerias/conexion.php';
$conexion = conectar();

$id_inm = $_REQUEST['id_inm'];

$registros = mysqli_query($conexion, "select * from inmueble where id_inm = $id_inm");
$fila = mysqli_fetch_array($registros);

echo json_encode($fila);
