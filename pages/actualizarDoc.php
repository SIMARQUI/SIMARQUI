<?php
require_once('../librerias/conexion.php');

$conexion = conectar();

$id_doc = $_REQUEST['id_doc'];
$cod_doc = $_REQUEST['cod_doc'];
$tipo = $_REQUEST['tipo'];
$fecha = $_REQUEST['fecha'];
$datos_registro = $_REQUEST['datos_registro'];
$abogado_redactor = $_REQUEST['abogado_redactor'];

$query = "update documento set cod_doc = '$cod_doc', tipo = '$tipo', fecha = '$fecha', datos_registro = '$datos_registro', abogado_redactor = '$abogado_redactor' where id_doc = '$id_doc'";

mysqli_query($conexion, $query) or die("Error al actualizar la tabla documento");
