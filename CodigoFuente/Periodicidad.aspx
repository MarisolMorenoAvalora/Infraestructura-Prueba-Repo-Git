<%@ page language="C#" autoeventwireup="true" inherits="Periodicidad, App_Web_imuq2iyt" masterpagefile="~/MasterPageEmpty.master" %>


<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="Content1" runat="server">
    <script type="text/javascript" language='javascript'>

     function __doPostBackFNC(eventTarget, eventArgument) {
         var theform = document['aspnetForm'];
         theform.__EVENTTARGET_FNC.value = eventTarget;
         theform.__EVENTARGUMENT_FNC.value = eventArgument;
         __doPostBack('ctl00_UpdatePanelGeneral', '');
     }

     function CambiarRadioButton(obj) {

         $("#ctl00_ContentPlaceHolder1_rdbMensualOpcion1")[0].checked = false;
         $("#ctl00_ContentPlaceHolder1_rdbMensualOpcion2")[0].checked = false;
         
         obj.checked = true;

     }

     function ValorDefecto(obj) {
         if (obj.value == "" || obj.value == "0") {
             obj.value = 1;
         }
     }
   
     function CalcularDatos() {
         __doPostBackFNC('calcularDatos', 'calcularDatos');
     }
   
     function GuardarSalir() {
         __doPostBackFNC('GuardarSalir', 'GuardarSalir');
     }
     </script>

     
 <div class="toolbar">
     
     <Avalora:Toolbar ID="ToolbarEdicion" runat="server" Buscar="false" Eliminar="false" Guardar="true"
            Imprimir="false" Nuevo="false" ExportarExcel="false" Titulo="<%$ Resources:Resource, Periodicidad %>" OnSalir_Click="Salir_Click" 
            OnGuardar_Click="Guardar_Click" />
 </div>

