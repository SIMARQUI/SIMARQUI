$(function(){
	var id_inm;
	$( "#mostrarInmuebles" ).on( "click", ".del_inm", function(event) {
	  event.preventDefault();
	  
	  //var band = confirm("esta seguro de eliminar?");
	  id_inm = $(this).data('inm');
	  $("#dialog-confirm-delete-inm").dialog("open");
    });
	
	$( "#dialog-confirm-delete-inm" ).dialog({
	  autoOpen: false,
      resizable: false,
      height: "auto",
      width: 400,
      modal: true,
      buttons: {
        "Aceptar": function() {
			$.get("del_inm.php?id_inm="+id_inm, function(data){
				$("#mostrarInmuebles").empty();
				$("#mostrarInmuebles").load("procesarInm.php?edit_inm=1");
			});
			$( this ).dialog( "close" );
        },
        Cancelar: function() {
          $( this ).dialog( "close" );
        }
      }
    });
});