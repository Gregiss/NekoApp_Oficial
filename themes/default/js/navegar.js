var search_top = "-35px";
$(".search").css("top", search_top);
var tabs = 1;
var grupos = 0;

$(".tabs .icon").click(function(){
	var href = $(this).data("id");
	if(href == "search"){
		if(search_top == "-35px"){
			search_top = "0px";
			icon_index_search = "5";
		}
		else{
			search_top = "-35px";
			icon_index_search = "0";
		}
		$(".search").css("top", search_top);
	}
})

$(".tabs").mouseover(function(){
	tabs = 1;
});

$(".tabs").mouseout(function(){
	tabs = 0;
});

$(".sugered").mouseover(function(){
	grupos = 1;
});

$(".sugered").mouseout(function(){
	grupos = 0;
});

$(function() {

   $(".sugered").mousewheel(function(event, delta) {
   	if(grupos == 1){
      this.scrollLeft -= (delta * 30);
      event.preventDefault();
   }
   });

});


$(function() {

   $(".tabs").mousewheel(function(event, delta) {
   	if(tabs == 1){
   	if(grupos == 0){
      this.scrollTop -= (delta * 30);
      event.preventDefault();
   }
}
   });

});

$(function() {

   $(".scroll").mousewheel(function(event, delta) {
   	if(tabs == 0){
   if(grupos == 0){
      this.scrollLeft -= (delta * 30);
    
      event.preventDefault();
     }
 }
   });

});

navegartabs();
acessarGrupos();

function navegartabs(){
	$(".fixed .links_rapido").click(function(){
		var onde = $(this).data("id");
		$(".tabs").css("padding", "0px");
		$(".fixed .links_rapido").css("color", "var(--white2)");
		$( ".fixed .links_rapido" ).removeClass( "active" );
		$(".tabs").css("left", "-15px");
		if(onde == "perfil"){
			$(".tabs").css("width", "0%");
			$("#me").css("width", "100%");
		} else if(onde == "feed"){
			$(".tabs").css("width", "0%");
			$("#feed").css("width", "100%");
		} else if(onde == "grupos"){
			$(".tabs").css("width", "0%");
			$(".grupos").css("width", "100%");
		}
		$(this).css("color", "#fff");
		$(this).addClass( "active" );
	});
}

function acessarGrupos(){
	$(".grupos .sugered .people").click(function(){
		var id = $(this).data("id");
		var servidorname = $(this).data("servidor");
		$("#feed .feed #group").html(servidorname);
	});
}