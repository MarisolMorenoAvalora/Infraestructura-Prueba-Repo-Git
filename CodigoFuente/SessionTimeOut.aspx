<%@ page language="C#" masterpagefile="~/MasterPageEmpty.master" autoeventwireup="true" inherits="SessionTimeOut, App_Web_imuq2iyt" title="Error de Session" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
   
    <div>
     <span class="mensaje_alert"> 
            <%--<asp:Image ID="Image2" runat="server" Height="88px" ImageUrl="~/App_Themes/img/error.gif" Width="88px" /> --%>          

            <h3><%=rmGlobal("ErrorConexion")%></h3>

              <p><%=rmGlobal("ErrorConexion2")%></p>
             
    </span>
    <span class="label_mini float_left">&nbsp;</span>
    <span class="float_left">
                <asp:Button ID="btnConectar" runat="server" 
                            OnClick="btnConectar_Click" Text="<%$Resources:Resource, VolverConectar%>" CssClass="botonIco icon-disconnect" />
    </span>
    </div>

  
</asp:Content>
