<?php
	/*session_start();
	
	if(!isset($_SESSION['usuario']))
		header('location: login.php');*/
	
	$conexion = conectar();
	
	$registros = mysqli_query($conexion, "select * from archiprestazgo") or die('Problemas con la consulta');
	
	while($fila = mysqli_fetch_array($registros))
    {
		$id_arch = $fila['id_arch'];
		$nom_arch = $fila['nom_arch'];
		
		echo "<option value='$id_arch'>$nom_arch</option>\n";
	}

?>