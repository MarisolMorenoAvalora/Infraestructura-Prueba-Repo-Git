<%@ control language="C#" autoeventwireup="true" inherits="Includes_BarraProceso, App_Web_1sw2qqip" %>
<link href="../App_Themes/default/BarraProceso.css" rel="stylesheet" type="text/css" />
<link href="App_Themes/default/BarraProceso.css" rel="stylesheet" type="text/css" />

<asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanelGeneral" DisplayAfter="700"  >
    <ProgressTemplate>
        <div class="BarraProcesoFondo" style=" filter: alpha(opacity=65);"> </div>
        <div   class="BarraProcesoTexto" >cargando. . . </div>
    </ProgressTemplate>
    
</asp:UpdateProgress>