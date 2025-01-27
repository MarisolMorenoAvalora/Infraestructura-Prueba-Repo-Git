<%@ page language="C#" autoeventwireup="true" inherits="Edificio, App_Web_imuq2iyt" masterpagefile="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 
<script type="text/javascript" language='javascript'>

    function __doPostBackFNC(eventTarget, eventArgument) {
        var theform = document['aspnetForm'];
        theform.__EVENTTARGET_FNC.value = eventTarget;
        theform.__EVENTARGUMENT_FNC.value = eventArgument;
        __doPostBack('ctl00_UpdatePanelGeneral', '');
    }
    function EliminarRegistro()
    {
        __doPostBackFNC('EliminarRegistro', 'EliminarRegistro');
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
            <span class="label_corto">
                <%=rmGlobal("Codigo")%>
             </span>          
             <Avalora:AvaloraText ID="txtCodigo" ReadOnly="true"  Enabled="false" runat="server" CssClass="input_mini float_left" Intro="true" />
             <span class="label_mini-corto">
                <%=rmGlobal("NombreObligatorio")%>
             </span>          
             <Avalora:AvaloraText ID="txtNombre" runat="server" MaxLength="150" CssClass="input_corto-medio float_left" Intro="true" />
                         		    
		    <asp:CheckBox ID="chkBaja"  Text="<%$Resources:Resource, Baja%>" runat="server" CssClass="label_corto" Enabled="true" Checked="false" />            
		</span>        
      	<span class="clear"> 
            <span class="label_corto">
                <%=rmGlobal("PaisObligatorio")%>
             </span>                    		    
             <asp:DropDownList ID="cboPais" runat="server" CssClass="select_corto-medio float_left" AutoPostBack="false" >        		                    
            </asp:DropDownList>  
              
                <span class="label_corto">
                <%=rmGlobal("ZonaHorariaObligatorio")%>
             </span>                    		    
             <asp:DropDownList ID="cboZonaHoraria" runat="server" CssClass="select_corto-medio float_left" AutoPostBack="false" >        		                    
            </asp:DropDownList>                 
          
		</span>
     <span class="clear">
         <span class="label_corto"> 
                <%=rmGlobal("Direccion")%> 
            </span>       
            <Avalora:AvaloraText ID="txtDireccion" MaxLength="150" runat="server" CssClass="input_corto-medio float_left" Intro="true" />             		    		    

           <span class="label_corto">
                <%=rmGlobal("RepeticionVeces")%>
             </span>                    		    
            <Avalora:AvaloraNumerico ID="txtRepeticionVeces" runat="server" Intro="true" MaxLength="5" NumDecimales="0" 
             PermiteNegativos="false"  AutoCero="true" CssClass="input_mini float_left " /> 
              <span class="label_corto"> 
                <%=rmGlobal("MaximoDias")%> 
            </span>       
            <Avalora:AvaloraNumerico ID="txtRepeticionDias" runat="server" Intro="true" MaxLength="5" NumDecimales="0" 
             PermiteNegativos="false"  AutoCero="true" CssClass="input_mini float_left " /> 
     </span>    
        <span class="clear">
            
        </span>
        
 </div>
 <div id="divHidden">
                    <input type="hidden" name="__EVENTTARGET_FNC" />
                    <input type="hidden" name="__EVENTARGUMENT_FNC" />
</div>
 </span>
</asp:Content>