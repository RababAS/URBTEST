$(document).ready(function (event) {

    $("#txtPatientId").focusout(function () {

        var TheParameterString = '{patientID:"' + $("#txtPatientId").val() + '"}';

        $.ajax({
            type: "POST",
            url: "/WebService/LookUp.asmx/GetPatientBasicInfoById",
            contentType: "application/json; charset=ut-8",
            data: TheParameterString,
            dataType: "json",
            success: function (data, b) {

                var Record = $.parseJSON(data.d);
                if (Record.length == 0) {
                    alert("Patient Not Found!");
                    $("#txtPatientId").focus(); return;
                }
                else {

                    if (Record[0].ResStatus == "Death") {
                        alert("Respondent is not Alive");
                        $("#txtStudyPatientId").focus();
                        return;

                    }



                    $("#txtPatientName").val(Record[0].ResName);
                    $("#txtFathersName").val(Record[0].ResFatherName);
                    $("#txtMothersName").val(Record[0].ResMotherName);
                    $("#txtSpouseName").val(Record[0].ResSpouseName);
                    $("#ddlSex").val(Record[0].ResSex);


                    //Generate and Set DOB on Basis of Age and Reqruitment Date
                    var dtDOB = new Date(Record[0].ResReqDate.match(/\d+/) * 1);
                    var Days = parseInt(Record[0].ResAge) * 365;


                    dtDOB.setDate(dtDOB.getDate() - Days);
                    setPatientDOB(dtDOB);


                }



            },
            error: function (a, b, c) {
                alert(c.toString());
            }
        });          
            
    })
});