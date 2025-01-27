<%@ page language="C#" autoeventwireup="true" inherits="ReservaExt, App_Web_nbzlxfjc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>OHLA | Reserva de Salas</title>
</head>
<body>
    
    <form id="form1" runat="server">
<div class="envoltorio">

        <div class="cabecera_envoltorio">
                            <div class="cabecera_izquierda" style="background: /*url(App_Themes/img/UI/bg_cabecera_central.jpg)*/ repeat-x scroll 0 0 transparent;"></div>
                            <div class="cabecera">
                                <h1>
                                    <a title="Inicio" href="Default.aspx">
                                            <span id="ctl00_Label1">OHLA Reserva de Salas</span>
                                    </a>
                                </h1>
                            </div><!-- FIN .cabecera -->
                            
        </div>
        <div class="bloque_central_envoltorio">                 
            <div class="bloque_central" style="min-height: 375px; width:500px; margin: 20px auto;">

                    <span class="clear">
                        <asp:Label ID="label1" runat="server" CssClass="label_completa" ></asp:Label>                        
                    </span>
                <span class="clear">
                        <asp:Label ID="label1a" runat="server" CssClass="label_completa" ></asp:Label>                        
                    </span>
                <span class="clear">
                        <asp:Label ID="label2" runat="server" CssClass="label_completa" ></asp:Label>                        
                    </span>
                <span class="clear">
                        <asp:Label ID="label3" runat="server" CssClass="label_completa" ></asp:Label>                        
                    </span>
                <span class="clear">
                        <asp:Label ID="label4" runat="server" CssClass="label_completa" ></asp:Label>                        
                    </span>
                <span class="clear">
                        <asp:Label ID="label5" runat="server" CssClass="label_completa" ></asp:Label>                        
                    </span>

                           <span class="clear">
                    <asp:Button ID="cmdAceptar" runat="server" Text="Aceptar" 
                             Visible="False" CssClass="botonIco icon-accept" onclick="cmdAceptar_Click" />
                        <asp:Button ID="cmdCancelar" runat="server"  CssClass="botonIco icon-cancel"
                            Text="Cancelar" onclick="cmdCancelar_Click" Visible="False" />
                        <asp:Button ID="cmdSalir" CssClass="botonIco icon-cancel" runat="server"  Visible="false" 
                            Text="Salir"  />
                    </span>
                    </div>
    
                 
            </div>
        </div>
        <div class="pie_pagina_envoltorio">
            <div class="pie_pagina">
                <p>
                    © 2013. Grupo Obrascón Huarte Lain, S.A.
                </p>
            </div><!--/.pie_pagina -->
        </div>
</div>
    </form>
</body>
</html>
