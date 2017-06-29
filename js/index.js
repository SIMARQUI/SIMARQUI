$(function(){
	var desdePicker = $("#desdePicker");
	var hastaPicker = $("#hastaPicker");
	var errorBusqDoc = $("#errorBusqDoc");
	var errorBusqInm = $("#errorBusqInm");
	var archiprestazgo_busqueda = $("#archiprestazgo_busqueda");
	var parroquia_busqueda = $("#parroquia_busqueda");
	
	$("#buscarDoc").on("click", function (){
		errorBusqDoc.text("");
		if(fechaValida()){
			$.get("procesar.php?"+$("#form1").serialize(), function(data){
				$("#mostrarDocumentos").empty().html(data);
			});
		}
	});
	
	function fechaValida(){
		if( (desdePicker.val() != '') && (hastaPicker.val() != '') ) {
			var desde = desdePicker.datepicker('getDate').getDate();
			var hasta = hastaPicker.datepicker('getDate').getDate();
			
			if(desde > hasta) {
				errorBusqDoc.text("Rango de fecha invalida");
				return false;
			}
		}
		return true;
	}
	 
	$("#ver_todos_doc").click(function(){
		$.get("procesar.php", function(data){
			$("#mostrarDocumentos").empty().html(data);
		});
	});
	//$("#busquedaDocumento").hide();
	/*$.getJSON("devolverAbrirBusqDoc.php", function(data){
		if(data.mantAb)
		{
			$("#busquedaDocumento").show();
		}
	});*/
	
	/*$("#abrirBusquedaDocumento").click(function(){
		
	});*/
	
	$("#buscarInm").on("click", function (){
		errorBusqInm.text("");
		if(propietarioValido()){
			$.get("procesarInm.php?"+$("#form2").serialize(), function(data){
				$("#mostrarInmuebles").empty().html(data);
			});
		}
	});
	
	function propietarioValido(){
		if( (archiprestazgo_busqueda.val() != "ningun") && (archiprestazgo_busqueda.val() != -1) ){
			if(parroquia_busqueda.val() == "ningun"){
				errorBusqInm.text("Debe seleccionar algo en el campo Parroquia");
				return false;
			}
		}
		return true;
	}
	
	$("#ver_todos_inm").click(function(){
		$.get("procesarInm.php", function(data){
			$("#mostrarInmuebles").empty().html(data);
		});
	});
	//$("#busquedaDocumento").hide();
	/*$.getJSON("devolverAbrirBusqInm.php", function(data){
		if(data.mantAb)
		{
			$("#busquedaInmueble").show();
		}
	});*/
	
	/*$("#abrirBusquedaInmueble").click(function(){
		
	});*/
});