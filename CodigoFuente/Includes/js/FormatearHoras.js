// JScript File
function KeyHora(e){

      var key = window.event.keyCode;

      var obj = event.srcElement;

      switch (key) {

            case 13 : //Intro

                  key=9;

                  break;

            case 48: case 49: case 50: case 51: case 52: case 53: case 54: case 55: case 56: case 57: case 58: 

                  

            break;

            

            case 8 : //BackSpace

            

            break;

            default :

                  key=0;

      }

      
      try{
	    window.event.keyCode = key;
	    return 'ok';
	  }
	  catch (ex)
	  {
	     return 'ok';
	  }

}                 

 

function AutoHora(e){

      var obj = event.srcElement;

      var key = window.event.keyCode;

      var horaValue=obj.value;
      
      

      if (horaValue.length==0 && key==13){

            var vHora= new Date();

            var mMinutos=vHora.getMinutes();

            var mSegundos=vHora.getSeconds(); 

        var mHora = vHora.getHours();

        mHora=(mHora<10)? "0"+mHora:mHora;

            mMinutos=(mMinutos<10)? "0"+mMinutos:mMinutos;

        obj.value = mHora + ":" + mMinutos;

        return true;

      }

}

 

function HoraFormat(e){

       
      var obj = event.srcElement;

      var horaValue=obj.value;

      var vHoraValueCheck;

     

      switch (horaValue.length){

            case 0:

                  obj.value = '';

                  return true;

                  break;

              case 1:
                  var mHoras;
                  if (horaValue.substr(0, 1) == ":") {
                      obj.value = '';
                      return true;
                      
                  }
                  else {
                      mHoras = "0" + horaValue.substr(0, 1);
                  }
                  var mMinutos = "00"

                  vHoraValueCheck = mHoras + ":" + mMinutos;

                  break;

              case 2:
                  var mHoras;
                  var dig1 = horaValue.substr(0, 1);
                  var dig2 = horaValue.substr(1, 1);
                  if (dig1 == ":") { //si el primer dígito es ":" limpiamos
                      obj.value = '';
                      return true;
                  }
                  if (dig2 == ":") {
                      mHoras = "0" + dig1;
                  }
                  else {
                      mHoras = horaValue.substr(0, 2);
                  }

                  var mMinutos = "00"

                  vHoraValueCheck = mHoras + ":" + mMinutos;

                  break;
              case 3:
                  var dig1 = horaValue.substr(0, 1);
                  var dig2 = horaValue.substr(1, 1);
                  var dig3 = horaValue.substr(2, 1);
                  var mMinutos = "00"
                  //Solo en el caso de que el formato introducido sea por ejemplo "12:" pondrá así "12:00"
                  //si es así: 1:2 o :12 limpia el campo
                  if (dig1 != ":" && dig2 != ":" && dig3 == ":") {
                      var mHoras = dig1 + dig2;
                  }
                  else {
                      obj.value = '';
                      return true;
                  }
                  vHoraValueCheck = mHoras + ":" + mMinutos;
                  break;

              case 4:
                  var dig1 = horaValue.substr(0, 1);
                  var dig2 = horaValue.substr(1, 1);
                  var dig3 = horaValue.substr(2, 1);
                  var dig4 = horaValue.substr(3, 1);
                  //si en los cuatro dígitos hay alguno que tiene ":" se limpia el campo
                  if (dig1 == ":" || dig2 == ":" || dig3 == ":" || dig4 == ":") {
                      obj.value = '';
                      return true;
                  }
                  var mHoras = horaValue.substr(0, 2);

                  var mMinutos = horaValue.substr(2, 2);

                  vHoraValueCheck = mHoras + ":" + mMinutos;

                  break;

              case 5:
                  var dig1 = horaValue.substr(0, 1);
                  var dig2 = horaValue.substr(1, 1);
                  var dig3 = horaValue.substr(2, 1);
                  var dig4 = horaValue.substr(3, 1);
                  var dig5 = horaValue.substr(4, 1);
                  //Solo en el caso de que tenga formato de fecha, es decir: 12:45
                  //si es así :1234, 1:234, 123:3 o 1234: se limpia el campo
                  if (dig1 != ":" && dig2 != ":" && dig3 == ":" && dig4 != ":" && dig5 != ":") {
                      var mHoras = horaValue.substr(0, 2);

                      var mMinutos = horaValue.substr(3, 2);

                      vHoraValueCheck = mHoras + ":" + mMinutos;

                      break;
                  }
                  else {
                      obj.value = '';
                      return true;
                  }


              case 8: //es el caso de tener HH:MM:SS
                  var dig1 = horaValue.substr(0, 1);
                  var dig2 = horaValue.substr(1, 1);
                  var dig3 = horaValue.substr(2, 1);
                  var dig4 = horaValue.substr(3, 1);
                  var dig5 = horaValue.substr(4, 1);
                  var dig6 = horaValue.substr(5, 1);
                  var dig7 = horaValue.substr(6, 1);
                  var dig8 = horaValue.substr(7, 1);

                  //el formato correcto es HH:MM:SS
                  if (dig1 != ":" && dig2 != ":" && dig3 == ":"
                      &&
                      dig4 != ":" && dig5 != ":" && dig6 == ":"
                      &&
                      dig7 != ":" && dig8 != ":") {
                      
                      var mHoras = horaValue.substr(0, 2);
                      var mMinutos = horaValue.substr(3, 2);
                      var mSegundos = horaValue.substr(6, 2);
                      vHoraValueCheck = mHoras + ":" + mMinutos + ":" + mSegundos;

                      break;
                  }
                  else {
                      obj.value = '';
                      return true;
                  }
                   
                  break;
            default :

                  obj.value = "";

                  obj.focus();

                  obj.select();

                  return false;

                  break;  

      }

    

      if (!HoraValid(vHoraValueCheck)){

                  obj.value = "";

            obj.focus();

            obj.select();

            return false;

      }

      else{
          if (horaValue.length == 8) {
              obj.value = mHoras + ":" + mMinutos + ":" + mSegundos;
          }
          else {
              obj.value = mHoras + ":" + mMinutos;
          }
            return true;  

      }

  }


  /*
  formatoHora = Indica si es HH:MM o HH:MM:SSS
  */
  function HoraFormat(e, formatoHora) {

      
      var obj = event.srcElement;

      var horaValue = obj.value;

      var vHoraValueCheck;
      //Declaro mSegundos por defecto a "00"
      //Para evitar comprobar en cada caso del switch si el formato es HHMMSS
      var mSegundos = "00";
      //alert('jorge');
      switch (horaValue.length) {

          case 0:

              obj.value = '';
              
              return true;

              break;

          case 1:
              var mHoras;
              if (horaValue.substr(0, 1) == ":") {
                  obj.value = '';
                  alert('La hora es incorrecta');
                  return true;

              }
              else {
                  mHoras = "0" + horaValue.substr(0, 1);
              }
              var mMinutos = "00"

              vHoraValueCheck = mHoras + ":" + mMinutos;

              break;

          case 2:
              var mHoras;
              var dig1 = horaValue.substr(0, 1);
              var dig2 = horaValue.substr(1, 1);
              if (dig1 == ":") { //si el primer dígito es ":" limpiamos
                  obj.value = '';
                  alert('La hora es incorrecta');
                  return true;
              }
              if (dig2 == ":") {
                  mHoras = "0" + dig1;
              }
              else {
                  mHoras = horaValue.substr(0, 2);
              }

              var mMinutos = "00"

              vHoraValueCheck = mHoras + ":" + mMinutos;

              break;
          case 3:
              var dig1 = horaValue.substr(0, 1);
              var dig2 = horaValue.substr(1, 1);
              var dig3 = horaValue.substr(2, 1);
              var mMinutos = "00"
              //Solo en el caso de que el formato introducido sea por ejemplo "12:" pondrá así "12:00"
              //si es así: 1:2 o :12 limpia el campo
              if (dig1 != ":" && dig2 != ":" && dig3 == ":") {
                  var mHoras = dig1 + dig2;
              }
              else {
                  obj.value = '';
                  alert('La hora es incorrecta');
                  return true;
              }
              vHoraValueCheck = mHoras + ":" + mMinutos;
              break;

          case 4:
              var dig1 = horaValue.substr(0, 1);
              var dig2 = horaValue.substr(1, 1);
              var dig3 = horaValue.substr(2, 1);
              var dig4 = horaValue.substr(3, 1);
              //si en los cuatro dígitos hay alguno que tiene ":" se limpia el campo
              if (dig1 == ":" || dig2 == ":" || dig3 == ":" || dig4 == ":") {
                  obj.value = '';
                  alert('La hora es incorrecta');
                  return true;
              }
              var mHoras = horaValue.substr(0, 2);

              var mMinutos = horaValue.substr(2, 2);

              vHoraValueCheck = mHoras + ":" + mMinutos;

              break;

          case 5:
              var dig1 = horaValue.substr(0, 1);
              var dig2 = horaValue.substr(1, 1);
              var dig3 = horaValue.substr(2, 1);
              var dig4 = horaValue.substr(3, 1);
              var dig5 = horaValue.substr(4, 1);
              //Solo en el caso de que tenga formato de fecha, es decir: 12:45
              //si es así :1234, 1:234, 123:3 o 1234: se limpia el campo
              if (dig1 != ":" && dig2 != ":" && dig3 == ":" && dig4 != ":" && dig5 != ":") {
                  var mHoras = horaValue.substr(0, 2);

                  var mMinutos = horaValue.substr(3, 2);

                  vHoraValueCheck = mHoras + ":" + mMinutos;

                  break;
              }
              else {
                  obj.value = '';
                  alert('La hora es incorrecta');
                  return true;
              }


          case 8: //es el caso de tener HH:MM:SS
              var dig1 = horaValue.substr(0, 1);
              var dig2 = horaValue.substr(1, 1);
              var dig3 = horaValue.substr(2, 1);
              var dig4 = horaValue.substr(3, 1);
              var dig5 = horaValue.substr(4, 1);
              var dig6 = horaValue.substr(5, 1);
              var dig7 = horaValue.substr(6, 1);
              var dig8 = horaValue.substr(7, 1);

              //el formato correcto es HH:MM:SS
              if (dig1 != ":" && dig2 != ":" && dig3 == ":"
                      &&
                      dig4 != ":" && dig5 != ":" && dig6 == ":"
                      &&
                      dig7 != ":" && dig8 != ":") {

                  var mHoras = horaValue.substr(0, 2);
                  var mMinutos = horaValue.substr(3, 2);
                  mSegundos = horaValue.substr(6, 2);
                  vHoraValueCheck = mHoras + ":" + mMinutos + ":" + mSegundos;

                  break;
              }
              else {
                  obj.value = '';
                  alert('La hora es incorrecta');
                  return true;
              }

              break;
          default:

              obj.value = "";

              obj.focus();

              obj.select();
              alert('La hora es incorrecta');
              return false;

              break;

      }

      

      //if (!HoraValid(vHoraValueCheck)) {
      if (!HoraValid(vHoraValueCheck,formatoHora)) {
          obj.value = "";
          alert('La hora es incorrecta');
          obj.focus();

          obj.select();

          return false;

      }

      else {
          if (horaValue.length == 8 || (formatoHora == "HHMMSS" || formatoHora == "hhmmss")) {
              obj.value = mHoras + ":" + mMinutos + ":" + mSegundos;
          }
          else {                              
              obj.value = mHoras + ":" + mMinutos;
          }
          return true;

      }

  }

 

