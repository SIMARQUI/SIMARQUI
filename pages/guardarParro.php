<?php
	session_start();
	
	if(!isset($_SESSION['usuario']))
		header('location: login.php');
	
	include('../librerias/conexion.php');
	$conexion = conectar();
	
	$nom_parro 	= $_REQUEST['nom_parro'];
	$id_archif	= $_REQUEST['id_archif'];

	$consulta = "insert into parroquia (nom_parro, id_archif) values ('$nom_parro', '$id_archif')";
	
	mysqli_query($conexion, $consulta) or die(mysqli_error($conexion));
?>