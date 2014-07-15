<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="OnlineOutPatientManagementSystem.Accounts.LogIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
 .logInPosition
  {
    height: 475px;
    width:375px; 
    position: relative;
    background-repeat: no-repeat;
    background-image: url(BackgroundURB.jpg);
    text-align:center;
    margin: auto;
    top:12px;  
  }


    </style>
  </head>
<body>
    <div class="logInPosition">
   
    <form id="form1" runat="server">
   
    <div>
        <br />
        <br />
        <asp:Label ID="lblUserName" runat="server" ForeColor="White" Text="User Name" Width="100px"></asp:Label>
        <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="UserName" runat="server" ErrorMessage="Enter User Name" ControlToValidate="txtUserName" ForeColor="White">*</asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Label ID="lblPassword" runat="server" ForeColor="White" Text="Password" Width="100px"></asp:Label>
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="Password" runat="server" ErrorMessage="Enter Password" ControlToValidate="txtPassword" ForeColor="White" >*</asp:RequiredFieldValidator>
        <br />
    </div>
        <div>

            <br />
            <br />
            <br />                      
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
           <asp:Button ID="btnLogIn" runat="server" Text="LogIn" OnClick="Button1_Click" />

        </div>
        <div style="color:red">
            <asp:Label ID="lblErrorMessage"  runat="server"></asp:Label>
            <br />
            <asp:ValidationSummary ID="ValidationSummary" runat="server" ForeColor="Red" />
        </div>
    </form>
    </div>
</body>
</html>
