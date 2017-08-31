<?php
	function obtAnyoAct() {
		return date("Y");
	}

	function obtArrayMeses() {
		$meses = array("Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre",
					"Octubre", "Noviembre", "Diciembre");
		return $meses;
	}

	function obtMes($mes) {
		$meses = obtArrayMeses();

		return ($meses[$mes-1]);
	}

	function obtTiposDocs($show_code = true) {
		$conexion = conectar();

		$registros = mysqli_query($conexion, "select * from tipo_documento order by codigo, nombre") or die("Error al consultar la tabla tipo_documento");

		while($fila = mysqli_fetch_array($registros)) {
			echo "<option value='".$fila['id']."'>" . ($show_code ? $fila['codigo'] . ' - ' : '') . $fila['nombre'] . "</option>\n";
		}
	}

	function sanitize_file_name($str, $relative_path = FALSE) {
		$bad = array(
	        '../', '<!--', '-->', '<', '>',
	        "'", '"', '&', '$', '#',
	        '{', '}', '[', ']', '=',
	        ';', '?', '%20', '%22',
	        '%3c',      // <
	        '%253c',    // <
	        '%3e',      // >
	        '%0e',      // >
	        '%28',      // (
	        '%29',      // )
	        '%2528',    // (
	        '%26',      // &
	        '%24',      // $
	        '%3f',      // ?
	        '%3b',      // ;
	        '%3d',       // =
	    );

	    if (! $relative_path)
	    {
	        $bad[] = './';
	        $bad[] = '/';
	    }

	    return stripslashes(str_replace($bad, '', $str));
	}
