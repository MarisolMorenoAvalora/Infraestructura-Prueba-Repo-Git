<%@ page language="C#" autoeventwireup="true" inherits="SeleccionarImagen, App_Web_nbzlxfjc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<link href="App_Themes/Avalora/NuevosEstilos.css" rel="stylesheet" type="text/css" />


<form action="SeleccionarImagen.aspx" runat="server" id="fmrSeleccionarImagen">
<html xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1" runat="server" style="background-color:White;">
    <title>Seleccionar Imagen</title>


    <script src="js/jquery/jquery-1.8.0.min.js" type="text/javascript"></script>
    <script src="js/jquery/jquery-ui-1.8.23.custom.js" type="text/javascript"></script>
    <script src="js/funciones_jquery.js" type="text/javascript"></script>

</head>
<body style="background-color:#E5E5E5" leftmargin="0" topmargin="0" bottommargin="0" rightmargin="0">
<div id="DivToolbar" class="toolbar">
    <Avalora:Toolbar ID="Toolbar" runat="server" Buscar="false" Eliminar="false" Guardar="true" ExportarExcel="false" 
            Imprimir="False" Nuevo="false" Titulo="" OnSalir_Click="Salir_Click" OnGuardar_Click="Guardar_Click" />
</div>
    <div id="TablaContenidos">
        <span class="clear" >
            <asp:Label ID="lblTituloPagina" CssClass="input_medio" Style="color: Gray" runat="server" Visible="false" ></asp:Label>        
        </span>
        <span class="H3cabecera_seccion">
                <asp:FileUpload ID="FileUpload1" runat="server" Width="400px" EnableViewState="true" />
                <input type="hidden" id="hiddenTipoPantalla" runat="server" />
                <input type="hidden" id="hiddenIdOpcion" runat="server" />
                <input type="hidden" id="hiddenIdReg" runat="server" />
        </span>        
    </div>
</body>
</html>
</form>
