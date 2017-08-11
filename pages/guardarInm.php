<?php
session_start();

if(!isset($_SESSION['usuario']))
	header('location: login.php');

include('../librerias/conexion.php');
$conexion = conectar();

$cod_inm		= $_REQUEST['cod_inm'];
$archiprestazgo = $_REQUEST['archiprestazgo'];
$parroquia 		= $_REQUEST['parroquia'];
$direccion 		= $_REQUEST['direccion'];
$modo_adq 		= $_REQUEST['modo_adq'];
$metraje 		= $_REQUEST['metraje'];
$tipo_inm 		= $_REQUEST['tipo_inm'];
$linderos 		= $_REQUEST['linderos'];
$descripcion 	= $_REQUEST['descripcion'];
$fecha 			= $_REQUEST['fecha'];
$datos_registro = $_REQUEST['datos_registro_doc'];
$abogado_redactor = $_REQUEST['abogado_redactor_doc'];

$consulta = "insert into inmueble (cod_inm, direccion, modo_adq, metraje, tipo_inm, descripcion, linderos, archiprestazgo, parroquia, fecha, datos_registro, abogado_redactor)
			values ('$cod_inm', '$direccion', '$modo_adq', '$metraje', '$tipo_inm', '$descripcion', '$linderos', '$archiprestazgo', '$parroquia', '$fecha', '$datos_registro', '$abogado_redactor')";

mysqli_query($conexion, $consulta) or die("Error en la insercion de inmueble");

$id_inm = mysqli_insert_id($conexion);
