<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmReportDelevery.aspx.cs" 
    Inherits="OnlineOutPatientManagementSystem.UI.CashCounter.frmReportDelevery" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <title>Report Delevery</title>


    <script src="../../Scripts/jquery-1.4.1-vsdoc.js" type="text/javascript"></script>

    <script lang="javascript" type="text/javascript">

    </script>

    <style type="text/css">
        #ReportDelevery 
        {
            width: 582px;
            display: block;
            margin-top: 50px;
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

        .auto-style2 {
            width: 70%;
            height: 28px;
        }

    </style>


</head>
<body>
    <form id="ReportDelevery" runat="server">

        <div class="style1">
            <fieldset>
                <table class="style100">

                    <tr>
                        <td class="style100" style="text-align: center; font-size: x-large; font-style: normal; font-weight: bold">Report Delevery
                        </td>
                    </tr>

                </table>
            </fieldset>
        </div>

        <div>
            <fieldset>
                <table class="style100">

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
                            &nbsp;</td>
                       
                    </tr>


                    <tr>

                        <td class="auto-style5"></td>
                        <td class="auto-style4">
                            &nbsp;</td>

                    </tr>

                    <tr>

                        <td class="auto-style5">
                            &nbsp;</td>
                        <td class="auto-style4">

                             &nbsp;</td>

                    </tr>

                    <tr>

                        <td class="auto-style5">
                            &nbsp;</td>
                        <td class="auto-style4">
                            &nbsp;</td>

                    </tr>


                    <tr>

                        <td class="auto-style5">
                            &nbsp;</td>
                        <td class="auto-style4">
                            &nbsp;</td>

                    </tr>

                    <tr>

                        <td class="auto-style5"></td>
                        <td class="auto-style4">

                        </td>

                    </tr>

                    <tr>

                        <td class="auto-style5"></td>
                        <td class="auto-style4"></td>

                    </tr>

                </table>
            </fieldset>

            <table class="style100">
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