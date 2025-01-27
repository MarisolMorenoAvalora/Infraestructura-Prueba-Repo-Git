<%@ page language="C#" autoeventwireup="true" inherits="Login, App_Web_nbzlxfjc" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" style="overflow:hidden">
<head id="Head2" runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=8"/>

    <title>OHLA | Reserva de Salas</title>
 
    


    <script src="Includes/js/jquery/jquery-1.8.0.min.js" type="text/javascript"></script>
    <script src="Includes/js/jquery/jquery-ui-1.8.23.custom.js" type="text/javascript"></script>
    <script src="Includes/js/funciones_jquery.js" type="text/javascript"></script>
    <%-- Este pluggin de jquery, sirve para abrir la ventana en dialog--%>
    <script src="Includes/js/jquery/jquery.simplemodal.1.4.4.min.js" type="text/javascript"></script>
    <%--<script src="Includes/js/jquery/jquery.simplemodal-1.3.5.min.js" type="text/javascript"></script>--%>
        
        
    <script src="Includes/js/FormatearHoras.js" type="text/javascript"></script>
    <script src="Includes/js/FormatearTextos.js" type="text/javascript"></script>
    <script src="Includes/js/FormatearNumeros.js" type="text/javascript"></script>
    
    <%--<link href="App_Themes/Avalora/jquery-ui-1.8.23.custom.css" rel="stylesheet" type="text/css" />
    <link href="App_Themes/Avalora/Avalora_Portal.css" rel="stylesheet" type="text/css" />--%>

     <script type="text/javascript">

         function capLock(e) {
             kc = e.keyCode ? e.keyCode : e.which;
             sk = e.shiftKey ? e.shiftKey : ((kc == 16) ? true : false);
             //.getElementById('trMessageMay').innerHTML = 'Mayuscula Activado'; //diccionario["capLockMensaje"];
             if (((kc >= 65 && kc <= 90) && !sk) || ((kc >= 97 && kc <= 122) && sk)) {
                 document.getElementById('trMessageMay').style.display = '';
                 document.getElementById('trMessage').style.display = 'none';
             }
             else
                 document.getElementById('trMessageMay').style.display = 'none';
         }

         function SetFocus() {
             document.getElementById('UsuarioTextBox').focus();
         }
         window.onload = SetFocus;
    </script>
    <script language="javascript" type="text/javascript">

        cargarClasesMenu();
      
  </script>

</head>
<body onload="javascript:SetFocus();">
    <form id="form2" runat="server" defaultbutton="AceptarSbm" defaultfocus="UsuarioTextBox" >


<div class="envoltorio">

<div class="cabecera_envoltorio">
                   <div class="cabecera_izquierda imagen2" ></div>  <!--  style="background: url(App_Themes/img/UI/bg_cabecera_central.jpg) repeat-x scroll 0 0 transparent;" -->
                       <div class="cabecera">
                        <h1>
                            <a title="Inicio" href="Default.aspx">
                                    <span id="ctl00_Label1">OHLA Reserva de Salas</span>
                            </a>
                        </h1>
                    </div>
                    <!-- FIN .cabecera -->
</div>


<div class="bloque_central_envoltorio">                 
                    <div class="bloque_central" style="min-height: 75px; width:415px; margin: 20px auto;">

     


          <span class="clear">         
            <span>
                 <h3 class="H3cabecera_seccion">
                    <span class="icon icon-application-form">&nbsp;</span>
                    <asp:Label ID="Label4" runat="server" Text='<%$Resources:Resource, AccesoSistema%>' />


        <span class="float_right" >
                        <asp:Literal ID="idiomasBanderas" runat="server" Visible="false" /> 
            <asp:Repeater ID="RpBanderas" runat="server"
                        onitemcommand="RpBanderas_ItemCommand" OnItemDataBound="RpBanderas_ItemDataBound" >
                        <ItemTemplate>
                            <asp:HiddenField id="descIdioma" runat="server" Value='<%# Eval("DESC_IDIOMA")%>' />
                            <asp:ImageButton ID="BanderasImageButton"  runat="server" CommandArgument='<%# Eval("CULTURA")%>' CommandName="CambiaIdioma" ImageUrl='<%#Eval("Logo")%>' ToolTip='' />
                            <asp:TextBox ID="IdIdiomaTextBox" runat="server" Text='<%# Eval("ID_IDIOMA")%>' 
                                Visible="false" />
                        </ItemTemplate>
                    </asp:Repeater>                                             
        </span>

                </h3>
            </span>        
          </span>
         
      <span class="clear"> 
      

        
        <div>
         <span class="clear">
             <asp:Label ID="Label5" runat="server" CssClass="label_corto float_left" Text='<%$Resources:Resource, Usuario%>' />
             <asp:TextBox ID="UsuarioTextBox"   runat="server" Text="" onkeypress="capLock(event)" CssClass="input_corto-medio float_left" />
         </span>   
          <span class="clear">
             <asp:Label ID="Label6" runat="server" CssClass="label_corto float_left" Text='<%$Resources:Resource, Contraseña%>' />
              <asp:TextBox ID="ContrasenaTextBox" runat="server" TextMode="Password" onkeypress="capLock(event)"  CssClass="input_corto-medio float_left"  />
         </span>    
          
          
         </div> 
         <div style="vertical-align:text-bottom; height:40px">
             <span class="label_corto">&nbsp;</span>
            <span >                              
                  <asp:Button ID="AceptarSbm" runat="server" Text="<%$Resources:Resource, Acceder%>"  CssClass="botonIco icon-disconnect" UseSubmitBehavior="false" OnClick="AceptarSbm_Click"/> <!--  =rmGlobal("Acceder") -->
                    
            </span>    
          </div>
         <span class="clear float_left" style="text-align:left; background:white url(App_Themes/img/warning.jpg) 2px center no-repeat; padding-left:33px; padding-bottom:5px; display:none; font-weight:normal" 
          ID="trMessageMay" runat="server">
                <asp:Label ID="Label7" runat="server" CssClass="label_login clear_both" Text='<%$Resources:Resource, MayusculasActivado%>' />  
         </span>   
         <span class="clear float_left" style="text-align:left;  background:white url(App_Themes/img/warning.jpg) 2px center no-repeat; padding-left:33px; padding-bottom:5px; display:none; font-weight:normal"
          ID="trMessage" runat="server">
               <asp:Label ID="Label8" runat="server" CssClass="label_login clear_both" Text='<%$Resources:Resource, LoginError%>' />   
         </span>   
         
      </span>    
      </div>
    

   
    </div>
 </div>
                <div class="pie_pagina_envoltorio">
                    <div class="pie_pagina">
                        <p>
                                                   
                        </p>
                    </div><!--/.pie_pagina -->
                </div>
    </div>
 </form>
</body>
</html>
