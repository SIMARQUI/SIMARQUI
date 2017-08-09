$(function(){
	var id_doc;
	$("#mostrarDocumentos").on("click", ".del_doc", function(event) {
	  event.preventDefault();

	  //var band = confirm("esta seguro de eliminar?");
	  id_doc = $(this).data('doc');
	  $("#dialog-confirm-delete-doc").dialog("open");
    });

	$( "#dialog-confirm-delete-doc" ).dialog({
	  autoOpen: false,
      resizable: false,
      height: "auto",
      width: 400,
      modal: true,
      buttons: {
        "Aceptar": function() {
			$.get("del_doc.php?id_doc="+id_doc, function(data){
				$("#mostrarDocumentos").empty();
				$("#mostrarDocumentos").load("procesar.php?edit_doc=1");
			});
			$( this ).dialog( "close" );
        },
        Cancelar: function() {
          $( this ).dialog( "close" );
        }
      }
    });
});
