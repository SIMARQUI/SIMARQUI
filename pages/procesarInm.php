<?php
	session_start();
	
	if(!isset($_SESSION['usuario']))
		header('location: login.php');

	require_once('../librerias/conexion.php');
	require_once('../librerias/utiles.php');

	require_once('../FirePHPCore/FirePHP.class.php');
	ob_start();
	
	$firephp = FirePHP::getInstance(TRUE);
	$firephp->log('fire ta listo', 'Info');
	
	$conexion = conectar();
	
	if(isset($_REQUEST['numPage']) or isset($_REQUEST['filasPPInm']) or isset($_REQUEST['edit_inm']))
	{
		if(isset($_REQUEST['numPage']))
		{
			$pagActual = $_REQUEST['numPage'];
			$_SESSION['ultima_pagina_inmueble'] = $pagActual;
		}
		else
		{
			if(isset($_REQUEST['filasPPInm']))
			{
				$consultaFilasPP = mysqli_query($conexion, "select filasPPInm from usuario where login = '".$_SESSION['usuario']."'");
				$getFilasPP = mysqli_fetch_array($consultaFilasPP);
				
				$filasPPAnt = $getFilasPP['filasPPInm'];
				
				$filasPPInm = $_REQUEST['filasPPInm'];
				
				mysqli_query($conexion, "update usuario set filasPPInm = $filasPPInm where login = '".$_SESSION['usuario']."'");
				
				$primera_fila_de_ultima_pagina = ( ($_SESSION['ultima_pagina_inmueble'] - 1) * $filasPPAnt ) + 1;
				
				$pagActual = ceil($primera_fila_de_ultima_pagina / $filasPPInm);
				
				$_SESSION['ultima_pagina_inmueble'] = $pagActual;
			}
			else
			{
				$pagActual = $_SESSION['ultima_pagina_inmueble'];
			}
			
		}
		
		$consulta_ejecutar = $_SESSION['ultima_consulta_inmueble'];
		
		
	}
	else
	{
		$consulta_base = "select id_inm, descripcion, modo_adq, direccion, metraje, tipo_inm, linderos from inmueble";
		$where = "";
		
		//comprueba si ya se ha enviado el formulario
		if(isset($_REQUEST['archiprestazgo']))
		{
			
			/*if($_REQUEST['tipo_documento'] != 'ningun')
			{
				$tipo = $_REQUEST['tipo_documento'];
				$where .= "(tipo = '$tipo')";
			}
			
			if($_REQUEST['desde'] != '' or $_REQUEST['hasta'] != '')
			{
				if($_REQUEST['desde'] == $_REQUEST['hasta'])
				{
					$desde = $_REQUEST['desde'];
					if($where != "")
					{
						$where .= " And ";
					}
					//$date = date_create_from_format("d-m-Y", "$desde");
					//$stringDate = date_format($date, 'Y-m-d');
					
					$where .= "(fecha = '$desde')";
				}
				else
				{
					if($_REQUEST['desde'] != '')
					{
						$desde = $_REQUEST['desde'];
						if($where != "")
						{
							$where .= " And ";
						}
						//$date = date_create_from_format("d-m-Y", $_REQUEST['desde']);
						//$stringDate = date_format($date, 'Y-m-d');
						
						$where .= "(fecha >= '$desde')";
					}
					
					if($_REQUEST['hasta'] != '')
					{
						$hasta = $_REQUEST['hasta'];
						if($where != "")
						{
							$where .= " And ";
						}
						//$date = date_create_from_format("d-m-Y", $_REQUEST['hasta']);
						//$stringDate = date_format($date, 'Y-m-d');
						
						$where .= "(fecha <= '$hasta')";
					}
				}
			}*/
			
			if($_REQUEST['archiprestazgo']!= "ningun")
			{
				$archiprestazgo = $_REQUEST['archiprestazgo'];
				
				//Arquidiocesis
				if($archiprestazgo == -1)
				{
					$consulta_base .= ", inm_pert_arqui";
					$where .= "(id_inm = id_inmffff)";
				}
				else
				{
					$parroquia = $_REQUEST['parroquia'];
					
					//Fundaciones
					if($archiprestazgo == 0)
					{
						$consulta_base .= ", inm_pert_fund";
						$where .= "(id_inm = id_inmff) And (id_fundff = $parroquia)";
					}
					else
					{
						$consulta_base .= ", inm_pert_parro";
						$where .= "(id_inm = id_inmf) And (id_parrof = $parroquia)";
					}
				}
			}
			
			if($_REQUEST['direccion'] != "")
			{
				$direccion = $_REQUEST['direccion'];
				if($where != '')
					$where .= " And ";
				
				$where .= "(direccion like '%$direccion%')";
			}
			
			if($where != '')
				$consulta_base .= " where ".$where;
		}
		
		$consulta_ejecutar = $consulta_base;
		$consulta_ejecutar .= " order by fecha_add_inm DESC";
		$_SESSION['ultima_consulta_inmueble'] = $consulta_ejecutar;
		$pagActual = 1;
		$_SESSION['ultima_pagina_inmueble'] = $pagActual;
	}
	
	/*echo	"<div class='row'>
				<div class='col-lg-12'>
					<p>consulta ejecutada: $consulta_ejecutar</p>
				</div>
			</div>";*/
	
	
	
	
	$registros = mysqli_query($conexion, $consulta_ejecutar) or die('Problemas con la consulta');
	$num_total_registros = mysqli_num_rows($registros);

	echo	"<div class='row'>
				<div class='col-lg-12'>
					<p>Elementos encontrados: $num_total_registros</p>
				</div>
			</div>";
	
	if($num_total_registros > 0)
	{
		if(!isset($filasPPInm))
		{
			$consultaFilasPP = mysqli_query($conexion, "select filasPPInm from usuario where login = '".$_SESSION['usuario']."'");
			$getFilasPP = mysqli_fetch_array($consultaFilasPP);
			
			$filasPPInm = $getFilasPP['filasPPInm'];
		}
		
		//contando el desplazamiento
		$offset = ($pagActual - 1) * $filasPPInm;
		$total_paginas = ceil($num_total_registros / $filasPPInm);
		
		$registros = mysqli_query($conexion, "$consulta_ejecutar LIMIT $offset, $filasPPInm") or die(mysqli_error($conexion));

        echo 		"<div class='row'>
                        <div class='col-lg-12'>";

        while($fila = mysqli_fetch_array($registros))
        {
			echo	"<div class='panel panel-primary'>
						<div class='panel-heading'><span style='font-weight:bold'>Codigo del Inmueble:</span> ".$fila['id_inm'];
			if($_SESSION['rol']=='Administrador')//Tiene permiso para borrar un documento
			{
				echo
					"<a class='del_inm' data-inm='".$fila['id_inm']."' href='#' style='margin-left:15px;'><img src='../papelera.jpg' width='24px' height='24px' alt='Eliminar Inmueble'></a>";
			}
			if($_SESSION['rol']=='Administrador')//Tiene permiso para editar un documento
			{
				echo
					"<a class='edit_inm' data-inm='".$fila['id_inm']."' href='#' style='margin-left:5px;'><img src='../icon-edit.png' width='24px' height='24px' alt='Editar Inmueble'></a>";
			}
			if($_SESSION['rol']=='Administrador')//Tiene permiso para editar un documento
			{
				echo
					"<div style='float:right; border:1px solid blue;'><a data-inm='".$fila['id_inm']."' class='new-doc-to-inm' href='#'><img src='../document_new.png' width='48px' height='51px' alt='Crear nuevo Documento'></a></div>";
			}
			echo		"<div style='float:right; margin-right:15px; border:1px solid blue;'><a data-inm='".$fila['id_inm']."' class='ver_docs' href='#'><img src='../documents2.png' width='48px' height='51px' alt='Ver Documentos'></a></div>
						</div>
						<!-- /.panel-heading -->
						<div class='panel-body'>
							<!-- Tab panes -->
							<div class='tab-content'>
								<div class='tab-pane fade in active' id='home-pills'>
									<p><span style='font-weight:bold'>Direccion:</span> ".$fila['direccion']."</p>
									<p><span style='font-weight:bold'>Tipo:</span> ".$fila['tipo_inm']."</p>
									<p><span style='font-weight:bold'>Modo de adquisicion:</span> ".$fila['modo_adq']."</p>
									<p><span style='font-weight:bold'>Metraje:</span> ".$fila['metraje']."</p>
									<p><span style='font-weight:bold'>Linderos:</span> ".$fila['linderos']."</p>
									<p><span style='font-weight:bold'>Descripcion:</span> ".$fila['descripcion']."</p>
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
?>