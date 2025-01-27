
<%@ page language="C#" autoeventwireup="true" inherits="BuscarTipoRecurso, App_Web_imuq2iyt" masterpagefile="~/MasterPage.master" %>
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
            Imprimir="false" Nuevo="true" ExportarExcel="false" Titulo="Búsqueda de Tipo Recurso" OnNuevo_Click="Nuevo_Click"
            OnSalir_Click="Salir_Click" OnBuscar_Click="Buscar_Click" FileAyuda ="GRSalas.pdf" />
 </div>
   
 <span class="clear">
 <div>
       
      <span class="clear"> 
            <span class="label_corto">
                <%=rmGlobal("Descripcion")%>
             </span>     
             <Avalora:AvaloraText ID="txtDescripcion" runat="server" CssClass="input_medio float_left" Intro="true" />     		    		    
		           		    
		    <asp:CheckBox ID="chkBaja"  Text="<%$Resources:Resource, Baja%>" runat="server" CssClass="label_corto" Checked="false" />            
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
        <asp:TemplateField  ItemStyle-Width="90%" HeaderStyle-Width="90%">
            <HeaderTemplate>
                <headertemplate>                                                
                    <asp:LinkButton  ID="lnkNombre" OnClick="OrdenarPor" 
                    CommandName="Descripcion" runat="server"   Text="<%$Resources:Resource, Descripcion%>"></asp:LinkButton>                                                
                </headertemplate>
            </HeaderTemplate>
             <ItemTemplate>                       
                    <asp:TextBox Text ='<%# Bind("Descripcion") %>' CssClass="input_grid ancho-completo"  runat="server" ID="txtDescripcion" ></asp:TextBox>
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