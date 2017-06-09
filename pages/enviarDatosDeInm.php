<?php
require_once '../librerias/conexion.php';
$conexion = conectar();

$id_inm = $_REQUEST['id_inm'];

$registros = mysqli_query($conexion, "select * from inmueble where id_inm = $id_inm");
$fila = mysqli_fetch_array($registros);

$registros = mysqli_query($conexion, "select * from inm_pert_arqui where id_inmffff = $id_inm");
if(mysqli_num_rows($registros) > 0)
{
	$fila['archiprestazgo'] = -1;
	$fila['parroquia'] = 'ningun';
}
else
{
	$registros = mysqli_query($conexion, "select * from inm_pert_fund where id_inmff = $id_inm");
	if(mysqli_num_rows($registros) > 0)
	{
		$row = mysqli_fetch_array($registros);
		$fila['archiprestazgo'] = 0;
		$fila['parroquia'] = $row['id_fundff'];
	}
	else
	{
		$registros = mysqli_query($conexion, "select id_parro, id_archif from parroquia, inm_pert_parro where (id_inmf = $id_inm) And (id_parro = id_parrof)");
		$row = mysqli_fetch_array($registros);
		$fila['archiprestazgo'] = $row['id_archif'];
		$fila['parroquia'] = $row['id_parro'];
	}
}

echo json_encode($fila);
?>