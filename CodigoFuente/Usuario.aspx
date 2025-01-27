<%@ page language="C#" autoeventwireup="true" inherits="Usuario, App_Web_imuq2iyt" masterpagefile="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 
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
                          		    
		    <asp:CheckBox ID="chkActivo" Text="<%$Resources:Resource, Activo%>" runat="server" CssClass="label_corto" Checked="true" />            
		</span>
		<span class="clear"> 
            <span class="label_corto">
                <%=rmGlobal("NombreObligatorio")%>
             </span>                    		    
             <Avalora:AvaloraText ID="txtNombre" MaxLength="50" runat="server" CssClass="input_medio float_left" Intro="true" />		    	  
              <span class="label_corto"> 
                <%=rmGlobal("Apellido1")%> 
            </span>       
            <Avalora:AvaloraText ID="txtApellido1" MaxLength="50" runat="server" CssClass="input_medio float_left" Intro="true" />             		    		    
		</span>
        <span class="clear">
            <span class="label_corto"> 
                <%=rmGlobal("Apellido2")%> 
            </span>                    		    		    
            <Avalora:AvaloraText ID="txtApellido2" MaxLength="50" runat="server" CssClass="input_medio float_left" Intro="true" />             		    		    
            <span class="label_corto">
                <%=rmGlobal("EmailObligatorio")%>
             </span>                    		    		    
            <Avalora:AvaloraText ID="txtEmail" MaxLength="250" runat="server" CssClass="input_medio float_left" Intro="true" />             		    		    
		   
        </span>
        <span class="clear"> 
            <span class="label_corto"> 
                <%=rmGlobal("Observaciones")%> 
            </span>                
            <Avalora:AvaloraText ID="txtObservaciones" TextMode="MultiLine"  Height="50"  runat="server" CssClass="input_multiline_largo" Intro="false" />             		    		    		    
		</span>
 </div>
 </span>
</asp:Content>