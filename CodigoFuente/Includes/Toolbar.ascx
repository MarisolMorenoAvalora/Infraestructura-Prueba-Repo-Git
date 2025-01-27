<%@ control language="C#" autoeventwireup="true" inherits="Includes_Toolbar, App_Web_1sw2qqip" %>

<link href="../App_Themes/default/toolbar.css" rel="stylesheet" type="text/css" />


<span class="clear float_left" style="width:100%;"> 
<ul>
    <li id="ctlNuevo" runat="server" class="float_left">
        <asp:ImageButton ID="btnNuevo" runat="server" ImageUrl="~/App_Themes/img/ico-16x16/page_add.png" 
                                        OnClick="btnNuevo_Click" CausesValidation="False" TabIndex="-1"/>     
       <asp:LinkButton ID="LnkNuevo"  runat="server" OnClick="LnkNuevo_Click" 
                                        CssClass="" CausesValidation="False" TabIndex="-1" Text="<%$Resources:Resource, Nuevo%>"></asp:LinkButton>   
        
       <!--<img src="Images/static_separator1.gif" />-->
    </li>
    
    <li id="ctlBuscar" runat="server" style="text-align:center" class="float_left">
         <asp:ImageButton ID="btnBuscar" runat="server" ImageUrl="~/App_Themes/img/ico-16x16/search.png" 
                                        OnClick="btnBuscar_Click" CausesValidation="False" TabIndex="-1"/>        
        <asp:LinkButton ID="lnkBuscar" runat="server"  OnClick="lnkBuscar_Click" 
                                         TabIndex="-1" CausesValidation="False" Text="<%$Resources:Resource, Buscar%>"></asp:LinkButton>
       <!--<img src="Images/static_separator1.gif" />-->
    </li>
    <li id="ctlGuardar" runat="server" style="text-align:center" class="float_left">
        <asp:ImageButton ID="btnGuardar" runat="server"  ImageUrl="~/App_Themes/img/ico-16x16/disk.png" 
                                 OnClick="btnGuardar_Click" CausesValidation="False" TabIndex="-1"/>   
        <asp:LinkButton ID="lnkGuardar" runat="server" OnClick="lnkGuardar_Click" 
                                  TabIndex="-1" CausesValidation="False" Text="<%$Resources:Resource, Guardar%>"></asp:LinkButton>
       <!--<img src="Images/static_separator1.gif" />-->
    </li>
    <li id="ctlEliminar" runat="server" style="text-align:center" class="float_left">
        <asp:ImageButton ID="btnEliminar" runat="server"  ImageUrl="~/App_Themes/img/ico-16x16/cross.png"  
                                    OnClick="btnEliminar_Click" TabIndex="-1"/>  
        <asp:LinkButton ID="lnkEliminar" runat="server" OnClick="lnkEliminar_Click" 
                                     TabIndex="-1"  Text="<%$Resources:Resource, Eliminar%>"></asp:LinkButton>
       <!--<img src="Images/static_separator1.gif" />-->
    </li> 
    <li id="ctlImprimir" runat="server" style="text-align:center" class="float_left">
        <asp:ImageButton ID="btnImprimir" runat="server" ImageUrl="~/App_Themes/img/ico-16x16/toolbar-print.png"  
                                    OnClick="btnImprimir_Click" CausesValidation="False" TabIndex="-1"/>        
        <asp:LinkButton ID="LinkButton2" runat="server" OnClick="lnkImprimir_Click" 
                                     CausesValidation="False" TabIndex="-1" Text="<%$Resources:Resource, Imprimir%>"></asp:LinkButton>
       <!--<img src="Images/static_separator1.gif" />-->
    </li>
    <li id="ctlExcel" runat="server" style="text-align:center" class="float_left">
        <asp:ImageButton ID="btnExcel" runat="server" ImageUrl="~/App_Themes/img/ico-16x16/toolbar-export.png"
                                    OnClick="btnExcel_Click" CausesValidation="False" TabIndex="-1"/>  
        <asp:LinkButton ID="lnkExcel" runat="server" OnClick="lnkExcel_Click" 
                                    CausesValidation="False" TabIndex="-1" Text="<%$Resources:Resource, Exportar%>"></asp:LinkButton>
       <!--<img src="Images/static_separator1.gif" />-->
    </li> 
    <li id="ctlSalir" runat="server" style="text-align:center" class="float_left">
        <asp:ImageButton ID="btnSalir" runat="server" ImageUrl="~/App_Themes/img/ico-16x16/arrow_undo.png"
                                    OnClick="btnSalir_Click" CausesValidation="False" TabIndex="-1"/>        
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="lnkSalir_Click" 
                                     CausesValidation="False" TabIndex="-1" Text="<%$Resources:Resource, Volver%>" ></asp:LinkButton>
       <!--<img src="Images/static_separator1.gif" />-->
    </li>
    
    <li id="ctlNuevaReserva" class="float_right" style="vertical-align:top" runat="server" >        
        
        <asp:ImageButton ID="btnNuevaReserva" runat="server" ImageUrl="~/App_Themes/img/ico-16x16/door_in.png"
                                    OnClick="btnNuevaReserva_Click" CausesValidation="False" TabIndex="-1"/>        
        <asp:LinkButton ID="lnkNuevaReserva" runat="server" OnClick="lnkNuevaReserva_Click" 
            CausesValidation="False" TabIndex="-1" Text="<%$Resources:Resource, NuevaReserva%>" ></asp:LinkButton>
    </li>
    
     
    <li id="ctlAyuda" class="float_right" style="vertical-align:top" runat="server" >        
        
        <asp:Label ID="lblTitulo" runat="server" CssClass="titulo-toolbar" ></asp:Label>        

        <asp:ImageButton ID="imbAyuda" runat="server" ImageUrl="~/App_Themes/img/ico-16x16/help.png"  
            CausesValidation="False"
            Visible="False" TabIndex="-1"/>     
    </li>
</ul>
</span>