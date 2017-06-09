$(function(){
	$("a[name='del_arch']").click(function(event){
		event.preventDefault();
		$.get("del_arch.php?id_arch="+$(this).data('arch'), function(){
			$("#lista").empty();
			$("#lista").load("listaArchiprestazgos.php");
		});

	});
});