<span class="clear">
 <div >
      <span class="H3cabecera_seccion">
            <%=rmGlobal("Hora")%>                                     
       </span>        
       <span class="clear">
                <span class="label_mini-corto float_left">
                    <%=rmGlobal("HoraInicio")%>
                 </span>          
                 <Avalora:AvaloraHora ID="txtHoraInicio" CssClass="input_mini float_left" runat="server" AutoHora="false" FormatoHora="HHMM" Enabled="false" Intro="true" MaxLength="5" />
                 <span class="label_mini-corto float_left">
                    <%=rmGlobal("HoraFin")%>
                 </span>          
                 <Avalora:AvaloraHora ID="txtHoraFin" CssClass="input_mini float_left" runat="server" AutoHora="false" FormatoHora="HHMM" Enabled="false" Intro="true" MaxLength="5" />
        </span>    
        <span class="H3cabecera_seccion">
            <%=rmGlobal("Frecuencia")%>                                     
       </span>        
       <span class="clear">
                <asp:DropDownList ID="cboFrecuencia" runat="server" 
          CssClass="select_corto float_left" AutoPostBack="true"
          onselectedindexchanged="cboFrecuencia_SelectedIndexChanged"  >
                    <asp:ListItem Text="<%$ Resources:Resource, Diaria %>" Value="D" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="<%$ Resources:Resource, Semanal %>" Value="S"></asp:ListItem>
                    <asp:ListItem Text="<%$ Resources:Resource, Mensual %>" Value="M"></asp:ListItem>
                </asp:DropDownList>                 
        </span>
        <div>
        <span class="clear">
        <div id="divDiario" runat="server" visible="true">
            <span class="label_mini-corto float_left">
                    <%=rmGlobal("Cada")%>
            </span>  
            <Avalora:AvaloraNumerico ID="txtIntervaloDias" runat="server" CssClass="input_mini float_left " Intro="true" AutoCero="true" MaxLength="3" NumDecimales="0" PermiteNegativos="false"
             Numero="1" />
            <span class="label_corto float_left">
                    <%=rmGlobal("Dias")%>
            </span>  
        </div>
        <div id="divSemanal" runat="server" visible="false">
            <span class="clear">
                 <span class="label_mini-corto float_left">
                        <%=rmGlobal("RepetirCada")%>
                </span>  
                <Avalora:AvaloraNumerico ID="txtIntervaloSemanas" runat="server" CssClass="input_mini float_left " AutoCero="false" Intro="true" MaxLength="3" NumDecimales="0" PermiteNegativos="false"
                 Numero="1" />
                <span class="label_corto float_left">
                        <%=rmGlobal("SemanasEl")%>
                </span>  
            <span class="clear">
                <asp:CheckBox ID="chkLunes" runat="server" CssClass="label_mini-corto"  Text="<%$ Resources:Resource, Lunes %>" />
                <asp:CheckBox ID="chkMartes" runat="server" CssClass="label_mini-corto" Text="<%$ Resources:Resource, Martes %>" />
                <asp:CheckBox ID="chkMiercoles" runat="server" CssClass="label_mini-corto" Text="<%$ Resources:Resource, Miercoles %>" />
                <asp:CheckBox ID="chkJueves" runat="server" CssClass="label_mini-corto" Text="<%$ Resources:Resource, Jueves %>" />
                <asp:CheckBox ID="chkViernes" runat="server" CssClass="label_mini-corto" Text="<%$ Resources:Resource, Viernes %>" />
                <asp:CheckBox ID="chkSabado" runat="server" CssClass="label_mini-corto" Text="<%$ Resources:Resource, Sabado %>" />
                <asp:CheckBox ID="chkDomingo" runat="server"  CssClass="label_mini-corto" Text="<%$ Resources:Resource, Domingo %>" />                
            </span> 
        </div>
        <div id="divMensual" runat="server" visible="false">
            <span class="clear">
            <span class="clear">
                <asp:RadioButton ID="rdbMensualOpcion1"  CssClass=" radio_inline float_left" runat="server" Text=""  onclick="CambiarRadioButton(this);ValorDefecto(this);CalcularDatos();" Checked="true"/>
                 <span class="label_mini float_left">
                    <%=rmGlobal("ElDia")%>
                </span>  
                <Avalora:AvaloraNumerico ID="txtDiaMes" runat="server" CssClass="input_mini float_left " AutoCero="false" Intro="true" MaxLength="2" NumDecimales="0" PermiteNegativos="false" Numero="1" />
                 <span class="label_mini float_left">
                    <%=rmGlobal("Cada")%>
                 </span>  
                 <Avalora:AvaloraNumerico ID="txtIntervaloMesesElDia" runat="server" CssClass="input_mini float_left " AutoCero="false" Intro="true" MaxLength="2" NumDecimales="0" PermiteNegativos="false"
                  Numero="1" />
                 <span class="label_mini float_left">
                    <%=rmGlobal("Meses")%>
                 </span>  
            </span>
             <span class="clear">
                <asp:RadioButton ID="rdbMensualOpcion2" CssClass="radio_inline float_left" runat="server" Text="" onclick="CambiarRadioButton(this);ValorDefecto(this);CalcularDatos();" />
                 <span class="label_mini float_left">
                    <%=rmGlobal("El")%>
                </span>  
                <asp:DropDownList ID="cboOrdenMes" runat="server" CssClass="select_corto float_left">
                    <asp:ListItem Text="<%$ Resources:Resource, Primer %>" Value="1"></asp:ListItem>
                    <asp:ListItem Text="<%$ Resources:Resource, Segundo %>" Value="2"></asp:ListItem>
                    <asp:ListItem Text="<%$ Resources:Resource, Tercero %>" Value="3"></asp:ListItem>
                    <asp:ListItem Text="<%$ Resources:Resource, Cuarto %>" Value="4"></asp:ListItem>
                    <asp:ListItem Text="<%$ Resources:Resource, Ultimo %>" Value="5"></asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="cboDiasSemana" runat="server" CssClass="select_corto float_left">
                    <asp:ListItem Text="<%$ Resources:Resource, Lunes %>" Value="1"></asp:ListItem>
                    <asp:ListItem Text="<%$ Resources:Resource, Martes %>" Value="2"></asp:ListItem>
                    <asp:ListItem Text="<%$ Resources:Resource, Miercoles %>" Value="3"></asp:ListItem>
                    <asp:ListItem Text="<%$ Resources:Resource, Jueves %>" Value="4"></asp:ListItem>
                    <asp:ListItem Text="<%$ Resources:Resource, Viernes %>" Value="5"></asp:ListItem>
                    <asp:ListItem Text="<%$ Resources:Resource, Sabado %>" Value="6"></asp:ListItem>
                    <asp:ListItem Text="<%$ Resources:Resource, Domingo %>" Value="7"></asp:ListItem>
                </asp:DropDownList>
                 <span class="label_mini float_left">
                    <%=rmGlobal("Cada")%>
                 </span>  
                 <Avalora:AvaloraNumerico ID="txtInteravaloMeses" runat="server" CssClass="input_mini float_left " AutoCero="false" Intro="true" MaxLength="2" NumDecimales="0" PermiteNegativos="false"
                  Numero="1" />
                 <span class="label_mini float_left">
                    <%=rmGlobal("Meses")%>
                 </span>  
            </span>
            </span>
        </div>
        </span>
        </div>
        <span class="clear">                
        </span>
        <div id="divIntervalo">
            <span class="clear" >
                <span class="clear" >
                    <span class="H3cabecera_seccion">
                        <%=rmGlobal("IntervaloRepeticion")%>                                     
                    </span> 
                 </span>
             <span class="label_mini-corto ">
                <%=rmGlobal("FechaInicioObligatorio")%>
            </span>     
            <Avalora:DatePicker ID="dpFechaInicio" runat="server" />
             <span class="label_corto">
                <%=rmGlobal("NumeroRepeticiones")%>
            </span>   
            <Avalora:AvaloraNumerico ID="txtNumeroRepeticiones" runat="server" CssClass="input_mini float_left " AutoCero="false" Intro="true" MaxLength="3" NumDecimales="0" PermiteNegativos="false" 
             Numero="1"/>
            <span class="clear">
                 <span class="label_mini-corto ">
                    <%=rmGlobal("FechaFin")%>
                </span>     
                <Avalora:AvaloraText ID="txtFechaFin" runat="server" Enabled="false" CssClass="input_mini-corto float_left" />
                
            </span>
            
            </span>
        </div>
       
</div> <%--fin div principal--%>
</span>                          
                   
<div id="divHidden">
                    <input type="hidden" name="__EVENTTARGET_FNC" />
                    <input type="hidden" name="__EVENTARGUMENT_FNC" />
</div>        
    </span>        
</asp:Content>

