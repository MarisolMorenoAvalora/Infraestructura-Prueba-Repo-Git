<%@ page language="C#" autoeventwireup="true" inherits="Sala, App_Web_imuq2iyt" masterpagefile="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <script type="text/javascript" language='javascript'>

     function __doPostBackFNC(eventTarget, eventArgument) {
         var theform = document['aspnetForm'];
         theform.__EVENTTARGET_FNC.value = eventTarget;
         theform.__EVENTARGUMENT_FNC.value = eventArgument;
         __doPostBack('ctl00_UpdatePanelGeneral', '');
     }
     function EliminarRegistro() {
         __doPostBackFNC('EliminarRegistro', 'EliminarRegistro');
     }

     ///dependiendo del valor tomado por el combo
     ///se habilitará o no el campo usuario aprobador
     function HabilitarAprobador(comboTipoSala) {

         if (comboTipoSala.value == "N" || comboTipoSala.value == "") {
             $('#ctl00_ContentPlaceHolder1_txtEmailAprobador_txtTexto')[0].disabled = true;
             $('#ctl00_ContentPlaceHolder1_txtEmailAprobador_txtTexto')[0].value = '';
         }
         else
             $('#ctl00_ContentPlaceHolder1_txtEmailAprobador_txtTexto')[0].disabled = false;
     }


     /*CORRESPONDIENTE A LA IMAGEN*/
     //funcion que recargará la página para asignar los valores(nombre, como Bytes) seleccionados de la pantalla
     function ActualizaBusquedaFichero(Nombre) {
         //   document.getElementById('ctl00_ContentPlaceHolder1_txtFichero').value = Nombre;
         __doPostBackFNC('ActualizarFoto', '');
     }


     function AbrirPaginaSubirFichero() {
         var Top = (screen.availHeight - 533) / 2;
         var Left = (screen.availWidth - 800) / 2;
         var TipoF = 'application/vnd.ms-excel';
         AbrirEmergente('SeleccionarImagen.aspx?TipoFichero=application/vnd.ms-excel&TipoPantalla=Datos', '300', '550');
     }

