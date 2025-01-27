<%@ control language="C#" autoeventwireup="true" inherits="Includes_Controles_AvaloraNumerico, App_Web_r5us2asm" %>

<!--<script src="../js/FormatearTextos.js" type="text/javascript"></script>-->
<script language="javascript" type="text/javascript">
    function SinIntro(e) {

        var key = window.event.keyCode;
        var obj = event.srcElement;
        var keyctrl = window.event.ctrlKey;
        switch (key) {
            case 13: //Intro
                key = 0;
                break;
            case 8: //Borrar
                key = 0;
                break;
        }
        try {
            window.event.keyCode = key;
            return 'ok';
        }
        catch (ex) {
            return 'ok';
        }
    }
</script>


<asp:TextBox ID="txtNumerico" runat="server"  ></asp:TextBox>