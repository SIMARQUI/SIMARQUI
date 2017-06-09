<?php
	function obtAnyoAct()
	{
		return date("Y");
	}
	
	function obtArrayMeses()
	{
		$meses = array("Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre",
					"Octubre", "Noviembre", "Diciembre"); 
		return $meses;
	}
	
	function obtMes($mes)
	{
		$meses = obtArrayMeses();
		
		return ($meses[$mes-1]);
	}
	
	function obtTiposDocs()
	{
		$conexion = conectar();
		
		$registros = mysqli_query($conexion, "select * from tipo_documento") or die("Error al consultar la tabla tipo_documento");
		
		while($fila = mysqli_fetch_array($registros))
		{
			echo "<option value='".$fila['nombre']."'>".$fila['nombre']."</option>\n";
		}
	}
?>