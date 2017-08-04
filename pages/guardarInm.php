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

$consulta = "insert into inmueble (cod_inm, direccion, modo_adq, metraje, tipo_inm, descripcion, linderos, archiprestazgo, parroquia)
			values ('$cod_inm', '$direccion', '$modo_adq', '$metraje', '$tipo_inm', '$descripcion', '$linderos', '$archiprestazgo', '$parroquia')";

mysqli_query($conexion, $consulta) or die("Error en la insercion de inmueble");

$id_inm = mysqli_insert_id($conexion);
