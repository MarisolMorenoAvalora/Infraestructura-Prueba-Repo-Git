<%@ control language="C#" autoeventwireup="true" inherits="Includes_DatePickerJQ, App_Web_1sw2qqip" %>

 <!--JMZ   <link href="App_Themes/default/jquery.ui.all.css" rel="stylesheet" type="text/css" /> -->
    <link href="App_Themes/default/jquery-ui-1.9.1.custom.css" rel="stylesheet" type="text/css" />  

    
<script type="text/javascript" language="JavaScript">


    function BorraFecha(e) {
        debugger;
        var key = window.event.keyCode;
        var obj = event.srcElement;
        switch (key) {
            case 8: case 46: //BackSpace, Supr
                obj.value = '';
                key = 0;
                break;
            default:
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



    function KeyFecha(e) {
        
        var key = window.event.keyCode;
        var obj = event.srcElement;
        switch (key) {
            case 13: //Intro
                key = 9;
                break;
            case 9: case 47: case 48: case 49: case 50: case 51: case 52: case 53: case 54: case 55: case 56: case 57:

                break;

            case 8: case 46: //BackSpace, Supr
                //obj.value='';
                //key=0;
                break;

                break;
            default:
                key = 0;
        }
        try {
            window.event.keyCode = key;
            return 'ok';
        }
        catch (ex) {
            return 'ok';
        }
    }

    function KeyFecha(e,autoFecha) {
      
        
        var key = window.event.keyCode;
        var obj = event.srcElement;
        switch (key) {
            case 13: //Intro
                //En caso de que el control tenga la propiedad autoFecha=true y no tenga valor y haya dado a intro
              //se rellena la fecha de hoy automáticamente
                if (obj.value == '' && autoFecha == true)
                    RellenaAutoFecha(e);
                key = 9;
                break;
            case 9: case 47: case 48: case 49: case 50: case 51: case 52: case 53: case 54: case 55: case 56: case 57:

                break;

            case 8: case 46: //BackSpace, Supr
                //obj.value='';
                //key=0;
                break;

                break;
            default:
                key = 0;
        }
        try {
            window.event.keyCode = key;
            return 'ok';
        }
        catch (ex) {
            return 'ok';
        }
    }


    
    function RellenaAutoFecha(e) {
       
        var obj = event.srcElement;
        
        var fechaActual = new Date();

        var mMonth = fechaActual.getMonth() + 1;
        var mDay = fechaActual.getDate();
        var mYear = fechaActual.getFullYear();

        var fecha;
        fecha = mDay + "/" + mMonth + "/" + mYear;       
        obj.value = fecha;
        DateFormat(e);
        return true;
    }




    function DateFormat(e) {

        
        var vdateType = 1; // vDateType
        //       1 = dd/mm/yyyy
        //       2 = mm/dd/yyyy
        var obj = event.srcElement;
        var dateValue = obj.value;
        var strSeparador = '/';
        var vDateValueCheck;
                
        switch (dateValue.length) {
            case 0:
                obj.value = '';
                //vDateValueCheck = "15/15/15";                
                break;
            case 5:
                obj.value = '';
                vDateValueCheck = "15/15/15";
                
                break;
            case 6: //ddmmyy or d/m/yy

                //COMPROBAR EL FORMATO DE FECHA. Comprobamos ddmmyy y d/d/yy

                // D/M/YY
                if (dateValue.substr(1, 1) == '/' && dateValue.substr(3, 1) == '/') {

                    if (formatoFechaDTPicker == 'MM/dd/yyyy') { // mm/dd/yyyy
                        var mMonth = "0" + dateValue.substr(0, 1);
                        var mDay = "0" + dateValue.substr(2, 1);
                        var mYear = dateValue.substr(4, 2);
                    }

                    if (formatoFechaDTPicker == 'dd/MM/yyyy') { // dd/mm/yyyy
                        var mDay = "0" + dateValue.substr(0, 1);
                        var mMonth = "0" + dateValue.substr(2, 1);
                        var mYear = dateValue.substr(4, 2);
                    }

                }
                else {


                    if (formatoFechaDTPicker == 'MM/dd/yyyy') { // mm/dd/yyyy
                        var mMonth = dateValue.substr(0, 2);
                        var mDay = dateValue.substr(2, 2);
                        var mYear = dateValue.substr(4, 2);
                    }

                    if (formatoFechaDTPicker == 'dd/MM/yyyy') { // dd/mm/yyyy
                        var mDay = dateValue.substr(0, 2);
                        var mMonth = dateValue.substr(2, 2);
                        var mYear = dateValue.substr(4, 2);
                    }
                }
                var mToday = new Date();
                //If the year is greater than 30 years from now use 19, otherwise use 20
                var checkYear = mToday.getFullYear() + 30;
                var mCheckYear = '20' + mYear;
                if (mCheckYear >= checkYear) {
                    mYear = '19' + mYear
                }
                else {
                    mYear = '20' + mYear;
                }
                vDateValueCheck = mMonth + strSeparador + mDay + strSeparador + mYear;
                break;
            case 8: //ddmmyyyy OR dd/mm/yy

                //dd/mm/yy
                if (dateValue.substr(2, 1) == '/') {
                    if (formatoFechaDTPicker == 'MM/dd/yyyy') { // mm/dd/yyyy
                        var mMonth = dateValue.substr(0, 2);
                        var mDay = dateValue.substr(3, 2);
                        var mYear = dateValue.substr(6, 2);
                    }

                    if (formatoFechaDTPicker == 'dd/MM/yyyy') { // dd/mm/yyyy
                        var mDay = dateValue.substr(0, 2);
                        var mMonth = dateValue.substr(3, 2);
                        var mYear = dateValue.substr(6, 2);
                    }
                }
                else {
                    //ddmmyy
                    if (formatoFechaDTPicker == 'MM/dd/yyyy') { // mm/dd/yyyy
                        var mMonth = dateValue.substr(0, 2);
                        var mDay = dateValue.substr(2, 2);
                        var mYear = dateValue.substr(4, 4);
                    }

                    if (formatoFechaDTPicker == 'dd/MM/yyyy') { // dd/mm/yyyy
                        var mDay = dateValue.substr(0, 2);
                        var mMonth = dateValue.substr(2, 2);
                        var mYear = dateValue.substr(4, 4);
                    }
                }


                

                vDateValueCheck = mMonth + strSeparador + mDay + strSeparador + mYear;
                break;
            case 9: //dmmyyyy
                
                if (formatoFechaDTPicker == 'MM/dd/yyyy') { // m/dd/yyyy or mm/d/yyyy

                    //Si al hacer un substr de los dos primeros dígitos tiene un / entonces es m/dd/yyyy
                    if (dateValue.substr(0, 2).split("/").length > 1) {
                        var mMonth = "0" + dateValue.substr(0, 1);
                        var mDay = dateValue.substr(2, 2);
                        var mYear = dateValue.substr(5, 4);
                    }
                    else { //mm/d/yyyy
                        var mMonth = dateValue.substr(0, 2);
                        var mDay = "0" + dateValue.substr(3, 1);
                        var mYear = dateValue.substr(5, 4);
                    }


                }
                else
                { // d/mm/yyyy
                    var mDay = "0" + dateValue.substr(0, 1);
                    var mMonth = dateValue.substr(2, 2);
                    var mYear = dateValue.substr(4, 4);
                }

                vDateValueCheck = mMonth + strSeparador + mDay + strSeparador + mYear;
                break;
          
            case 10: //dd/mm/yyyy
                if (formatoFechaDTPicker == 'MM/dd/yyyy') { // mm/dd/yyyy
                    var mMonth = dateValue.substr(0, 2);
                    var mDay = dateValue.substr(3, 2);
                    var mYear = dateValue.substr(6, 4);
                }

                if (formatoFechaDTPicker == 'dd/MM/yyyy') { // dd/mm/yyyy
                    var mDay = dateValue.substr(0, 2);
                    var mMonth = dateValue.substr(3, 2);
                    var mYear = dateValue.substr(6, 4);
                }
                vDateValueCheck = mMonth + strSeparador + mDay + strSeparador + mYear;
                break;
            default:
                vDateValueCheck = "15/15/15";
                obj.value = "";
                obj.focus();
                //obj.select();                
                break;
        }
        if (dateValue != "")
        {
          if (!dateValid(vDateValueCheck))
          {
            obj.value = "";
            obj.focus();
            obj.select();
            var error = '<%=Resources.Resource.IntroducirFechaValida %>';
            error += '  ' + formatoFechaDTPicker;
            alert(error);
            return false;
          }
          else {
            if (formatoFechaDTPicker == 'MM/dd/yyyy') { // mm/dd/yyyy
              obj.value = mMonth + strSeparador + mDay + strSeparador + mYear;
              return true;
            }
            if (formatoFechaDTPicker == 'dd/MM/yyyy') { // dd/mm/yyyy
              obj.value = mDay + strSeparador + mMonth + strSeparador + mYear;
              return true;
            }
          }
        }
    }

    function dateValid(objName) {

        
        var strDate;
        var strDateArray;
        var strDay;
        var strMonth;
        var strYear;
        var intday;
        var intMonth;
        var intYear;
        var booFound = false;
        var datefield = objName;
        var strSeparatorArray = new Array("-", " ", "/", ".");
        var intElementNr;
        // var err = 0;
        var strMonthArray = new Array(12);
        strMonthArray[0] = "Jan";
        strMonthArray[1] = "Feb";
        strMonthArray[2] = "Mar";
        strMonthArray[3] = "Apr";
        strMonthArray[4] = "May";
        strMonthArray[5] = "Jun";
        strMonthArray[6] = "Jul";
        strMonthArray[7] = "Aug";
        strMonthArray[8] = "Sep";
        strMonthArray[9] = "Oct";
        strMonthArray[10] = "Nov";
        strMonthArray[11] = "Dec";

        //strDate = datefield.value;
        strDate = objName;

        if (strDate.length < 1) {
            return true;
        }
        for (intElementNr = 0; intElementNr < strSeparatorArray.length; intElementNr++) {
            if (strDate.indexOf(strSeparatorArray[intElementNr]) != -1) {
                strDateArray = strDate.split(strSeparatorArray[intElementNr]);
                if (strDateArray.length != 3) {
                    err = 1;
                    return false;
                }
                else {
                    strDay = strDateArray[0];
                    strMonth = strDateArray[1];
                    strYear = strDateArray[2];
                }
                booFound = true;
            }
        }
        if (booFound == false) {
            if (strDate.length > 5) {
                strDay = strDate.substr(0, 2);
                strMonth = strDate.substr(2, 2);
                strYear = strDate.substr(4);
            }
        }
        //Adjustment for short years entered
        if (strYear.length == 2) {
            strYear = '20' + strYear;
        }
        strTemp = strDay;
        strDay = strMonth;
        strMonth = strTemp;
        intday = parseInt(strDay, 10);
        if (isNaN(intday)) {
            err = 2;
            return false;
        }

        intMonth = parseInt(strMonth, 10);
        if (isNaN(intMonth)) {
            for (i = 0; i < 12; i++) {
                if (strMonth.toUpperCase() == strMonthArray[i].toUpperCase()) {
                    intMonth = i + 1;
                    strMonth = strMonthArray[i];
                    i = 12;
                }
            }
            if (isNaN(intMonth)) {
                err = 3;
                return false;
            }
        }
        intYear = parseInt(strYear, 10);
        if (isNaN(intYear)) {
            err = 4;
            return false;
        }
        if (intMonth > 12 || intMonth < 1) {
            err = 5;
            return false;
        }
        if ((intMonth == 1 || intMonth == 3 || intMonth == 5 || intMonth == 7 || intMonth == 8 || intMonth == 10 || intMonth == 12) && (intday > 31 || intday < 1)) {
            err = 6;
            return false;
        }
        if ((intMonth == 4 || intMonth == 6 || intMonth == 9 || intMonth == 11) && (intday > 30 || intday < 1)) {
            err = 7;
            return false;
        }
        if (intMonth == 2) {
            if (intday < 1) {
                err = 8;
                return false;
            }
            if (LeapYear(intYear) == true) {
                if (intday > 29) {
                    err = 9;
                    return false;
                }
            }
            else {
                if (intday > 28) {
                    err = 10;
                    return false;
                }
            }

        }
        //comprobar si el ao es mayor que el rango m�nimo 1800
        if (ComprobarFecha(strYear) == false)
        { return false; }
        return true;
    }

    function LeapYear(intYear) {

        if (intYear % 100 == 0) {
            if (intYear % 400 == 0) {
                return true;
            }
        }
        else {
            if ((intYear % 4) == 0) {
                return true;
            }
        }
        return false;
    }
    function ComprobarFecha(Anio) {
        if (Anio < 1800) {
            return false;
        }
        else {
            return true;
        }
    }

</script>
 
 

 <asp:TextBox id="fecha" runat="server" onblur ="DateFormat(event);" CssClass="input_fecha float_left"  />            


<style type="text/css">
        
       .ui-datepicker-trigger
        {
            float: left;
            margin: 2px 3px;
            padding: 3px 0;
            border: none;
        }
    </style>
    

     
     
     
<script type="text/javascript">

    
    $(document).ready(function() { $.getScript('<%=RegionalScript%>', CreateJQCalendar); });
    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(CreateJQCalendar);
     function CreateJQCalendar() {         
         var idioma = '<%=Session["IDIOMA"].ToString() %>';
         idioma = idioma.split('-')[0];
         $('.input_fecha').datepicker(
            {
                showOn: 'button',                
                buttonImage: 'App_Themes/img/ico_date_picker.gif',// 'Images/ico_date_picker.gif',
                buttonImageOnly: true,
                changeMonth: true,
                css: 'ico_date_picker',
                changeYear: true
            });
         $.datepicker.regional[idioma];
     }
     


</script>

