<%@ page language="C#" autoeventwireup="true" inherits="_Default, App_Web_imuq2iyt" masterpagefile="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%--Aquí es donde pones el código html que quieras--%>
     <script type="text/javascript" language="JavaScript">
         $(function () { PrivatePageLoaded() });

         var idTabSeleccionado = 0;

         function PrivatePageLoaded() {

             //Crea los tabs
             $("#tabs").tabs({
                 select: function (event, ui) {
                     if ($('#<%=hdnTabSeleccionado.ClientID %>') != null) {
                         $('#<%=hdnTabSeleccionado.ClientID %>')[0].value = ui.index;
                     } else {
                     }
                 },
                 fx: { opacity: 'toggle' },
                 selected: function () { if ($('#<%=hdnTabSeleccionado.ClientID %>') != null) { $('#<%=hdnTabSeleccionado.ClientID %>')[0].value; } }
             })
           
             $("#tabs").tabs("select", idTabSeleccionado);
         }

         function MarcarDesmarcar(checkCabecera,nombreGrid) {

             var marcado = checkCabecera.checked;

             var Grid = $('#ctl00_ContentPlaceHolder1_' + nombreGrid + '')[0];

             //recorremos todo el grid que está en pantalla
             for (var i = 1; i < Grid.rows.length; i++) {
                 //recorremos todos los objetos que tiene la fila.
                 for (var y = 1; y < Grid.rows[i].children.length; y++) {
                     if (Grid.rows[i].children[y].children[0] != null) {
                         //comprobar que sea tipo checkbox
                         if (Grid.rows[i].children[y].children[0].type == 'checkbox') {
                             Grid.rows[i].children[y].children[0].checked = marcado;
                         }
                     }
                 }

             }

         }

         function __doPostBackFNC(eventTarget, eventArgument) {
             var theform = document['aspnetForm'];
             theform.__EVENTTARGET_FNC.value = eventTarget;
             theform.__EVENTARGUMENT_FNC.value = eventArgument;
             __doPostBack('ctl00_UpdatePanelGeneral', '');
         }


         function FilaSeleccionadaMisReservas(idFila) {
             __doPostBackFNC('filaSeleccionadaMisReservas', idFila);
         }

         function FilaSeleccionadaMisSalas(idFila) {
             __doPostBackFNC('filaSeleccionadaMisSalas', idFila);
         }

         function aprobarReservas(datoAprobacion) {
             __doPostBackFNC(datoAprobacion, datoAprobacion);
         }

         function rechazarReservas(datoCancelar) {
             __doPostBackFNC(datoCancelar, datoCancelar);
         }

         function NuevaReserva() {
             window.open("Reserva.aspx", "_self");
             //window.open("PruebaSeleccionarSala.aspx", "_self");        
         }

         
         
       

     </script>
       <asp:HiddenField ID="hdnTabSeleccionado" runat="server" Value=""/>
    <!-- TABS jQuery UI -->
        <span class="clear">
            <div id="tabs">
               <div runat="server" id="paginaPrincipal">            
                <ul>
                    <li id="liMisReservas" runat="server">
                        <a href="#tabs-1" onclick=" idTabSeleccionado = 0;" ><span class="tab_icon_adjudicacion"></span>
                        <asp:Literal ID="litInfoMisReservas" runat="server" Text='<%$Resources:Resource, MisReservas%>'  />
                        <strong>
                            <asp:Literal ID="litNumMisReservas" runat="server" />
                        </strong></a>
                     </li>
                     <li id="liMisSalas" runat="server">
                        <a href="#tabs-2" onclick=" idTabSeleccionado = 1;" ><span class="tab_icon_adjudicacion"></span>
                        <asp:Literal ID="litInfoMisSalas" runat="server" Text='<%$Resources:Resource, MisReservasSalas%>'  />
                        <strong>
                            <asp:Literal ID="litNumMisSalas" runat="server" />
                        </strong></a>
                     </li>
                    <li id="liMisRecursos" runat="server">
                        <a href="#tabs-3" onclick=" idTabSeleccionado = 2;" ><span class="tab_icon_alertas"></span>
                        <asp:Literal ID="litInfoMisRecursos" runat="server" Text='<%$Resources:Resource, Recursos%>'  />
                        <strong id="numAlertas">
                            <asp:Literal ID="litNumRecursos" runat="server" />
                        </strong></a>
                     </li>
                </ul>
                  <div id="divMesanjeSinDatos" runat="server" class="mensaje_info" style="vertical-align:top" >
                    <h3>
                        <asp:Label ID="lblMensajeInformativo" CssClass="input_largo" runat="server" Text='<%$Resources:Resource, SinDatosReserva %>' />
                    </h3>                
                </div>    
                <div id="tabs-1" >
                <span class="clear">
                    <div runat="server" id="divMisReservas">
                                        
                             <div class="data_grid">                                
                                <asp:GridView ID="grdMisReservas" runat="server" AllowPaging="true"      
                                 OnPageIndexChanging="grdMisReservas_PageIndexChanging"      
                                 OnRowDataBound="grdMisReservas_RowDataBound"       
                                 AutoGenerateColumns="false" PageSize="10">        
                                <Columns>   
         
                                     <asp:TemplateField ItemStyle-Width="1%">
                                         <HeaderTemplate>
                                            <headertemplate>                                                
                                                <asp:LinkButton  ID="lnkCod" OnClick="OrdenarPor" visible="false" 
                                                CommandName="idReserva" runat="server"></asp:LinkButton>                                                
                                            </headertemplate>
                                        </HeaderTemplate>
                                         <ItemTemplate>                                             
                                                <Avalora:AvaloraText Visible="false"  Text ='<%# Bind("idReserva") %>' CssClass="input_grid ancho-completo"  runat="server" ID="txtReserva" />
                                                <Avalora:AvaloraText Visible="false" Text ='<%# Bind("idRepeticion") %>' CssClass="input_grid ancho-completo"  runat="server" ID="txtRepeticion" />
                                        </ItemTemplate>
                                    </asp:TemplateField>                                                 
                                    <asp:TemplateField  ItemStyle-Width="12%" HeaderStyle-Width="12%">
                                        <HeaderTemplate>
                                            <headertemplate>                                                
                                                <asp:LinkButton  ID="lnkNombre" OnClick="OrdenarPor" 
                                                CommandName="Fecha" runat="server"   Text="<%$Resources:Resource, Fecha%>"></asp:LinkButton>                                                
                                            </headertemplate>
                                        </HeaderTemplate>
                                         <ItemTemplate>                       
                                                <Avalora:AvaloraText ReadOnly="true" Text ='<%# Bind("Fecha") %>' ToolTip='<%# Bind("Fecha") %>' CssClass="input_grid ancho-completo"  runat="server" ID="txtFecha" />
                                        </ItemTemplate>                                        
                                    </asp:TemplateField>                                                 
                                    <asp:TemplateField  ItemStyle-Width="9%" HeaderStyle-Width="9%">
                                        <HeaderTemplate>
                                            <headertemplate>                                                
                                                <asp:LinkButton  ID="lnkHoraInicio" OnClick="OrdenarPor"
                                                CommandName="HoraInicio" runat="server"   Text="<%$Resources:Resource, HoraInicio%>"></asp:LinkButton>                                                
                                            </headertemplate>
                                        </HeaderTemplate>
                                         <ItemTemplate>                       
                                                <Avalora:AvaloraText ReadOnly="true" Text ='<%# Bind("HoraInicio") %>' ToolTip='<%# Bind("HoraInicio") %>' CssClass="input_grid ancho-completo"  runat="server" ID="txtHoraInicio" />
                                        </ItemTemplate>                                        
                                    </asp:TemplateField>         
                                     <asp:TemplateField  ItemStyle-Width="8%" HeaderStyle-Width="8%">
                                        <HeaderTemplate>
                                            <headertemplate>                                                
                                                <asp:LinkButton  ID="lnkHoraFin" OnClick="OrdenarPor" 
                                                CommandName="HoraFin" runat="server"   Text="<%$Resources:Resource, HoraFin%>"></asp:LinkButton>                                                
                                            </headertemplate>
                                        </HeaderTemplate>
                                         <ItemTemplate>                       
                                                <Avalora:AvaloraText ReadOnly="true" Text ='<%# Bind("HoraFin") %>' ToolTip='<%# Bind("HoraFin") %>' CssClass="input_grid ancho-completo"  runat="server" ID="txtHoraFin" />
                                        </ItemTemplate>                                        
                                    </asp:TemplateField>
                                      <asp:TemplateField  ItemStyle-Width="21%" HeaderStyle-Width="21%">
                                         <HeaderTemplate>
                                            <headertemplate>                                                
                                                <asp:LinkButton  ID="lnkDescripcion"  OnClick="OrdenarPor"
                                                CommandName="Descripcion" runat="server"   Text="<%$Resources:Resource, Descripcion%>"></asp:LinkButton>                                                
                                            </headertemplate>
                                        </HeaderTemplate>
                                         <ItemTemplate>
                                            <Avalora:AvaloraText  ReadOnly="true"  Text ='<%# Bind("Descripcion") %>' ToolTip='<%# Bind("Descripcion") %>' CssClass="input_grid ancho-completo"  runat="server" ID="txtDescripcion" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField  ItemStyle-Width="7%" HeaderStyle-Width="7%">
                                         <HeaderTemplate>
                                            <headertemplate>                                                
                                                <asp:LinkButton  ID="lnkPais"  OnClick="OrdenarPor" 
                                                CommandName="IdPais" runat="server"   Text="<%$Resources:Resource, Pais%>"></asp:LinkButton>                                                
                                            </headertemplate>
                                        </HeaderTemplate>
                                         <ItemTemplate>
                                            <Avalora:AvaloraText ReadOnly="true"  Visible="true"  CssClass="input_grid ancho-completo"  runat="server" ID="txtDescPais" />
                                            <Avalora:AvaloraText  Text ='<%# Bind("IdPais") %>' Visible="false"  CssClass="input_grid ancho-completo"  runat="server" ID="txtIdPais" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField  ItemStyle-Width="10%" HeaderStyle-Width="10%">
                                         <HeaderTemplate>
                                            <headertemplate>                                                
                                                <asp:LinkButton  ID="lnkEdificio"  OnClick="OrdenarPor" 
                                                CommandName="Edificio" runat="server"   Text="<%$Resources:Resource, Edificio%>"></asp:LinkButton>                                                
                                            </headertemplate>
                                        </HeaderTemplate>
                                         <ItemTemplate>
                                            <Avalora:AvaloraText ReadOnly="true" Text ='<%# Bind("Edificio") %>' ToolTip='<%# Bind("Edificio") %>' CssClass="input_grid ancho-completo"  runat="server" ID="txtEdificio" />
                                        </ItemTemplate>
                                    </asp:TemplateField>                                      
                                    <asp:TemplateField  ItemStyle-Width="25%" HeaderStyle-Width="25%">
                                         <HeaderTemplate>
                                            <headertemplate>                                                
                                                <asp:LinkButton  ID="lnkSala"  OnClick="OrdenarPor"
                                                CommandName="DescSala" runat="server"   Text="<%$Resources:Resource, Sala%>"></asp:LinkButton>                                                
                                            </headertemplate>
                                        </HeaderTemplate>
                                         <ItemTemplate>
                                            <Avalora:AvaloraText ReadOnly="true" Text ='<%# Bind("DescSala") %>' ToolTip='<%# Bind("DescSala") %>' Visible="true"  CssClass="input_grid ancho-completo"  runat="server" ID="txtDescSala" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField  ItemStyle-Width="12%" HeaderStyle-Width="12%">
                                         <HeaderTemplate>
                                            <headertemplate>                                                
                                                <asp:LinkButton  ID="lnkEstado"  OnClick="OrdenarPor"  
                                                CommandName="Estado" runat="server"   Text="<%$Resources:Resource, Estado%>"></asp:LinkButton>                                                
                                            </headertemplate>
                                        </HeaderTemplate>
                                         <ItemTemplate>
                                            <Avalora:AvaloraText ReadOnly="true" Text ='<%# Bind("Estado") %>' ToolTip='<%# Bind("Estado") %>'  CssClass="input_grid ancho-completo"  runat="server" ID="txtEstado" />
                                            <Avalora:AvaloraText Text ='<%# Bind("ResponsableSala") %>' Visible="false"  CssClass="input_grid ancho-completo"  runat="server" ID="txtResponsableSala" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField  ItemStyle-Width="5%" HeaderStyle-Width="5%" Visible="false" >
                                         <HeaderTemplate>
                                            <headertemplate>                                                
                                                <asp:LinkButton  ID="lnkPeticionario"  OnClick="OrdenarPor" 
                                                CommandName="Peticionario" runat="server"   Text="<%$Resources:Resource, Peticionario%>"></asp:LinkButton>                                                
                                            </headertemplate>
                                        </HeaderTemplate>
                                         <ItemTemplate>
                                            <Avalora:AvaloraText ReadOnly="true" Text ='<%# Bind("Peticionario") %>'  ToolTip='<%# Bind("Peticionario") %>'    CssClass="input_grid ancho-completo"  runat="server" ID="txtPeticionario" />                         
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField  ItemStyle-Width="35%" HeaderStyle-Width="35%" Visible="false" >
                                         <HeaderTemplate>
                                            <headertemplate>                                                
                                                <asp:LinkButton  ID="Solicitante"  OnClick="OrdenarPor" 
                                                CommandName="Solicitante" runat="server"   Text="<%$Resources:Resource, Solicitante%>"></asp:LinkButton>                                                
                                            </headertemplate>
                                        </HeaderTemplate>
                                         <ItemTemplate>
                                           <Avalora:AvaloraText ReadOnly="true" Text ='<%# Bind("Solicitante") %>' ToolTip='<%# Bind("Solicitante") %>'   CssClass="input_grid ancho-completo"  runat="server" ID="txtSolicitante" />
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
                              <span class="clear">
                                  <div class="clear float_right" style="text-align:right">            
                                    <!--<input type="button"  runat="server" id="btnNuevo_"  class="botonIco icon-door-in"  
                                        value='<%$Resources:Resource, NuevaReserva%>' onclick="NuevaReserva();" />    -->
                                     <asp:Button runat="server" ID="btnNuevo" CssClass="botonIco icon-door-in" Text="<%$Resources:Resource, NuevaReserva%>" OnClick="btnNuevo_Click" />
                                </div>
                               </span>         

                    </div>
                 </span>
                </div>
                <div id="tabs-2" >
                <span class="clear">
                        <div runat="server" id="divMisSalas">                        
                                
                             <div class="data_grid">
                                <asp:GridView ID="grdMisSalas" runat="server" AllowPaging="true"      
                                 OnPageIndexChanging="grdMisSalas_PageIndexChanging"      
                                 OnRowDataBound="grdMisSalas_RowDataBound"       
                                 AutoGenerateColumns="false" PageSize="10">        
                                <Columns>   
         
                                     <asp:TemplateField ItemStyle-Width="1%">
                                         <HeaderTemplate>
                                            <headertemplate>                                                
                                                <asp:LinkButton  ID="lnkCod" OnClick="MisSalasOrdenarPor" 
                                                CommandName="idReserva" runat="server"></asp:LinkButton>                                                
                                            </headertemplate>
                                        </HeaderTemplate>
                                         <ItemTemplate>                                             
                                                <Avalora:AvaloraText  Visible="false"  Text ='<%# Bind("idReserva") %>' CssClass="input_grid ancho-completo"  runat="server" ID="txtReserva" />
                                                <Avalora:AvaloraText  Visible="false"  Text ='<%# Bind("idRepeticion") %>' CssClass="input_grid ancho-completo"  runat="server" ID="txtRepeticion" />
                                        </ItemTemplate>
                                    </asp:TemplateField>                                                 
                                    <asp:TemplateField  ItemStyle-Width="9%" HeaderStyle-Width="9%">
                                        <HeaderTemplate>
                                            <headertemplate>                                                
                                                <asp:LinkButton  ID="lnkNombre" OnClick="MisSalasOrdenarPor" 
                                                CommandName="Fecha" runat="server"   Text="<%$Resources:Resource, Fecha%>"></asp:LinkButton>                                                
                                            </headertemplate>
                                        </HeaderTemplate>
                                         <ItemTemplate>                       
                                                <Avalora:AvaloraText ReadOnly="true" Text ='<%# Bind("Fecha") %>' ToolTip='<%# Bind("Fecha") %>' CssClass="input_grid ancho-completo"  runat="server" ID="txtFecha" />
                                        </ItemTemplate>                                        
                                    </asp:TemplateField>   
                                    <asp:TemplateField  ItemStyle-Width="7%" HeaderStyle-Width="7%">
                                        <HeaderTemplate>
                                            <headertemplate>                                                
                                                <asp:LinkButton  ID="lnkHoraInicio" OnClick="MisSalasOrdenarPor"
                                                CommandName="HoraInicio" runat="server"   Text="<%$Resources:Resource, HoraIni%>"></asp:LinkButton>                                                
                                            </headertemplate>
                                        </HeaderTemplate>
                                         <ItemTemplate>                       
                                                <Avalora:AvaloraText ReadOnly="true" Text ='<%# Bind("HoraInicio") %>' ToolTip='<%# Bind("HoraInicio") %>' CssClass="input_grid ancho-completo"  runat="server" ID="txtHoraInicio" />
                                        </ItemTemplate>                                        
                                    </asp:TemplateField>         
                                     <asp:TemplateField  ItemStyle-Width="7%" HeaderStyle-Width="7%">
                                        <HeaderTemplate>
                                            <headertemplate>                                                
                                                <asp:LinkButton  ID="lnkHoraFin" OnClick="MisSalasOrdenarPor" 
                                                CommandName="HoraFin" runat="server"   Text="<%$Resources:Resource, HoraFin%>"></asp:LinkButton>                                                
                                            </headertemplate>
                                        </HeaderTemplate>
                                         <ItemTemplate>                       
                                                <Avalora:AvaloraText ReadOnly="true" Text ='<%# Bind("HoraFin") %>' ToolTip='<%# Bind("HoraFin") %>' CssClass="input_grid ancho-completo"  runat="server" ID="txtHoraFin" />
                                        </ItemTemplate>                                        
                                    </asp:TemplateField>
                                    <asp:TemplateField  ItemStyle-Width="10%" HeaderStyle-Width="10%">
                                         <HeaderTemplate>
                                            <headertemplate>                                                
                                                <asp:LinkButton  ID="lnkPais"  OnClick="MisSalasOrdenarPor" 
                                                CommandName="IdPais" runat="server"   Text="<%$Resources:Resource, Pais%>"></asp:LinkButton>                                                
                                            </headertemplate>
                                        </HeaderTemplate>
                                         <ItemTemplate>
                                            <Avalora:AvaloraText ReadOnly="true"  Visible="true"  CssClass="input_grid ancho-completo"  runat="server" ID="txtDescPais" />
                                            <Avalora:AvaloraText  Text ='<%# Bind("IdPais") %>' Visible="false"  CssClass="input_grid ancho-completo"  runat="server" ID="txtIdPais" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField  ItemStyle-Width="15%" HeaderStyle-Width="15%">
                                         <HeaderTemplate>
                                            <headertemplate>                                                
                                                <asp:LinkButton  ID="lnkEdificio"  OnClick="MisSalasOrdenarPor" 
                                                CommandName="DescEdificio" runat="server"   Text="<%$Resources:Resource, Edificio%>"></asp:LinkButton>                                                
                                            </headertemplate>
                                        </HeaderTemplate>
                                         <ItemTemplate>
                                            <Avalora:AvaloraText ReadOnly="true" Text ='<%# Bind("DescEdificio") %>' ToolTip='<%# Bind("DescEdificio") %>' CssClass="input_grid ancho-completo"  runat="server" ID="txtEdificio" />
                                        </ItemTemplate>
                                    </asp:TemplateField>                                                                                    
                                    <asp:TemplateField  ItemStyle-Width="20%" HeaderStyle-Width="20%">
                                         <HeaderTemplate>
                                            <headertemplate>                                                
                                                <asp:LinkButton  ID="lnkSala"  OnClick="MisSalasOrdenarPor" 
                                                CommandName="DescSala" runat="server"   Text="<%$Resources:Resource, Sala%>"></asp:LinkButton>                                                
                                            </headertemplate>
                                        </HeaderTemplate>
                                         <ItemTemplate>
                                            <Avalora:AvaloraText ReadOnly="true"  Text ='<%# Bind("DescSala") %>' ToolTip='<%# Bind("DescSala") %>' Visible="true"  CssClass="input_grid ancho-completo"  runat="server" ID="txtDescSala" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField  ItemStyle-Width="13%" HeaderStyle-Width="13%">
                                         <HeaderTemplate>
                                            <headertemplate>                                                
                                                <asp:LinkButton  ID="lnkPeticionario"  OnClick="MisSalasOrdenarPor" 
                                                CommandName="Peticionario" runat="server"   Text="<%$Resources:Resource, Peticionario%>"></asp:LinkButton>                                                
                                            </headertemplate>
                                        </HeaderTemplate>
                                         <ItemTemplate>
                                            <Avalora:AvaloraText ReadOnly="true" Text ='<%# Bind("Peticionario") %>' ToolTip='<%# Bind("Peticionario") %>'  CssClass="input_grid ancho-completo"  runat="server" ID="txtPeticionario" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField  ItemStyle-Width="13%" HeaderStyle-Width="13%">
                                         <HeaderTemplate>
                                            <headertemplate>                                                
                                                <asp:LinkButton  ID="Solicitante"  OnClick="MisSalasOrdenarPor" 
                                                CommandName="Solicitante" runat="server"   Text="<%$Resources:Resource, Solicitante%>"></asp:LinkButton>                                                
                                            </headertemplate>
                                        </HeaderTemplate>
                                         <ItemTemplate>
                                            <Avalora:AvaloraText ReadOnly="true" Text ='<%# Bind("Solicitante") %>' ToolTip='<%# Bind("Solicitante") %>'  CssClass="input_grid ancho-completo"  runat="server" ID="txtSolicitante" />
                                        </ItemTemplate>
                                    </asp:TemplateField>                                                       
                                      <asp:TemplateField  ItemStyle-Width="10%" HeaderStyle-Width="10%">                   
                                        <HeaderTemplate>
                                            
                                                <asp:CheckBox ID="chkSeleccionarTodos" runat="server" onclick="MarcarDesmarcar(this,'grdMisSalas')" ToolTip="<%$Resources:Resource, SeleccionarTodos %>" />
                                            
                                        </HeaderTemplate>
                                         <ItemTemplate>
                                            <asp:CheckBox ID="chkSeleccionar" runat="server" />
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
                            </div> 
                            <span class="clear">
                                
                                     <div class="clear float_right" style="text-align:right">            
                                        <input type="button"  runat="server" id="btnAprobarMisSalas" class="botonIco icon-accept"
                                            value='<%$Resources:Resource, Aprobar%>' onclick="aprobarReservas('AprobarMisReservasSalas');" />                                         
                                         <input type="button"  runat="server" id="btnRechazarMisSalas" class="botonIco icon-cancel"
                                            value='<%$Resources:Resource, Rechazar%>' onclick="rechazarReservas('RechazarMisReservasSalas');" />                                    
                                    </div>
                                </span>
                        </div>
                    </span>
                </div>
                <div id="tabs-3" >
                    
                   <span class="clear">
                     <div id="divMisRecursos" runat="server">                        
                   
                        <div class="data_grid">
                                <asp:GridView ID="grdMisRecursos" runat="server" AllowPaging="true"      
                                 OnPageIndexChanging="grdMisRecursos_PageIndexChanging"      
                                 OnRowDataBound="grdMisRecursos_RowDataBound"       
                                 AutoGenerateColumns="false" PageSize="10">        
                                <Columns>   
         
                                     <asp:TemplateField  ItemStyle-Width="1%" HeaderStyle-Width="1%">                   
                                         <HeaderTemplate>
                                            <headertemplate>                                                
                                                <asp:LinkButton  ID="lnkCod" OnClick="MisRecursosOrdenarPor" 
                                                CommandName="idReserva" runat="server"></asp:LinkButton>                                                
                                            </headertemplate>
                                        </HeaderTemplate>
                                         <ItemTemplate>                                             
                                                <Avalora:AvaloraText Visible="false" Text ='<%# Bind("idReserva") %>' CssClass="input_grid ancho-completo"  runat="server" ID="txtReserva" />
                                                <Avalora:AvaloraText Visible="false" Text ='<%# Bind("idRepeticion") %>' CssClass="input_grid ancho-completo"  runat="server" ID="txtRepeticion" />
                                        </ItemTemplate>
                                    </asp:TemplateField>                                                 
                                    <asp:TemplateField  ItemStyle-Width="10%" HeaderStyle-Width="10%">                   
                                        <HeaderTemplate>
                                            <headertemplate>                                                
                                                <asp:LinkButton  ID="lnkNombre" OnClick="MisRecursosOrdenarPor" 
                                                CommandName="Fecha" runat="server"   Text="<%$Resources:Resource, Fecha%>"></asp:LinkButton>                                                
                                            </headertemplate>
                                        </HeaderTemplate>
                                         <ItemTemplate>                       
                                                <Avalora:AvaloraText ReadOnly="true" Text ='<%# Bind("Fecha") %>' ToolTip='<%# Bind("Fecha") %>' CssClass="input_grid ancho-completo"  runat="server" ID="txtFecha" />
                                        </ItemTemplate>                                        
                                    </asp:TemplateField>                                                 

                                     <asp:TemplateField  ItemStyle-Width="9%" HeaderStyle-Width="9%">
                                        <HeaderTemplate>
                                            <headertemplate>                                                
                                                <asp:LinkButton  ID="lnkHoraInicio" OnClick="MisRecursosOrdenarPor"
                                                CommandName="HoraInicio" runat="server"   Text="<%$Resources:Resource, HoraInicio%>"></asp:LinkButton>                                                
                                            </headertemplate>
                                        </HeaderTemplate>
                                         <ItemTemplate>                       
                                                <Avalora:AvaloraText ReadOnly="true" Text ='<%# Bind("HoraInicio") %>' ToolTip='<%# Bind("HoraInicio") %>' CssClass="input_grid ancho-completo"  runat="server" ID="txtHoraInicio" />
                                        </ItemTemplate>                                        
                                    </asp:TemplateField>         
                                     <asp:TemplateField  ItemStyle-Width="8%" HeaderStyle-Width="8%">
                                        <HeaderTemplate>
                                            <headertemplate>                                                
                                                <asp:LinkButton  ID="lnkHoraFin" OnClick="MisRecursosOrdenarPor" 
                                                CommandName="HoraFin" runat="server"   Text="<%$Resources:Resource, HoraFin%>"></asp:LinkButton>                                                
                                            </headertemplate>
                                        </HeaderTemplate>
                                         <ItemTemplate>                       
                                                <Avalora:AvaloraText ReadOnly="true" Text ='<%# Bind("HoraFin") %>' ToolTip='<%# Bind("HoraFin") %>' CssClass="input_grid ancho-completo"  runat="server" ID="txtHoraFin" />
                                        </ItemTemplate>                                        
                                    </asp:TemplateField>

                                    <asp:TemplateField  ItemStyle-Width="30%" HeaderStyle-Width="30%">                   
                                         <HeaderTemplate>
                                            <headertemplate>                                                
                                                <asp:LinkButton  ID="lnkSala"  OnClick="MisRecursosOrdenarPor" 
                                                CommandName="DescSala" runat="server"   Text="<%$Resources:Resource, Sala%>"></asp:LinkButton>                                                
                                            </headertemplate>
                                        </HeaderTemplate>
                                         <ItemTemplate>
                                           <Avalora:AvaloraText ReadOnly="true" Text ='<%# Bind("DescSala") %>' ToolTip='<%# Bind("DescSala") %>' Visible="true"  CssClass="input_grid ancho-completo"  runat="server" ID="txtDescSala" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField  ItemStyle-Width="15%" HeaderStyle-Width="15%">                   
                                         <HeaderTemplate>
                                            <headertemplate>                                                
                                                <asp:LinkButton  ID="lnkPeticionario"  OnClick="MisRecursosOrdenarPor" 
                                                CommandName="Peticionario" runat="server"   Text="<%$Resources:Resource, Peticionario%>"></asp:LinkButton>                                                
                                            </headertemplate>
                                        </HeaderTemplate>
                                         <ItemTemplate>
                                            <Avalora:AvaloraText ReadOnly="true"  Text ='<%# Bind("Peticionario") %>' ToolTip='<%# Bind("Peticionario") %>'  CssClass="input_grid ancho-completo"  runat="server" ID="txtPeticionario" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField  ItemStyle-Width="15%" HeaderStyle-Width="15%">                   
                                         <HeaderTemplate>
                                            <headertemplate>                                                
                                                <asp:LinkButton  ID="Solicitante"  OnClick="MisRecursosOrdenarPor" 
                                                CommandName="Solicitante" runat="server"   Text="<%$Resources:Resource, Solicitante%>"></asp:LinkButton>                                                
                                            </headertemplate>
                                        </HeaderTemplate>
                                         <ItemTemplate>
                                            <Avalora:AvaloraText ReadOnly="true" Text ='<%# Bind("Solicitante") %>' ToolTip='<%# Bind("Solicitante") %>'  CssClass="input_grid ancho-completo"  runat="server" ID="txtSolicitante" />
                                        </ItemTemplate>
                                    </asp:TemplateField>         
                                      <asp:TemplateField  ItemStyle-Width="25%" HeaderStyle-Width="25%">                   
                                         <HeaderTemplate>
                                            <headertemplate>                                                
                                                <asp:LinkButton  ID="TipoRecurso"  OnClick="MisRecursosOrdenarPor" 
                                                CommandName="TipoRecurso" runat="server"   Text="<%$Resources:Resource, TipoRecurso%>"></asp:LinkButton>                                                
                                            </headertemplate>
                                        </HeaderTemplate>
                                         <ItemTemplate>
                                           <Avalora:AvaloraText ReadOnly="true" Text ='<%# Bind("TipoRecursoIdioma") %>' ToolTip='<%# Bind("TipoRecursoIdioma") %>'  CssClass="input_grid ancho-completo"  runat="server" ID="txtTipoRecurso" />
                                           <Avalora:AvaloraText Visible="false" Text ='<%# Bind("idTipoRecurso") %>' CssClass="input_grid ancho-completo"  runat="server" ID="txtIdTipoRecurso" />
                                            
                                        </ItemTemplate>
                                    </asp:TemplateField>                                                                                             
                                      <asp:TemplateField  ItemStyle-Width="10%" HeaderStyle-Width="10%">                   
                                      <HeaderTemplate>
                                            
                                                <asp:CheckBox ID="chkSeleccionarTodos" runat="server" onclick="MarcarDesmarcar(this,'grdMisRecursos')" ToolTip="<%$Resources:Resource, SeleccionarTodos %>" />
                                            
                                        </HeaderTemplate>          
                                         <ItemTemplate>
                                            <asp:CheckBox ID="chkSeleccionar" runat="server" />
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
                            </div>  
                           <span class="clear">
                              <div class="clear float_right" style="text-align:right">            
                                    <input type="button"  runat="server" id="btnAprobarMisRecursos"  class="botonIco icon-accept" value='<%$Resources:Resource, Aprobar%>' onclick="aprobarReservas('AprobarMisReservasRecursos');" />                                                                              
                                </div>
                    </span> 
                    </div>
                   </span>                    
                </div>
              

              </div>   
               <div runat="server" id="divAbrirSerie" visible="false"   >
               <span class="clear">
                <asp:Label ID="lblAbrirReserva" runat="server" Text="<%$ Resources:Resource, ConfirmacionAbrirReserva %>" CssClass="label_completa"></asp:Label>
               </span>
                <span class="clear">
                    <asp:RadioButtonList ID="rdbAbrirReserva" runat="server" CssClass="label_corto-medio" >
                    <asp:ListItem Text="Serie Completa" Value="1" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Repetición" Value="2"></asp:ListItem>
                </asp:RadioButtonList>
                </span>                
                <asp:Button ID="btnAceptar" Text="<%$Resources:Resource, Aceptar %>"   class="botonIco icon-accept"
                    runat="server" onclick="btnAceptar_Click" />
                <asp:Button ID="btnCancelar" Text="<%$Resources:Resource, Cancelar%>"  class="botonIco icon-cancel"
                    runat="server" onclick="btnCancelar_Click" />
            </div>
            </div>           
        </span>
        <div id="divHidden">
                    <input type="hidden" name="__EVENTTARGET_FNC" />
                    <input type="hidden" name="__EVENTARGUMENT_FNC" />
</div>
</asp:Content>
