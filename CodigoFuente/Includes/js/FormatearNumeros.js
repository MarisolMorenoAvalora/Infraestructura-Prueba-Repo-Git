function FormatearConMiles(nStr)
{
	nStr += '';
	x = nStr.split(formatoDecimal);
	x1 = x[0];
	x2 = x.length > 1 ? formatoDecimal + x[1] : '';
	var rgx = /(\d+)(\d{3})/;
	while (rgx.test(x1)) {
	    x1 = x1.replace(rgx, '$1' + formatoSeparadorMiles + '$2');
	}
	return x1 + x2;
}

function FormatearSinMiles(nStr)
{
	nStr += '';
	x = nStr.split(formatoDecimal);
	x1 = x[0];
	x2 = x.length > 1 ? formatoDecimal + x[1] : '';
	return x1 + x2;
}

function SinMiles(obj) 
{
    var strNumero;
    var Numero;
    strNumero = obj.value;
    var re = new RegExp("[" + formatoSeparadorMiles + "]", 'g');
    strNumero = strNumero.replace(re, "");
    obj.value=strNumero;
}

function Redondea(Num, numDec, Miles)
{
	var strNumero;
	var Numero;
	strNumero=Num;
	if (strNumero.length < 1)
	{
		return 0;
    }
    var re = new RegExp("[" + formatoSeparadorMiles + "]", 'g');
    strNumero = strNumero.replace(re, "");
	Numero = Number(strNumero.replace(formatoDecimal, "."));
	if (isNaN(Numero))
	{
		return 0;
	}
	if (isNaN(numDec)) 
	{
		return 0;
	}
	if (numDec!=null)
	{
		if (numDec > 0){ 
			var intCeros;
			var intCerosAux=1;
			for (intCeros=1; intCeros<=numDec; intCeros++){
				intCerosAux=intCerosAux*10;
			}
			Numero=Numero*intCerosAux;
			Numero=Math.round(Numero);
			Numero=Numero/intCerosAux;
			strNumero = Numero.toString();
			var len=strNumero.length;
			var posComa=strNumero.indexOf(".");
			if (((len-(posComa+1)) < numDec) && posComa > 0){
				for (inte=(len-(posComa+1)); inte<numDec; inte++){
					strNumero = strNumero+"0"
				}
			}
			if (posComa==-1){
				strNumero = strNumero+"."
				for (inte=1; inte<=numDec; inte++){
					strNumero = strNumero+"0"
				}			
			}
		}
		else
		{
			Numero=Math.round(Numero);
			strNumero = Numero.toString();
		}
		//return Number(strNumero);
		
		strNumero = strNumero.replace(".", formatoDecimal);
		if (Miles != null) 
		{
		    strNumero = FormatearConMiles(strNumero);
		}
		return strNumero;	
	}
}

