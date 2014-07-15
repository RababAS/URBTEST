
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="OnlineOutPatientManagementSystem.UI.Registration" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>Registration</title>
        <script src="../../Scripts/modernizr-2.6.2.js" type="text/javascript"></script>
        <script src="../../Scripts/modernizr.custom.input.js" type="text/javascript"></script>
        <!-- for H5F-->

        <link href="../../Styles/FormControlStyle.css" rel="stylesheet" type="text/css" />

        <script src="../../Scripts/jquery-1.9.1.min.js" type="text/javascript"></script>


         <script type="text/javascript"  language="javascript">
             //Added by shahed***********************************************************************************
             function VerifyAddress() {
             
                //Thana varify: ddlThana
                 var select = document.getElementById('ddlThana');
                 if (select.options[select.selectedIndex].value == '00') {
                     alert("Please Select Tahan Name First!!");
                     ddlThana.focus();
                     return false;
                 }

                 //Union varify: ddlUnion
                  var select = document.getElementById('ddlUnion');
                 if (select.options[select.selectedIndex].value == '00') {
                     alert("Please Select Union Name First!!");
                     ddlUnion.focus();
                     return false;
                 }

                 //Village varify: ddlVillage
                 var select = document.getElementById('ddlVillage');
                 if (select.options[select.selectedIndex].value == '00') {
                     alert("Please Select Village Name First!!");
                     ddlVillage.focus();
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
                //alert(Respondent.StudyName + Respondent.ResID);
                
                //var Tang = JSON.stringify(Respondent);
                //var Tang = JSON.stringify(Respondent);
                // alert(TheParameterString);

                $.ajax({
                    type: "POST",
                    url: "/WebService/LookUp.asmx/GetRespondentInfo",
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


            $(document).ready(function () {});
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

            function btnSave_onclick() {}
        </script>



    </head>
    <body>
        <form id="frmRegistration" runat="server" >
        <telerik:RadWindowManager ID="RadWindowManager" runat="server">
        </telerik:RadWindowManager>
            <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            </telerik:RadScriptManager>
            <telerik:RadAjaxManager ID="RadAjaxManagerRegistration" runat="server" 
                >
                <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="ddlDistrict">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="ddlThana" UpdatePanelCssClass="" />
                            <telerik:AjaxUpdatedControl ControlID="ddlUnion" UpdatePanelCssClass="" />
                            <telerik:AjaxUpdatedControl ControlID="ddlVillage" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="ddlThana">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="ddlUnion" UpdatePanelCssClass="" />
                            <telerik:AjaxUpdatedControl ControlID="ddlVillage" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="ddlUnion">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="ddlVillage" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                </AjaxSettings>
            </telerik:RadAjaxManager>

            <div align="center">
                <fieldset>
                    <legend>Patient Type</legend>
                    <table style="width:50%;">
                        <tr>
                            <td style="width:30%; text-align:right;">
                                <asp:Label ID="lblPatientType" runat="server" Text="Patient Type"></asp:Label>
                            </td>
                            <td style="text-align:left;">
                                <asp:DropDownList ID="ddlPatientType" runat="server" CssClass="comboField" 
                                    onselectedindexchanged="ddlPatientType_SelectedIndexChanged" >
                                    <asp:ListItem Value="1">Regular</asp:ListItem>
                                    <asp:ListItem Value="2">Respondant</asp:ListItem>
                                    <asp:ListItem Value="3">Staff</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td style="width:30%; text-align:right;">
                                <asp:Label ID="lblStudyName" runat="server" Text="Study Name"></asp:Label>
                            </td>
                            <td style="text-align:left;">
                                <asp:DropDownList ID="ddlStudyName" runat="server" required 
                                    DataValueField="StudyName" DataTextField="StudyName" 
                                                  CssClass="comboField" 
                                    onselectedindexchanged="ddlStudyName_SelectedIndexChanged" >
                                </asp:DropDownList>

                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td style="width:30%; text-align:right;">
                                <asp:Label ID="lblStudyPatientId" runat="server" required=true; Text="Study Patient ID"></asp:Label>
                            </td>
                            <td style="text-align:left;">
                                <asp:TextBox ID="txtStudyPatientId" placeholder="Input Study Patient ID" pattern=[0-9]{6} required 
                                             MaxLength="6" runat="server" CssClass="txtField" title="Must be 6 Digits" onblur="VerifyStudyID(this)"></asp:TextBox>

                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td style="width:30%; text-align:right;">
                                <asp:Label ID="lblEmployeeId" runat="server" MaxLength=6  pattern=[0-9]{1}  Text="Employee ID" ></asp:Label>
                            </td>
                            <td style="text-align:left;">
                                <asp:TextBox ID="txtEmployeeId" placeholder="Input Employee ID" onblur="VerifyStaffID(this);"
                                             MaxLength="6" runat="server" CssClass="txtField"  required></asp:TextBox>

                            </td>
                            <td> &nbsp; </td>
                        </tr>
                        <tr>
                            <td style="width:30%; text-align:right;">
                                <asp:Label ID="lblRelationship" runat="server" Text="Relationship"></asp:Label>
                            </td>
                            <td style="text-align:left;">
                                <asp:DropDownList ID="ddlRelationship" runat="server" required  DataTextField="RelationDescription" DataValueField="RelationCode"
                                                  CssClass="comboField">
                                </asp:DropDownList>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                </fieldset>

            </div>

            <div>

                <table style="width:100%;">

                    <tr>
                        <td style="width:50%;">
                            <fieldset>
                                <legend>Patient Basic Information</legend>

                                <table style="width:100%;">
                                    <tr>
                                        <td style="width:30%;">
                                            <asp:Label ID="lblPatientId" runat="server" Text="Patient ID"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtPatientId" runat="server" CssClass="txtField" 
                                                         ReadOnly="True" required Enabled="False"></asp:TextBox>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>

                                    <tr>
                                        <td style="width:30%;">
                                            <asp:Label ID="lblPatientName" runat="server" Text="Patient Name"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtPatientName" placeholder="Input Patient Name" required
                                                         runat="server" CssClass="txtField" MaxLength="50" pattern=".{3,50}" title="3 to 50 characters"></asp:TextBox>

                                        </td>
                                        <td>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width:30%;">
                                            <asp:Label ID="lblFathersName" runat="server" Text="Father's Name"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtFathersName" placeholder="Input Fathers Name" required
                                                         MaxLength="50" runat="server" CssClass="txtField" pattern=".{3,50}" title="3 to 50 characters"></asp:TextBox>

                                        </td>
                                        <td>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width:30%;">
                                            <asp:Label ID="lblMothersName" runat="server" Text="Mother's Name"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtMothersName" placeholder="Input Mothers Name" required
                                                         runat="server" CssClass="txtField" MaxLength="50" pattern=".{3,50}" title="3 to 50 characters"></asp:TextBox>

                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width:30%;">
                                            <asp:Label ID="lblSex" runat="server" Text="Sex"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlSex" runat="server" 
                                                              CssClass="comboField">
                                                <asp:ListItem Value="1" Selected="True">Male</asp:ListItem>
                                                <asp:ListItem Value="2">Female</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width:30%;">
                                            <asp:Label ID="lblMaritalStatus" runat="server" Text="Marital Status"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlMaritalStatus" runat="server" 
                                                              CssClass="comboField">
                                                <asp:ListItem Value="2" Selected="True">Unmarried</asp:ListItem>
                                                <asp:ListItem Value="1">Married</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width:30%;">
                                            <asp:Label ID="lblSpouseName" runat="server" Text="Spouse Name"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtSpouseName" runat="server" CssClass="txtField" required 
                                                         MaxLength="50" pattern=".{3,50}" title="3 to 50 characters"></asp:TextBox>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width:30%;">
                                            <asp:Label ID="lblRegistrationDate" runat="server" Text="Registration Date "></asp:Label>
                                        </td>
                                        <td>

                                            <%--<input type="text" id="txtRegistrationDate" name="txtRegistrationDate" class="txtField datetime" value="" runat="server" />
                                            
                                            <script type="text/javascript">
                                            $(document).ready(function (event) {
                                            //registerDTPicker(".date");
                                            registerDateTimePicker(".datetime");
                                            });
                                            </script>--%>
                                            <telerik:RadDatePicker ID="RdtpRegistrationDate" Runat="server" 
                                                Enabled="False"   >
                                            </telerik:RadDatePicker>

                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <fieldset>
                                                <legend>Age Info</legend>
                                                <table class="style1">
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>

                                                            <asp:CheckBox ID="chkDOB"  runat="server" Checked="True" Text="Date of Birth"  />
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lblDOB" runat="server" Text="Date of Birth" 
                                                                       ></asp:Label>
                                                        </td>
                                                        <td>
                                                            <div id="RdpDOBContent">
                                                                <telerik:RadDatePicker ID="RdpDOB" Runat="server" MinDate="1940-01-01" 
                                                                    ToolTip="Birth Dathe"  >
                                                                    <DateInput DateFormat="dd/MM/yyyy" required></DateInput>
                                                                </telerik:RadDatePicker >
                                                                <asp:Label ID="lblDOB0" runat="server" Text=" (DD/MM/YY)" 
                                                                           ></asp:Label>
                                                            </div>

                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lblAge" runat="server" Text="Age"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <div id=ageContent>
                                                                <telerik:RadNumericTextBox ID="RNtxtAgeYear" title="Numeric Only (0-110)" required
                                                                                           Width="90px" runat="server" DisplayText="Year" EmptyMessage="Year" 
                                                                                           Label="Year:" ToolTip="Enter Year Here" 
                                                                                           Enabled="False" MaxValue="110" MinValue="0" 
                                                                      DataType="System.Byte" MaxLength="3" CausesValidation="True" 
                                                                    CssClass="ttt" Value="0"  >
                                                                    <NumberFormat ZeroPattern="n" DecimalDigits="0" ></NumberFormat>
                                                                    <NegativeStyle Resize="None"></NegativeStyle>
                                                                    <EmptyMessageStyle Resize="None"></EmptyMessageStyle>
                                                                    <ReadOnlyStyle Resize="None"></ReadOnlyStyle>

                                                                    <FocusedStyle Resize="None"></FocusedStyle>

                                                                    <DisabledStyle Resize="None"></DisabledStyle>

                                                                    <InvalidStyle Resize="None"></InvalidStyle>

                                                                    <HoveredStyle Resize="None"></HoveredStyle>
                                                                    
                                                                    <EnabledStyle Resize="None"></EnabledStyle>
                                                                   <InvalidStyle  />
                                                                </telerik:RadNumericTextBox>
                                                                <telerik:RadNumericTextBox ID="RNtxtAgeMonth" title="Numeric Only (0-110)" required 
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
                                                                <telerik:RadNumericTextBox ID="RNtxtAgeDay" title="Numeric Only (0-110)" required
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

                                                            </div>
                                                        </td>

                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                </table>
                                            </fieldset>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                <fieldset style="width:420px; text-align:center; ">
                    <%--<asp:Panel ID="Panel1" runat="server">
                    </asp:Panel>--%>&nbsp;<input type=button id="btnSave" class="buttonField" value="Close" 
                        onclick="CloseThisWindow();" />

                    <asp:Button ID="btnSave" runat="server" Text="Save"  
                                ValidationGroup="form"  
                                CssClass="buttonField"  OnClientClick="return VerifyAddress()"
                                onclick="btnSave_Click"/>
                </fieldset></td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        <td style="width:50%; ">

                            <fieldset>
                                <legend>
                                    NID & Mobile
                                </legend>

                                <table style="width:100%;">
                                    <tr>
                                        <td style="width:20%;">
                                            <asp:Label ID="lblNID" runat="server" Text="NID"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtNID" runat="server" CssClass="txtField"
                                            placeholder="Input NID" 
                                            MaxLength="17" pattern="[0-9]{13,17}" Width="150px">
                                            </asp:TextBox>
                                            

                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width:20%;">
                                            <asp:Label ID="lblMobile" runat="server" Text="Mobile"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtMobile" runat="server" CssClass="txtField" 
                                            placeholder="Input Mobile NO" 
                                            MaxLength="11" Width="150px" pattern="[0-9]{11}"></asp:TextBox>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                </table>

                            </fieldset>

                            <fieldset>
                                <legend>Patient Address</legend>

                                <table style="width:100%;">
                                    <tr>
                                        <td style="width:20%;">
                                            <asp:Label ID="lblDistrict" runat="server" Text="District"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlDistrict" runat="server" DataTextField="DistrictName" DataValueField="DistrictCode"
                                                              CssClass="comboField" AutoPostBack="True" 
                                                              onselectedindexchanged="ddlDistrict_SelectedIndexChanged" >
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width:20%;">
                                            <asp:Label ID="lblThana" runat="server" Text="Thana/Upazila"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlThana" runat="server" 
                                                              CssClass="comboField" DataTextField="ThanaName" DataValueField="ThanaCode" 
                                                              onselectedindexchanged="ddlThana_SelectedIndexChanged"
                                                              AutoPostBack="True" >
                                            </asp:DropDownList>

                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width:20%;">
                                            <asp:Label ID="lblUnion" runat="server" Text="Union"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlUnion" runat="server" AutoPostBack="True" 
                                                              CssClass="comboField" DataTextField="UnionName" DataValueField="UnionCode" 
                                                              onselectedindexchanged="ddlUnion_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width:20%;">
                                            <asp:Label ID="lblVillage" runat="server" Text="Village"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlVillage" runat="server" AutoPostBack="True" 
                                                              CssClass="comboField" DataTextField="VillageName" 
                                                              DataValueField="VillageCode">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width:20%;">
                                            <asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" 
                                                      required  MaxLength="100" CssClass="txtAreaField"></asp:TextBox>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width:20%;">
                                            Remarks
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtRemarks" runat="server" TextMode="MultiLine" 
                                                         MaxLength="100" CssClass="txtAreaField"></asp:TextBox>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                                <asp:Label ID="lblForFunctionCall" runat="server" Text="Label For Function" ForeColor="White"></asp:Label>
                        </td>
                    </tr>

                </table>

            </div>

            <div>

            </div>
            <div class="fieldDiv pageAction">
                &nbsp;</div>



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

                        $.ajax({
                            type: "POST",
                            url: "/WebService/LookUp.asmx/GetStaffInfo",
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
                        var jRNtxtYear =  $find('<%=RNtxtAgeYear.ClientID %>');

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

                </script>


            </telerik:RadCodeBlock>



        </form>
    </body>
</html>
