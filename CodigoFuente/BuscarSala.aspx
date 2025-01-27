<%@ page language="C#" autoeventwireup="true" inherits="BuscarSala, App_Web_imuq2iyt" masterpagefile="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<script type="text/javascript" language='javascript'>

    function __doPostBackFNC(eventTarget, eventArgument) {
        var theform = document['aspnetForm'];
        theform.__EVENTTARGET_FNC.value = eventTarget;
        theform.__EVENTARGUMENT_FNC.value = eventArgument;
        __doPostBack('ctl00_UpdatePanelGeneral', '');
    }

    function FilaSeleccionada(idFila) {
        __doPostBackFNC('filaSeleccionada', idFila);
    }
</script>

 <div class="toolbar">
     
     <Avalora:Toolbar ID="ToolbarBusqueda" runat="server" Buscar="true" Eliminar="false" Guardar="false"
            Imprimir="false" Nuevo="true" ExportarExcel="false" Titulo="Búsqueda de Usuarios" OnNuevo_Click="Nuevo_Click"
            OnSalir_Click="Salir_Click" OnBuscar_Click="Buscar_Click" FileAyuda ="GRSalas.pdf"/>
 </div>
   
 <span class="clear">
 <div >
       	<span class="clear"> 
            <span class="label_corto">
                <%=rmGlobal("NombreSala")%>
             </span>                    		    
             <Avalora:AvaloraText ID="txtSala" runat="server" CssClass="input_medio-largo float_left" Intro="true" />     		    		    		    		    

            <asp:CheckBox ID="chkBaja"  Text="<%$Resources:Resource, Baja%>" runat="server" CssClass="label_corto-medio float_left" Checked="false" />
		</span>


      <span class="clear"> 
            <span class="label_corto">
                <%=rmGlobal("Pais")%>
             </span>     
             <asp:DropDownList ID="cboPais" runat="server" 
          CssClass="select_corto-medio float_left" AutoPostBack="true" 
          onselectedindexchanged="cboPais_SelectedIndexChanged" >        		    
                
            </asp:DropDownList>
		    <span class="label_corto"> 
                <%=rmGlobal("Edificio")%> 
            </span>                    		    
             <asp:DropDownList ID="cboEdificio" runat="server" CssClass="select_corto-medio float_left" AutoPostBack="true" OnSelectedIndexChanged="cboEdificio_SelectedIndexChanged" >        		    
             </asp:DropDownList>               
		</span>
     

     <span class="clear">
         <span class="label_corto"> 
                <%=rmGlobal("TipoRecurso")%> 
            </span>                    		    
		      <asp:DropDownList ID="cboTipoRecurso" runat="server" CssClass="select_corto-medio float_left" AutoPostBack="false">        		                   
            </asp:DropDownList>
           <span class="label_corto"> 
                <%=rmGlobal("TipoSala")%> 
            </span>                    		    
		      <asp:DropDownList ID="cboTipoSala" runat="server" CssClass="select_corto-medio float_left" AutoPostBack="false">        		    
                <asp:ListItem Text="<%$Resources:Resource, Todas%>" Value="">                    
                </asp:ListItem>
                <asp:ListItem Text="<%$Resources:Resource, Normal%>" Value="N">                    
                </asp:ListItem>
                <asp:ListItem Text="<%$Resources:Resource, Formacion%>" Value="F">                    
                </asp:ListItem>
                <asp:ListItem Text="<%$Resources:Resource, Especial%>" Value="E">                    
                </asp:ListItem>
            </asp:DropDownList>     
     </span>
	
        <span class="clear">
        <span class="label_corto"> 
                <%=rmGlobal("UsoSala")%> 
            </span>                    		    
             <asp:DropDownList ID="cboVideoAudio" runat="server" CssClass="select_corto-medio float_left" AutoPostBack="false">        		    
                <asp:ListItem Text="<%$Resources:Resource, Todos%>" Value="">                    
                </asp:ListItem>
                <asp:ListItem Text="<%$Resources:Resource, Videoconferencia%>" Value="V">                    
                </asp:ListItem>
                <asp:ListItem Text="<%$Resources:Resource, Audiovisual%>" Value="A">                    
                </asp:ListItem>                
            </asp:DropDownList>         		    
        </span>
 </div>
 </span>
 <span class="clear">
        
    </span>

 <div class="data_grid">

    <span class="H3cabecera_seccion">
        <asp:Label  CssClass="icon icon-application-view-list"  runat="server" ID="lblNumRegistros" Text="<%$Resources:Resource, ResultadoBusqueda%>"></asp:Label>                                                                                             
    </span>
    <span class="clear">
        
    </span>
    <asp:GridView ID="grdBuscar" runat="server" AllowPaging="true"      
     OnPageIndexChanging="grdBuscar_PageIndexChanging"      
     OnRowDataBound="grdBuscar_RowDataBound"       
     AutoGenerateColumns="false" PageSize="10">        
    <Columns>   
         
         <asp:TemplateField  ItemStyle-Width="10%" HeaderStyle-Width="10%">
             <HeaderTemplate>
                <headertemplate>                                                
                    <asp:LinkButton  ID="lnkCod" OnClick="OrdenarPor" 
                    CommandName="codigo" runat="server"   Text="<%$Resources:Resource, Codigo%>"></asp:LinkButton>                                                
                </headertemplate>
            </HeaderTemplate>
             <ItemTemplate>                                             
                    <asp:TextBox  Text ='<%# Bind("codigo") %>' CssClass="input_grid ancho-completo"  runat="server" ID="txtCodigo"></asp:TextBox>                
            </ItemTemplate>
        </asp:TemplateField>                                                 
        <asp:TemplateField  ItemStyle-Width="45%" HeaderStyle-Width="40%">
            <HeaderTemplate>
                <headertemplate>                                                
                    <asp:LinkButton  ID="lnkNombre" OnClick="OrdenarPor"
                    CommandName="Descripcion" runat="server"   Text="<%$Resources:Resource, NombreSala%>"></asp:LinkButton>                                                
                </headertemplate>
            </HeaderTemplate>
             <ItemTemplate>                       
                    <asp:TextBox Text ='<%# Bind("Descripcion") %>' CssClass="input_grid ancho-completo"  runat="server" ID="txtDescripcion" ></asp:TextBox>
            </ItemTemplate>
            
        </asp:TemplateField>                                                 
        <asp:TemplateField  ItemStyle-Width="15%" HeaderStyle-Width="15%">
             <HeaderTemplate>
                <headertemplate>                                                
                    <asp:LinkButton  ID="lnkPais"  OnClick="OrdenarPor" 
                    CommandName="IdPais" runat="server"   Text="<%$Resources:Resource, Pais%>"></asp:LinkButton>                                                
                </headertemplate>
            </HeaderTemplate>
             <ItemTemplate>
                <asp:TextBox  Text ='<%# Bind("IdPais") %>' Visible="false"   runat="server" ID="txtIdPais" ></asp:TextBox>                          
                <asp:TextBox CssClass="input_grid ancho-completo"  runat="server" ID="txtDescPais" ></asp:TextBox>                          

            </ItemTemplate>
        </asp:TemplateField>
    <asp:TemplateField  ItemStyle-Width="15%" HeaderStyle-Width="15%">
             <HeaderTemplate>
                <headertemplate>                                                
                    <asp:LinkButton  ID="lnkEdificio"  OnClick="OrdenarPor"
                    CommandName="Edificio" runat="server"   Text="<%$Resources:Resource, Edificio%>"></asp:LinkButton>                                                
                </headertemplate>
            </HeaderTemplate>
             <ItemTemplate>
                <asp:TextBox  Text ='<%# Bind("Edificio") %>'  CssClass="input_grid ancho-completo"  runat="server" ID="txtEdificio" ></asp:TextBox>                          
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField  ItemStyle-Width="15%" HeaderStyle-Width="15%">
             <HeaderTemplate>
                <headertemplate>                                                
                    <asp:LinkButton  ID="lnkTipoSala"  OnClick="OrdenarPor" 
                    CommandName="TipoSala" runat="server"   Text="<%$Resources:Resource, TipoSala%>"></asp:LinkButton>                                                
                </headertemplate>
            </HeaderTemplate>
             <ItemTemplate>
                <asp:TextBox  Text ='<%# Bind("TipoSala") %>'  CssClass="input_grid ancho-completo"  runat="server" ID="txtTipoSala" ></asp:TextBox>                          
            </ItemTemplate>
        </asp:TemplateField>                                                       
    </Columns>                            
            <EmptyDataTemplate>
                <div class="mensaje_info">                                                             
                    <h3><asp:Label ID="lblAvisoGrid" runat="server" Text="<%$Resources:Resource, GridSinDatos%>" /></h3>                        
                </div>
            </EmptyDataTemplate>       
            <PagerSettings Mode="Numeric"  Position="Bottom" PageButtonCount="10" />
            <PagerStyle CssClass="data_grid_paginador" />
            </asp:GridView> 
</div> 
<div id="divHidden">
                    <input type="hidden" name="__EVENTTARGET_FNC" />
                    <input type="hidden" name="__EVENTARGUMENT_FNC" />
</div>
  
</asp:Content>