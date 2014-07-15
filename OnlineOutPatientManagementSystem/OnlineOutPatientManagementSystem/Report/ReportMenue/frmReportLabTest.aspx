<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmReportLabTest.aspx.cs" Inherits="OnlineOutPatientManagementSystem.Report.ReportMenue.frmReportLabTest" %>


<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <title>Prescription Report</title>
    <script src="../../Scripts/UDScripts/ForReport.js"></script>

    <script src="../../Scripts/jquery-1.4.1-vsdoc.js" type="text/javascript"></script>

    <script lang="javascript" type="text/javascript">

    </script>

    <style type="text/css">
        #ReportPrescription 
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
            alert('Visit ID not foun please check!');
            //window.parent.parent.parent.location.reload();
            $('#txtVisitID').focus(function () {
                $(this).val('');
            });
        }

        function openReport() {

            var strLabTestID = document.getElementById('txtLabTestID').value;

            var url = "../frmCommonReportViewer.aspx?prmReportNmae=LabTest &prmLabTestID=" + strLabTestID;
            ViewReport(url);

            //myWindow = window.open(url);
            //myWindow.focus();

            //window.location = '~/Default.aspx';
        }

     



</script>


</head>
<body>
    <form id="ReportPrescription" runat="server">

        <div class="Header">
            <br />
            Lab Test Report
        </div>

      
       
        
        <div class="style100">
            <fieldset>
                <table class="style100">
                    <tr>
                        <td class="style30">
                            <asp:Label ID="Label1" runat="server" Text="Lab Test ID:"></asp:Label>
                        </td>

                        <td class="style70">
                            <asp:TextBox ID="txtLabTestID" runat="server" CssClass="validate[required]" AutoPostBack="true"
                                placeholder="Input Lab Test ID" MaxLength="12"
                                onFocus="this.select()"
                                OnTextChanged="txtLabTestID_TextChanged">
                            </asp:TextBox>
                            
                        </td>
                    </tr>

                    <tr>
                        <td class="style30"></td>

                        <td class="style70">
                            <input id="btnPreview" runat="server" type="button" value="Preview" onclick="openReport();" />
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


