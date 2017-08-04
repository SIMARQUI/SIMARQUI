<?php
	session_start();

	if(!isset($_SESSION['usuario']))
		header('location: login.php');

	include('../librerias/conexion.php');
	$conexion = conectar();

	$nom_arch = $_REQUEST['nom_arch'];

	$consulta = "insert into archiprestazgo (nom_arch) values ('$nom_arch')";

	mysqli_query($conexion, $consulta) or die("Error de insercion en la base de datos");
