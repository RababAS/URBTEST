<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportDelevery.aspx.cs" Inherits="OnlineOutPatientManagementSystem.UI.ReportDelevery" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Report Delevery</title>
    <link href="../Styles/FormControlStyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width:100%;">
            <tr>
                <td>
                    &nbsp;</td>
                <td style="text-align:left;font-size:x-large;font-style:normal;font-weight:bold">
                    Report Delevery</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblTestId" runat="server" Text="Test ID:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtTestId" runat="server" CssClass="txtField" type="number" 
                        placeholder="Input Test ID" MaxLength="12" pattern="\d{12}" 
                        title="Required 12 digit Test ID" required="required"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblPatientId" runat="server" Text="Patient ID:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPatientId" runat="server" CssClass="txtField" ReadOnly="True"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblPatientName" runat="server" Text="Patient Name:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPatientName" runat="server" ReadOnly="True" 
                        CssClass="txtField"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblReqDate" runat="server" Text="Requisition Date:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtReqDate" runat="server" ReadOnly="True"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblDeliveryDate" runat="server" Text="Delivery Date:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtDeliveryDate" runat="server" ReadOnly="True"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:CheckBox ID="chkPaymentDue" runat="server" Checked="True" 
                        Enabled="False" Text="Payment Due" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Label ID="lblTestDetails" runat="server" Text="Test Details:"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                        <Columns>
                            <asp:TemplateField HeaderText="SL">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Test Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblTestName" runat="server" Text=""></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:CheckBox ID="chkReportDelevered" runat="server" Text="Report Delevered" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblDeliveredDate" runat="server" Text="Delivered Date:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtDeliveredDate" runat="server" ReadOnly="True"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Button ID="btnCommit" runat="server" Text="Commit" 
                        CssClass="buttonField" />
                    <asp:Button ID="btnClose" runat="server" Text="Close" CssClass="buttonField" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
