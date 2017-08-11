<?php
require_once '../librerias/conexion.php';
$conexion = conectar();

$id_inm = $_REQUEST['id_inm'];

$registros = mysqli_query($conexion, "select * from inmueble where id_inm = $id_inm");
$fila = mysqli_fetch_array($registros);

$fecha = date_create_from_format("Y-m-d", $fila['fecha']);
if ($fecha) {
    $fila['fecha'] = $fecha->format('d-m-Y');
}

echo json_encode($fila);
