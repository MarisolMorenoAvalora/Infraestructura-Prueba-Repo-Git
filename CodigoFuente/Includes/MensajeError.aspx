<%@ page language="C#" autoeventwireup="true" inherits="Includes_MensajeError, App_Web_1sw2qqip" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server" style="background-color:White;">
    <title></title>
    <link href="../App_Themes/default/core.css" rel="stylesheet" />
    <link href="../App_Themes/default/containers.css" rel="stylesheet" />
    <link href="../App_Themes/default/dialogos.css" rel="stylesheet" />
    <link href="../App_Themes/default/botones.css" rel="stylesheet" />
    <link href="../App_Themes/default/layout.css" rel="stylesheet" />
    <link href="../App_Themes/default/icons-Base64.css" rel="stylesheet" />
    <link href="../App_Themes/default/genericas.css" rel="stylesheet" />
    <script src="js/jquery/jquery-1.8.0.min.js" type="text/javascript"></script>
    <script src="js/jquery/jquery-ui-1.8.23.custom.js" type="text/javascript"></script>
    <script src="js/funciones_jquery.js" type="text/javascript"></script>

      <script type="text/javascript" language="javascript">

          function Cerrar() {              
              window.parent.$.modal.close();
          }             
            

    </script>
</head>
<body  style="background-color:white;" id="body">

    <form id="form1" style="border-width:0; " runat="server">
    <div class="bloque_central ancho-tres-cuartos float_none" style="margin-top:20px;">
        <div class="mensaje_alert" onblur="alert(this.name);">
            <h3>
                <asp:Label ID="lblMensajeInformativo" runat="server" Text="<%$Resources:Resource, ValidacionDatos%>" />
            </h3>
            <p>
                <asp:Label ID="lblMensaje" runat="server"  Text="Descripción en texto del aviso"></asp:Label>        
            </p>        
        
              <div class="clear" style="text-align:center">            
                <input type="button" class="botonIco icon-cancel"  runat="server" id="btnCancelar"
                    value="<%$Resources:Resource, Cerrar%>"
                    onclick="Cerrar();"   />                                    
                </div>
        </div>   
    </div>   
    </form>
</body>
</html>
