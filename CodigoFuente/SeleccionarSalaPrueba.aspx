<%@ page language="C#" autoeventwireup="true" inherits="SeleccionarSalaPrueba, App_Web_imuq2iyt" masterpagefile="~/MasterPageEmpty.master" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


<script type="text/javascript" language='javascript'>


    function __doPostBackFNC(eventTarget, eventArgument) {
        var theform = document['aspnetForm'];
        theform.__EVENTTARGET_FNC.value = eventTarget;
        theform.__EVENTARGUMENT_FNC.value = eventArgument;
        __doPostBack('ctl00_UpdatePanelGeneral', '');
    }


    function CalcularSalas() {
        __doPostBackFNC('CalcularSalas', 'CalcularSalas');
    }
    //mueve el scroll horizontal
    function CalcularHorizontalScroll(scroll) {

        document.getElementById("ctl00_ContentPlaceHolder1_Panel1").scrollLeft = scroll;
    }

    var horarioNoPermitido = '';
    var lstIds = '';
    var filaPrincipal = '';
    var colPrincipal = '';
    //Número de celdas que tiene a partir de los hroarios que se cargan
    var numCeldas = 0;


    var numVecesDown = 0;

    //Evento que salta al mouseDown de la celda
    //Guardando la hora inicio
    function Principio(id) {

        if (document.getElementById(id).style.backgroundColor != 'red') {
                                
            var idLabel = id.replace('_pnl', '_lbl');
            document.getElementById(idLabel).style.backgroundColor = 'blue';
                        

            horarioNoPermitido = '';

            //'ctl02' es la fila
            //'ctl01' es la columna
            
            idQuitar = 'ctl00_ContentPlaceHolder1_';
            id = id.replace(idQuitar, '');
            idQuitar = 'grdSalas_';
            id = id.replace(idQuitar, '');
            idQuitar = 'rptHora_';
            id = id.replace(idQuitar, '');
            idQuitar = 'ctl';
            id = id.replace(idQuitar, '');

            idQuitar = '_pnl';
            id = id.replace(idQuitar, '');
            idQuitar = '_lbl';
            id = id.replace(idQuitar, '');
            idQuitar = 'ctl';
            id = id.replace(idQuitar, '');
            //Una vez quitado parte del nombres dl control, seleccionamos la fila y la columna
            var n = id.split("_");
            filaPrincipal = n[0];
            colPrincipal = n[1];
            
            lstIds = id;
            
        }
        else {
            filaPrincipal = '';
            colPrincipal = '';
        }
    }

    //Evento que salta al mouseUp de una celda
    //Que indica la hora y la sala seleccionada
    function Final(id) {
        if (lstIds != '') {
            if (horarioNoPermitido == '' && document.getElementById(id).style.backgroundColor != 'red') {

                if (filaPrincipal != '' && colPrincipal != '') {
                    //'ctl02' es la fila
                    //'ctl01' es la columna
                    var idQuitar = 'grdSalas_ctl02_rptHora_ctl01_pnl';
                    idQuitar = 'ctl00_ContentPlaceHolder1_';
                    id = id.replace(idQuitar, '');
                    idQuitar = 'grdSalas_';
                    id = id.replace(idQuitar, '');
                    idQuitar = 'rptHora_';
                    id = id.replace(idQuitar, '');
                    idQuitar = 'ctl';
                    id = id.replace(idQuitar, '');
                    idQuitar = '_pnl';
                    id = id.replace(idQuitar, '');
                    idQuitar = 'ctl';
                    id = id.replace(idQuitar, '');
                    //Una vez quitado parte del nombres dl control, seleccionamos la fila y la columna
                    var n = id.split("_");
                    var filaFinal = n[0];
                    var colFinal = n[1];

                    var horaInicio = '';
                    var horaFin = '';
                    var IdSala = '';
                    var Sala = '';

                    //Comprobamos que es la misma fila
                    if (filaPrincipal == filaFinal) {
                        //Habrá que recorrer los ids
                        if (colFinal > colPrincipal) {
                            horaInicio = document.getElementById("ctl00_ContentPlaceHolder1_grdSalas_ctl" + filaPrincipal + "_rptHora_ctl" + colPrincipal + "_lblHora").innerText;
                            horaFin = document.getElementById("ctl00_ContentPlaceHolder1_grdSalas_ctl" + filaFinal + "_rptHora_ctl" + colFinal + "_lblHora").innerText;
                            IdSala = document.getElementById("ctl00_ContentPlaceHolder1_grdSalas_ctl" + filaFinal + "_txtIdSala").value;
                            Sala = document.getElementById("ctl00_ContentPlaceHolder1_grdSalas_ctl" + filaFinal + "_txtSala_txtTexto").value;



                        }
                        else {
                            horaFin = document.getElementById("ctl00_ContentPlaceHolder1_grdSalas_ctl" + filaPrincipal + "_rptHora_ctl" + colPrincipal + "_lblHora").innerText;
                            horaInicio = document.getElementById("ctl00_ContentPlaceHolder1_grdSalas_ctl" + filaFinal + "_rptHora_ctl" + colFinal + "_lblHora").innerText;
                            IdSala = document.getElementById("ctl00_ContentPlaceHolder1_grdSalas_ctl" + filaFinal + "_txtIdSala").value;
                            Sala = document.getElementById("ctl00_ContentPlaceHolder1_grdSalas_ctl" + filaFinal + "_txtSala_txtTexto").value;
                        }
                        var desc = '<%=Resources.Resource.Sala %>';
                        desc += ': ' + Sala + ' (' + horaInicio + '--' + horaFin + ')   ';
                        desc += '<%=Resources.Resource.DeseaSeleccionarEstaSala %>';
                        if (confirm(desc)) {
                            salir_Actualizar(IdSala, horaInicio, horaFin);
                        }
                        else
                            document.getElementById("ctl00_ContentPlaceHolder1_dpFechaInicio_fecha").focus();
                    }
                    else {
                        alert('<%=Resources.Resource.Val_SalasDistintas %>');
                        document.getElementById("ctl00_ContentPlaceHolder1_dpFechaInicio_fecha").focus();
                    }
                } //fin de if  if (filaPrincipal != '' && colPrincipal != '') 
                //                else {
                //                    alert('<%=Resources.Resource.Val_SalaOcupada %>');
                //                //alert('No se puede seleccionar ese horario para esa sala ya que se encuentra ocupada');
                //            }
            } //fin de if horarioNoPermitido = ''
            else {
                alert('<%=Resources.Resource.Val_SalaOcupada %>');
                //document.getElementById("ctl00_ContentPlaceHolder1_salas").focus();
                document.getElementById("ctl00_ContentPlaceHolder1_dpFechaInicio_fecha").focus();
            }
        } //FIN  if (lstIds != '') 
        else {
            
            document.getElementById("ctl00_ContentPlaceHolder1_dpFechaInicio_fecha").focus();
        }
        
        vaciarVariableComienzo();

    }

    function salir_Actualizar(idSala, horaInicio, horaFin) {

        //Cogemos la primera hora de inicio 
        var n = horaInicio.split("/");
        var horaInicioPrimera = n[0];
        var horaInicioSegunda = n[1];
        //Cogemos la segunda hora de fin
        n = horaFin.split("/");
        var horaFinPrimera = n[0];
        var horaFinSegunda = n[1];

        var fecha = document.getElementById("ctl00_ContentPlaceHolder1_dpFechaInicio_fecha").value;

        window.parent.ActualizaSalaHora(fecha, idSala, horaInicioPrimera, horaFinSegunda);
        window.parent.$.modal.close();
    }

        //Pone la celda pasada por parámetro un background-color para indicar que está seleccionada
    function marcarCelda(id) 
    {
        if (lstIds != '') {

            
            var idControl = id;
            //'ctl02' es la fila
            //'ctl01' es la columna            
            var idQuitar = 'ctl00_ContentPlaceHolder1_';
            id = id.replace(idQuitar, '');
            idQuitar = 'grdSalas_';
            id = id.replace(idQuitar, '');
            idQuitar = 'rptHora_';
            id = id.replace(idQuitar, '');
            idQuitar = 'ctl';
            id = id.replace(idQuitar, '');

            idQuitar = '_pnl';
            id = id.replace(idQuitar, '');
            idQuitar = '_lbl';
            id = id.replace(idQuitar, '');
            idQuitar = 'ctl';
            id = id.replace(idQuitar, '');
            //Una vez quitado parte del nombres dl control, seleccionamos la fila y la columna
            var n = id.split("_");
            var filaActual = n[0];


            if (filaPrincipal == filaActual )
            {
                if (document.getElementById(idControl).style.backgroundColor == 'red') 
                {
                    horarioNoPermitido = '1';
                    vaciarVariableComienzo();
                }
                else {
                    
                    var idLabel = idControl.replace('_pnl', '_lbl');
                    document.getElementById(idLabel).style.backgroundColor = 'blue';
                    //document.getElementById(idControl).style.backgroundColor = 'blue';
                }            
            }
            else { //si no es la fila principal deseleccionamos todo                
                document.getElementById("ctl00_ContentPlaceHolder1_dpFechaInicio_fecha").focus();
                vaciarVariableComienzo();
                
            }
        }        
}

    //ponemos '' la variable que indica que existe la primera celda de inicio de seleccion de horario y sala
    function vaciarVariableComienzo() {
        lstIds = '';
        devolverColorCeldas();


    }



    //devuelve a su estado el color de las celdas
    function devolverColorCeldas() {
        var grid = document.getElementById("ctl00_ContentPlaceHolder1_grdSalas");

        //recorrer todas las filas del grid
        for (var fila = 0; fila <= grid.rows.length; fila++) {
            if (fila > 1) {
                var idFila = zeroPad(fila, 10);
                //document.getElementById("ctl00_ContentPlaceHolder1_grdSalas_ctl" + idFila + "_rptHora_ctl" + colPrincipal + "_pnl").style.backgroundColor        
                var panel = document.getElementById("ctl00_ContentPlaceHolder1_grdSalas_ctl" + idFila + "_rptHora_ctl"); // + colPrincipal + "_pnl").style.backgroundColor                        
                //numCeldas está calculado dinámicamente en Prueba.aspx.cs=>CargarSalas()
                for (var filaRpt = 0; filaRpt < numCeldas; filaRpt++) {
                    var idCol = zeroPad(filaRpt, 10);
                    panel = document.getElementById("ctl00_ContentPlaceHolder1_grdSalas_ctl" + idFila + "_rptHora_ctl" + idCol + "_lbl");
                    if (panel.style.backgroundColor == 'blue') {
                        panel.style.backgroundColor = 'green';
                    }
                    
                }
            }
        }

        //recorrer todas las celdas del dataList
    }

    //Función para formateo de números
    //Ej, => nr=1 y base 10 => resultado = 01
    function zeroPad(nr, base) {
        var len = (String(base).length - String(nr).length) + 1;
        return len > 0 ? new Array(len).join('0') + nr : nr;
    }


