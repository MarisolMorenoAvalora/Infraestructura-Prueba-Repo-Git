<%@ page language="C#" autoeventwireup="true" inherits="Preferencia, App_Web_imuq2iyt" masterpagefile="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <script type="text/javascript" language='javascript'>

   
</script>
 <div class="toolbar">
     
     <Avalora:Toolbar ID="ToolbarEdicion" runat="server" Buscar="false" Eliminar="true" Guardar="true"
            Imprimir="false" Nuevo="false" ExportarExcel="false" Titulo="Gestión Usuario" OnSalir_Click="Salir_Click" 
            OnGuardar_Click="Guardar_Click" OnEliminar_Click="Eliminar_Click" FileAyuda ="GRSalas.pdf"/>
 </div>
 
 <span class="clear">
 <div >
      <span class="clear"> 
            <span class="label_corto-medio">
                <%=rmGlobal("Nombre")%>
             </span>          
             <Avalora:AvaloraText ID="txtUsuario" ReadOnly="true"  Enabled="false" runat="server" CssClass="input_medio-largo float_left" Intro="true" />                                
		</span>        
        <span class="clear">
            <span class="label_corto-medio"> 
                <%=rmGlobal("Pais")%> 
            </span>                    		    
		      <asp:DropDownList ID="cboPais" runat="server" 
          CssClass="select_corto-medio float_left" AutoPostBack="true" 
          onselectedindexchanged="cboPais_SelectedIndexChanged">        		                    
            </asp:DropDownList>         
            
        </span>
     <span class="clear">
        <span class="label_corto-medio"> 
                <%=rmGlobal("EdificioObligatorio")%> 
            </span>                    		    
		      <asp:DropDownList ID="cboEdificio" runat="server" 
          CssClass="select_corto-medio float_left" AutoPostBack="true" 
          onselectedindexchanged="cboEdificio_SelectedIndexChanged">        		                    
            </asp:DropDownList>                                                  		    		    
         </span>
        <span class="clear">
            <span class="label_corto-medio"> 
                <%=rmGlobal("SalaObligatorio")%> 
            </span>                    		    
		      <asp:DropDownList ID="cboSala" runat="server" CssClass="select_corto-medio float_left" AutoPostBack="false">        		                    
                  </asp:DropDownList>
        </span>
        <span class="clear">
              
                 
            <span class="label_corto-medio float_left"> 
                <%=rmGlobal("ZonaHorariaObligatorio")%> 
            </span>                    		    
		      <asp:DropDownList ID="cboZonaHoraria" runat="server" CssClass="select_corto-medio float_left" AutoPostBack="false">        		                    
            </asp:DropDownList>         
                                               		    		    
        </span>

            <span class="label_corto-medio"> 
                <%=rmGlobal("IdiomaEnvioCorreoObligatorio")%> 
            </span>                    		    
		      <asp:DropDownList ID="cboIdioma" runat="server" CssClass="select_corto-medio float_left" AutoPostBack="false">        		                    
            </asp:DropDownList> 
 </div>
  <div id="divHidden">
                    <input type="hidden" name="__EVENTTARGET_FNC" />
                    <input type="hidden" name="__EVENTARGUMENT_FNC" />
</div>
 </span>
</asp:Content>