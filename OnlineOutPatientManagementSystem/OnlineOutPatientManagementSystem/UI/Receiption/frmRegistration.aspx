<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmRegistration.aspx.cs" EnableEventValidation="false"
    Inherits="OnlineOutPatientManagementSystem.UI.Receiption.frmRegistration" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration</title>

        <script src="../../Scripts/modernizr-2.6.2.js" type="text/javascript"></script>
        <script src="../../Scripts/modernizr.custom.input.js" type="text/javascript"></script>
        <!-- for H5F-->

        <link href="../../Styles/FormControlStyle.css" rel="stylesheet" type="text/css" />

        <script src="../../Scripts/jquery-1.9.1.min.js" type="text/javascript"></script>

    <link href="../../ValidationEngine.css" rel="stylesheet" />

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://cdn.ucb.org.br/Scripts/formValidator/js/languages/jquery.validationEngine-en.js"
        charset="utf-8"></script>
    <script type="text/javascript" src="http://cdn.ucb.org.br/Scripts/formValidator/js/jquery.validationEngine.js"
        charset="utf-8"></script>
    <script type="text/javascript">
        $(function () {
            $("#Registration").validationEngine('attach', { promptPosition: "topRight" });
        });
    </script>


  <%--  <script src="scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
        <script src="scripts/jquery.autocomplete.js" type="text/javascript"></script>
        <script type="text/javascript">

            $(document).ready(function () {
                $("#<%#txtStudyPatientId.ClientID%>").autocomplete('Search_CS.ashx');
            });
        </script> --%>

    <script type="text/javascript" language="javascript">

    </script>


    <script type="text/javascript" language="javascript">
        function DataSaveAlert() {
            alert('Data Save successfully.');
            $("#txtPatientId").focus();
        }
    </script>

     <script type="text/javascript"  language="javascript">
         //Added by shahed***********************************************************************************
         function VerifyAddress() {


             //Thana varify: Patient Type
             var select = document.getElementById('ddlPatientType');
             if (select.options[select.selectedIndex].value == '00') {
                 alert("Please Select Patient Type First!!");
                 ddlPatientType.focus();
                 return false;
             }

             return true;
         }

         //\\End Added by shahed*********************************************************************************
         </script>

     <script type="text/javascript"  language="javascript">

            function CloseThisWindow() {

                //GetRadWindow().get_contentFrame().RegistrationGrid.refreshGrid();
                var oWnd = GetRadWindow();
                //Close the RadWindow and send the argument to the parent page
                oWnd.close();
            }

            function GetRadWindow() {
                var oWindow = null;
                if (window.radWindow)
                    oWindow = window.radWindow;
                else if (window.frameElement.radWindow)
                    oWindow = window.frameElement.radWindow;
                return oWindow;
            }

            //SQL function call here************************************************************************
            function returnToParent() {
                //create the argument that will be returned to the parent page

                //        if ($("#hiddenSubmitComplete").val()!="Complete")
                //        return false;
                //   if (isNaN(document.getElementById("txtVisitNo").value + 1))
                //     return;
                var oArg = new Object();

                //get the city's name

                oArg.DataSave = "Yes"; //document.getElementById("txtVisitNo").value;

                CloseThisWindow();
                ////get a reference to the current RadWindow
                //var oWnd = GetRadWindow();

                ////Close the RadWindow and send the argument to the parent page
                //oWnd.close(oArg);
            }
            //End SQL function call here************************************************************************



            function VerifyStudyID(input) {
                if ($("#txtStudyPatientId").val() == "")
                    return;

                if ($('#ddlStudyName').val() == "None") {
                    alert("Please Select Study Name First!!");
                    $('#ddlStudyName').focus();
                    return false;
                }


                var TheParameterString = '{StudyName:"' + $("#ddlStudyName").val() + '",RespondentID:"' + $("#txtStudyPatientId").val() + '"}';
 

                $.ajax({
                    type: "POST",
                    url: "../../WebService/LookUp.asmx/GetRespondentInfo",
 
                    contentType: "application/json; charset=ut-8",
                    data: TheParameterString,
                    dataType: "json",


                    success: function (data, b) {
                        var Record = $.parseJSON(data.d);
                        if (Record.length == 0) {
                            alert("Respondent Not Found!");
                            $("#txtStudyPatientId").focus(); return;
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

            }


            //*************************************************************
            function CheckData(sender, eventArgs) {
                alert("submit Trigger");
                return true;
            }


            function HandleSubmit() {
                alert("Hell");
            }


            $(document).ready(function () { });
            //************************************************************


            $(document).ready(function (event) {
                $('#txtStudyPatientId').attr("disabled", "true");
                $('#ddlStudyName').attr("disabled", "true");
                $('#txtEmployeeId').attr("disabled", "true");
                $('#ddlRelationship').attr("disabled", "true");
                $('#txtSpouseName').attr("disabled", "true");

                $('#ddlPatientType').change(function () {
                    //alert("Handler for .change() called.");
                    handleControlDisplay(this);
                });
                // patient cjhange  end

                $('#ddlStudyName').change(function () {
                    $('#txtStudyPatientId').val("");
                    $('#ddlRelationship').val(9);
                });

                $("#chkDOB").click(function () {
                    click_chkDOB();
                });



                $('#ddlMaritalStatus').change(function () {
                    //var opt = $(this).find('option:selected');
                    //var maritalStatus = $(opt).attr('value');
                    //alert(maritalStatus);
                    // alert($("#ddlMaritalStatus").val())
                    switch ($("#ddlMaritalStatus").val()) {
                        case '1':
                            $('#txtSpouseName').removeAttr("disabled");
                            break;
                        case '2':
                            $('#txtSpouseName').attr("disabled", "true");
                            break;
                        default:
                            $('#txtSpouseName').attr("disabled", "true");
                            break;
                    }

                }); //maritalstatus live change

            });      // End Ready



            function handleControlDisplay(control) {
                var opt = $(control).find('option:selected');
                var patientType = $(opt).attr('value');

                switch (patientType) {
                    case '1':
                        $('#txtStudyPatientId').attr("disabled", "true");
                        $('#txtStudyPatientId').val("");
                        $('#ddlStudyName').val("None");
                        $('#ddlStudyName').attr("disabled", "true");
                        $('#txtEmployeeId').attr("disabled", "true");
                        $('#txtEmployeeId').val("");
                        $('#ddlRelationship').val(9);
                        $('#ddlRelationship').attr("disabled", "true");
                        break;
                    case '2':
                        $('#txtEmployeeId').attr("disabled", "true");
                        $('#txtEmployeeId').val("");
                        $('#txtStudyPatientId').removeAttr("disabled");
                        $('#ddlStudyName').removeAttr("disabled");
                        $('#ddlRelationship').removeAttr("disabled");
                        break;
                    case '3':
                        $('#txtStudyPatientId').attr("disabled", "true");
                        $('#ddlStudyName').attr("disabled", "true");
                        $('#txtStudyPatientId').val("");
                        $('#ddlStudyName').val("None");
                        $('#txtEmployeeId').removeAttr("disabled");
                        $('#ddlRelationship').removeAttr("disabled");
                        break;
                    default:
                        $('#txtStudyPatientId').attr("disabled", "true");
                        $('#txtStudyPatientId').val("");
                        $('#ddlStudyName').val("None");
                        $('#ddlStudyName').attr("disabled", "true");
                        $('#txtEmployeeId').attr("disabled", "true");
                        $('#txtEmployeeId').val("");
                        $('#ddlRelationship').val(9);
                        $('#ddlRelationship').attr("disabled", "true");
                        break;
                }
            }

            function btnSave_onclick() { }
        </script>

    <script type="text/javascript" language="javascript">
        function confirmCancel() {
            var mgs = 'Are you sure that you want to cancel?';
            if (!confirm(mgs)) { return false }
            else {
                window.location = '/UI/Prescription/frmPrescriptionFrontPage.aspx';
            }
        }
    </script>
   

    <style type="text/css">
        #Registration 
        {
            display: block;
            margin-top: 50px;
            margin-bottom: auto;
            margin-left: 50px;
            margin-right: 50px;
            width: 871px;
        }
        .style1
        {
            width: 90%;
        }

        .style100
        {
            width: 100%;
        }

        .style2
        {
            width: 50%;
        }

        .style3
        {
            width: 25%;
        }

         .style4
        {
            width: 100%;
            text-align: center;
            float:left;
        }

         .style60
        {
            width: 60%;
        }

         .style40
        {
            width: 40%;
        }

          .style30
        {
            width: 30%;
        }

           .style20
        {
            width: 20%;
        }

         .style14
        {
            width: 14%;
        }

    </style>
</head>

<body>
    <form id="Registration" runat="server">

         <div class="style1">
            <fieldset>
                <table class="style100">

                    <tr>
                        <td class="style1" style="text-align: center; font-size: x-large; font-style: normal; font-weight: bold">
                           Patient Basic Info
                        </td>
                    </tr>

                </table>
            </fieldset>
        </div>

         <br />


        <div style="float:left; width:90%;">

              <div style="float:left; width:49%; margin-right:10px;">    
             <fieldset>
                 <legend id="PatientType">Patient Type</legend>

                 <table class="style100">

                     <tr class="style100">
                         <td class="style40">
                             <asp:Label ID="lblPatientType" runat="server" Text="Patient Type"></asp:Label>
                         </td>

                         <td class="style60">
                             <asp:DropDownList ID="ddlPatientType" runat="server" CssClass="comboField; 
                                 validate[required];" Width="120px" ValidationGroup="valGCommon">                                   
                                    <asp:ListItem Value="1">Regular</asp:ListItem>
                                    <asp:ListItem Value="2">Respondant</asp:ListItem>
                                    <asp:ListItem Value="3">Staff</asp:ListItem>
                                </asp:DropDownList>
                                
                             <%-- <asp:RequiredFieldValidator ID="ReqValPatientType" runat="server" ControlToValidate="ddlPatientType" ForeColor="Red"
                                 ValidationGroup='valGCommon' ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
                                                       
                         </td>
                     </tr>

                      <tr class="style100">
                         <td class="style40">
                             <asp:Label ID="lblStudyName" runat="server" Text="Study Name"></asp:Label>
                         </td>

                         <td class="style60">
                             <asp:DropDownList ID="ddlStudyName" runat="server" Width="120px"
                                    DataValueField="StudyName" DataTextField="StudyName"
                                    CssClass="comboField">
                                </asp:DropDownList>
                         </td>
                     </tr>

                      <tr class="style100">
                         <td class="style40">
                             <asp:Label ID="lblStudyPatientId" runat="server" Text="Study Patient ID"></asp:Label>
                         </td>

                         <td class="style60">
                             <asp:TextBox ID="txtStudyPatientId" placeholder="Input Study Patient ID" pattern="[0-9]{6}" Width="120px"
                                 MaxLength="6" runat="server" CssClass="txtField"  onkeydown = "return (event.keyCode!=13);"
                                 title="Must be 6 Digits" onblur="VerifyStudyID(this)"></asp:TextBox>
                         </td>
                     </tr>

                      <tr class="style100">
                         <td class="style40">
                             <asp:Label ID="lblEmployeeId" runat="server" Text="Employee ID" ></asp:Label>
                         </td>

                         <td class="style60">
                             <asp:TextBox ID="txtEmployeeId" placeholder="Input Employee ID" onblur="VerifyStaffID(this);" Width="120px"
                                             MaxLength="6" runat="server" CssClass="txtField"></asp:TextBox>
                         </td>
                     </tr>

                      <tr class="style100">
                         <td class="style40">
                             <asp:Label ID="lblRelationship" runat="server" Text="Relationship"></asp:Label>
                         </td>

                          <td class="style60">
                              <asp:DropDownList ID="ddlRelationship" runat="server" Width="120px"
                                  DataTextField="RelDesc" DataValueField="RelCode">
                              </asp:DropDownList>
                          </td>
                     </tr>

                 </table>
             </fieldset>
             
             <br />   
             
              <fieldset>
                 <legend id="PBasicInfo">Patient Basic Information</legend>

                 <table class="style100">

                      <tr class="style100">
                         <td class="style40">
                             <asp:Label ID="lblPatientName" runat="server" Text="Patient Name"></asp:Label>
                         </td>

                         <td class="style60">
                             <asp:TextBox ID="txtPatientName" placeholder="Input Patient Name" Width="200px"
                                 runat="server" CssClass="txtField; validate[required]" MaxLength="50" pattern=".{3,50}" title="3 to 50 characters"></asp:TextBox>

                            <%-- <asp:RequiredFieldValidator ID="ReqValPatientName" runat="server" ControlToValidate="txtPatientName" ForeColor="Red"
                                 ValidationGroup='valGCommon' ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>--%>

                         </td>
                     </tr>

                      <tr class="style100">
                         <td class="style40">
                             <asp:Label ID="lblFathersName" runat="server" Text="Father's Name"></asp:Label>
                         </td>

                         <td class="style60">
                             <asp:TextBox ID="txtFathersName" placeholder="Input Fathers Name"
                                 MaxLength="50" runat="server" CssClass="txtField" pattern=".{3,50}" title="3 to 50 characters" Width="200px"></asp:TextBox>
                         </td>
                     </tr>

                     <tr class="style100">
                         <td class="style40">
                             <asp:Label ID="lblMothersName" runat="server" Text="Mother's Name"></asp:Label>
                         </td>

                         <td class="style60">
                             <asp:TextBox ID="txtMothersName" placeholder="Input Mothers Name" 
                                 runat="server" CssClass="txtField" MaxLength="50" pattern=".{3,50}" title="3 to 50 characters" Width="200px"></asp:TextBox>
                         </td>
                     </tr>

                      <tr class="style100">
                         <td class="style40">
                             <asp:Label ID="lblSex" runat="server" Text="Sex"></asp:Label>
                         </td>

                         <td class="style60">
                             <asp:DropDownList ID="ddlSex" runat="server"
                                 CssClass="comboField" Width="200px">
                                 <asp:ListItem Value="1" Selected="True">Male</asp:ListItem>
                                 <asp:ListItem Value="2">Female</asp:ListItem>
                             </asp:DropDownList>
                         </td>
                     </tr>

                      <tr class="style100">
                         <td class="style40">
                             <asp:Label ID="lblMaritalStatus" runat="server" Text="Marital Status"></asp:Label>
                         </td>

                         <td class="style60">
                             <asp:DropDownList ID="ddlMaritalStatus" runat="server"
                                 CssClass="comboField" Width="200px">
                                 <asp:ListItem Value="2" Selected="True">Unmarried</asp:ListItem>
                                 <asp:ListItem Value="1">Married</asp:ListItem>
                             </asp:DropDownList>
                         </td>
                     </tr>

                     <tr class="style100">
                         <td class="style40">
                             <asp:Label ID="lblSpouseName" runat="server" Text="Spouse Name"></asp:Label>
                         </td>

                         <td class="style60">
                             <asp:TextBox ID="txtSpouseName" runat="server" CssClass="txtField" 
                                 MaxLength="50" pattern=".{3,50}" title="3 to 50 characters" Width="200px"></asp:TextBox>
                         </td>
                     </tr>

                 </table>
             </fieldset> 
              
                  
               <br />

               <fieldset>
                 <legend id="AgeInfo">Age Info</legend>

                 <table class="style100">

                     
                     <tr class="style100">
                         <td class="style2">                          
                         </td>

                         <td class="style3">
                             <asp:CheckBox ID="chkDOB"  runat="server" Checked="True" Text="Date of Birth"  />                             
                         </td>

                         <td class="style2">
                                                       
                         </td>
                     </tr>

                     <tr class="style100">
                         <td class="style20">
                             <asp:Label ID="lblDOB" runat="server" Text="Date of Birth" >
                             </asp:Label>
                         </td>

                         <td class="style60">
                             <telerik:RadDatePicker ID="RdpDOB" Runat="server" Culture="English (United States)">
                             </telerik:RadDatePicker>

                           

                         </td> 
                         
                          <td class="style20">                           
                         </td>                        
                     </tr>

                 </table>

                 <table class="style100">
                     <tr class="style100">
                         <td class="style3">
                             <asp:Label ID="lblAge" runat="server" Text="Age"></asp:Label>
                         </td>

                         <td class="style3">
                             <telerik:RadNumericTextBox ID="RNtxtAgeYear" title="Numeric Only (0-110)" 
                                 Width="90px" runat="server" DisplayText="Year" EmptyMessage="Year"
                                 Label="Year:" ToolTip="Enter Year Here"
                                 Enabled="False" MaxValue="110" MinValue="0"
                                 DataType="System.Byte" MaxLength="3" CausesValidation="True"
                                 CssClass="ttt" Value="0">
                                 <NumberFormat ZeroPattern="n" DecimalDigits="0"></NumberFormat>
                                 <NegativeStyle Resize="None"></NegativeStyle>
                                 <EmptyMessageStyle Resize="None"></EmptyMessageStyle>
                                 <ReadOnlyStyle Resize="None"></ReadOnlyStyle>

                                 <FocusedStyle Resize="None"></FocusedStyle>

                                 <DisabledStyle Resize="None"></DisabledStyle>

                                 <InvalidStyle Resize="None"></InvalidStyle>

                                 <HoveredStyle Resize="None"></HoveredStyle>

                                 <EnabledStyle Resize="None"></EnabledStyle>
                                 <InvalidStyle />
                             </telerik:RadNumericTextBox>
                         </td>


                         <td class="style3">
                             <telerik:RadNumericTextBox ID="RNtxtAgeMonth" title="Numeric Only (0-110)"
                                 Width="95px" runat="server" DisplayText="Month" EmptyMessage="Month"
                                 Label=" Month:" ToolTip="Enter Month Here"
                                 Enabled="False" MaxValue="11" MinValue="0"
                                 DataType="System.Byte" MaxLength="2" Value="0">
                                 <NumberFormat ZeroPattern="n" DecimalDigits="0"></NumberFormat>
                                 <NegativeStyle Resize="None"></NegativeStyle>
                                 <EmptyMessageStyle Resize="None"></EmptyMessageStyle>
                                 <ReadOnlyStyle Resize="None"></ReadOnlyStyle>

                                 <FocusedStyle Resize="None"></FocusedStyle>

                                 <DisabledStyle Resize="None"></DisabledStyle>

                                 <InvalidStyle Resize="None"></InvalidStyle>

                                 <HoveredStyle Resize="None"></HoveredStyle>

                                 <EnabledStyle Resize="None"></EnabledStyle>
                             </telerik:RadNumericTextBox>
                         </td>


                         <td class="style3">
                             <telerik:RadNumericTextBox ID="RNtxtAgeDay" title="Numeric Only (0-110)"
                                 Width="80px" runat="server" DisplayText="Day" EmptyMessage="Day"
                                 Label="Day:" ToolTip="Enter Day Here"
                                 Enabled="False" MaxValue="29" MinValue="0"
                                 DataType="System.Byte" MaxLength="2" Value="0">
                                 <NumberFormat ZeroPattern="n" DecimalDigits="0"></NumberFormat>
                                 <NegativeStyle Resize="None"></NegativeStyle>
                                 <EmptyMessageStyle Resize="None"></EmptyMessageStyle>
                                 <ReadOnlyStyle Resize="None"></ReadOnlyStyle>

                                 <FocusedStyle Resize="None"></FocusedStyle>

                                 <DisabledStyle Resize="None"></DisabledStyle>

                                 <InvalidStyle Resize="None"></InvalidStyle>

                                 <HoveredStyle Resize="None"></HoveredStyle>

                                 <EnabledStyle Resize="None"></EnabledStyle>
                             </telerik:RadNumericTextBox>
                         </td>
                     </tr>
                 </table>
             </fieldset> 
                       
        </div>


       <div style="float:right; width:49%; margin-left:5px;">
                       
             <fieldset>
                 <legend id="NIDMobile">NID & Mobile</legend>

                 <table class="style100">

                     <tr class="style100">
                         <td class="style40">
                             <asp:Label ID="lblNID" runat="server" Text="National ID"></asp:Label>
                         </td>

                         <td class="style60">
                             <asp:TextBox ID="txtNID" runat="server" CssClass="txtField"
                                            placeholder="Input NID" 
                                            MaxLength="17" pattern="[0-9]{13,17}" Width="250px" Height="16px"></asp:TextBox>
                         </td>
                     </tr>

                      <tr class="style1">
                         <td class="style40">
                             <asp:Label ID="lblMobile" runat="server" Text="Mobile"></asp:Label>
                         </td>

                         <td class="style60">
                              <asp:TextBox ID="txtMobile" runat="server" CssClass="txtField" 
                                            placeholder="Input Mobile NO" 
                                            MaxLength="11" Width="250px" pattern="[0-9]{11}"></asp:TextBox>
                         </td>
                     </tr>

                 </table>
             </fieldset> 
           
           <br />
           
            <fieldset>
                 <legend id="PatientAddress">Patient Address</legend>

                 <table class="style100">

                     <tr class="style100">
                         <td class="style40">
                             <asp:Label ID="lblDistrict" runat="server" Text="District"></asp:Label>
                         </td>

                         <td class="style60">
                             <asp:DropDownList ID="ddlDistrict" runat="server" Width="250" 
                                 CssClass="validate[required]" ValidationGroup="valGCommon">
                             </asp:DropDownList>
                            
                             <cc1:CascadingDropDown ID="ccddlDistrict" TargetControlID="ddlDistrict" PromptText="Select District"
                                 PromptValue="" ServicePath="../../WebService/LookUp.asmx" ServiceMethod="GetDistrictList" runat="server"
                                 Category="DistCode" LoadingText="Loading..." />

                         </td>
                     </tr>

                      <tr class="style100">
                         <td class="style40">
                             <asp:Label ID="lblThana" runat="server" Text="Thana/Upazila"></asp:Label>
                         </td>

                         <td class="style60">
                             <asp:DropDownList ID="ddlThana" runat="server" Width="250" 
                                 CssClass="validate[required]" ValidationGroup="valGCommon">
                             </asp:DropDownList>

                             <cc1:CascadingDropDown ID="ccddlThana" TargetControlID="ddlThana" PromptText="Select Thana"
                                 PromptValue="" ServicePath="../../WebService/LookUp.asmx" ServiceMethod="GetThanaorUpZillaList" runat="server"
                                 Category="ThanaCode" ParentControlID="ddlDistrict" LoadingText="Loading..." />
                         </td>
                     </tr>

                      <tr class="style100">
                         <td class="style40">
                              <asp:Label ID="lblUnion" runat="server" Text="Union"></asp:Label>
                         </td>

                         <td class="style60">
                             
                             <asp:TextBox ID="txtUnion" runat="server" Width="250px"  
                                 placeholder="Input Union">
                             </asp:TextBox>
                             
                         </td>
                     </tr>


                     <tr class="style100">
                         <td class="style40">
                             <asp:Label ID="lblVillage" runat="server" Text="Village"></asp:Label>
                         </td>

                         <td class="style60">
                              <asp:TextBox ID="txtVillage" runat="server" Width="250px"  placeholder="Input Village" ></asp:TextBox>                       
                         </td>
                     </tr>

                      <tr class="style100">
                         <td class="style40">
                             <asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label>
                         </td>

                         <td class="style60">
                              <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine"  placeholder="Input Address" 
                                  MaxLength="100" CssClass="txtAreaField" Width="250px"></asp:TextBox>
                         </td>
                     </tr>

                      <tr class="style100">
                         <td class="style40">
                              <asp:Label ID="lblRemarks" runat="server" Text="Remarks"></asp:Label>
                         </td>

                         <td class="style60">
                             <asp:TextBox ID="txtRemarks" runat="server" TextMode="MultiLine"  placeholder="Input Remarks" 
                                 MaxLength="100" CssClass="txtAreaField" Width="250px"></asp:TextBox>
                         </td>
                     </tr>


                 </table>
             </fieldset> 
        </div>

        </div>

       <div style="float:left; width:90%;">
           <br />   
        </div>

       <div style="float:left; width:90%;">   
             <fieldset>
                <table class="style100">
                    <tr class="style2">
                         <td style="text-align: right">
                             <asp:Button ID="btnSave" runat="server" Text="Save"
                                 OnClick="btnSave_Click" />
                         </td>
                         <td style="text-align: left">
                             <asp:Button ID="btnClose" runat="server" Text="Close" OnClientClick="return confirmCancel()" 
                                 ValidationGroup="none" cssclass="cancel" UseSubmitBehavior="false"/>
                         </td>
                     </tr>

                   <tr class="style2">
                         <td style="text-align: right">

                         </td>
                         <td style="text-align: left">

                         </td>
                     </tr>
                 </table>
                                  
            </fieldset>   
        </div>

        <div class="style1">
            <table class="style100">
                <tr class="style1">
                    <td class="style40">
        <telerik:RadWindowManager ID="RadWindowManager" runat="server">
        </telerik:RadWindowManager>
                    </td>

                    <td class="style60">

                    </td>
                </tr>

                <tr class="style1">
                    <td class="style40">
                        
                    </td>

                    <td class="style60">                 
                    </td>
                </tr>

                <tr class="style1">
                    <td class="style40">
            <telerik:RadAjaxManager ID="RadAjaxManagerRegistration" runat="server" 
                >
                <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="ddlDistrict">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="ddlThana" UpdatePanelCssClass="" />                          
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                                      
                    <telerik:AjaxSetting AjaxControlID="btnSave">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="btnSave" UpdatePanelCssClass="" />
                            <telerik:AjaxUpdatedControl ControlID="btnClose" UpdatePanelCssClass="" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                                      
                </AjaxSettings>
            </telerik:RadAjaxManager>

                    </td>

                    <td class="style60">
                        <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                        </cc1:ToolkitScriptManager>
                    </td>
                </tr>

                <tr class="style1">
                    <td class="style40"></td>

                    <td class="style60"></td>
                </tr>
            </table>
        </div>


        <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
                
                <script type="text/javascript">


                    function VerifyStaffID(input) {

                        if (input.value == "")
                            return;

                        var TheParameterString = '{StaffID:"' + $("#txtEmployeeId").val() + '"}';
                        //alert(Respondent.StudyName + Respondent.ResID);

                        //var Tang = JSON.stringify(Respondent);
                        //var Tang = JSON.stringify(Respondent);
                        // alert(TheParameterString);

                        var loc = window.location.href.split('?')[0];
                        if (loc.substr(loc.length - 1, 1) == "/")
                            loc = loc + "frmRegistration.aspx";

                        $.ajax({
                            type: "POST",
                            //url: "../../WebService//LookUp.asmx/GetStaffInfo",
                            url: loc + "/GetStaffInfo",
                            contentType: "application/json; charset=ut-8",
                            data: TheParameterString,
                            dataType: "json",
                            success: function (data, b) {

                                var Record = $.parseJSON(data.d);
                                if (Record.length == 0)
                                    alert("Invalid Staff ID!");
                                else {
                                    $("#txtPatientName").val(Record[0].StaffName);
                                    $("#ddlSex").val(Record[0].StaffSex);

                                    //Convert JSON Date to Java Date
                                    var dtDOB = new Date(Record[0].StaffDOB.match(/\d+/) * 1);
                                    setPatientDOB(dtDOB);
                                    // var RdtPicker = $find('<%=RdpDOB.ClientID %>');
                                    // var date = RdtPicker.get_selectedDate();

                                    // RdtPicker.set_selectedDate(dtDOB);

                                }

                            },
                            error: function (a, b, c) {
                                alert(c.toString());
                            }
                        });

                    } //end VerifyStaffID



                    function click_chkDOB() {

                        var dPicker = $find('<%=RdpDOB.ClientID %>');
                        var jRNtxtYear = $find('<%=RNtxtAgeYear.ClientID %>');

                        var jRNtxtMonth = $find('<%=RNtxtAgeMonth.ClientID %>');
                        var jRNtxtDay = $find('<%=RNtxtAgeDay.ClientID %>');
                        if ($('#chkDOB').is(":checked")) {
                            // it is checked

                            //  $("#RdpDOBContent").removeAttr("disabled");
                            //$("#ageContent").children().attr("disabled", "disabled");

                            dPicker.set_enabled(true);
                            // $find('<%=RNtxtAgeYear.ClientID %>').disable();
                            jRNtxtYear.set_value(0);
                            jRNtxtYear.disable();
                            jRNtxtMonth.set_value(0);
                            jRNtxtMonth.disable();
                            jRNtxtDay.set_value(0);
                            jRNtxtDay.disable();


                        }
                        else {

                            dPicker.set_enabled(false);


                            jRNtxtYear.enable();

                            jRNtxtMonth.enable();

                            jRNtxtDay.enable();

                            //$("#ageContent").children().removeAttr("disabled", true);

                        }
                    }



                    function setPatientDOB(theValue) {
                        var RdtPicker = $find('<%=RdpDOB.ClientID %>');
                        // var date = RdtPicker.get_selectedDate();
                        RdtPicker.set_selectedDate(theValue);
                    }

                    function DateFormat(field, rules, i, options) {
                        var regex = /^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$/;
                        if (!regex.test(field.val())) {
                            return "Please enter date in dd/MM/yyyy format."
                        }
                    }

                </script>


            </telerik:RadCodeBlock>

    </form>

</body>
</html>