</script>



 <div class="toolbar" onclick="vaciarVariableComienzo();">
     
     <Avalora:Toolbar ID="ToolbarEdicion" runat="server" Buscar="false" Eliminar="false" Guardar="false"
            Imprimir="false" Nuevo="false" ExportarExcel="false" Titulo="Seleccionar Sala" OnSalir_Click="Salir_Click" />
 </div>


    <div onclick="vaciarVariableComienzo();">
     <span class="clear"> 
                            <span class="label_corto">
                                <%=rmGlobal("PaisObligatorio")%>
                             </span>                    		    
                             <asp:DropDownList ID="cboPais" runat="server" 
                          CssClass="select_corto float_left" AutoPostBack="true" 
                          onselectedindexchanged="cboPais_SelectedIndexChanged" >        		                    
                            </asp:DropDownList>
                               <span class="label_corto"> 
                                <%=rmGlobal("EdificioObligatorio")%> 
                            </span>                    		    
                             <asp:DropDownList ID="cboEdificio" runat="server" 
                                CssClass="select_corto float_left" AutoPostBack="true" 
                                onselectedindexchanged="cboEdificio_SelectedIndexChanged" >        		    
                             </asp:DropDownList>                                         
		                </span> 
                         <span class="clear">
                             <span class="label_corto float_left">
                                <%=rmGlobal("FechaInicioObligatorio")%>
                             </span>     
                             <Avalora:DatePicker ID="dpFechaInicio" runat="server" />                             
                               
                            <span class="label_corto float_left">
                                <%=rmGlobal("HoraInicioObligatorio")%>
                             </span>     
                            <Avalora:AvaloraHora runat="server" ReadOnly="true" Enabled="false" AutoHora="false" CssClass="input_corto float_left" ID="txtHoraInicio" FormatoHora="HHMM" Intro="false"  onkeypress="KeyHora(event)" onBlur="HoraFormat(event)" MaxLength="5" />
                             <span class="label_corto float_left">
                                <%=rmGlobal("HoraFinObligatorio")%>
                             </span>     
                             <Avalora:AvaloraHora runat="server" ReadOnly="true" Enabled="false" AutoHora="false" CssClass="input_corto float_left" ID="txtHoraFin" FormatoHora="HHMM" Intro="false"  onkeypress="KeyHora(event)" onBlur="HoraFormat(event)" MaxLength="5" />
                             <span style="vertical-align:middle">
                                    <asp:Label ID="lbl" runat="server" CssClass="label_largo float_right" ></asp:Label>                                    
                             </span>                                                    
                        </span>            
    </div>
     <div id="salas" runat="server" style="width:100%;overflow:scroll" onclick="vaciarVariableComienzo();">
          