function HoraValid(value){

      var strHora;

      var strHoras;

      var strMinutos;

      var strSegundos;

      var intHoras;

      var intMinutos;

      var intSegundos;

       
      strHora=value;

      if (strHora.length < 1){
          //alert('La hora es incorrecta');
            return true;

            

      }
      //si no es HH:MM o HH:MM:SS=> formato erroneo
      if (strHora.length !=5 && strHora.length != 8){
          //alert('La hora es incorrecta');
            return false;

        }

        
        
        

      strHoras=value.substr(0, 2);

      strMinutos = value.substr(3, 2);

      intHoras=parseInt(strHoras,10);

      if (isNaN(intHoras)) {

         // alert('La hora es incorrecta');
            return false;

      }

      intMinutos=parseInt(strMinutos,10);

      if (isNaN(intMinutos)) {

          //alert('La hora es incorrecta');
            return false;

      }

      if (intHoras>23){
          //alert('La hora es incorrecta');
            return false;

      }

      if (intMinutos>59){
          //alert('La hora es incorrecta');
            return false;

        }

        //FORMATO HH:MM:SS
        if (strHora.length == 8) {
            strSegundos = value.substr(6, 2);
            intSegundos = parseInt(strSegundos, 10);
            if (intSegundos > 59) {
                alert('La hora es incorrecta');
                return false;

            }   
            
        }
      

      return true;

  }

    /*
    formatoHora => indica si es HH:MM o HH:MM:SS
    */
  function HoraValid(value, formatoHora) {

      var strHora;

      var strHoras;

      var strMinutos;

      var strSegundos;

      var intHoras;

      var intMinutos;

      var intSegundos;


      strHora = value;

      if (strHora.length < 1) {
          alert('La hora es incorrecta');
          return true;



      }
      //si no es HH:MM o HH:MM:SS=> formato erroneo
      if (strHora.length != 5 && strHora.length != 8) {
          //alert('La hora es incorrecta');
          return false;

      }

        



      strHoras = value.substr(0, 2);

      strMinutos = value.substr(3, 2);

      intHoras = parseInt(strHoras, 10);

      if (isNaN(intHoras)) {
          //alert('La hora es incorrecta');
          return false;

      }

      intMinutos = parseInt(strMinutos, 10);

      if (isNaN(intMinutos)) {
          //alert('La hora es incorrecta');
          return false;

      }

      if (intHoras > 23) {
         // alert('La hora es incorrecta');
          return false;

      }

      if (intMinutos > 59) {
          //alert('La hora es incorrecta');
          return false;

      }

      //FORMATO HH:MM:SS
      if (strHora.length == 8) {
          strSegundos = value.substr(6, 2);
          intSegundos = parseInt(strSegundos, 10);
          if (intSegundos > 59) {
              //alert('La hora es incorrecta');
              return false;

          }
      }
      else //si es HH:MM:SS pero solo introdujo 5 dígitos
      {
          if (formatoHora == "hhmmss" || formatoHora == "HHMMSS") {
              strSegundos = "00";
              intSegundos = 00;
          }
      }


      return true;

  }




   function FechaActual() {
            
            var fecha = new Date();
            var mMonth = fecha.getMonth() + 1;
            var mDay = fecha.getDate();
            var mYear = fecha.getFullYear();
            var strFecha = "";
            var mDaySimple = mDay;
            var mMonthSimple = mMonth;
            if (mDay < 10) mDay = "0" + mDay;
            if (mMonth < 10) mMonth = "0" + mMonth;

              switch (formatoFechaDTPicker){
                
                case 'MM/dd/yyyy' : 
                     strFecha = mMonth + "/" + mDay + "/" + mYear;
                     break;
                
                case 'dd/MM/yyyy' :
                    strFecha = mDay   + "/" + mMonth + "/" + mYear;
                    break;
                case 'd/m/yyyy' :
                    strFecha = mDaySimple + "/" + mMonthSimple + "/" + mYear;
                    break;
                    
                case 'm/d/yyyy' :
                    strFecha = mMonthSimple  + "/" + mDaySimple  + "/" + mYear;
                    break;
                default:
                    strFecha = mDay   + "/" + mMonth + "/" + mYear;
                    break;
                
            }
            return strFecha;

        }