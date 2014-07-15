﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmReportDoctorVisitMoneyReceipt.aspx.cs" 
    Inherits="OnlineOutPatientManagementSystem.Report.ReportMenue.frmReportDoctorVisitMoneyReceipt" %>


<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <title>Prescription Report</title>


     <script src="../../Scripts/jquery-1.4.1-vsdoc.js" type="text/javascript"></script>
    

    
    <link href="../../ValidationEngine.css" rel="stylesheet" />

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://cdn.ucb.org.br/Scripts/formValidator/js/languages/jquery.validationEngine-en.js"
        charset="utf-8"></script>
    <script type="text/javascript" src="http://cdn.ucb.org.br/Scripts/formValidator/js/jquery.validationEngine.js"
        charset="utf-8"></script>
    <script src="../../Scripts/UDScripts/ForReport.js"></script> 
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
    

    <style type="text/css">
        #ReportDoctorVisitMoneyReceipt 
        {
            width: 50%;
            display: block;
            margin-top: 20px;
            margin-bottom: auto;
            margin-left: 50px;
            margin-right: 50px;
        }
        .style100
        {
            width: 100%;
        }

        .style70
        {
            width: 70%;
        }

        .style50
        {
            width: 50%;
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

         .style10
        {
            width: 10%;
        }

         .Header
		{
            color: white;
			text-align: center;
            font-size:xx-large;
            font-weight:bold;
            background-color:red;
            height:100px; 
            background-color:#620F2C;
		}

        </style>


    <script type="text/javascript"  lang="javascript">

        function PageOpen() {
            window.location = '/Default.aspx';
            return false
        }


        function Showalert() {
            alert('Patient ID not foun please check!');
            //window.parent.parent.parent.location.reload();
            $('#txtVisitID').focus(function () {
                $(this).val('');
            });
        }

        function openReport() {

            var strPatientID = document.getElementById('txtPatientID').value;

            var url = "../frmCommonReportViewer.aspx?prmReportNmae=DoctorVisitMoneyReceipt &prmPatientId=" + strPatientID;
            ViewReport(url);

            //myWindow = window.open(url);
            //myWindow.focus();

            //window.location = '~/Default.aspx';
        }

     



</script>


</head>
<body>
    <form id="ReportDoctorVisitMoneyReceipt" runat="server">

        <div class="Header">
            <br />
            Doctor Visit Money Receipt Report
        </div>


        
        <div class="style100">
            <fieldset>
                <table class="style100">
                    <tr>
                        <td class="style30">
                            <asp:Label ID="Label1" runat="server" Text="Patient ID"></asp:Label>
                        </td>

                        <td class="style70">
                            
                            <asp:TextBox ID="txtPatientID" runat="server" AutoPostBack="True" type="number" CssClass="validate[required]"
                                placeholder="Input Patient ID" MaxLength="11" pattern="\d{11}"
                                onFocus="this.select()" onkeypress="return IsNumeric(event);"
                                OnTextChanged="txtPatientID_TextChanged">
                            </asp:TextBox>

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPatientID" forecolor="Red"
							ValidationGroup='valGCommon' ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>

                             <span id="error" style="color: Red; display: none">* Input digits (0 - 9)</span>
                            
                        </td>
                    </tr>

                    <tr>
                        <td class="style30"></td>

                        <td class="style70">
                            <input id="btnPreview" runat="server" type="button" value="Preview" validationgroup="valGCommon"
                                onclick="openReport();" />
                        </td>
                    </tr>

                    <tr>
                        <td class="style30"></td>

                        <td class="style70"></td>
                    </tr>

                </table>
            </fieldset>
        </div>

     <div>
         <table class="style100">
             <tr>
                 <td class="style50"></td>

                 <td class="style50"></td>
             </tr>

             <tr>
                 <td class="style50"></td>

                 <td class="style50"></td>
             </tr>

             <tr>
                 <td class="style50"></td>

                 <td class="style50"></td>
             </tr>

             <tr>
                 <td class="style50"></td>

                 <td class="style50"></td>
             </tr>

             <tr>
                 <td class="style50">
                     <telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
                     </telerik:RadScriptManager>
                 </td>

                 <td class="style50"></td>
             </tr>

             <tr>
                 <td class="style50">
                     <telerik:RadWindowManager ID="RadWindowManager1" runat="server">
                     </telerik:RadWindowManager>
                 </td>

                 <td class="style50"></td>
             </tr>

             <tr>
                 <td class="style50">
                        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
                            <AjaxSettings>

                                <telerik:AjaxSetting AjaxControlID="txtVisitID">
                                    <UpdatedControls>
                                        <telerik:AjaxUpdatedControl ControlID="btnPreview" UpdatePanelCssClass="" />
                                    </UpdatedControls>
                                </telerik:AjaxSetting>

                            </AjaxSettings>
                        </telerik:RadAjaxManager>
                    </td>

                 <td class="style50"></td>
             </tr>

         </table>
    </div>

    </form>
</body>
</html>


