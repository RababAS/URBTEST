
function NumberOnly(txt)
		{
		  var textbox= document.getElementById("txt");

			debugger;
			if (textbox.value.length<3){
			 var AsciiValue=event.keyCode
			if((AsciiValue>=48 && AsciiValue<=57) || (AsciiValue==8 || AsciiValue==127))
				event.returnValue=true;
			else
				event.returnValue=false;
			}   
		}




function allowonlynumbers() 
{
	if (event.keyCode >= 48 && event.keyCode <= 57) {
		return true;

	}

	else {
		alert('Only numbers can be entered.'); return false;

	}
}

//document.getElementById('bttnadd').click(); return false;

function EnableValidator() {
	if (document.getElementById('btnAddTreatment').click()) 
	{
		ValidatorEnable(document.getElementById('<%=reqvalInvestigation.ClientID%>'), false);
	}
	else 
	{
		ValidatorEnable(document.getElementById('<%=reqvalInvestigation.ClientID%>'), true);
	}
}

function showdata(strName, strPlaceofissue) 
{
	document.getElementById('txtPasName').value = strName;
	document.getElementById('txtPIssue').value = strPlaceofissue;

}

function PrescriptionID(input) 
{
	var TheParameterString = '{PatienID:"' + $("#txtPID").val() + '"}';

	$.ajax({
		type: "POST",
		url: "/WebService/LookUp.asmx/GetPatientInfo",
		contentType: "application/json; charset=ut-8",
		data: TheParameterString,
		dataType: "json",

		success: function (data, b) {
				var Record = $.parseJSON(data.d);
				$("#txtName").val(Record[0].PatientName);
				$("#txtSex").val(Record[0].PatientSex);
		},
	});

}



//this code handles the F5/Ctrl+F5/Ctrl+R
document.onkeydown = checkKeycode
function checkKeycode(e) {
    var keycode;
    if (window.event)
        keycode = window.event.keyCode;
    else if (e)
        keycode = e.which;

    // Mozilla firefox
    if ($.browser.mozilla) {
        if (keycode == 116 || (e.ctrlKey && keycode == 82)) {
            if (e.preventDefault) {
                e.preventDefault();
                e.stopPropagation();
            }
        }
    }
        // IE
    else if ($.browser.msie) {
        if (keycode == 116 || (window.event.ctrlKey && keycode == 82)) {
            window.event.returnValue = false;
            window.event.keyCode = 0;
            window.status = "Refresh is disabled";
        }
    }
}

function preventBackspace(e) {
    var evt = e || window.event;
    if (evt) {
        var keyCode = evt.charCode || evt.keyCode;
        if (keyCode === 8) {
            if (evt.preventDefault) {
                evt.preventDefault();
            } else {
                evt.returnValue = false;
            }
        }
    }
}




