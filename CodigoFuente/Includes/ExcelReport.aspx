<%@ page language="C#" autoeventwireup="true" inherits="ExcelReport, App_Web_1sw2qqip" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML>
	<HEAD>
		<title>Generador de listados con formato Excel</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1"/>
		<meta name="CODE_LANGUAGE" content="C#"/>
		<meta name="vs_defaultClientScript" content="JavaScript"/>
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5"/>
		<%--<link href="../Styles/crmtNet.css" type="text/css" rel="stylesheet"/>--%>
	</HEAD>
	<body>
		<asp:DataGrid id="grdExcelReport" style="Z-INDEX: 101" runat="server" Width="100%" >
			<HeaderStyle Font-Bold="True"></HeaderStyle>
		</asp:DataGrid>
	</body>
</HTML>
