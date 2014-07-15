<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmCommonReportViewer.aspx.cs" Inherits="OnlineOutPatientManagementSystem.Report.frmCommonReportViewer" %>

<%@ Register assembly="Telerik.ReportViewer.WebForms, Version=7.2.14.127, Culture=neutral, PublicKeyToken=a9d7983dfcc261be" namespace="Telerik.ReportViewer.WebForms" tagprefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <title>Prescription Input Edit</title>


    <script src="../../Scripts/jquery-1.4.1-vsdoc.js" type="text/javascript"></script>

    <script lang="javascript" type="text/javascript">

    </script>

    <style type="text/css">
        #CommonReportViewer 
        {
            width: 85%;
            display: block;
            margin-top: 50px;
            margin-bottom: auto;
            margin-left: 100px;
            margin-right: 100px;
           background-color:#FFFFFF;
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

        </style>

    <script src="../Scripts/jsFunctions.js"></script>



</head>
<body>
    <form id="frmCommonReportViewer" runat="server">

     <div class="style100">
            <fieldset>
                <table class="style100">
                    <tr>
                        <td class="style100">
                            
                            <telerik:ReportViewer ID="rvCommonReportViewer" runat="server" Height="600px" Width="100%"></telerik:ReportViewer>
                            
                        </td>
                    </tr>

                    <tr>
                        <td class="style100">

                            &nbsp;</td>
                    </tr>

                </table>
            </fieldset>
        </div>

     <div>
    </div>

    </form>
</body>
</html>