</script>
 <div class="toolbar">
     
     <Avalora:Toolbar ID="ToolbarEdicion" runat="server" Buscar="false" Eliminar="true" Guardar="true"
            Imprimir="false" Nuevo="false" ExportarExcel="false" Titulo="Gestión Usuario" OnSalir_Click="Salir_Click" 
            OnGuardar_Click="Guardar_Click" OnEliminar_Click="Eliminar_Click" FileAyuda ="GRSalas.pdf"/>
 </div>
 
 <span class="clear">
 <div >
      <span class="clear"> 
            <span class="label_mini-corto">
                <%=rmGlobal("Codigo")%>
             </span>          
             <Avalora:AvaloraText ID="txtCodigo" ReadOnly="true"  Enabled="false" runat="server" CssClass="input_mini float_left" Intro="true" />             
		    <asp:CheckBox ID="chkBaja" Text="<%$Resources:Resource, Baja%>" runat="server" CssClass="label_mini-corto" Enabled="true" Checked="false" />                  
            
        
          
           <asp:Button ID="imgAbrirSala" runat="server" CssClass="botonIco icon-image-add" Text="<%$ Resources: Resource, AñadirImagen %>" ToolTip="<%$ Resources: Resource, AñadirImagen %>" 
                OnClientClick="AbrirPaginaSubirFichero();"/>

          <asp:Button ID="imgBorrarFoto" runat="server" CssClass="botonIco icon-image-delete" Text="<%$ Resources: Resource, EliminarImagen %>" ToolTip="<%$ Resources: Resource, EliminarImagen %>"
               OnClick="imgBorrarFoto_Click" />
            
            
          <span class="imgSala">
            <asp:Image Visible="true" Height="180px" Width="180px" CssClass="float_right" ID="foto" runat="server" ImageUrl="~/App_Themes/img/UI/imagen_no_disponible.png" />                                
            </span>
		</span>    
     <span class="clear">
         <span class="label_mini-corto">
                <%=rmGlobal("NombreObligatorio")%>
             </span>          
             <Avalora:AvaloraText ID="txtNombre" runat="server" MaxLength="150" CssClass="input_medio float_left" Intro="true" />                      		    

            <asp:CheckBox ID="chkReservable" Text="<%$Resources:Resource, Reservable%>"  runat="server" CssClass="label_corto" Checked="false" />                                     		    
     </span>    
        <span class="clear">
            <span class="label_mini-corto"> 
                <%=rmGlobal("TipoSalaObligatorio")%> 
            </span>                    		    
		      <asp:DropDownList ID="cboTipoSala" onclick="HabilitarAprobador(this);" runat="server" CssClass="select_corto float_left" AutoPostBack="false">        		    
                <asp:ListItem Text="<%$Resources:Resource, Seleccione%>" Value="">                    
                </asp:ListItem>
                <asp:ListItem Text="<%$Resources:Resource, Normal%>" Value="N">                    
                </asp:ListItem>
                <asp:ListItem Text="<%$Resources:Resource, Formacion%>" Value="F">                    
                </asp:ListItem>
                <asp:ListItem Text="<%$Resources:Resource, Especial%>" Value="E">                    
                </asp:ListItem>
                  
            </asp:DropDownList>             
                      		    
		      <span class="label_mini">
                <%=rmGlobal("PaisObligatorio")%>
             </span>                    		    
             <asp:DropDownList ID="cboPais" runat="server" 
          CssClass="select_corto float_left" AutoPostBack="true" 
          onselectedindexchanged="cboPais_SelectedIndexChanged" >        		                    
            </asp:DropDownList>              
              
		    
                    
                  



        </span>
      	<span class="clear">           
             <span class="label_mini-corto"> 
                <%=rmGlobal("EdificioObligatorio")%> 
            </span>                    		
              <div class="">
                  <asp:DropDownList ID="cboEdificio" runat="server" 
                  CssClass="select_medio float_left ancho-dos-cuartos" AutoPostBack="true" 
                  onselectedindexchanged="cboEdificio_SelectedIndexChanged" >        		    
                     </asp:DropDownList>       
              </div>                

		</span>
     <span class="clear">
         <span class="label_mini-corto"> 
                &nbsp;
            </span>                    		
         <asp:CheckBox ID="chkAudiovisual" Text="<%$Resources:Resource, Audiovisual%>"  runat="server" CssClass="label_corto" Checked="false" />                                     		    
		    <asp:CheckBox ID="chkVideoConferencia" Text="<%$Resources:Resource, Videoconferencia%>" runat="server" CssClass="label_corto" Checked="false" />                          
         <asp:CheckBox ID="chkReservableFinSemana" Text="<%$Resources:Resource, ReservableFinSemana%>" runat="server" CssClass="label_corto-medio" Checked="false" />                        
     </span>
        <span class="clear">
                <span class="label_corto"> 
                <%=rmGlobal("Planta")%> 
            </span>       
            <Avalora:AvaloraText ID="txtPlanta" MaxLength="150" runat="server" CssClass="input_corto float_left" Intro="true" />    

               <span class="label_corto">
                <%=rmGlobal("EmailAprobador")%>
             </span>                    		    
             <Avalora:AvaloraText ID="txtEmailAprobador" MaxLength="150" runat="server" CssClass="input_corto-medio float_left" Intro="true" />         

        </span>

        <span class="clear"> 
            		    		    
               <span class="label_corto">
                <%=rmGlobal("CapacidadObligatorio")%> &nbsp; &nbsp;
             </span>                    		    
           <Avalora:AvaloraNumerico ID="txtCapacidad" runat="server" Intro="true"  AutoCero="true" MaxLength="5" NumDecimales="0" 
             PermiteNegativos="false" CssClass="input_corto float_left " />           

                 <span class="label_corto">
                <%=rmGlobal("RepeticionVeces")%>
             </span>              		    
            <Avalora:AvaloraNumerico ID="txtRepeticionVeces" runat="server" Intro="true" MaxLength="5" NumDecimales="0" 
             PermiteNegativos="false" CssClass="input_mini float_left " AutoCero="true" />  


      <%--  </span> 
                <span class="clear">           --%>  
                    
                    
                    <span class="label_corto" > 
                <%=rmGlobal("MaximoDias")%> </span>
            <Avalora:AvaloraNumerico ID="txtRepeticionDias" runat="server" Intro="true"  AutoCero="true" MaxLength="5" NumDecimales="0" 
             PermiteNegativos="false" CssClass="input_mini float_left " /> 
            	
