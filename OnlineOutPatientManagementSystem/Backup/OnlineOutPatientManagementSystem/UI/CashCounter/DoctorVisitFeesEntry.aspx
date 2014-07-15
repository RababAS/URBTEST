<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DoctorVisitFeesEntry.aspx.cs" Inherits="OnlineOutPatientManagementSystem.UI.DoctorVisitFeesEntry" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Doctors Fee</title>

    <link href="../Styles/FormControlStyle.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        .style1
        {
            width: 140px;
        }
        .style2
        {
            width: 222px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width:100%;">
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td class="style2" style="text-align:left;font-size:x-large;font-style:normal;font-weight:bold">
                    Doctor Visit Info</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:Label ID="lblPatientId" runat="server" Text="Patient ID :"></asp:Label>
                </td>
                <td class="style2">
                    <asp:TextBox ID="txtPatientId" runat="server" CssClass="txtField" type="number" placeholder="Input Patient ID" MaxLength="11" pattern="\d{11}" title="Required 11 digit Patient ID" required="required"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:Label ID="lblPatientName" runat="server" Text="Patient Name :"></asp:Label>
                </td>
                <td class="style2">
                    <asp:TextBox ID="txtPatientName" runat="server" ReadOnly="True" 
                        CssClass="txtField"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:Label ID="lblVisitId" runat="server" Text="Visit ID :"></asp:Label>
                </td>
                <td class="style2">
                    <asp:TextBox ID="txtVisitId" runat="server" ReadOnly="True" CssClass="txtField"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:Label ID="lblVisitDate" runat="server" Text="Visit Date :"></asp:Label>
                </td>
                <td class="style2">
                    <asp:TextBox ID="txtVisitDate" runat="server"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td class="style2">
                    <asp:CheckBox ID="chkRegistrationFee" runat="server" Checked="True" 
                        Enabled="False" Text="Registration Fee" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:Label ID="lblDoctorName" runat="server" Text="Doctor Name :"></asp:Label>
                </td>
                <td class="style2">
                    <asp:DropDownList ID="ddlDoctorName" runat="server" CssClass="comboField">
                    </asp:DropDownList>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:Label ID="lblDoctorFee" runat="server" Text="Doctor Fee :"></asp:Label>
                </td>
                <td class="style2">
                    <asp:TextBox ID="txtDoctorFee" runat="server" ReadOnly="True" 
                        CssClass="txtField num" Width="150px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td class="style2">
                    <asp:Button ID="btnMoneyReceipt" runat="server" Text="Money Receipt" 
                        CssClass="buttonField" Width="100px" onclick="btnMoneyReceipt_Click" />
                    <asp:Button ID="btnClose" runat="server" Text="Close" CssClass="buttonField" 
                        onclick="btnClose_Click" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
