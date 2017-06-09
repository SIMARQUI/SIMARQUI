  $(function() {
    var dialogNewInm, form,
 
      // From http://www.whatwg.org/specs/web-apps/current-work/multipage/states-of-the-type-attribute.html#e-mail-state-%28type=email%29
      //emailRegex = /^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/,
      id_inm = $( "#id_inm" ),
	  archiprestazgo = $( "#archiprestazgo" ),
      parroquia = $( "#parroquia" ),
      direccion = $( "#direccion" ),
	  modo_adq	= $("#modo_adq"),
	  metraje	= $("#metraje"),
	  tipo_inm	= $("#tipo_inm"),
	  linderos	= $("#linderos"),
	  descripcion	= $("#descripcion"),
	  
      allFields = $( [] ).add( id_inm ).add( archiprestazgo ).add( parroquia ).add( direccion ).add( modo_adq ).add( metraje ).add( tipo_inm ).add( linderos ).add( descripcion ),
      tips = $( ".validateTips" );
 
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
          min + " y " + max + "." );
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
	
	function campoRepetido(url, elem){
		var rep;
		var json = {
			"elem" : elem
		};
		
		$.ajax({
			dataType : "json",
			url : url,
			data : json,
			async : false,
			success : function(data) {
				rep = data.rep;
			}
		});
		return rep;
	}
	
	function checkId_inm(o, n, min, max){
		if(!checkLength(o, n, min, max)){
			return false;
		} else {
			if(campoRepetido("estaId_inmRepetido.php", o.val())){
				o.addClass( "ui-state-error" );
				updateTips( n + " se encuentra repetido" );
				return false;
			}
		}
		return true;
	}
	
	function checkPropietario() {
		if(archiprestazgo.val() == 'ningun'){
			archiprestazgo.addClass("ui-state-error");
			updateTips( "Debe seleccionar algo en el campo Archiprestazgo" );
			return false;
		} else {
			if(archiprestazgo.val() > -1){
				if(parroquia.val() == "ningun"){
					parroquia.addClass("ui-state-error");
					updateTips( "Debe seleccionar algo en el campo Parroquia" );
					return false;
				}
			}
		}
		return true;
	}
 
    function createInm() {
		var valid = true;
		allFields.removeClass( "ui-state-error" );
		valid = valid && checkId_inm(id_inm, "Codigo", 1, 1000);
		valid = valid && checkPropietario();
		valid = valid && checkLength( direccion, "Direccion", 1, 200 );
		valid = valid && checkLength( modo_adq, "Modo de Adquisicion", 1, 50 );
		valid = valid && checkLength( metraje, "Metraje", 1, 20 );
		valid = valid && checkLength( tipo_inm, "Tipo de Inmueble", 1, 50 );
		valid = valid && checkLength( linderos, "Linderos", 1, 200 );
		valid = valid && checkLength( descripcion, "Descripcion", 1, 200 );

      if ( valid ) {
		
		$.get("guardarInm.php?"+$("#form_inm_new").serialize(), function(){
			$("#mostrarInmuebles").empty();
			$("#mostrarInmuebles").load("procesarInm.php");
		});
		
        dialogNewInm.dialog( "close" );
      }
      return valid;
    }
 
    dialogNewInm = $( "#dialog-new-inmueble" ).dialog({
      autoOpen: false,
      height: 500,
      width: 700,
      modal: true,
      buttons: {
        "Guardar cambios": createInm,
        Cancelar: function() {
          dialogNewInm.dialog( "close" );
        }
      },
      close: function() {
        form[ 0 ].reset();
        allFields.removeClass( "ui-state-error" );
      }
    });
 
    form = dialogNewInm.find( "form" ).on( "submit", function( event ) {
      event.preventDefault();
      createInm();
    });
	
    $( "#create-inm" ).button().on( "click", function(event) {
	  event.preventDefault();
	  tips.text('');
      dialogNewInm.dialog( "open" );
    });
  });