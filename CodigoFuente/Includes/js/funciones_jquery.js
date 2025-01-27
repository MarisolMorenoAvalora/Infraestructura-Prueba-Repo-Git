// JavaScript Document

//Tabs y dialog modal
$(document).ready(function() {
    // jQuery UI
    $(function() {
        
        $('#tabs').tabs();
    });
  
    $(function() {
        $("#dialog-modal").dialog({
            width: 640,
            height: 340,
            modal: true
        });
    });
 
});


/**********************CUADRO DE DIALOGO MODAL**************/
/*Parámetros: 
-   ruta de la pantalla a abrir
-   alto para el cuadro
-   ancho para el cuadro   
*/

function AbrirEmergente(ruta, alto, ancho) {
    //debugger;
    if (alto == undefined) {
        alto = 610;
    }


    if (ancho == undefined) {
        ancho = 1010;
    }    
    $('<div class="dialog" style="width:' + (parseInt(ancho) - 10) + 'px;height:' + (parseInt(alto) - 10) + 'px; overflow:hidden"><iframe scrolling=auto height=100% width=100% frameborder=0 marginheight=0 marginwidth=0   src=' + ruta + '></iframe></div>').fadeIn('slow').modal();


}

function SmallAbrirEmergente(ruta, alto, ancho) {
    //debugger;
    if (alto == undefined) {
        alto = 300;
    }

    if (ancho == undefined) {
        ancho = 500;
    }    
    $('<div class="dialog" style="width:' + (parseInt(ancho) - 10) + 'px;height:' + (parseInt(alto) - 10) + 'px; overflow:hidden"><iframe scrolling=auto height=300 width=500 frameborder=0 marginheight=0 marginwidth=0   src=' + ruta + '></iframe></div>').fadeIn('slow').modal();
}



function AbrirR(ruta, alto, ancho) {

    debugger;
    $.fx.speeds._default = 1000;

    $('<iframe id="1" scrolling=auto style="height:100%;width:100%;" src="' + ruta + '" />').dialog({

        autoOpen: true,

        show: "blind",

        hide: "explode",

        resizable: false,

        autoResize: true,

        width: 600,

        height: 900

    }).width(600).height(900);

}
//**********************FIN CUADRO DE DIALOGO MODAL**************/



//Función que abre pantalla modal
function showRegDialog(url, alto, ancho) {
    if (alto == undefined) {
        alto = 500;
    }
    if (ancho == undefined) {
        ancho = 700;
    }
    
    $(function() {
        var $this = $(this);
        var horizontalPadding = 30;
        var verticalPadding = 30;
        
        $('<iframe id="ventanaModal" scrolling="no" frameborder="0" class="externalSite" src="' + url + '" />').dialog({
            autoOpen: true,
            width: parseInt(ancho),
            height: parseInt(alto),
            modal: true,
            resizable: true,
            autoResize: true,            
            overlay: { opacity: 0.5, background: "black"}
        }).width(parseInt(ancho) - horizontalPadding).height(parseInt(alto) - verticalPadding);
    });

}


/*****----PARA EL MENÚ de <ul> <li>----*****/
/*****----                          ----*****/
/*
    Función necesaria para los menús <ul> <li> para que muestre/oculte
    los distintos niveles    
*/
function cargarClasesMenu() {
    // MENU NIVEL 01 EN CABECERA PARA MOSTRAR NIVEL 02
    $(document).ready(function() {

        //OCULTA SUBNIVELES UL NIVEL02
        $('ul.menu_nivel02').hide();
        //OCULTA SUBNIVELES UL NIVEL03

        //MUESTRA NIVEL 02 ON-HOVER
        $('ul.menu_nivel01 li').hover(
        //OnHover
			function() {
			    //OCULTA OTROS MENUS
			    $('.menu_nivel01').not($('ul',
this)).stop();
			    $('.menu_nivel03').hide();
			    // AD CLASE A LI Y A ANCHOR PARA DEJAR SELECCIONADO SIN HOVER

			    $(this).addClass('menu_nivel01_seleccionado');
			    $('a',
this).addClass('menu_nivel01_seleccionado');
			    // OCULTA NIVEL02 Y MUESTRA LISTA MENU NIVEL
			    02
			    $('.menu_nivel02', this).hide();
			    $('.menu_nivel02', this).slideDown();
			    $('.test').hover(function() {
			        $('.menu_nivel03',
this).slideDown();
			    });

			},
        //FUERA DEL SUBMENU
			function() {
			    // OCULTA OTROS MENUS
			    $('.menu_nivel02', this).slideUp();
			    // ELIMINA LAS CLASES SELECCIONADO

			    $(this).removeClass('menu_nivel01_seleccionado');
			    $('a',
this).removeClass('menu_nivel01_seleccionado');
			    //$('ul.menu_nivel03').show();
			}
		);
    });

    // MENU FAVORITOS E IDIOMA
    $(function() {

        //OCULTA LOS DESPLEGADOS
        $('.menu_fav_leng li ul').hide();

        //ON HOVER MOSTRAR NIVEL
        $('.menu_fav_leng li').hover(
        //OnHover
			function() {
			    //OCULTA OTROS MENUS
			    $('.menu_fav_leng ul li').not($('ul', this)).stop();
			    // MUESTRA NIVEL
			    $('ul', this).slideDown();

			    // AD CLASE A LI Y A ANCHOR PARA DEJAR SELECCIONADO SIN HOVER

			    $(this).addClass('but_favoritos_seleccionado');
			    $('a',
this).addClass('menu_nivel01_seleccionado');
			    $('.menu_fav_leng ul li a').removeClass('menu_nivel01_seleccionado');
			},
        //FUERA DEL SUBMENU
			function() {
			    // OCULTA MENU ACTIVO
			    $('ul', this).slideUp();
			    // ELIMINA LAS CLASES SELECCIONADO

			    $(this).removeClass('but_favoritos_seleccionado');
			    $('a',
this).removeClass('menu_nivel01_seleccionado');
			}
		);

    });
}
/*****----        FIN              ----*****/
/*****----PARA EL MENÚ de <ul> <li>----*****/






