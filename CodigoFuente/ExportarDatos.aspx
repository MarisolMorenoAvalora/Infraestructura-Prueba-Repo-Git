<%@ page language="C#" autoeventwireup="true" inherits="ExportarDatos, App_Web_imuq2iyt" masterpagefile="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="toolbar">
        <Avalora:Toolbar ID="ToolbarBusqueda" runat="server" Buscar="false" Eliminar="false" Guardar="false"
            Imprimir="false" Nuevo="false" NuevaReserva="false" ExportarExcel="true" Titulo="Búsqueda de Usuarios" 
            OnSalir_Click="Salir_Click" OnExcel_Click="Excel_Click" FileAyuda="GRSalas.pdf" />
    </div>

    <span class="clear">
        <span class="clear">
            <span class="label_corto">
                <%=rmGlobal("FechaInicio")%>
            </span>
            <Avalora:DatePicker ID="dpFechaInicio" runat="server" />
            <span class="label_corto">
                <%=rmGlobal("FechaFin")%> 
            </span>
            <Avalora:DatePicker ID="dpFechaFin" runat="server" />
        </span>
    </span>

</asp:Content>

