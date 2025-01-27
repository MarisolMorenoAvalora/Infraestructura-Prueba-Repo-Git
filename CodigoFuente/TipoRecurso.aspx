<%@ page language="C#" autoeventwireup="true" inherits="TipoRecurso, App_Web_imuq2iyt" masterpagefile="~/MasterPage.master" theme="default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 
<script type="text/javascript" language='javascript'>

    function __doPostBackFNC(eventTarget, eventArgument) {
        var theform = document['aspnetForm'];
        theform.__EVENTTARGET_FNC.value = eventTarget;
        theform.__EVENTARGUMENT_FNC.value = eventArgument;
        __doPostBack('ctl00_UpdatePanelGeneral', '');
    }

    function ConfirmarBaja() {
        var desc = '<%=Resources.Resource.TipoRecursoAsignadoReservaSalasDeseaDarBaja%>';

        if (confirm(desc))
            __doPostBackFNC('darBaja', 'darBaja');
    }
</script>
 <div class="toolbar">
     
     <Avalora:Toolbar ID="ToolbarEdicion" runat="server" Buscar="false" Eliminar="true" Guardar="true"
            Imprimir="false" Nuevo="false" ExportarExcel="false" Titulo="Gestión Usuario" OnSalir_Click="Salir_Click" 
            OnGuardar_Click="Guardar_Click" OnEliminar_Click="Eliminar_Click" FileAyuda ="GRSalas.pdf" />
 </div>
 
 <span class="clear">
 <div >
      <span class="clear"> 
            <span class="label_corto">
                <%=rmGlobal("Codigo")%>
             </span>          
             <Avalora:AvaloraText ID="txtCodigo" ReadOnly="true"  Enabled="false" runat="server" CssClass="input_mini float_left" Intro="true" />
                         		    
		    <asp:CheckBox ID="chkBaja" Text="<%$Resources:Resource, Baja%>" Enabled="true" runat="server" CssClass="label_corto" Checked="false" />            
		</span>
        
            <div class="data_grid">
		    <span class="clear">                                                    
                        <asp:GridView ID="grdDescripcion" runat="server" AllowPaging="false" AutoGenerateColumns="false" OnRowDataBound="grdDescripcion_RowDataBound">        
                                <Columns>                        
                                    <asp:TemplateField ItemStyle-Width="5%" HeaderStyle-Width="5%">                    
                                        <HeaderTemplate>   
                                                 <asp:Label ID="LblIdioma" runat="server" ><%=rmGlobal("Idioma")%></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <span class="clear float_left">
                                                 <asp:Image ID="BanderasImageButton"  runat="server" CssClass="float_left" ImageUrl='<%# Bind("IDIOMA.LOGO") %>' ToolTip=''/>                                                                                            
                                            </span>
                                        </ItemTemplate>                                                                                
                                    </asp:TemplateField>
                                    <asp:TemplateField >                    
                                        <ItemTemplate>
                                            <span class="clear float_left">
                                              <asp:HiddenField id="descIdioma" runat="server" Value='<%# Bind("IDIOMA.DESC_IDIOMA") %>' />
                                            <asp:Label ID="lblDescIdioma" runat="server" CssClass="input_grid ancho-completo" Text=''></asp:Label>
                                            </span>
                                        </ItemTemplate>                                                                                
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-Width="85%" HeaderStyle-Width="85%">                    
                                        <HeaderTemplate>                                                
                                                <asp:Label ID="LblDescripcion" runat="server" ><%=rmGlobal("DescripcionObligatorio")%></asp:Label>                                                
                                        </HeaderTemplate>                                        
                                        <ItemTemplate>
                                            <asp:TextBox  ID="txtDescripcion" runat="server" CssClass="input_medio-largo ancho-completo"  MaxLength="150" Text='<%# Bind("DESC_TIPO_RECURSO") %>' ></asp:TextBox>


                                                  <asp:TextBox Visible="false"  ID="txtID_IDIOMA" runat="server" ReadOnly="True"
                                                Text='<%# Bind("ID_IDIOMA") %>' ></asp:TextBox>
                                                <asp:TextBox Visible="false"  ID="txtIdTipoRecurso" CssClass="float_left" runat="server" ReadOnly="True"
                                                Text='<%# Bind("ID_TIPO_RECURSO") %>' ></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>                                    
                            </Columns>
                            <EmptyDataTemplate>
                            <div class="mensaje_info">                                                             
                                <p><asp:Label ID="lblAvisoGrid" CssClass="input_medio" runat="server" Text="<%$Resources:Resource, GridSinDatos%>" /></p>                        
                            </div>
                        </EmptyDataTemplate>                   
                        <PagerSettings Mode="Numeric"  Position="Bottom" PageButtonCount="10" />
                        <PagerStyle CssClass="data_grid_paginador" />
                        </asp:GridView>    		    		    
		    </span>  
            </div>
        
 </div>
 </span>
</asp:Content>