</span>



            
              
            



            
	
       <!-- BSM -->
            <span class="clear">
            <span class="label_corto"> 
                &nbsp;Buzón de sala
            </span>
           <asp:TextBox  
               AutoPostBack="true" enabled="true"  ID="txtCuentaOffice" MaxLength="90" 
               runat="server" CssClass="input_corto float_left" Intro="true" OnTextChanged="txt_OnCuentaOfficeChanged" />    
          
               <span class="label_corto"> 
                &nbsp;Usuario PC sala
            </span>
               
            <Avalora:AvaloraText enabled="true"  ID="txtLoginCuenta" MaxLength="120" runat="server" CssClass="input_corto float_left" Intro="true" />    
            
                </span>
     
     
     </span>
    <span class="clear">

                <span class="label_corto"> 
                &nbsp;Contraseña Sala 
            </span>
              <Avalora:AvaloraText enabled="true"  ID="txtPassCuenta" MaxLength="120" runat="server" CssClass="input_corto float_left" Intro="true" />    
            
            <span class="label_corto"> 
                &nbsp;Contraseña PC</span>
              <Avalora:AvaloraText enabled="true"  ID="txtPassCuenta2" MaxLength="120" runat="server" CssClass="input_corto float_left" Intro="true" />    
             

          <span class="clear" style="vertical-align:top"> 
            <span class="label_corto" style="vertical-align:top"> 
                <%=rmGlobal("Observaciones")%>                 
            </span>                
            <Avalora:AvaloraText  ID="txtObservaciones" TextMode="MultiLine"  runat="server" Height="50" CssClass="input_multiline_largo" Intro="false" />             		    		    		    
           </span>
    </span>  
       <div class="data_grid">
            <span class="H3cabecera_seccion">
                <%=rmGlobal("Recursos")%>
            </span>  
            
		    <span class="clear">  
                        <asp:GridView ID="grdRecursosSala" runat="server"                                                                                  
                                OnRowDataBound="grdRecursosSala_RowDataBound"  
                                OnRowDeleting="grdRecursosSala_RowDeleting"                                         
                                AutoGenerateColumns="false" >        
                                    <Columns> 
                                        <asp:TemplateField  ItemStyle-Width="5%" HeaderStyle-Width="5%">
                                            <HeaderTemplate>
                                                <asp:ImageButton runat ="server" ID="imgAddLinea"                                                                               
                                                    OnClick="imgAdd_Click"
                                                    ImageUrl="~/App_Themes/img/nuevo.png"
                                                    TabIndex="-1" />
                                            </HeaderTemplate>
                                            <ItemStyle Width="16px" />
                                            <ItemTemplate>
                                                <asp:ImageButton ID="imgBorrar" runat="server" CommandName="Delete" 
                                                ImageUrl="~/App_Themes/img/eliminar.gif"
                                                TabIndex="-1" />
                                                </ItemTemplate>
                                        </asp:TemplateField>                                                                                                   
                                       <asp:TemplateField  ItemStyle-Width="30%" HeaderStyle-Width="30%">                    
                                            <HeaderTemplate>                                                
                                                    <asp:Label ID="lblTipoRecurso" runat="server" ><%=rmGlobal("TipoRecursoObligatorio")%></asp:Label>                                                
                                            </HeaderTemplate>                                        
                                            <ItemTemplate>                                                
                                                      <Avalora:AvaloraText Visible="false"  ID="txtIdIdioma" runat="server" ReadOnly="True" Text='<%# Bind("ID_SALA") %>' />
                                                      <Avalora:AvaloraText Visible="false"  ID="txtIdTipoRecurso" runat="server" ReadOnly="True" Text='<%# Bind("ID_TIPO_RECURSO") %>' />
                                                    <asp:DropDownList ID="cboTipoRecurso" runat="server" CssClass="select_corto-medio float_left" AutoPostBack="false" >        		    
                                                    </asp:DropDownList>
                                            </ItemTemplate>
                                    </asp:TemplateField>           
                                    <asp:TemplateField  ItemStyle-Width="65%" HeaderStyle-Width="65%">
                                            <HeaderTemplate>                                                
                                                    <asp:Label ID="lblEmailResponsable" runat="server" ><%=rmGlobal("EmailResponsable")%></asp:Label>                                                
                                            </HeaderTemplate>                                        
                                            <ItemTemplate>                                                                                                      
                                                    <Avalora:AvaloraText ID="txtEmailResponsable" Text='<%# Bind("EMAIL_RESPONSABLE") %>' MaxLength="150" runat="server" CssClass="input_medio-largo float_left" Intro="true" />             		    		    
                                            </ItemTemplate>
                                    </asp:TemplateField>           
                                    </Columns>                            
                                    <EmptyDataTemplate>
                                        <div>
                                            <asp:ImageButton ID="imgAddRegistro" runat="server" ImageUrl="~/App_Themes/img/nuevo.png"
                                                OnClick="imgAdd_Click" TabIndex="-1" />
                                            <asp:Label ID="Label32" Width="400px" runat="server" CssClass="labelCampo" Text="<%$Resources:Resource, AnadirRegistro%>"></asp:Label>
                                        </div>                                        
                                    </EmptyDataTemplate>                   
                                    <PagerSettings Mode="Numeric"  Position="Bottom" PageButtonCount="10" />
                                    <PagerStyle CssClass="data_grid_paginador" />
                        </asp:GridView>       
            </span>
        </div>
        
 </div>
  <div id="divHidden">
                    <input type="hidden" name="__EVENTTARGET_FNC" />
                    <input type="hidden" name="__EVENTARGUMENT_FNC" />
</div>
 </span>
</asp:Content>