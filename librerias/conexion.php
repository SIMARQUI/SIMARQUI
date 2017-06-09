<?php
	function conectar()
	{
		$conexion=mysqli_connect("localhost","paginaye_admin","paginacurea1","paginaye_basesc") or die("Problemas con la conexión");
		
		return($conexion);
	}
?>