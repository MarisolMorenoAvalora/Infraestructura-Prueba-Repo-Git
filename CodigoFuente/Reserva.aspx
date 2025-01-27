<%@ page language="C#" autoeventwireup="true" inherits="Reserva, App_Web_imuq2iyt" masterpagefile="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

  <%--<script type="text/javascript">history.forward();</script>--%>
  <script language="JavaScript" type="text/javascript">
    (document.all) ? history.forward() : history.forward(1);

  </script>

  <script type="text/javascript" language='javascript'>
    $(function () { PrivatePageLoaded() });



    var tempo = 0;
    var arrayPersonas = new Array();
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
      //alert('3');
        $("#tabs").tabs("select", idTabSeleccionado);

        CalcularHorizontalScroll();
      }



      function __doPostBackFNC(eventTarget, eventArgument) {
        var theform = document['aspnetForm'];
        theform.__EVENTTARGET_FNC.value = eventTarget;
        theform.__EVENTARGUMENT_FNC.value = eventArgument;
        __doPostBack('ctl00_UpdatePanelGeneral', '');
      }


      function LimpiarUsuario() {
        $("#ctl00_ContentPlaceHolder1_lstPersonas").empty();
        $("#ctl00_ContentPlaceHolder1_lstPersonas").hide();
      }

      function mostrar() {
        var subMenu = document.getElementById('ctl00_ContentPlaceHolder1_divBusquedaUsuarios');
        subMenu.style.visibility = 'visible';
        clearTimeout(tempo);
      }

      function ocultar() {
        var subMenu = document.getElementById('ctl00_ContentPlaceHolder1_divBusquedaUsuarios');
        subMenu.style.visibility = 'hidden';
        subMenu.style.height = '0px';
      }

      function ocultar_retarda() {
        tempo = setTimeout("ocultar();", 1000);
      }

      /*
      Función que se ejecuta cada vez que el usuario pulsa una tecla en el txtEmailAsistente
      */
      var varNombreEmail = '';
      var varNombre = '';
      function AbrirUsuario(idFilaActual, objBusqueda, objEmail, objNombre) {

        try {

          //vaciamos el listado
          $("#ctl00_ContentPlaceHolder1_lstPersonas").empty();
          var subMenu = document.getElementById('ctl00_ContentPlaceHolder1_divBusquedaUsuarios');
          var varLeft = document.getElementById('ctl00_ContentPlaceHolder1_divConvocatoria').parentNode.offsetLeft + objBusqueda.parentNode.offsetLeft;
          var varTop = document.getElementById('ctl00_ContentPlaceHolder1_divConvocatoria').parentNode.offsetTop;
          varTop += idFilaActual * 30;

          subMenu.style.top = varTop + 90 + "px";
          subMenu.style.left = varLeft + "px";
          subMenu.style.visibility = 'visible';

          clearTimeout(tempo);

          var arrayEncontrados = new Array();
          var valor = objBusqueda.value;
          var i = 0;
          var idx = 0;
          arrayEncontrados = new Array(arrayPersonas.length);
          for (var i = 0; i < arrayPersonas.length; i++)
          {
            if (arrayPersonas[i] != null) {
              var str = arrayPersonas[i].replace("[", " ").replace("]", " ");
              if (escape(str).match(escape(valor)) != null) {
                arrayEncontrados[idx] = arrayPersonas[i].toString();
                idx ++;
              } 
            }
            else
            {
              break;
            }
          }

          for (var i = 0; i < arrayEncontrados.length; i++) {
            if (arrayEncontrados[i] != null) {
              var valor = arrayEncontrados[i].toString();

              //para FireFox
              if (typeof objEmail.textContent != "undefined") {
                varNombreEmail = objEmail.id;
                varNombre = objNombre.id;

                $("#ctl00_ContentPlaceHolder1_lstPersonas").append("<li  style='cursor:pointer;' onclick=PonerAsistenteFireFox(this.textContent);>" + valor + "</li>");
              }
              else {
                $("#ctl00_ContentPlaceHolder1_lstPersonas").append("<li  style='cursor:pointer;' onclick=PonerAsistente(this.innerText," + objEmail.name + "," + objNombre.name + "); >" + valor + "</li>");
              }
            }
            else
              break;
          }
        }
        catch (ex) {
          alert('Error: ' + ex);
        }

      }

      function PonerAsistenteFireFox(objeto) {

        var valor = objeto;

        var datos = valor.split("]");

        var datoEmail = datos[0].toString().replace("[", "");
        var datoNombreCompleto = datos[1].toString();

        var objEmail = document.getElementById(varNombreEmail);
        if (objEmail != null)
          objEmail.value = datoEmail;
        var objNombre = document.getElementById(varNombre);
        if (objNombre != null)
          objNombre.value = datoNombreCompleto;

        var subMenu = document.getElementById('ctl00_ContentPlaceHolder1_divBusquedaUsuarios');
        subMenu.style.visibility = 'hidden';
      }

      /*
          Ponemos el valor seleccionado en el objTexto
      */
      function PonerAsistente(objListado, objEmail, objNombre) {

        var valor = objListado;//  '';

        var datos = valor.split("]");

        var datoEmail = datos[0].toString().replace("[", "");
        var datoNombreCompleto = datos[1].toString();

        objEmail.value = datoEmail;
        objNombre.value = datoNombreCompleto;

        var subMenu = document.getElementById('ctl00_ContentPlaceHolder1_divBusquedaUsuarios');
        subMenu.style.visibility = 'hidden';

      }
      function ActualizarDatos() {
        __doPostBackFNC('ActualizarDatosPeriodicidad', 'ActualizarDatosPeriodicidad');
      }
      function Actualizar() {
        __doPostBackFNC('ActualizarDatos', 'ActualizarDatos');
      }

      function CalcularPeriodicidad() {
        __doPostBackFNC('CalcularPeriodicidad', 'CalcularPeriodicidad');
      }
      function ActualizaUsuario(nombreUsuario, emailUsuario) {
        var arr = new Array(2)
        arr[0] = nombreUsuario;
        arr[1] = emailUsuario;
        __doPostBackFNC('ActualizarSolicitante', arr);

      }

      //Función llamada desde SeleccionarSala 
      //se ha elegido sala y horario.
      function ActualizaSalaHora(fecha, idSala, horaInicio, horaFin) {

        document.getElementById('ctl00_ContentPlaceHolder1_hiddenFecha').value = fecha;
        document.getElementById('ctl00_ContentPlaceHolder1_hiddenIdSala').value = idSala;
        document.getElementById('ctl00_ContentPlaceHolder1_hiddenHoraInicio').value = horaInicio;
        document.getElementById('ctl00_ContentPlaceHolder1_hiddenHoraFin').value = horaFin;

        __doPostBackFNC('ActualizarSalaHorario', 'ActualizarSalaHorario');
      }


      function CalcularPeriodicidad_Salas() {
        __doPostBackFNC('CalcularPeriodicidadSalas', 'CalcularPeriodicidadSalas');

      }


      function CalcularPeriodicidadSalas_VideoAudio() {
        __doPostBackFNC('CalcularPeriodicidadSalas_VideoAudio', 'CalcularPeriodicidadSalas_VideoAudio');

      }

      /*FUNCIONES PARA LA SELECCIÓN DE LA SALA*/
      function CalcularSalas(nombreControl) {
        //variable nombreControl indica el control que está ejecutando la función (es para el control del foco)
        //alert('jorge');
        __doPostBackFNC('CalcularSalas', nombreControl);
      }

      //mueve el scroll horizontal
      function CalcularHorizontalScroll() {
        document.getElementById("ctl00_ContentPlaceHolder1_DivSeleccionSalas").scrollLeft = 550;
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

        var colorLibre = document.getElementById("ctl00_ContentPlaceHolder1_lblLibre").style.backgroundColor;
        var colorOcupado = document.getElementById("ctl00_ContentPlaceHolder1_lblOcupado").style.backgroundColor;
        var colorSeleccionada = document.getElementById("ctl00_ContentPlaceHolder1_lblSeleccionada").style.backgroundColor;
        var colorSeleccionActual = document.getElementById("ctl00_ContentPlaceHolder1_lblSeleccionActual").style.backgroundColor;

        if (document.getElementById(id).style.backgroundColor != colorOcupado) { // 'red') {

          var idLabel = id.replace('_pnl', '_lbl');
          document.getElementById(idLabel).style.backgroundColor = colorSeleccionada; //  'blue';


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
          var colorLibre = document.getElementById("ctl00_ContentPlaceHolder1_lblLibre").style.backgroundColor;
          var colorOcupado = document.getElementById("ctl00_ContentPlaceHolder1_lblOcupado").style.backgroundColor;
          var colorSeleccionada = document.getElementById("ctl00_ContentPlaceHolder1_lblSeleccionada").style.backgroundColor;
          var colorSeleccionActual = document.getElementById("ctl00_ContentPlaceHolder1_lblSeleccionActual").style.backgroundColor;


          if (horarioNoPermitido == '' && document.getElementById(id).style.backgroundColor != colorOcupado) {// != 'red') {

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
              // JMZ Prueba para que funcione con Firefox
              //Comprobamos que es la misma fila
              if (filaPrincipal == filaFinal) {
                //Habrá que recorrer los ids
                if (colFinal > colPrincipal) {
                  // Firefox 
                  if (document.getElementById("ctl00_ContentPlaceHolder1_grdSalas_ctl" + filaPrincipal + "_rptHora_ctl" + colPrincipal + "_lblHora").innerText == undefined) {
                    horaInicio = document.getElementById("ctl00_ContentPlaceHolder1_grdSalas_ctl" + filaPrincipal + "_rptHora_ctl" + colPrincipal + "_lblHora").textContent;
                    horaFin = document.getElementById("ctl00_ContentPlaceHolder1_grdSalas_ctl" + filaFinal + "_rptHora_ctl" + colFinal + "_lblHora").textContent;
                  }
                  else {
                    horaInicio = document.getElementById("ctl00_ContentPlaceHolder1_grdSalas_ctl" + filaPrincipal + "_rptHora_ctl" + colPrincipal + "_lblHora").innerText;
                    horaFin = document.getElementById("ctl00_ContentPlaceHolder1_grdSalas_ctl" + filaFinal + "_rptHora_ctl" + colFinal + "_lblHora").innerText;
                  }
                  IdSala = document.getElementById("ctl00_ContentPlaceHolder1_grdSalas_ctl" + filaFinal + "_txtIdSala").value;
                  Sala = document.getElementById("ctl00_ContentPlaceHolder1_grdSalas_ctl" + filaFinal + "_txtSala_txtTexto").value;



                }
                else {
                  // horaFin = document.getElementById("ctl00_ContentPlaceHolder1_grdSalas_ctl" + filaPrincipal + "_rptHora_ctl" + colPrincipal + "_lblHora").innerText;
                  // horaInicio = document.getElementById("ctl00_ContentPlaceHolder1_grdSalas_ctl" + filaFinal + "_rptHora_ctl" + colFinal + "_lblHora").innerText;
                  // Firefox 
                  if (document.getElementById("ctl00_ContentPlaceHolder1_grdSalas_ctl" + filaPrincipal + "_rptHora_ctl" + colPrincipal + "_lblHora").innerText == undefined) {
                    horaInicio = document.getElementById("ctl00_ContentPlaceHolder1_grdSalas_ctl" + filaPrincipal + "_rptHora_ctl" + colPrincipal + "_lblHora").textContent;
                    horaFin = document.getElementById("ctl00_ContentPlaceHolder1_grdSalas_ctl" + filaFinal + "_rptHora_ctl" + colFinal + "_lblHora").textContent;
                  }
                  else {
                    horaInicio = document.getElementById("ctl00_ContentPlaceHolder1_grdSalas_ctl" + filaPrincipal + "_rptHora_ctl" + colPrincipal + "_lblHora").innerText;
                    horaFin = document.getElementById("ctl00_ContentPlaceHolder1_grdSalas_ctl" + filaFinal + "_rptHora_ctl" + colFinal + "_lblHora").innerText;
                  }
                  IdSala = document.getElementById("ctl00_ContentPlaceHolder1_grdSalas_ctl" + filaFinal + "_txtIdSala").value;
                  Sala = document.getElementById("ctl00_ContentPlaceHolder1_grdSalas_ctl" + filaFinal + "_txtSala_txtTexto").value;
                }
                var desc = '<%=Resources.Resource.Sala %>';
                if (horaInicio.split('/')[0] >= horaFin.split('/')[1])
                {
                  //desc += ': ' + Sala + ' (' + horaInicio.split('/')[1] + '-' + horaFin.split('/')[0] + ')   ';
                  var aux = horaInicio;
                  horaInicio = horaFin;
                  horaFin = aux;
                }
                else
                {
                  
                }
                desc += ': ' + Sala + ' (' + horaInicio.split('/')[0] + '-' + horaFin.split('/')[1] + ')   ';
                  desc += '<%=Resources.Resource.DeseaSeleccionarEstaSala %>';
                        if (confirm(desc)) {
                          salir_Actualizar(IdSala, horaInicio, horaFin);
                        }
                        else { //SI DA BOTÓN CANCELAR RECARGAMOS LA PÁGINA CON LOS VALORES QUE TENÍA                             
                          document.getElementById("ctl00_ContentPlaceHolder1_dpFechaInicio_fecha").focus();

                          //var idSalaActual = document.getElementById("ctl00_ContentPlaceHolder1_cboSala").value;                            
                          //var horaInicioActual = document.getElementById("ctl00_ContentPlaceHolder1_txtHoraInicio_txtHora").value
                          //var horaFinActual = document.getElementById("ctl00_ContentPlaceHolder1_txtHoraFin_txtHora").value;
                          //var fecha = document.getElementById("ctl00_ContentPlaceHolder1_dpFechaInicio_fecha").value;
                          //ActualizaSalaHora(fecha, idSalaActual, horaInicioActual, horaFinActual);
                        }
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

          //vaciarVariableComienzo();

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
          ActualizaSalaHora(fecha, idSala, horaInicioPrimera, horaFinSegunda);
        }


        //Pone la celda pasada por parámetro un background-color para indicar que está seleccionada
        function marcarCelda(id) {
          if (lstIds != '') {

            var colorLibre = document.getElementById("ctl00_ContentPlaceHolder1_lblLibre").style.backgroundColor;
            var colorOcupado = document.getElementById("ctl00_ContentPlaceHolder1_lblOcupado").style.backgroundColor;
            var colorSeleccionada = document.getElementById("ctl00_ContentPlaceHolder1_lblSeleccionada").style.backgroundColor;
            var colorSeleccionActual = document.getElementById("ctl00_ContentPlaceHolder1_lblSeleccionActual").style.backgroundColor;


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


            if (filaPrincipal == filaActual) {
              if (document.getElementById(idControl).style.backgroundColor == colorOcupado) { // 'red') {
                horarioNoPermitido = '1';
                vaciarVariableComienzo();
              }
              else {

                var idLabel = idControl.replace('_pnl', '_lbl');
                document.getElementById(idLabel).style.backgroundColor = colorSeleccionada; //  'blue';                    
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


          if (grid != null) {
            var colorLibre = document.getElementById("ctl00_ContentPlaceHolder1_lblLibre").style.backgroundColor;
            var colorOcupado = document.getElementById("ctl00_ContentPlaceHolder1_lblOcupado").style.backgroundColor;
            var colorSeleccionada = document.getElementById("ctl00_ContentPlaceHolder1_lblSeleccionada").style.backgroundColor;
            var colorSeleccionActual = document.getElementById("ctl00_ContentPlaceHolder1_lblSeleccionActual").style.backgroundColor;

            //recorrer todas las filas del grid
            for (var fila = 0; fila <= grid.rows.length; fila++) {
              if (fila > 1) {
                var idFila = zeroPad(fila, 10);
                var panel = document.getElementById("ctl00_ContentPlaceHolder1_grdSalas_ctl" + idFila + "_rptHora_ctl"); // + colPrincipal + "_pnl").style.backgroundColor                        
                //numCeldas está calculado dinámicamente en Prueba.aspx.cs=>CargarSalas()
                for (var filaRpt = 0; filaRpt < numCeldas; filaRpt++) {
                  var idCol = zeroPad(filaRpt, 10);
                  panel = document.getElementById("ctl00_ContentPlaceHolder1_grdSalas_ctl" + idFila + "_rptHora_ctl" + idCol + "_lbl");
                  if (panel.style.backgroundColor == colorSeleccionada) { // 'blue') {
                    panel.style.backgroundColor = colorLibre; //  'green';
                  }

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
        /*FIN DE FUNCIONES DE SELECCIÓN DE LA SALA*/


        //funcion correspondiente a si quiere guardar datos de la reserva con periodicidad que coincide con fin de semana
        function GuardarSalir() {
          __doPostBackFNC('GuardarSalir', 'GuardarSalir');
        }
        function GuardarSalirRepeticion() {
          __doPostBackFNC('GuardarSalirRepeticion', 'GuardarSalirRepeticion');
        }

  </script>




  <div class="toolbar">

    <Avalora:Toolbar ID="ToolbarEdicion" runat="server" Buscar="false" Eliminar="true" Guardar="true"
      Imprimir="false" Nuevo="false" ExportarExcel="false" Titulo="Gestión Usuario" OnSalir_Click="Salir_Click"
      OnGuardar_Click="Guardar_Click" OnEliminar_Click="Eliminar_Click" FileAyuda="GRSalas.pdf" />
  </div>
  <asp:HiddenField ID="hdnTabSeleccionado" runat="server" Value="" />

  <span class="clear">


    <span class="H3cabecera_seccion">
      <asp:Label CssClass="icon icon-application-form-edit" runat="server" ID="Label4" Text="<%$Resources:Resource, DatosReserva%>"></asp:Label>



    </span>

    <input type="hidden" runat="server" id="hiddenFecha" />
    <input type="hidden" runat="server" id="hiddenIdSala" />
    <input type="hidden" runat="server" id="hiddenHoraInicio" />
    <input type="hidden" runat="server" id="hiddenHoraFin" />


    <span class="clear">
      <div runat="server" id="divDatos">
        <span class="clear">

          <Avalora:AvaloraText ID="txtCodigo" ReadOnly="true" Enabled="false" runat="server" CssClass="input_mini float_left" Intro="true" Visible="false" />
          <Avalora:AvaloraText ID="txtIdRepeticion" ReadOnly="true" Visible="false" Enabled="false" runat="server" CssClass="input_corto float_left" Intro="true" />
          <span>
            <asp:Label ID="lblEstado" runat="server" CssClass="label_corto float_left" Text="<%$ Resources:Resource, Estado %>"></asp:Label>
          </span>
          <asp:DropDownList ID="cboEstado" Enabled="false" runat="server" CssClass="select_mini-corto float_left" AutoPostBack="false">
            <asp:ListItem Text="<%$ Resources:Resource, Pendiente %>" Value="P"></asp:ListItem>
            <asp:ListItem Text="<%$ Resources:Resource, Aceptado %>" Value="A"></asp:ListItem>
            <asp:ListItem Text="<%$ Resources:Resource, Cancelado %>" Value="C"></asp:ListItem>
          </asp:DropDownList>
          <span class="imgSala">
            <asp:Image Visible="true" Height="180px" Width="180px" CssClass="float_right" ID="foto" runat="server" ImageUrl="~/App_Themes/img/UI/imagen_no_disponible.png" />
          </span>

        </span>
        <span class="clear">
          <span class="label_corto">
            <%=rmGlobal("PeticionarioObligatorio")%>
          </span>
          <Avalora:AvaloraText ID="txtPeticionario" ReadOnly="true" Enabled="false" runat="server" MaxLength="150" CssClass="input_medio float_left" Intro="true" />
        </span>
        <span class="clear">
          <span class="label_corto">
            <%=rmGlobal("SolicitanteObligatorio")%>
          </span>
          <asp:HiddenField runat="server" ID="hdnNombreSolicitante" />
          <Avalora:AvaloraText ID="txtSolicitante" ReadOnly="true" Enabled="false" runat="server" MaxLength="150" CssClass="input_medio float_left" Intro="true" />

          <asp:Button ID="btnSolicitante" runat="server" CssClass="botonIco icon-user-add" ToolTip="<%$ Resources:Resource,ModificarSolicitante %>"
            OnClick="btnSolicitante_Click" Text="<%$ Resources:Resource, ModificarSolicitante %>" />
          <asp:Button ID="btnSolicitanteVaciar" runat="server" CssClass="botonIco icon-user-delete" ToolTip="<%$ Resources:Resource, RestaurarSolicitante%>"
            Text="<%$ Resources:Resource, RestaurarSolicitante %>"
            OnClick="btnSolicitanteVaciar_Click" />


        </span>
        <span class="clear">
          <span class="label_corto">
            <%=rmGlobal("DescripcionObligatorio")%>
          </span>
          <Avalora:AvaloraText ID="txtDescripcion" runat="server" CssClass="input_medio float_left" MaxLength="150" Intro="true" />
        </span>
        <span class="clear">
          <span class="label_corto float_left">
            <%=rmGlobal("FechaInicioObligatorio")%>
          </span>
          <Avalora:DatePicker ID="dpFechaInicio" runat="server" />
          <span>
            <asp:Label ID="lblFechaFin" runat="server" CssClass="label_mini-corto float_left" Text="<%$ Resources:Resource, FechaFinObligatorio %>"></asp:Label>
          </span>
          <Avalora:AvaloraText ID="txtFechaFin" runat="server" Enabled="false" CssClass="input_corto float_left" />



        </span>
        <span class="clear">
          <span class="label_corto float_left">
            <%=rmGlobal("HoraInicioObligatorio")%>
          </span>

          <Avalora:AvaloraHora runat="server" AutoHora="false" Enabled="true" CssClass="input_corto float_left" ID="txtHoraInicio" FormatoHora="HHMM" Intro="true"
            onkeypress="KeyHora(event)" MaxLength="5" />
          <span class="label_mini-corto float_left">
            <%=rmGlobal("HoraFinObligatorio")%>
          </span>

          <Avalora:AvaloraHora runat="server" AutoHora="false" Enabled="true" CssClass="input_corto float_left" ID="txtHoraFin" FormatoHora="HHMM" Intro="true" onkeypress="KeyHora(event)" onBlur="HoraFormat(event)" MaxLength="5" />
          <span style="vertical-align: middle">
            <asp:Label ID="lbl" runat="server" CssClass="label_largo float_right"></asp:Label>
          </span>


        </span>

      </div>
      <div id="divSalas" runat="server">

        <%--   <span class="H3cabecera_seccion float_left" style="width:100%; border-width:0px" >
                                <span class="float_left" style="vertical-align:top">
                                    <%=rmGlobal("SeleccionSala")%>                                 
                                </span>                                
                         </span>         --%>
        <span class="clear">
          <span class="label_corto">
            <%=rmGlobal("PaisObligatorio")%>
          </span>
          <asp:DropDownList ID="cboPais" runat="server"
            CssClass="select_corto float_left" AutoPostBack="true"
            OnSelectedIndexChanged="cboPais_SelectedIndexChanged">
          </asp:DropDownList>
          <span class="label_mini-corto">
            <%=rmGlobal("EdificioObligatorio")%> 
          </span>
          <asp:DropDownList ID="cboEdificio" runat="server"
            CssClass="select_corto-medio float_left" AutoPostBack="true"
            OnSelectedIndexChanged="cboEdificio_SelectedIndexChanged">
          </asp:DropDownList>
        </span>

        <span class="H3cabecera_seccion">

          <span class="clear">
            <span class="label_corto">
              <asp:Label CssClass="icon icon-arrow-join" runat="server" ID="lblFiltrarPor" Text="<%$Resources:Resource, FiltrarPor%>"></asp:Label>
            </span>
            <asp:CheckBox ID="chkVideoconferencia" runat="server" Text="<%$ Resources: Resource, Videoconferencia%>" CssClass="label_corto-medio" />
            <asp:CheckBox ID="chkAudiovisual" runat="server" Text="<%$ Resources: Resource, Audiovisual%>" CssClass="label_corto" />
            <span class="label_corto" style ="width: auto; ">
              <asp:Label CssClass="TextoVideoconferenciaAudiovisual" runat="server" ID="Label6" Text="<%$Resources:Resource, TextoVideoconferenciaAudiovisual%>"></asp:Label>.
            </span>
            <!--<span class="" style="vertical-align: middle; padding-top: 39px;color: #333;">
              TextoVideoconferenciaAudiovisual
            </span>-->
          </span>


          <span class="clear">

            <span class="label_mini">
              <asp:Label CssClass="icon icon-door" runat="server" ID="Label3" Text="<%$Resources:Resource, Sala%>"></asp:Label>
            </span>

            <asp:DropDownList ID="cboSala"
              runat="server"
              Enabled="true"
              CssClass="select_medio float_left"
              AutoPostBack="true"
              OnSelectedIndexChanged="cboSala_SelectedIndexChanged" />
             
              <asp:Label ID="lblCapacidadSala"
                  runat="server"
                  text="Capacidad:"
                   />
               <span class="label_mini">&nbsp;
                  </span>
              <asp:Label ID="lblValorCapacidadSala"
                  runat="server"
                  text=""
                   />

            <span class="label_mini float_left" style="display: none;">
              <%=rmGlobal("TZ")%>
            </span>
            <span class="label_medio float_left" style="display: none;">
              <asp:Label ID="lblZonaHoraria" runat="server" Visible="false"></asp:Label>
            </span>
            <%--   <span class="label_corto float_left"> 
                              <asp:ImageButton ID="imgAbrirSala" runat="server" ImageUrl="~/App_Themes/img/asociar.gif" 
                                ToolTip="<%$ Resources: Resource, Sala %>"  Visible="false"
                                onclick="imgAbrirSala_Click" />
                            </span>
            --%>
            <div id="divLeyenda" runat="server" visible="false">
              <span class="float_right">
                <asp:Label ID="lblLibre" Width="10px" CssClass="labelLeyenda float_left" runat="server"></asp:Label>

                <asp:Label ID="lblVerde" CssClass="label_mini-corto float_left" runat="server"><%=rmGlobal("Disponible")%></asp:Label>
                <asp:Label ID="lblOcupado" Width="10px" CssClass="labelLeyenda float_left" runat="server"></asp:Label>
                <asp:Label ID="lblRojo" CssClass="label_mini-corto float_left" runat="server"><%=rmGlobal("Ocupado")%></asp:Label>
                <asp:Label ID="lblSeleccionActual" Width="10px" CssClass="labelLeyenda float_left" runat="server"></asp:Label>
                <asp:Label ID="lblAmarillo" CssClass="label_mini-corto float_left" runat="server"><%=rmGlobal("Seleccion")%></asp:Label>
                <div style="display: none">
                  <asp:Label ID="lblSeleccionada" Width="10px" CssClass="labelLeyenda float_left" runat="server"></asp:Label>
                  <asp:Label ID="lblAzul" CssClass="label_mini-corto float_left" runat="server"><%=rmGlobal("Azul")%></asp:Label>
                </div>

              </span>
            </div>
          </span>



        </span>


        <span class="clear">



          <div style="width: 100%">
            <span class="clear">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr>
                  <td valign="top">
                    <div style="width: 15%">
                      <asp:GridView ID="grdSalasNombre" runat="server" Visible="false"
                        CellPadding="0" CellSpacing="0" BorderWidth="1"
                        AutoGenerateColumns="false">
                        <Columns>
                          <asp:TemplateField>
                            <HeaderTemplate>
                              <asp:Label ID="lblSala" CssClass="thSala" runat="server" Height="16px"><%=rmGlobal("Sala")%></asp:Label>
                            </HeaderTemplate>
                            <ItemTemplate>
                              <Avalora:AvaloraText ID="txtSala" runat="server" Height="15" ReadOnly="True" Text='<%# Bind("Descripcion") %>' />
                            </ItemTemplate>
                          </asp:TemplateField>
                        </Columns>
                      </asp:GridView>
                    </div>
                  </td>
                  <td valign="top">
                    <div id="DivSeleccionSalas" runat="server" style="width: 57%; overflow: auto" onclick="vaciarVariableComienzo();">

                      <asp:Panel ID="Panel1" runat="server" onclick="vaciarVariableComienzo();" Width="100%">
                        <asp:GridView ID="grdSalas" runat="server" Width="100%"
                          OnRowDataBound="grdSalas_RowDataBound"
                          CellPadding="0" CellSpacing="0"
                          Visible="false"
                          AutoGenerateColumns="false">
                          <Columns>
                            <asp:TemplateField Visible="true">
                              <HeaderTemplate>
                                <asp:Label ID="lblSala" Visible="false" runat="server"><%=rmGlobal("Sala")%></asp:Label>
                              </HeaderTemplate>
                              <ItemTemplate>
                                <asp:ImageButton ID="imgSeleccionar" runat="server" CommandName="Select" Visible="false"
                                  ImageUrl="~/App_Themes/img/asociar.gif"
                                  TabIndex="-1" />

                                <input type="hidden" runat="server" value='<%# Bind("Codigo") %>' id="txtIdSala" />
                                <input type="hidden" runat="server" value='<%# Bind("Solicitante") %>' id="txtSolicitante" />
                                <Avalora:AvaloraText ID="txtSala" runat="server" Visible="true" Enabled="false" ReadOnly="True" Text='<%# Bind("Descripcion") %>' />
                               
                                  <Avalora:AvaloraText ID="txtHoraIni" runat="server" ReadOnly="True" Visible="false" />
                                <Avalora:AvaloraText ID="txtMinIni" runat="server" ReadOnly="True" Visible="false" />
                                <Avalora:AvaloraText ID="txtHoraFin" runat="server" ReadOnly="True" Visible="false" />
                                <Avalora:AvaloraText ID="txtMinFin" runat="server" ReadOnly="True" Visible="false" />

                              </ItemTemplate>
                             
                            </asp:TemplateField>
                               <asp:TemplateField>
                                    <HeaderTemplate>
                                <asp:Label  cssclass="panel_horas" ID="lblSala2" Visible="true" runat="server">Cap.</asp:Label>
                              </HeaderTemplate>
                                       <ItemTemplate>
                                                  <Avalora:AvaloraText cssclass="txtCapacidad_txtTexto" width="20" ID="txtCapacidad" runat="server" Visible="true" Enabled="false" ReadOnly="True" Text='<%# Bind("Capacidad") %>' />
                   
                                     </ItemTemplate>
                               </asp:TemplateField>

                            <asp:TemplateField>
                              <HeaderTemplate>
                                <asp:DataList ID="dtlHoras" runat="server" RepeatDirection="Horizontal" CellPadding="0" CellSpacing="0"
                                  BorderStyle="Solid"
                                  HorizontalAlign="Left" BorderWidth="1" BorderColor="White">
                                  <ItemTemplate>
                                    <asp:Panel ID="pnl" runat="server">
                                      <asp:Label ID="lblHoras" runat="server" CssClass="panel_horas" Text='<%# Bind("hora") %>'></asp:Label>
                                    </asp:Panel>
                                  </ItemTemplate>
                                </asp:DataList>
                              </HeaderTemplate>
                              <ItemTemplate>
                                <asp:DataList ID="rptHora" runat="server" OnItemDataBound="rptHoras_ItemDataBound"
                                  CellSpacing="0" CellPadding="0" RepeatDirection="Horizontal" Width="100%">
                                  <ItemTemplate>
                                    <asp:Panel ID="pnl" runat="server" CssClass="panelIntervaloHoras">
                                      <asp:Label ID="lbl" runat="server" Font-Size="XX-Small" ReadOnly="true" Height="20px" Enabled="true" Visible="true" ToolTip='<%# Bind("hora") %>' Text="·" />
                                      <asp:Label ID="lblHora" runat="server" ReadOnly="false" Enabled="false" Height="20px" Visible="true" Text='<%# Bind("hora") %>' />
                                    </asp:Panel>
                                  </ItemTemplate>
                                </asp:DataList>
                              </ItemTemplate>
                            </asp:TemplateField>


                          </Columns>

                          <PagerSettings Mode="Numeric" Position="Bottom" PageButtonCount="10" />
                          <PagerStyle CssClass="data_grid_paginador" />
                        </asp:GridView>
                      </asp:Panel>
                    </div>
                  </td>
                </tr>
              </table>
            </span>
            <span class="clear"></span>
          </div>
        </span>
      </div>
      <%--/*fin div de seleccionar sala*/--%>


      <span class="clear">
        <span class="H3cabecera_seccion">
          <asp:Label CssClass="icon icon-pencil" runat="server" ID="Label5" Text="<%$Resources:Resource, Observaciones%>"></asp:Label>
        </span>
        <Avalora:AvaloraText ID="txtObservaciones" TextMode="MultiLine" Height="50" CssClass="input_multiline_largo ancho-completo" runat="server" />
      </span>


      <span class="clear">
        <div id="divPeriodicidad" runat="server">


          <span class="H3cabecera_seccion">

            <asp:Button ID="imgAgregarPeriodicidad" runat="server"
              Text="<%$ Resources: Resource, DefinirPeriodicidad%>"
              CssClass="botonIco icon-arrow-refresh float_left"
              ToolTip="<%$ Resources: Resource, AgregarPeriodicidad %>" OnClick="imgAgregarPeriodicidad_Click1" />

            <asp:Label ID="lblInformePeriodicidad" runat="server" CssClass="label_largo ancho-tres-cuartos float_left"></asp:Label>

          </span>
        </div>
      </span>


      <span class="clear">
        <div id="divRecursos" runat="server">

          <span class="H3cabecera_seccion">
            <asp:Label CssClass="icon icon-computer" runat="server" ID="Label2" Text="<%$Resources:Resource, Recursos%>"></asp:Label>
          </span>
          <span class="clear">
            <div class="data_grid">
              <span class="clear">
                <asp:GridView ID="grdRecursosSala" runat="server"
                  Width="100%"
                  OnRowDataBound="grdRecursosSala_RowDataBound"
                  OnRowDeleting="grdRecursosSala_RowDeleting"
                  AutoGenerateColumns="false">
                  <Columns>
                    <asp:TemplateField ItemStyle-Width="5%" HeaderStyle-Width="5%">
                      <HeaderTemplate>
                        <asp:ImageButton runat="server" ID="imgAddLinea"
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
                    <asp:TemplateField ItemStyle-Width="95%" HeaderStyle-Width="95%">
                      <HeaderTemplate>
                        <asp:Label ID="lblTipoRecurso" runat="server"><%=rmGlobal("TipoRecursoObligatorio")%></asp:Label>
                      </HeaderTemplate>
                      <ItemTemplate>
                        <Avalora:AvaloraText Visible="false" ID="txtIdTipoRecurso" runat="server" ReadOnly="True" Text='<%# Bind("ID_TIPO_RECURSO") %>' />
                        <asp:DropDownList ID="cboTipoRecurso" runat="server" CssClass="select_largo float_left" AutoPostBack="false">
                        </asp:DropDownList>
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
                  <PagerSettings Mode="Numeric" Position="Bottom" PageButtonCount="10" />
                  <PagerStyle CssClass="data_grid_paginador" />
                </asp:GridView>
              </span>
            </div>
            <%--FIN <div class="data_grid">--%>
          </span>
        </div>
        <%-- FIN DIV RECURSOS--%>
      </span>

      <span class="clear">
        <div id="divConvocatoria" runat="server">

          <span class="H3cabecera_seccion">
            <asp:Label CssClass="icon icon-date" runat="server" ID="Label1" Text="<%$Resources:Resource, ConvocatoriaReunion%>"></asp:Label>
          </span>
          <span class="clear">
            <div id="div1" runat="server" visible="false">
              <span class="clear">
                <input type="hidden" runat="server" id="hiddenIdConvocatoria" />
              </span>
            </div>
            <div class="data_grid">
              <span class="clear">
                <asp:GridView ID="grdAsistentes" runat="server"
                  OnRowDataBound="grdAsistentes_RowDataBound"
                  OnRowDeleting="grdAsistentes_RowDeleting"
                  Width="100%"
                  AutoGenerateColumns="false">
                  <Columns>
                    <asp:TemplateField ItemStyle-Width="5%" HeaderStyle-Width="5%">
                      <HeaderTemplate>
                        <asp:ImageButton runat="server" ID="imgAddLinea"
                          OnClick="imgAddAsistente_Click"
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
                    <asp:TemplateField ItemStyle-Width="47%" HeaderStyle-Width="47%">
                      <HeaderTemplate>
                        <asp:Label ID="lblEmail" runat="server"><%=rmGlobal("EmailAsistente")%></asp:Label>
                      </HeaderTemplate>
                      <ItemTemplate>
                        <asp:TextBox ID="txtEmail" CssClass="input_medio ancho-completo postion_relative" onfocus="this.select()" runat="server" Text='<%# Bind("EMAIL_ASISTENTE") %>' />

                      </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="47%" HeaderStyle-Width="47%">
                      <HeaderTemplate>
                        <asp:Label ID="lblNombreCompleto" runat="server"><%=rmGlobal("Nombre")%></asp:Label>
                      </HeaderTemplate>
                      <ItemTemplate>
                        <asp:TextBox ID="txtNombreCompleto" CssClass="input_medio ancho-completo postion_relative" onfocus="this.select()" runat="server" Text='<%# Bind("NOMBRE_ASISTENTE") %>' />

                      </ItemTemplate>
                    </asp:TemplateField>
                  </Columns>
                  <EmptyDataTemplate>
                    <div>
                      <asp:ImageButton ID="imgAddRegistro" runat="server" ImageUrl="~/App_Themes/img/nuevo.png"
                        OnClick="imgAddAsistente_Click" TabIndex="-1" />
                      <asp:Label ID="Label32" Width="400px" runat="server" CssClass="labelCampo" Text="<%$Resources:Resource, AnadirRegistro%>"></asp:Label>
                    </div>
                  </EmptyDataTemplate>
                  <PagerSettings Mode="Numeric" Position="Bottom" PageButtonCount="10" />
                  <PagerStyle CssClass="data_grid_paginador" />
                </asp:GridView>
              </span>

              <asp:Panel ID="Panel2" CssClass="clear" Height="200px" runat="server" BorderColor="Transparent" BorderWidth="0" BorderStyle="None">
                <div id="divBusquedaUsuarios" onmouseover="mostrar();" onmouseout="ocultar();" runat="server" style="visibility: hidden; height: 200px; position: absolute;">
                  <asp:Panel ID="pnlUsuarios" runat="server" ScrollBars="Vertical" Height="200px">
                    <ul id="lstPersonas" class="autocompletar_contenedor" runat="server">
                      <li>
                        <a onclick="alert(this.name);" style="cursor: pointer"></a>
                      </li>
                    </ul>
                  </asp:Panel>
                </div>
              </asp:Panel>


            </div>
          </span>
        </div>
        <%-- fin div convocatoria--%>
                         
                      
      </span>






    </span><%--fin span tab Datos--%>

    <div id="divHidden">
      <input type="hidden" name="__EVENTTARGET_FNC" />
      <input type="hidden" name="__EVENTARGUMENT_FNC" />
    </div>
  </span>
</asp:Content>
