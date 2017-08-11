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
$fecha 			= $_REQUEST['fecha'];
$datos_registro = $_REQUEST['datos_registro_doc'];
$abogado_redactor = $_REQUEST['abogado_redactor_doc'];

if ($fecha) {
    $fecha = date_create_from_format("d-m-Y", $fecha);
    if ($fecha) {
        $fecha = $fecha->format('Y-m-d');
    }
}

$query = "update inmueble set cod_inm = '$cod_inm', direccion = '$direccion', modo_adq = '$modo_adq', metraje = '$metraje', tipo_inm = '$tipo_inm', linderos = '$linderos', descripcion = '$descripcion', archiprestazgo = '$archiprestazgo', parroquia = '$parroquia', fecha = '$fecha', datos_registro = '$datos_registro', abogado_redactor = '$abogado_redactor' where id_inm = $id_inm";

mysqli_query($conexion, $query);
