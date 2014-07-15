<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DoctorEntry.aspx.cs" Inherits="OnlineOutPatientManagementSystem.UI.DoctorEntry" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Doctor Entry</title>
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
                    Doctor Name Entry</td>
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
                    <asp:Label ID="lblDoctorName" runat="server" Text="Doctor Name:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtDoctorName" runat="server" CssClass="txtField" 
                        placeholder="Input Doctor Name" MaxLength="50" pattern=".{3,50}" 
                        title="3 to 50 characters" required="required"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblDescription" runat="server" Text="Doctor Description:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtDescription" runat="server" CssClass="txtAreaField" 
                        MaxLength="200" pattern=".{3,200}" title="3 to 200 characters" required="required" TextMode="MultiLine"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:CheckBox ID="chkURBDoctor" runat="server" Text="URB Doctor" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblDoctorFee" runat="server" Text="Doctor Fee:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtDoctorFee" runat="server" CssClass="txtField num" 
                        type="number" pattern="\d{1,4}" title="Numeric Only" required="required"></asp:TextBox>
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
                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="buttonField" />
                    <asp:Button ID="btnClose" runat="server" Text="Close" CssClass="buttonField" OnClientClick="window.close();"/>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
