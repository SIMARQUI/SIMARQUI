<?php
session_start();

if(!isset($_SESSION['usuario']))
	header('location: login.php');

include('../librerias/conexion.php');
$conexion = conectar();

$cod_doc 		= $_REQUEST['cod_doc'];
$tipo 			= $_REQUEST['tipo'];
$fecha 			= $_REQUEST['fecha'];
$datos_registro = $_REQUEST['datos_registro'];
$abogado_redactor 	= $_REQUEST['abogado_redactor'];

$consulta = "insert into documento (cod_doc, tipo, fecha, datos_registro, abogado_redactor)
			values ('$cod_doc', '$tipo', '$fecha', '$datos_registro', '$abogado_redactor')";

//ADD

//comprobamos si existe un directorio para subir el archivo
//si no es así, lo creamos

move_uploaded_file($_FILES['archivo_doc']['tmp_name'],"C:/wamp/www/scnueva/pdf/".$id_doc.".pdf");
//FIN ADD

mysqli_query($conexion, $consulta) or die(mysqli_error($conexion));
