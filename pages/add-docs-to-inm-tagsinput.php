<?php

	session_start();
	
	if(!isset($_SESSION['usuario']))
		header('location: login.php');

	include('../librerias/conexion.php');
	include('../librerias/utiles.php');

	$conexion = conectar();
	
	$id_inm = $_REQUEST['id_inm'];
	//$id_inm = $_REQUEST['id_inm'];
	
	foreach($_REQUEST['ids_docs'] as $id_doc){
		$consulta = "insert into se_refiere values ('$id_doc', $id_inm)";
		mysqli_query($conexion, $consulta) or die('error');
	}
	
?>