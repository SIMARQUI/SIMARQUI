  $(function() {
    var dialogEditInm, form,

      // From http://www.whatwg.org/specs/web-apps/current-work/multipage/states-of-the-type-attribute.html#e-mail-state-%28type=email%29
      //emailRegex = /^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/,
      archiprestazgo_edit = $( "#archiprestazgo_edit" ),
      parroquia_edit = $( "#parroquia_edit" ),
      direccion_edit = $( "#direccion_edit" ),
	  modo_adq_edit	= $("#modo_adq_edit"),
	  metraje_edit	= $("#metraje_edit"),
	  tipo_inm_edit	= $("#tipo_inm_edit"),
	  linderos_edit	= $("#linderos_edit"),
	  descripcion_edit	= $("#descripcion_inm_edit"),
      fechaPickerDocEdit = $("#fechaPickerDocEdit"),
      datos_registro_doc_edit = $("#datos_registro_doc_edit"),
      abogado_redactor_doc_edit = $("#abogado_redactor_doc_edit"),
      estatus_edit = $("#estatus_edit"),

      allFields = $([]).add(archiprestazgo_edit)
                        .add(parroquia_edit)
                        .add(direccion_edit)
                        .add(modo_adq_edit)
                        .add(metraje_edit)
                        .add(tipo_inm_edit)
                        .add(linderos_edit)
                        .add(descripcion_edit)
                        .add(fechaPickerDocEdit)
                        .add(datos_registro_doc_edit)
                        .add(abogado_redactor_doc_edit)
                        .add(estatus_edit),

      tips = $(".validateTips");

    function updateTips( t ) {
      tips
        .text( t )
        .addClass( "ui-state-highlight" );
      setTimeout(function() {
        tips.removeClass( "ui-state-highlight", 1500 );
      }, 500 );
    }

    function checkLength( o, n, min, max ) {
      if ( o.val().length > max || o.val().length < min ) {
        o.addClass( "ui-state-error" );
        updateTips( "Longitud de " + n + " debe estar entre " +
          min + " and " + max + "." );
        return false;
      } else {
        return true;
      }
    }

    function checkRegexp( o, regexp, n ) {
      if ( !( regexp.test( o.val() ) ) ) {
        o.addClass( "ui-state-error" );
        updateTips( n );
        return false;
      } else {
        return true;
      }
    }

	function checkPropietario() {
		if(archiprestazgo_edit.val() == 'ningun'){
			archiprestazgo_edit.addClass("ui-state-error");
			updateTips( "Debe seleccionar algo en el campo Archiprestazgo" );
			return false;
		} else {
			if(archiprestazgo_edit.val() > -1){
				if(parroquia_edit.val() == "ningun"){
					parroquia_edit.addClass("ui-state-error");
					updateTips( "Debe seleccionar algo en el campo Parroquia" );
					return false;
				}
			}
		}
		return true;
	}

    function updateInm() {
        var valid = true;
        allFields.removeClass("ui-state-error");
        valid = valid && checkPropietario();
        valid = valid && checkLength(direccion_edit, "Direccion", 1, 200);
        valid = valid && checkLength(metraje_edit, "Metraje", 1, 20);
        valid = valid && checkLength(tipo_inm_edit, "Tipo de Inmueble", 1, 50);
        valid = valid && checkLength(linderos_edit, "Linderos", 1, 200);

        if (valid) {
            //información del formulario
    		var formData = new FormData(document.getElementById("form_inm_edit"));

            //hacemos la petición ajax
            $.ajax({
                url: 'actualizarInm.php',
                type: 'POST',
                // Form data
                //datos del formulario
                data: formData,
                //necesario para subir archivos via ajax
                cache: false,
                contentType: false,
                processData: false,
                //mientras enviamos el archivo
                /*beforeSend: function(){
                    //message = $("<span class='before'>Subiendo la imagen, por favor espere...</span>");
                    //showMessage(message)
                },*/
                //una vez finalizado correctamente
                success: function(data){
                    $("#mostrarInmuebles").empty();
                    $("#mostrarInmuebles").load("procesarInm.php?edit_inm=1");
                },
                //si ha ocurrido un error
                error: function(){
                    //message = $("<span class='error'>Ha ocurrido un error.</span>");
                    //showMessage(message);
    				alert('ocurrio un error');
                }
            });
            //FIN ADD

            dialogEditInm.dialog("close");
        }
        return valid;
    }

    dialogEditInm = $("#dialog-edit-inmueble").dialog({
        autoOpen: false,
        height: 600,
        width: 1000,
        modal: false,
        buttons: {
            "Guardar cambios": updateInm,
            Cancelar: function() {
                dialogEditInm.dialog("close");
            }
        },
        close: function() {
            form[0].reset();
            allFields.removeClass("ui-state-error");
        }
    });

    form = dialogEditInm.find("form").on("submit", function(event) {
        event.preventDefault();
        updateInm();
    });

    $("#mostrarInmuebles").on("click", ".edit_inm", function(event) {
        event.preventDefault();
        tips.text('');
        $.getJSON("enviarDatosDeInm.php?id_inm="+$(this).data('inm'), function(data) {
            $("#id_inm").val(data.id_inm);
            $("#id_cod_edit").text(data.cod_inm);
            $("#cod_inm_edit").val(data.cod_inm);
            $("#archiprestazgo_edit").val(data.archiprestazgo);
            obtSelectParros(data.archiprestazgo, data.parroquia);

            $("#direccion_edit").val(data.direccion);
            $("#modo_adq_edit").val(data.modo_adq);
            $("#metraje_edit").val(data.metraje);
            $("#tipo_inm_edit").val(data.tipo_inm);
            $("#linderos_edit").val(data.linderos);
            $("#descripcion_inm_edit").val(data.descripcion);
            $("#fechaDocEdit").val(data.fecha);
            $("#fecha_doc_edit").val(data.fecha);
            $("#datos_registro_doc_edit").val(data.datos_registro);
            $("#abogado_redactor_doc_edit").val(data.abogado_redactor);
            $("#estatus_edit").val(data.estatus);

            $("#list_archivo_inmueble_edit").html('');

            data.archivos.forEach(function(archivo) {
                var item = $("<div>").addClass('btn-group')
                            .attr('id', 'btn-delete-inmueble-' + data.id_inm)
                            .append(
                                $('<a>').addClass('btn btn-default btn-sm')
                                .attr('target', '_blank')
                                .attr('href', archivo.url)
                                .attr('title', 'Descargar ' + archivo.name)
                                .append($('<span>').html(archivo.short_name))
                                .append($('<span>').addClass('glyphicon glyphicon-save')))
                            .append(
                                $('<a>').addClass('btn btn-danger btn-sm')
                                .attr('href', '#')
                                .attr('title', 'Eliminar ' + archivo.name)
                                .attr('data-inm', data.id_inm)
                                .attr('data-name', archivo.name)
                                .append($('<span>').addClass('glyphicon glyphicon-trash')));
                $('#list_archivo_inmueble_edit').append(item);
            });
        });

        dialogEditInm.dialog("open");
    });

	function obtSelectParros(arch_val, parro){
		var enlace;
		var parroquia_edit = $("#parroquia_edit");
		parroquia_edit.empty().html("<option value='ningun'>Seleccionar...</option>");

		if( (arch_val != 'ningun') && (arch_val != '-1') )
		{
			if(arch_val == '0')
			{
				enlace = "obtSelectFunds.php";
				$.ajax({
					url: enlace,
					success: function(result){
						parroquia_edit.append(result);
						$("#parroquia_edit").val(parro);
					}
				});
			}
			else
			{
				enlace = "obtSelectParros.php?id_archif="+arch_val;
				$.ajax({
					url: enlace,
					success: function(result){
						parroquia_edit.append(result);
						$("#parroquia_edit").val(parro);
					}
				});
			}
		}
	}
  });
