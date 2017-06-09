<?php
	session_start();
	
	if(!isset($_SESSION['usuario']))
		header('location: login.php');
	
	include('../librerias/conexion.php');
	$conexion = conectar();
	
	$id_inm			= $_REQUEST['id_inm'];
	$archiprestazgo = $_REQUEST['archiprestazgo'];
	$parroquia 		= $_REQUEST['parroquia'];
	$direccion 		= $_REQUEST['direccion'];
	$modo_adq 		= $_REQUEST['modo_adq'];
	$metraje 		= $_REQUEST['metraje'];
	$tipo_inm 		= $_REQUEST['tipo_inm'];
	$linderos 		= $_REQUEST['linderos'];
	$descripcion 	= $_REQUEST['descripcion'];

	$consulta = "insert into inmueble (id_inm, direccion, modo_adq, metraje, tipo_inm, descripcion, linderos)
				values ($id_inm, '$direccion', '$modo_adq', '$metraje', '$tipo_inm', '$descripcion', '$linderos')";
				
	mysqli_query($conexion, $consulta) or die("Error en la insercion de inmueble");
	
	if($archiprestazgo == -1)
	{
		$consulta = "insert into inm_pert_arqui (id_inmffff) values ($id_inm)";
	}
	else
	{
		if($archiprestazgo == 0)
		{
			$consulta = "insert into inm_pert_fund (id_inmff, id_fundff) values ($id_inm, $parroquia)";
		}
		else
		{
			$consulta = "insert into inm_pert_parro (id_inmf, id_parrof) values ($id_inm, $parroquia)";
		}
	}
	
	mysqli_query($conexion, $consulta) or die("Error en la insercion del propietario del inmueble");
?>