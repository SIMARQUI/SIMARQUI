<?php
session_start();

if(!isset($_SESSION['usuario']))
	header('location: login.php');

include('../librerias/mensajes.php');
include('../librerias/utiles.php');
include('../librerias/conexion.php');

$_SESSION['ultima_consulta'] = "select id_doc, tipo, datos_registro, abogado_redactor from documento order by fecha_add_doc DESC";
$_SESSION['ultima_pagina'] = 1;
$_SESSION['ultima_consulta_inmueble'] = "select id_inm, descripcion, modo_adq, direccion, metraje, tipo_inm, linderos from inmueble order by fecha_add_inm DESC";
$_SESSION['ultima_pagina_inmueble'] = 1;

?>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title><?php echo TITULO; ?></title>

    <!-- Bootstrap Core CSS -->
    <link href="../bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	
	<!-- Custom Fonts -->
    <link href="../bower_components/bootstrap-tagsinput/bootstrap-tagsinput.css" rel="stylesheet" type="text/css">
	
	
	<!--  Jquery-ui css  -->
    <link rel="stylesheet" href="../jquery-ui/jquery-ui.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.php" style="color:#5d5d89"><?php echo TITULO_INNER; ?></a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
					</a>
					<ul class="dropdown-menu dropdown-user">
						<li><a href="#"><i class="fa fa-user fa-fw"></i> Perfil</a>
						</li>
						<li><a href="#"><i class="fa fa-gear fa-fw"></i> Configuraciones</a>
						</li>
						<li class="divider"></li>
						<li><a href="cerrarSesion.php"><i class="fa fa-sign-out fa-fw"></i> Cerrar Sesion</a>
						</li>
					</ul>
					<!-- /.dropdown-user -->
				</li>
				<!-- /.dropdown -->
			</ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a href="index.php"><i class="fa fa-search fa-fw"></i> Documentos e Inmuebles</a>
                        </li>
						<!--<li>
                            <a href="inmuebles.php"><i class="fa fa-home fa-fw"></i> Cargar Datos</a>
                        </li-->
						<li>
                            <a href="archi_parroq.php"><i class="fa fa-university fa-fw"></i> Archiprestazgos y Parroquias</a>
                        </li>
						<li>
                            <a href="fundaciones.php"><i class="fa fa-users fa-fw"></i> Fundaciones y Asociaciones Civiles</a>
                        </li>
						<li>
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Administración<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <?php if($_SESSION['rol']=='Administrador'){//tiene permiso para agregar Inmueble
								?>
								<li>
                                    <a href="usuarios.php">Usuarios</a>
                                </li>
								<?php } ?>
								<li>
                                    <a href="cambContra.php">Cambiar Contrasena</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper" style="padding: 0px 0px 0px 0px">
            <!--<div class="row">
                <div class="col-lg-12">
                    <div style="margin-top:10px;"><img src="../search.jpg" /><h1 class="page-header" style="color:#5d5d89">Buscar Documentos</h1>
                </div>-->
                <!-- /.col-lg-12 -->
            <!--</div>-->
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default" style="border:none;">
                        <!--<div class="panel-heading" style="color:#5CB85C; background-color:white">
                           <button id='create-doc' style='color:black' class='btn btn-primary'>Nuevo</button>
                        </div>-->
                        <div class="panel-body">
							<!-- Nav tabs -->
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#documentos" data-toggle="tab">Documentos</a>
                                </li>
                                <li><a href="#inmuebles" data-toggle="tab">Inmuebles</a>
                                </li>
                            </ul>
							
							<!-- Tab panes -->
                            <div class="tab-content">
                                <div class="tab-pane fade in active" id="documentos">
									<?php include('documentos.php'); ?>
                                </div>
                                <div class="tab-pane fade" id="inmuebles">
									<?php include('inmuebles2.php'); ?>
                                </div>
                            </div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
	
	<!--------------------------------- Modales Para documento ------------------------------------->
	<div id="dialog-new-document" title="Nuevo documento">
		<p class="validateTips">Todos los campos son requeridos.</p>
		<form role="form" id="form_doc_new" enctype="multipart/form-data">
			<div class="form-group">
				<label>Codigo</label>
				<input id="id_doc" name="id_doc" class="form-control" placeholder="Codigo">
			</div>
			<div class="form-group">
				<label>Tipo</label>
				<select id="tipo" name="tipo" class="form-control" >
					<option value="ningun" size="10">Seleccionar...</option>
					<?php
						obtTiposDocs();
					?>
				</select>
			</div>
			
			<div class="form-group">
				<label>Fecha</label>
				<input type="text" id="fechaPicker" name="fechaPicker" readonly="readonly">
				<input type="hidden" id="fecha" name="fecha">
			</div>
			<!-- / fecha -->
			
			<div class="form-group">
				<label>Datos de Registro</label>
				<input id="datos_registro" name="datos_registro" class="form-control" placeholder="Datos de Registro">
			</div>
			
			<div class="form-group">
				<label>Abogado Redactor</label>
				<input id="abogado_redactor" name="abogado_redactor" class="form-control" placeholder="Abogado Redactor">
			</div>
			<!-- ADD -->
			<div class="form-group">
				<label>Documento</label>
				<input type="file" id="archivo_doc" name="archivo_doc">
			</div>
			<button type="reset" class="btn btn-default">Borrar</button>
		</form>
	</div>
	
	<div id="dialog-edit-document" title="Editar Documento">
		<p class="validateTips">Todos los campos son requeridos.</p>
		<form role="form" id="form_doc_edit" enctype="multipart/form-data">
			<div class="form-group">
				<label>Codigo</label>
				<span id='id_doc_edit'></span>
				<input type="hidden" name="id_doc" id="id_doc_hidden">
			</div>
			<div class="form-group">
				<label>Tipo</label>
				<select id="tipo_edit" name="tipo" class="form-control" >
					<option value="ningun" size="10">Seleccionar...</option>
					<?php
						obtTiposDocs();
					?>
				</select>
			</div>

			<div class="form-group">
				<label>Fecha</label>
				<input type="text" id="fecha_edit" name="fechaPicker">
				<input type="hidden" id="fecha_edit_hidden" name="fecha">
			</div>
			<!-- / fecha -->
			
			<div class="form-group">
				<label>Datos de Registro</label>
				<input id="datos_registro_edit" name="datos_registro" class="form-control" placeholder="Datos de Registro">
			</div>
			
			<div class="form-group">
				<label>Abogado Redactor</label>
				<input id="abogado_redactor_edit" name="abogado_redactor" class="form-control" placeholder="Abogado Redactor">
			</div>
			<!-- ADD -->
			<!--<div class="form-group">
				<label>Documento</label>
				<input type="file" id="archivo_doc_edit" name="archivo_doc">
			</div>-->
			<button type="reset" class="btn btn-default">Borrar</button>
		</form>
	</div>
	<div id="show-inms-from-doc-modal" title="Inmuebles de documento">
		<div class="row" style="margin-top:20px">
			<div class='col-lg-12'>
				<div class="panel panel-default" style="border-left:none; border-right:none;">
					<div class="panel-heading" style="border-left:1px #DDD solid; border-right:1px #DDD solid;">
						Inmuebles de documento
					</div>
					<div class="panel-body" id="show-inms-from-doc">
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="add-inm-to-doc" title="Añadir Inmueble a Documento">
		<div class="row">
			<div class="col-lg-12">
				<div>
				Añadir existente <input id="inms-news-to-doc-tagsinput" type="text" data-role="tagsinput" />
				</div>
				<button type="button" id="btn-inms-news-to-doc-tagsinput">Añadir</button>
			</div>
		</div>
		<!--<div class="row">
			<div class="col-lg-12">
				<a href="#" id="open-form-inms-news-to-doc">Crear Nuevo</a>
			</div>
		</div>-->
		<!--<div class="row" id="inms-news-to-doc-form">
			<div class="col-lg-12">
				cosa que debera ocultarse
			</div>
		</div>-->
	</div>
	<div id="dialog-confirm-delete-doc" title="Eliminar Documento">
		<p><span class="ui-icon ui-icon-alert" style="float:left; margin:12px 12px 20px 0;"></span>esta seguro de borrar este documento?.</p>
	</div>
	<!------------------------------------------ Modales Para inmueble --------------------------------->
	<div id="dialog-new-inmueble" title="Nuevo Inmueble">
		<p class="validateTips">Todos los campos son requeridos.</p>
		<form role="form" id="form_inm_new">
			<div class="form-group">
				<label>Codigo</label>
				<input id="id_inm" name="id_inm" class="form-control" placeholder="Codigo">
			</div>
			<div id="ubicacion" style="margin-bottom:30px;">
				<div style="display:inline-table; width:49%;">
					<p><label>Archiprestazgo</label></p>
					<select name="archiprestazgo" id="archiprestazgo" class="form-control">
						<option value="ningun">Seleccionar</option>
						<option value="-1">Arquidiocesis</option>
						<option value="0">Fundac. y Asoc. Civiles</option>
						<?php include 'selectArchiprestazgos.php'; ?>
					</select>
				</div>
				<div style="display:inline-table; width:49%;">
					<p><label>Parroquia</label></p>
					<select name="parroquia" id="parroquia" class="form-control">
						<option value="ningun">Seleccionar...</option>
					</select>
				</div>
			</div>
			<!-- / ubiacion -->
			<div class="form-group">
				<label>Direccion</label>
				<input id="direccion" name="direccion" class="form-control">
			</div>
			<div class="form-group">
				<p><label>Modo de Adquisicion</label></p>
				<input id="modo_adq" name="modo_adq" class="form-control" placeholder="Modo de Adquisicion">
			</div>
			<div class="form-group">
				<label>Metraje</label>
				<input id="metraje" name="metraje" class="form-control" placeholder="Metraje">
			</div>
			<div class="form-group">
				<label>Tipo de inmueble</label>
				<input id="tipo_inm" name="tipo_inm" class="form-control" placeholder="Tipo de Inmueble">
			</div>
			<div class="form-group">
				<label>Linderos</label>
				<textarea id="linderos" name="linderos" class="form-control" rows="3"></textarea>
			</div>
			<div class="form-group">
				<label>Descripcion</label>
				<textarea id="descripcion" name="descripcion" class="form-control" rows="3"></textarea>
			</div>
			<button type="reset" class="btn btn-default">Borrar</button>
		</form>
	</div>
	
	<div id="dialog-edit-inmueble" title="Editar Inmueble">
		<p class="validateTips">Todos los campos son requeridos.</p>
		<form role="form" id="form_inm_edit">
			<div class="form-group">
				<label>Codigo</label>
				<span id='id_inm_edit'></span>
				<input type="hidden" name="id_inm" id="id_inm_hidden">
			</div>
			<div style="margin-bottom:30px;">
				<div style="display:inline-table; width:49%;">
					<p><label>Archiprestazgo</label></p>
					<select name="archiprestazgo" id="archiprestazgo_edit" class="form-control">
						<option value="ningun">Seleccionar</option>
						<option value="-1">Arquidiocesis</option>
						<option value="0">Fundac. y Asoc. Civiles</option>
						<?php include 'selectArchiprestazgos.php'; ?>
					</select>
				</div>
				<div style="display:inline-table; width:49%;">
					<p><label>Parroquia</label></p>
					<select name="parroquia" id="parroquia_edit" class="form-control">
						<option value="ningun">Seleccionar...</option>
					</select>
				</div>
			</div>
			<!-- / ubiacion -->
			<div class="form-group">
				<label>Direccion</label>
				<input id="direccion_edit" name="direccion" class="form-control">
			</div>
			<div class="form-group">
				<p><label>Modo de Adquisicion</label></p>
				<input id="modo_adq_edit" name="modo_adq" class="form-control" placeholder="Modo de Adquisicion">
			</div>
			<div class="form-group">
				<label>Metraje</label>
				<input id="metraje_edit" name="metraje" class="form-control" placeholder="Metraje">
			</div>
			<div class="form-group">
				<label>Tipo de inmueble</label>
				<input id="tipo_inm_edit" name="tipo_inm" class="form-control" placeholder="Tipo de Inmueble">
			</div>
			<div class="form-group">
				<label>Linderos</label>
				<textarea id="linderos_edit" name="linderos" class="form-control" rows="3"></textarea>
			</div>
			<div class="form-group">
				<label>Descripcion</label>
				<textarea id="descripcion_edit" name="descripcion" class="form-control" rows="3"></textarea>
			</div>
			<button type="reset" class="btn btn-default">Borrar</button>
		</form>
	</div>
	<div id="show-docs-from-inm-modal" title="Documentos de inmueble">
		<div class="row" style="margin-top:20px">
			<div class='col-lg-12'>
				<div class="panel panel-default" style="border-left:none; border-right:none;">
					<div class="panel-heading" style="border-left:1px #DDD solid; border-right:1px #DDD solid;">
						Documentos de inmueble
					</div>
					<div class="panel-body" id="show-docs-from-inm">
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="add-doc-to-inm" title="Crear Documento para Inmueble">
		<div class="row">
			<div class="col-lg-12">
				<div>
				Añadir existente <input id="docs-news-to-inm-tagsinput" type="text" data-role="tagsinput" />
				</div>
				<button type="button" id="btn-docs-news-to-inm-tagsinput">Añadir</button>
			</div>
		</div>
		<!--<div class="row">
			<div class="col-lg-12">
				<a href="#" id="open-form-inms-news-to-doc">Crear Nuevo</a>
			</div>
		</div>-->
		<!--<div class="row" id="inms-news-to-doc-form">
			<div class="col-lg-12">
				cosa que debera ocultarse
			</div>
		</div>-->
	</div>
	<div id="dialog-confirm-delete-inm" title="Eliminar Inmueble">
		<p><span class="ui-icon ui-icon-alert" style="float:left; margin:12px 12px 20px 0;"></span>esta seguro de borrar este inmueble?.</p>
	</div>
    <!-- jQuery -->
    <script src="../bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../bower_components/metisMenu/dist/metisMenu.min.js"></script>
	
	<script src="../bower_components/bootstrap-tagsinput/bootstrap-tagsinput.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>
	
	 <!-- Bootstrap Core JavaScript -->
    <script src="../node_modules/moment/min/moment.min.js"></script>
	
	<!-- Jquery-UI -->
	<script src="../jquery-ui/jquery-ui.js"></script>
	
    <!-- Archiprestazgos y parroquias -->
    <script src="../js/archiParro.js"></script>
	
	<!-- index.js -->
	<script src="../js/index.js"></script>
	
	<!-- index.js -->
	<script src="../js/accordion.js"></script>
	
	<!-----------------------------------Scripts para Documentos ----------------------------------------------------->
	<!-- modal-doc-new.js -->
	<script src="../js/modal-doc-new.js"></script>
	
	<!-- modal-doc-new.js -->
	<script src="../js/fechaDoc.js"></script>
	
	<!-- modal-doc-new.js -->
	<script src="../js/paginadorDoc.js"></script>
	
	<!-- modal-doc-new.js -->
	<script src="../js/cambiarFilasPPDoc.js"></script>
	
	<!-- edit_doc.js -->
	<script src="../js/edit_doc.js"></script>
	
	<!-- edit_doc.js -->
	<script src="../js/del_doc.js"></script>
	
	<!-- edit_doc.js -->
	<script src="../js/show-inms-from-doc-modal.js"></script>
	
	<!-- add-inm-to-doc-modal.js -->
	<script src="../js/add-inm-to-doc-modal.js"></script>
	
	<!-----------------------------------Scripts para Inmuebles ----------------------------------------------------->
	<!-- modal-doc-new.js -->
	<script src="../js/modal-inm-new.js"></script>
	
	<!-- modal-doc-new.js -->
	<script src="../js/paginadorInm.js"></script>
	
	<!-- modal-doc-new.js -->
	<script src="../js/cambiarFilasPPInm.js"></script>
	
	<!-- edit_doc.js -->
	<script src="../js/edit_inm.js"></script>
	
	<!-- edit_doc.js -->
	<script src="../js/del_inm.js"></script>
	
	<!-- edit_doc.js -->
	<script src="../js/show-docs-from-inm-modal.js"></script>
	
	<!-- add-inm-to-doc-modal.js -->
	<script src="../js/add-doc-to-inm-modal.js"></script>
</body>

</html>