<asp:Panel ID="Panel1" runat="server" Height="200px" Width="100%" onclick="vaciarVariableComienzo();">
              
            <asp:GridView ID="grdSalas" runat="server"
                 
                OnRowDataBound="grdSalas_RowDataBound"  
                 OnSelectedIndexChanged="grdSalas_SelectedIndexChanged"                                
                 CellPadding="0" CellSpacing="0"
                AutoGenerateColumns="false" >        
                    <Columns>               
                        <asp:TemplateField >   
                            <HeaderTemplate>                                                                            
                                <asp:Label ID="lblSala" runat="server" CssClass="GridLinkBusqueda"><%=rmGlobal("Sala")%></asp:Label>                                                
                            </HeaderTemplate>                            
                            <ItemTemplate>
                                    <asp:ImageButton ID="imgSeleccionar" runat="server" CommandName="Select" Visible="false" 
                                    ImageUrl="~/App_Themes/img/asociar.gif"
                                    TabIndex="-1" />
                                                                         
                                        <input type="hidden" runat="server" value='<%# Bind("Codigo") %>' id="txtIdSala"  />
                                        <Avalora:AvaloraText ID="txtSala" runat="server" Enabled="false" ReadOnly="True" Text='<%# Bind("Descripcion") %>'  />
                                        <Avalora:AvaloraText ID="txtHoraIni" runat="server" ReadOnly="True" Text='<%# Bind("Hora_Ini") %>' Visible="false" />
                                        <Avalora:AvaloraText ID="txtMinIni" runat="server" ReadOnly="True" Text='<%# Bind("Min_Ini") %>' Visible="false" />
                                        <Avalora:AvaloraText ID="txtHoraFin" runat="server" ReadOnly="True" Text='<%# Bind("Hora_Fin") %>' Visible="false" />
                                        <Avalora:AvaloraText  ID="txtMinFin" runat="server" ReadOnly="True" Text='<%# Bind("Min_Fin") %>' Visible="false" />  
                            </ItemTemplate>      
                        </asp:TemplateField>          
                        <asp:TemplateField>                                                   
                            <HeaderTemplate>                                                                                                                
                                   <%--  <asp:DataList ID="rptHoras" runat="server" RepeatDirection="Horizontal">
                                            <ItemTemplate>
                                                <Avalora:AvaloraText ID="txtHora" runat="server" ReadOnly="True" Text='<%# Bind("hora") %>'  />
                                            </ItemTemplate>
                                        </asp:DataList>--%>
                                        <asp:DataList ID="dtlHoras" runat="server" RepeatDirection="Horizontal" CellPadding="0" CellSpacing="0"
                                            BorderStyle="Solid"
                                        HorizontalAlign="Left" BorderWidth="1" BorderColor="Black">
                                        <ItemTemplate>
                                            <asp:Panel ID="pnl" runat="server" Width="61px" BorderColor="Black" BorderWidth="1px" BorderStyle="Solid">
                                                <asp:Label ID="lblHoras" runat="server" Text='<%# Bind("hora") %>' Width="61px"></asp:Label>
                                            </asp:Panel>
                                        </ItemTemplate>                                             
                                    </asp:DataList>                             
                            </HeaderTemplate>                                        
                            <ItemTemplate>                                   
                               <asp:DataList ID="rptHora" runat="server" OnItemDataBound="rptHoras_ItemDataBound" CellSpacing="0" CellPadding="0" RepeatDirection="Horizontal" Width="100%">
                                   
                                            <ItemTemplate>
                                                <asp:Panel ID="pnl" runat="server"  BorderWidth="0" >                                                    
                                                    <asp:Label ID="lbl" runat="server" Font-Size="XX-Small" ReadOnly="true" Enabled="true" Visible="true" ToolTip='<%# Bind("hora") %>' Text="X"/>    
                                                    <asp:Label ID="lblHora" runat="server" ReadOnly="false" Enabled="false" Visible="true" Text='<%# Bind("hora") %>'    />    
                                                </asp:Panel>                                                                                                
                                            </ItemTemplate>
                                </asp:DataList>
                            </ItemTemplate>
                    </asp:TemplateField>           

                                                           
                    </Columns>                            
                    <EmptyDataTemplate>
                        <div>
                            <asp:Label ID="Label32" Width="400px" runat="server" CssClass="labelCampo" Text="<%$Resources:Resource, NoSalasEncontradas%>"></asp:Label>
                        </div>                                        
                    </EmptyDataTemplate>                   
                    <PagerSettings Mode="Numeric"  Position="Bottom" PageButtonCount="10" />
                    <PagerStyle CssClass="data_grid_paginador" />
        </asp:GridView>    

        

</asp:Panel>    
    </div>
     <div id="divHidden">
                    <input type="hidden" name="__EVENTTARGET_FNC" />
                    <input type="hidden" name="__EVENTARGUMENT_FNC" />
</div>

</asp:Content>