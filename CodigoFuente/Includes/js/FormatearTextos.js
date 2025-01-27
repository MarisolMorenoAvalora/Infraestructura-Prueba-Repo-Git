// JScript File
function limitarMaxLength(text, maxLength)
{
    try
    {
        if (!esTeclaControl() && text.value.length >= maxLength){ 
            event.keyCode = 0;
            return false;
            //text.value = text.value.substring(0, maxLength); 
        }
    }
    catch (ex)
    {
        // No hacemos nada
    }
}

function esTeclaControl()
{
    //debugger
    return (event.keyCode == 8 || event.keyCode == 46 || event.keyCode == 39 || event.keyCode == 37 || event.keyCode == 40 || event.keyCode == 38);
}
function RellenaCeros(e)
{
    var obj = event.srcElement;
    var strNumero = obj.value; 
    var len=0;
    len = obj.value.length;
    var MaxLen =0;   
    MaxLen =(obj.maxLength); 
    var restoceros = 0;
    restoceros=(MaxLen-len);
    if (len>0)
    {
       for (inte=1; inte<=(restoceros); inte++){
	        strNumero = "0" + strNumero;
       }
       obj.value=strNumero;
    }
}

function KeyTexto(e){
	var key =  window.event.keyCode;
	var obj =  event.srcElement;
	var keyctrl = window.event.ctrlKey;
	switch (key) {
		case 13 : //Intro
			key=9;
		break;
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
function Intro(e){
	var key =  window.event.keyCode;
	var obj =  event.srcElement;
	var keyctrl = window.event.ctrlKey;
	switch (key) {
		case 13 : //Intro
			key=9;
		break;
	}
	try{
	    awindow.event.keyCode = key;
	    return 'ok';
	}
	catch (ex)
	{
	    return 'ok';
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

function KeyNull(e){
	try{
	    window.event.keyCode = 0;
	    return 'ok';
	}
	catch (ex)
	{
	    return 'ok';
	}
}


function checkSize (obj, num_caract) 
{ 
    // se usa para comprobar en los textbos multiline el maxlenght porque en .net no funciona
    if(obj.value.length >= num_caract) 
    { 
        obj.value = obj.value.substr(0, num_caract -1); 
        //alert('Longitud maxima '+num_caract); 
        return false; 
    }; 
} 
function toLower(e){
	var obj = (isIE) ? event.srcElement : e.target;
	obj.value=obj.value.toLowerCase();
}

function toUpper(e){	
	var obj = event.srcElement;
	obj.value=obj.value.toUpperCase();
}

function setFocus(Id){
	document.getElementById('" + obj +  "').focus();
	return 'ok';
}