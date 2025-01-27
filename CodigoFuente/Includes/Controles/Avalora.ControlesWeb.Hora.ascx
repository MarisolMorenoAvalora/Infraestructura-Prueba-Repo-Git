<%@ control language="C#" autoeventwireup="true" inherits="Includes_Controles_AvaloraHora, App_Web_r5us2asm" %>

<!--<script src="../js/FormatearTextos.js" type="text/javascript"></script>-->
<%--<script type="text/javascript">    history.forward();</script>--%>
<script language="javascript" type="text/javascript">
    
    var textboxes = $("input.data-entry");
    $(textboxes).keydown(checkForEnter);

    function checkForEnter(event) {
        if (event.keyCode == 13) {
            alert('yuju');
        }
    }


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

    function Seleccionar(control) {
        if (control.value != '')
            control.select();
    }
   
</script>


<asp:TextBox ID="txtHora" runat="server"  ></asp:TextBox>