function Format(obj,numDec, Miles){
	var strNumero;
	var Numero;
	strNumero=obj.value;
	if (strNumero.length < 1){
	    obj.value = "0";
	    Format(obj,numDec);
		return true;
	}
	//Numero=Number(strNumero);
	//var re = new RegExp("[" + formatoSeparadorMiles + "]", 'g');
	//strNumero = strNumero.replace(re, "");
	Numero = Number(strNumero.replace(formatoDecimal, "."));
	if (isNaN(Numero)) {
		obj.value = "0";
		Format(obj,numDec);
	    //obj.focus();
        //obj.select();
		return false;
	}
	if (numDec!=null){
		if (numDec > 0){ 
			var intCeros;
			var intCerosAux=1;
			for (intCeros=1; intCeros<=numDec; intCeros++){
				intCerosAux=intCerosAux*10;
			}
			Numero=Numero*intCerosAux;
			Numero=Math.round(Numero);
			Numero=Numero/intCerosAux;
			strNumero = Numero.toString();
			var len=strNumero.length;
			var posComa=strNumero.indexOf(".");
			if (((len-(posComa+1)) < numDec) && posComa > 0){
				for (inte=(len-(posComa+1)); inte<numDec; inte++){
					strNumero = strNumero+"0"
				}
			}
			if (posComa==-1){
				strNumero = strNumero+"."
				for (inte=1; inte<=numDec; inte++){
					strNumero = strNumero+"0"
				}
				
			}
		}
		else{
			Numero=Math.round(Numero);
			strNumero = Numero.toString();
		}
		strNumero = strNumero.replace(".", formatoDecimal);
		if (Miles != null) {
		    strNumero = FormatearConMiles(strNumero);
		}
		obj.value=strNumero;
		//obj.value = Numero.toString();
		
	}
	return true;
}
function NumeroFormat(e,numDec,Miles)
{

	var obj = event.srcElement; // : e.target;
	var strNumero;
	var Numero;
	strNumero = obj.value;
	var re = new RegExp("[" + formatoSeparadorMiles + "]", 'g');
	strNumero = strNumero.replace(re, "");
	strNumero = strNumero.replace(formatoDecimal, ".");
	if (strNumero.length < 1)
	{   
	    obj.value = "0";
	    Format(obj,numDec);
		return true;
	}
	Numero = Number(strNumero.replace(formatoDecimal, "."));
	
	if (isNaN(Numero)) 
	{
	    obj.value = "0";
	    Format(obj,numDec);
		obj.focus();
    	obj.select();
		return false;
	}
	if (numDec!=null)
	{
		if (numDec > 0)
		{ 
			var intCeros;
			var intCerosAux=1;
			for (intCeros=1; intCeros<=numDec; intCeros++)
			{
				intCerosAux=intCerosAux*10;
			}
			Numero=Numero*intCerosAux;
			Numero=Math.round(Numero);
			Numero=Numero/intCerosAux;
			strNumero=Numero.toString();
			var len=strNumero.length;
			
			var posComa=strNumero.indexOf(".");
			if (((len-(posComa+1)) < numDec) && posComa > 0)
			{
				for (inte=(len-(posComa+1)); inte<numDec; inte++)
				{
					strNumero = strNumero+"0"
				}
			}
			if (posComa==-1)
			{
				strNumero = strNumero+"."
				for (inte=1; inte<=numDec; inte++)
				{
					strNumero = strNumero+"0"
				}				
			}
		}
		else
		{
			Numero=Math.round(Numero);
			strNumero = Numero.toString();
		}
        
		strNumero = strNumero.replace(".", formatoDecimal);
		if (Miles != null) {
		    if (Miles == true)
		        strNumero = FormatearConMiles(strNumero);
		}
		obj.value=strNumero;
		//obj.value = Numero.toString();
		
	}
	return true;
}


function NumeroFormatBusqueda(e, numDec, Miles) {

    var obj = event.srcElement; // : e.target;
    var strNumero;    
    strNumero = obj.value;
    if (strNumero != '')
        NumeroFormat(e, numDec, Miles);
}

function Autocero() {

    var obj = event.srcElement; // : e.target;
    if (obj.value == '')
        obj.value = "0";
    
}


function ControlarPorCiento(event) {
  
   var obj = event.srcElement;
   var strNumero;
   strNumero = obj.value; 
   var x = parseFloat(strNumero);
   if (isNaN(x) || x < 0 || x > 100) {
       // fuera de rango
       obj.value='';
   }
   return true;
  
}

		

function GetValorNum(nStr)
{
	var Cad='';
	
	for(var i=0;i<nStr.length;i++)
	{	
		if(nStr.substring(i,i+1)!='.')
		{
			if(nStr.substring(i,i+1)==',')
				Cad+=".";
			else
				Cad+=nStr.substring(i,i+1);
		}
	}
	return Cad;
}

//-------------------------------------------------------------------------------------------------------------------
void function CheckNumeric(me, is_positive, is_decimal, decimal_digits){
	var actualValue = me.value;
	var bOk=true;
	if ( bOk && (window.event.keyCode == 32)) bOk=false;
	if ( bOk && 
		( isNaN(String.fromCharCode(window.event.keyCode)) || 
		( !isNaN(String.fromCharCode(window.event.keyCode)) && window.event.shiftKey ) ) &&  
		!isNumericPad(window.event.keyCode) && 
		!isEditKey(window.event.keyCode) && 
		!isMovingKey(window.event.keyCode)) 
		{
			//if (! is_date){
				bOk = isPositive(me, window.event.keyCode, !is_positive);
				bOk = (bOk || isAuthorizedChar(window.event.keyCode, 188, ',', actualValue, is_decimal));
			//}else{
				// bOk = (bOk  && ( isDate(window.event.keyCode, '189', is_date) || isDate(window.event.keyCode, '109', is_date)) );
			//}
		}//else
		if (bOk && !isEditKey(window.event.keyCode) && !isMovingKey(window.event.keyCode)) 
			bOk = isDecimalCompleted(me, decimal_digits);
	window.event.returnValue=bOk;
}

//-------------------------------------------------------------------------------------------------------------------

function isDecimalCompleted(me, num_digits){
	if (num_digits == -1) return true;
	
	var myValue = me.value;
	var pos = myValue.indexOf(',');
	if (pos != -1){
		myValue = myValue.substring(pos);
		if (myValue.length == (num_digits + 1))
			return false;
	}
	return true;
}

