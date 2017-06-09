<?php
	require_once('../librerias/conexion.php');
	
	$conexion = conectar();
	
	$id_inm = $_REQUEST['id_inm'];
	$archiprestazgo = $_REQUEST['archiprestazgo'];
	$parroquia = $_REQUEST['parroquia'];
	$direccion = $_REQUEST['direccion'];
	$modo_adq = $_REQUEST['modo_adq'];
	$metraje = $_REQUEST['metraje'];
	$tipo_inm = $_REQUEST['tipo_inm'];
	$linderos = $_REQUEST['linderos'];
	$descripcion = $_REQUEST['descripcion'];
	
	$query = "update inmueble set direccion = '$direccion', modo_adq = '$modo_adq', metraje = '$metraje', tipo_inm = '$tipo_inm', linderos = '$linderos', descripcion = '$descripcion' where id_inm = $id_inm";
	mysqli_query($conexion, $query);
	
	mysqli_query($conexion, "delete from inm_pert_arqui where id_inmffff = $id_inm");
	mysqli_query($conexion, "delete from inm_pert_fund where id_inmff = $id_inm");
	mysqli_query($conexion, "delete from inm_pert_parro where id_inmf = $id_inm");
	
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