<?php
require_once('../librerias/conexion.php');

$conexion = conectar();

$id_inm = $_REQUEST['id_inm'];
$cod_inm = $_REQUEST['cod_inm_edit'];
$archiprestazgo = $_REQUEST['archiprestazgo'];
$parroquia = $_REQUEST['parroquia'];
$direccion = $_REQUEST['direccion'];
$modo_adq = $_REQUEST['modo_adq'];
$metraje = $_REQUEST['metraje'];
$tipo_inm = $_REQUEST['tipo_inm'];
$linderos = $_REQUEST['linderos'];
$descripcion = $_REQUEST['descripcion'];

$query = "update inmueble set cod_inm = '$cod_inm', direccion = '$direccion', modo_adq = '$modo_adq', metraje = '$metraje', tipo_inm = '$tipo_inm', linderos = '$linderos', descripcion = '$descripcion', archiprestazgo = '$archiprestazgo', parroquia = '$parroquia' where id_inm = $id_inm";

mysqli_query($conexion, $query);
