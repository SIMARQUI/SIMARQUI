<?php
	//session_start();

	if(!isset($_SESSION['usuario']))
		header('location: login.php');

	require_once('../librerias/conexion.php');
	require_once('../librerias/utiles.php');

	$conexion = conectar();
	$consulta_ejecutar = "select id_inm, cod_inm, descripcion, modo_adq, direccion, metraje, tipo_inm, linderos, fecha, datos_registro, abogado_redactor, ".
						 	"(select archi.nom_arch from archiprestazgo as archi where archi.id_arch = archiprestazgo) as nom_arch, ".
							"(select parr.nom_parro from parroquia as parr where parr.id_parro = parroquia) as nom_parro ".
							"from inmueble order by fecha_add_inm DESC";

	$registros = mysqli_query($conexion, $consulta_ejecutar) or die('Problemas con la consulta');
	$num_total_registros = mysqli_num_rows($registros);

	echo	"<div class='row'>
				<div class='col-lg-12'>
					<p>Elementos encontrados: $num_total_registros</p>
				</div>
			</div>";

	if($num_total_registros > 0)
	{
		$pagActual = 1;

		$consultaFilasPP = mysqli_query($conexion, "select filasPPInm from usuario where login = '".$_SESSION['usuario']."'");
		$getFilasPP = mysqli_fetch_array($consultaFilasPP);
		$filasPPInm = $getFilasPP['filasPPInm'];

		//contando el desplazamiento
		$offset = ($pagActual - 1) * $filasPPInm;
		$total_paginas = ceil($num_total_registros / $filasPPInm);

		$registros = mysqli_query($conexion, "$consulta_ejecutar LIMIT $offset, $filasPPInm") or die(mysqli_error($conexion));

        echo 		"<div class='row'>
                        <div class='col-lg-12'>";

		while($fila = mysqli_fetch_array($registros))
        {
			echo	"<div class='panel panel-primary'>
						<div class='panel-heading'><span style='font-weight:bold'>Codigo del Inmueble:</span> ".$fila['cod_inm'];
			if($_SESSION['rol']=='Administrador')//Tiene permiso para borrar un inmueble
			{
				echo
					"<a class='del_inm' data-inm='".$fila['id_inm']."' href='#' style='margin-left:15px;'><img src='../papelera.jpg' width='24px' height='24px' alt='Eliminar Inmueble'></a>";
			}
			if($_SESSION['rol']=='Administrador')//Tiene permiso para editar un inmueble
			{
				echo
					"<a class='edit_inm' data-inm='".$fila['id_inm']."' href='#' style='margin-left:5px;'><img src='../icon-edit.png' width='24px' height='24px' alt='Editar Inmueble'></a>";
			}
			if($_SESSION['rol']=='Administrador')//Tiene permiso para editar un inmueble
			{
				echo
					"<!--<div style='float:right; border:1px solid blue;'><a data-inm='".$fila['id_inm']."' class='new-doc-to-inm' href='#'><img src='../document_new.png' width='48px' height='51px' alt='Crear nuevo Documento'></a></div>-->";
			}

			echo		"<!--<div style='float:right; margin-right:15px; border:1px solid blue;'><a data-inm='".$fila['id_inm']."' class='ver_docs' href='#'><img src='../documents2.png' width='48px' height='51px' alt='Ver Documentos'></a></div>-->
						</div>
						<!-- /.panel-heading -->
						<div class='panel-body'>
							<!-- Tab panes -->
							<div class='tab-content'>
								<div class='tab-pane fade in active' id='home-pills'>
									<p><span style='font-weight:bold'>Archiprestazgo:</span> " . $fila['nom_arch'] . "</p>
									<p><span style='font-weight:bold'>Parroquia:</span> " . $fila['nom_parro'] . "</p>
									<p><span style='font-weight:bold'>Direccion:</span> ".$fila['direccion']."</p>
									<p><span style='font-weight:bold'>Tipo:</span> ".$fila['tipo_inm']."</p>
									<p><span style='font-weight:bold'>Modo de adquisicion:</span> ".$fila['modo_adq']."</p>
									<p><span style='font-weight:bold'>Metraje:</span> ".$fila['metraje']."</p>
									<p><span style='font-weight:bold'>Linderos:</span> ".$fila['linderos']."</p>
									<p><span style='font-weight:bold'>Descripcion:</span> ".$fila['descripcion']."</p>
									<hr/>
									<h4>Informacion del documento</h4>
									<p><span style='font-weight:bold'>Fecha:</span> ".$fila['fecha']."</p>
									<p><span style='font-weight:bold'>Datos de Registro:</span> ".$fila['datos_registro']."</p>
									<p><span style='font-weight:bold'>Abogado Redactor:</span> ".$fila['abogado_redactor']."</p>
								</div>
							</div>
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->";
        }

        echo 		"</div>
        			 </div>";



		if($total_paginas > 1)
		{
			echo 		"<div class='row''>
							<div class='col-lg-12'>";

			if ($pagActual != 1)
				echo "<a href='#' class='paginarInm' style='margin-right:10px' data-numpage='".($pagActual-1)."'>Anterior</a>";

			if( ($pagActual >= 1) And ($pagActual <= 6) )
			{
				$lim_inf = 1;

				if($total_paginas < 10)
					$lim_sup = $total_paginas;
				else
					$lim_sup = 10;
			}
			else
			{
				if(($pagActual+4) > $total_paginas)
				{
					$lim_sup = $total_paginas;
					if($lim_sup >= 10)
					{
						$lim_inf = $lim_sup - 9;
					}
					else
					{
						$lim_inf = 1;
					}
				}
				else
				{
					$lim_sup = $pagActual + 4;
					$lim_inf = $lim_sup - 9;
				}
			}

			for($i = $lim_inf; $i <= $lim_sup; $i++)
			{
				if($i == $pagActual)
					echo "<span style='margin-right:10px'>$i</span>";
				else
					echo "<a class='paginarInm' href='#' style='margin-right:10px' data-numpage='$i'>$i</a>";
			}

			if($pagActual != $total_paginas)
				echo "<a class='paginarInm' href='#' style='margin-right:10px' data-numpage='".($pagActual+1)."'>Siguiente</a>";
			echo "</div>";
			echo "</div>";
		}
	}
	else
	{
		echo 		"<div class='row'>
                        <div class='col-lg-12'>
                            <p style='color:green'>Presione Crear Nuevo para agregar un nuevo Inmueble</p>
                        </div>
                    </div>";
	}