//-------------------------------------------------------------------------------------------------------------------

function isPositive(me, myCharCode, myBoolean){
	if (myBoolean){
		var myValue = me.value;
		if ((myCharCode == 189) || (myCharCode == 109)){
			if (myValue.indexOf('-') == -1 )
				me.value = '-' + myValue;
			else if (myValue.indexOf('-') != -1)
				me.value = '-' + myValue.substring(1);
			return false;
		}
	}
	return false;
}

//-------------------------------------------------------------------------------------------------------------------

void function VerifyNumericData(me){
if (me.value.length == 0) return;
if ( ((me.value.length == 1) && 
		((me.value.indexOf('-') != -1) || (me.value.indexOf(',') != -1)) )
	 || ((me.value.length == 2) && 
		((me.value.indexOf('-')!= 1) && (me.value.indexOf(',') != -1)) ) )
			me.value = '';
}

//-------------------------------------------------------------------------------------------------------------------

function isAuthorizedChar(myCharCode, findCharCode, myCharValue, myValue, myBoolean){
	if (myBoolean){
		if (window.event.keyCode == findCharCode && myValue.indexOf(myCharValue) == -1 )
			return true;
		return false;
	}else return false;
}

//-------------------------------------------------------------------------------------------------------------------

function isNumericPad(myCharCode){
		return ( (myCharCode >= 96 && myCharCode <= 105) || ( myCharCode==12 || myCharCode==45 || (myCharCode >=33 && myCharCode <= 40) ) )
}

//-------------------------------------------------------------------------------------------------------------------

function isEditKey(myCharCode){
		return (myCharCode == 8 || myCharCode == 46 || myCharCode == 9)
}

//-------------------------------------------------------------------------------------------------------------------

function isMovingKey(myCharCode){
		return (myCharCode == 37 || myCharCode == 39 || myCharCode == 35 || myCharCode == 36)
}

//-------------------------------------------------------------------------------------------------------------------

void function FieldDataRequired(ctrl, isValid, bkColor, reqBkCol){
	if (isValid && ctrl.value.length == 0){
		ctrl.style.backgroundColor = ((reqBkCol != '') ? reqBkCol : DEFAULT_TXT_BK_COLOR_REQUIRED);
	}else  { //Forecolor		
		ctrl.style.backgroundColor = bkColor;
	}
}

//-------------------------------------------------------------------------------------------------------------------

function MaxCharCounter(field, maxlimit) {
  if (field.value.length > maxlimit){
      field.value = field.value.substring(0, maxlimit);
  }
}

//-------------------------------------------------------------------------------------------------------------------

function IsPasteFromClipboard(){
	if (window.event.keyCode == 21 || (window.event.ctrlKey && window.event.keyCode == 86))
		return false;
	else return true;
}

//-------------------------------------------------------------------------------------------------------------------

void function InvalidAction(){
	if (event.button==2) alert('Invalid action.');
}

function KeyNumero(e,Neg,Dec){
	var key =  window.event.keyCode;
	var obj =  event.srcElement;
	var keyctrl = window.event.ctrlKey;
//	alert (event.name);
//	alert(keyctrl);
	switch (key) {
	    case 9 : //Tab
		break;	
		case 13 : //Intro
			key=9;
		break;
		case 48: case 49: case 50: case 51: case 52: case 53: case 54: case 55: case 56 :case 57 : 
			
		break;
		case 44 : //,
		    if (Dec == true && formatoDecimal == ",") {
				
				if (obj.value.indexOf(",")<0) {
					key=44;
				}
				else{
					key=0;
				}
			}
			else{
				key=0;
			}
		break;
        case 46: //.
            if (event.type != "keydown") {
                if (Dec == true && formatoDecimal == ".") {

                    if (obj.value.indexOf(".") < 0) {
                        key = 46;
                    }
                    else {
                        key = 0;
                    }
                }
                else {
                    key = 0;
                }
            }
            break;
        case 45: //-
            key = 0
            if (Neg == true) {
                var strNumero;
                var Numero;
                strNumero = obj.value;
                var re = new RegExp(formatoSeparadorMiles, 'gi');
                Numero = strNumero.replace(re, "");
                Numero = Number(strNumero.replace(formatoDecimal, "."));
                if (isNaN(Numero) == true) {
                    obj.value = 0
                }
                else {
                    Numero = Numero * (-1);
                    strNumero = Numero.toString();
                    strNumero = strNumero.replace(".", formatoDecimal);
                    obj.value = strNumero;
                }
            }
            break;
        case 8://BackSpace 

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