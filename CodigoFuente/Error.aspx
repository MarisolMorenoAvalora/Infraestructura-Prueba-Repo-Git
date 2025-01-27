<%@ page language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="Error, App_Web_imuq2iyt" title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <span id="tblError" class="clear">
        <span class="clear">
            <%=rmGlobal("Error1")%><br /> <%=rmGlobal("Error2")%><br />
             <asp:Image ID="Image1" runat="server" Height="89px" ImageUrl="~/App_Themes/img/ico_error.gif"
                    Width="112px" />
        </span>
        <span class="clear">
            <br /> <%=rmGlobal("ErrorDetalle")%>
        </span>
        <span class="clear">
            <asp:Label ID="lblDescError" runat="server" CssClass="labelCampo"></asp:Label>
        </span>
    </span>

 <%--   <table id="tblError" style="width:100%;">
        <tr>
            
            <td style="width:80%; font-size: large; color: navy;" align="left">
                </td>
            <td style="width:20%" valign="middle" >
               </td>
               
        </tr>
        <tr>
            <td colspan ="2" style="font-size: medium" align="left">
                </td>
        </tr>
        <tr>
            <td colspan ="2" align="left">
                </td>
        </tr>
    </table>--%>
</asp:Content>
