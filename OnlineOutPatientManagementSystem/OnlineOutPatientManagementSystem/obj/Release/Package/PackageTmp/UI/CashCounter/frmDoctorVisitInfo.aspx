<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmDoctorVisitInfo.aspx.cs" EnableEventValidation="false"
    Inherits="OnlineOutPatientManagementSystem.UI.CashCounter.frmDoctorVisitInfo" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Doctors Visit Info</title>

    <script src="../../Scripts/jquery-1.4.1-vsdoc.js" type="text/javascript"></script>
    

    
    <link href="../../ValidationEngine.css" rel="stylesheet" />

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://cdn.ucb.org.br/Scripts/formValidator/js/languages/jquery.validationEngine-en.js"
        charset="utf-8"></script>
    <script type="text/javascript" src="http://cdn.ucb.org.br/Scripts/formValidator/js/jquery.validationEngine.js"
        charset="utf-8"></script>
    <script type="text/javascript">
        $(function () {
            $("#DoctorVisitInfo").validationEngine('attach', { promptPosition: "topRight" });
        });
    </script>
       

    <script type="text/javascript">
        var specialKeys = new Array();
        specialKeys.push(8); //Backspace
        function IsNumeric(e) {
            var keyCode = e.which ? e.which : e.keyCode
            var ret = ((keyCode >= 48 && keyCode <= 57) || specialKeys.indexOf(keyCode) != -1);
            document.getElementById("error").style.display = ret ? "none" : "inline";
            return ret;
        }
    </script>



    <script language="javascript" type="text/javascript">

        function Showalert() {
            alert('Patient ID not foun please check!');
            //window.parent.parent.parent.location.reload();
            $('#txtPatientId').focus(function () {
                $(this).val('');
            });
        }

        function openReport() {

            alert('Data Save successfully.');
            var strPatientId = document.getElementById('txtPatientId').value;

            var url = "/Report/frmCommonReportViewer.aspx?prmReportNmae=DoctorVisit &prmPatientId=" + strPatientId;
            //ViewReport(url);

            myWindow = window.open(url);
            myWindow.focus();

            //window.location = '~/Default.aspx';
        }

        function ViewReport(URL) {

            var wnd = window.radopen(URL, null);
            wnd.set_title("Report Viewer");
            wnd.setSize(1100, 600);
            wnd.set_modal(true);
            wnd.set_visibleStatusbar(false);
            wnd.showRoundCorner(true);
            return false;

        }

        function DataSaveAlert() {
            alert('Data Save successfully.');
            $("#txtPatientId").focus();
        }

        function ControlledFocus() {
            $("#txtRemarks").focus();
        }

        function PrescriptionID(input) {
            if ($("#txtPatientId").val() == "")
                return;

            var TheParameterString = '{PatienID:"' + $("#txtPatientId").val() + '"}';

            var loc = window.location.href.split('?')[0];
            if (loc.substr(loc.length - 1, 1) == "/")
                loc = loc + "frmDoctorVisitInfo.aspx";

            $.ajax({
                type: "POST",
                //url:"/WebService/LookUp.asmx/GetPatientInfo",
                url: loc + "/GetPatientInfo",
                contentType: "application/json; charset=ut-8",
                data: TheParameterString,
                dataType: "json",



                success: function (data, b) {
                    var Record = $.parseJSON(data.d);
                    alert(PatienID);
                    alert(Record);

                    if (Record.length == 0) {
                        alert("Patience ID Not Found!");
                        $("#txtPatientId").focus();
                        return;
                    }

                    alert(Record);
                },
                error: function (a, b, c) {
                    alert(c.toString());
                }
            });

        }

    </script>

    <style type="text/css">
        #DoctorVisitInfo 
        {
            width: 582px;
            display: block;
            margin-top: 50px;
            margin-bottom: auto;
            margin-left: 50px;
            margin-right: 50px;
        }
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 5%;
        }

        .style3
        {
            width: 40%;
        }

         .style4
        {
            width: 20%;
        }

         fieldset div 
         {
             border: 1px dotted silver;
             margin: 300px;
         }

        .num {}

        .auto-style2 {
            width: 139%;
            height: 23px;
        }
        
        .auto-style4 {
            width: 139%;
        }
        .auto-style5 {
            width: 40%;
        }
        .auto-style6 {
            width: 76%;
            height: 23px;
        }

    </style>
