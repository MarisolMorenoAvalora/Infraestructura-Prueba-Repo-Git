<%@ page language="C#" autoeventwireup="true" inherits="BuscarUsuarioGesusu, App_Web_imuq2iyt" masterpagefile="~/MasterPageEmpty.master" %>

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
            Imprimir="false" Nuevo="false" ExportarExcel="false" Titulo="Búsqueda de Usuarios" OnBuscar_Click="Buscar_Click" OnSalir_Click="Salir_Click" />
 </div>
   
 <span class="clear">
 <div >
       
      <span class="clear"> 
            <span class="label_corto">
                <%=rmGlobal("Nombre")%>
             </span>     
             <Avalora:AvaloraText ID="txtNombre" runat="server" CssClass="input_medio float_left"  /><%//Intro="true"  %>
		    <span class="label_corto"> 
                <%=rmGlobal("Apellido1")%> 
            </span>                    		    
            <Avalora:AvaloraText ID="txtApellido1" runat="server" CssClass="input_medio float_left" /><%//Intro="true"  %>
		</span>
		<span class="clear"> 
            <span class="label_corto">
                <%=rmGlobal("Apellido2")%>
             </span>                    		    
             <Avalora:AvaloraText ID="txtApellido2" runat="server" CssClass="input_medio float_left" /><%//Intro="true"  %>  		    		    		    		               		    		    
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
                    <asp:Label ID="lnkCod" 
                    CommandName="ID_PERSONA" runat="server"   Text="<%$Resources:Resource, Codigo%>"></asp:Label>
                    <%--<asp:LinkButton  </asp:LinkButton>                                                --%>
                </headertemplate>
            </HeaderTemplate>
             <ItemTemplate>                                             
                    <asp:TextBox  Text ='<%# Bind("ID_PERSONA") %>' CssClass="input_grid ancho-completo"  runat="server" ID="txtCodigo"></asp:TextBox>                
            </ItemTemplate>
        </asp:TemplateField>                                                 
        <asp:TemplateField  ItemStyle-Width="45%" HeaderStyle-Width="45%">
            <HeaderTemplate>
                <headertemplate>                                                
                    <asp:Label ID="lnkNombre" 
                    CommandName="NOMBRE" runat="server"   Text="<%$Resources:Resource, Nombre%>"></asp:Label>                    
                </headertemplate>
            </HeaderTemplate>
             <ItemTemplate>                       
                    <asp:TextBox Text ='<%# Bind("NOMBRE") %>' CssClass="input_grid ancho-completo"  runat="server" ID="txtDescripcion" ></asp:TextBox>
                    <asp:TextBox Visible="false" Text ='<%# Bind("APELLIDO1") %>' runat="server" ID="txtApellido1" ></asp:TextBox>
                    <asp:TextBox Visible="false" Text ='<%# Bind("APELLIDO2") %>' runat="server" ID="txtApellido2" ></asp:TextBox>
            </ItemTemplate>
            
        </asp:TemplateField>                                                 
        <asp:TemplateField  ItemStyle-Width="45%" HeaderStyle-Width="45%">
             <HeaderTemplate>
                <headertemplate>                                                
                    <asp:Label ID="lnkEmail" 
                    CommandName="EMAIL" runat="server"   Text="<%$Resources:Resource, Email%>"></asp:Label>
                            
                </headertemplate>
            </HeaderTemplate>
             <ItemTemplate>
                <asp:TextBox  Text ='<%# Bind("EMAIL") %>'  CssClass="input_grid ancho-completo"  runat="server" ID="txtEmail" ></asp:TextBox>                          
            </ItemTemplate>
        </asp:TemplateField>                                                       
    </Columns>                            
            <EmptyDataTemplate>
                <div class="mensaje_info">                                                             
                    <h3><asp:Label ID="lblAvisoGrid" runat="server" Text="<%$Resources:Resource, GridSinDatos%>" /></h3>                        
                </div>
            </EmptyDataTemplate>       
            <PagerSettings Mode="Numeric"  Position="Bottom" PageButtonCount="10" />
            <PagerStyle CssClass="data_grid_paginador"/>
            </asp:GridView> 
</div> 

  <div id="divHidden">
                    <input type="hidden" name="__EVENTTARGET_FNC" />
                    <input type="hidden" name="__EVENTARGUMENT_FNC" />
</div>
</asp:Content>