<?php
session_start();

if(!isset($_SESSION['usuario']))
	header('location: login.php');

include('../librerias/conexion.php');
$conexion = conectar();

$id_doc = $_REQUEST['id_doc'];

mysqli_query($conexion, "delete from documento where id_doc = '$id_doc'");
mysqli_query($conexion, "delete from se_refiere where id_docf = '$id_doc'");
