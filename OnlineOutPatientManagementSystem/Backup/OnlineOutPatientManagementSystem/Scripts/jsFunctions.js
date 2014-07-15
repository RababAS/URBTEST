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