</head>

<body>
    <form id="DoctorVisitInfo" runat="server">

        <div class="style1">
            <fieldset>
                <table class="style1">

                    <tr>
                        <td class="style1" style="text-align: center; font-size: x-large; font-style: normal; font-weight: bold">Doctor Visit Info
                        </td>
                    </tr>

                </table>
            </fieldset>
        </div>

        <div>
            <fieldset>
                <table class="style1">

                    <tr>

                        <td class="auto-style5">
                            <asp:Label ID="lblPatientId" runat="server" Text="Patient ID :"></asp:Label>
                        </td>
                        <td class="auto-style4">

                           <asp:TextBox ID="txtPatientId" runat="server" AutoPostBack="True" type="number" CssClass="validate[required]"
                                placeholder="Input Patient ID" MaxLength="11" pattern="\d{11}"
                                onFocus="this.select()" onkeypress="return IsNumeric(event);"
                                OnTextChanged="txtPatientId_TextChanged">
                            </asp:TextBox>
                             <span id="error" style="color: Red; display: none">* Input digits (0 - 9)</span>

                        </td>

                    </tr>

                    <tr>

                        <td class="auto-style5">
                            <asp:Label ID="lblPatientName" runat="server" Text="Patient Name :"></asp:Label>
                        </td>
                        <td class="auto-style4">
                            <asp:TextBox ID="txtPatientName" runat="server" ReadOnly="True" Enabled="False" Width="380px"
                                CssClass="txtField"></asp:TextBox>
                        </td>

                    </tr>

                    <tr>

                        <td class="auto-style5">
                            <asp:Label ID="lblPatientAge" runat="server" Text="Patient Age :"></asp:Label>
                        </td>
                        <td class="auto-style4">
                            <table style="width: 90%">
                                <tr>
                                    <td style="width: 8%">

                                        <asp:Label ID="lblYear" runat="server" Text="Year"></asp:Label>

                                    </td>
                                    <td style="width: 17%">

                                        <asp:TextBox ID="txtYear" runat="server" Width="50px" Enabled="False">00</asp:TextBox>

                                    </td>
                                    <td style="width: 8%">
                                        <asp:Label ID="lblMonth" runat="server" Text="Month"></asp:Label>
                                    </td>
                                    <td style="width: 17%">
                                        <asp:TextBox ID="txtMonth" runat="server" Width="50px" Enabled="False">00</asp:TextBox>
                                    </td>
                                    <td style="width: 8%">
                                        <asp:Label ID="lblDay" runat="server" Text="Day"></asp:Label>
                                    </td>
                                    <td style="width: 17%">
                                        <asp:TextBox ID="txtDay" runat="server" Width="50px" Enabled="False">00</asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>

                    </tr>


                    <tr>

                        <td class="auto-style5"></td>
                        <td class="auto-style4">
                            <asp:CheckBox ID="chkRegistrationFee" runat="server" Checked="True"
                                Enabled="False" Text="Registration Fee" />
                        </td>

                    </tr>

                    <tr>

                        <td class="auto-style5">
                            <asp:Label ID="lblDoctorName" runat="server" Text="Doctor Name :"></asp:Label>
                        </td>
                        <td class="auto-style4">

                             <asp:DropDownList ID="ddlDoctorName" runat="server"
                                 Width="370" CssClass="validate[required]">
                             </asp:DropDownList>
                            
                             <cc1:CascadingDropDown ID="ccddlDoctorName" TargetControlID="ddlDoctorName" PromptText="Select DoctorName"
                                 PromptValue="" ServicePath="../../WebService/LookUp.asmx" ServiceMethod="GetDoctorNameList" runat="server"
                                 Category="DNCode" LoadingText="Loading..." />
                        </td>

                    </tr>

                    <tr>

                        <td class="auto-style5">
                            <asp:Label ID="lblDoctorFee" runat="server" Text="Doctor Fee :"></asp:Label>
                        </td>
                        <td class="auto-style4">
                            <asp:DropDownList ID="ddlDoctorFee" runat="server"
                                Width="50px" CssClass="validate[required]">
                             </asp:DropDownList>

                             <cc1:CascadingDropDown ID="ccddlDoctorFee" TargetControlID="ddlDoctorFee" PromptText=""
                                 PromptValue="" ServicePath="../../WebService/LookUp.asmx" ServiceMethod="GetDoctorFee" runat="server"
                                 Category="DNCode" ParentControlID="ddlDoctorName" LoadingText="Loading..." />
                        </td>

                    </tr>


                    <tr>

                        <td class="auto-style5">
                            <asp:Label ID="lblRemarks" runat="server" Text="Remarks :"></asp:Label>
                        </td>
                        <td class="auto-style4">
                            <asp:TextBox ID="txtRemarks" runat="server" placeholder="Type Remarks"
                                CssClass="txtField num" Width="380px" TextMode="MultiLine" Height="80px"></asp:TextBox>
                        </td>

                    </tr>

                    <tr>

                        <td class="auto-style5"></td>
                        <td class="auto-style4">
                            <asp:Button ID="btnMoneyReceipt" runat="server" Text="Money Receipt" ValidationGroup="valGCommon"
                                CssClass="buttonField" Width="120px" OnClick="btnMoneyReceipt_Click" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                      

                        </td>

                    </tr>

                    <tr>

                        <td class="auto-style5"></td>
                        <td class="auto-style4">
                            &nbsp;</td>

                    </tr>

                </table>
            </fieldset>

            <table>
                <tr>

                    <td class="auto-style5"></td>
                    <td class="auto-style4">&nbsp;</td>

                </tr>

                <tr>

                    <td class="auto-style5"></td>
                    <td class="auto-style4"></td>

                </tr>


                <tr>

                    <td class="auto-style5"></td>
                    <td class="auto-style4"></td>

                </tr>

                <tr>

                    <td class="auto-style5"></td>
                    <td class="auto-style4">

                        <asp:SqlDataSource ID="SqlDSlkp_DoctorsName" runat="server"
                            ConnectionString="<%$ ConnectionStrings:OnLinePrescriptionConnectionString %>"
                            ProviderName="System.Data.SqlClient"
                            SelectCommand="select DNCode,DoctorName from lkp_DoctorsName order by DNCode"></asp:SqlDataSource>

                    </td>

                </tr>

                <tr>

                    <td class="auto-style5"></td>
                    <td class="auto-style4"></td>

                </tr>

                <tr>

                    <td class="auto-style5"></td>
                    <td class="auto-style4">
                        <telerik:RadWindowManager ID="RadWindowManager" runat="server">
                        </telerik:RadWindowManager>
                    </td>

                </tr>

                <tr>
                    <td class="auto-style6"></td>
                    <td class="auto-style2">
                        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">

                            <AjaxSettings>
                                <telerik:AjaxSetting AjaxControlID="txtPatientId">
                                    <UpdatedControls>
                                        <telerik:AjaxUpdatedControl ControlID="txtPatientName" UpdatePanelCssClass="" />
                                        <telerik:AjaxUpdatedControl ControlID="txtYear" UpdatePanelCssClass="" />
                                        <telerik:AjaxUpdatedControl ControlID="txtMonth" UpdatePanelCssClass="" />
                                        <telerik:AjaxUpdatedControl ControlID="txtDay" UpdatePanelCssClass="" />
                                    </UpdatedControls>
                                </telerik:AjaxSetting>

                                <telerik:AjaxSetting AjaxControlID="RadTextBox1">
                                    <UpdatedControls>
                                        <telerik:AjaxUpdatedControl ControlID="txtPatientName" UpdatePanelCssClass="" />
                                    </UpdatedControls>
                                </telerik:AjaxSetting>

                                <telerik:AjaxSetting AjaxControlID="ddlDoctorName">
                                    <UpdatedControls>
                                        <telerik:AjaxUpdatedControl ControlID="txtDoctorFee" UpdatePanelCssClass="" />
                                    </UpdatedControls>
                                </telerik:AjaxSetting>

                                <telerik:AjaxSetting AjaxControlID="btnMoneyReceipt">
                                </telerik:AjaxSetting>
                            </AjaxSettings>
                        </telerik:RadAjaxManager>
                    </td>                   
                </tr>

                <tr>

                    <td class="auto-style5"></td>
                    <td class="auto-style4">
                        <cc1:ToolkitScriptManager ID="ToolkitSM_DoctorVisitInfo" runat="server">
                        </cc1:ToolkitScriptManager>
                    </td>

                </tr>

            </table>
        </div>

    </form>
</body>
</html>
