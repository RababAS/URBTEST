<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogInURB.aspx.cs" Inherits="URBControlPanel.Account.LogInURB" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <link rel="Shortcut Icon" href="/urb.ico" />  
    <title>LogIn</title>
<style type="text/css" media="screen">

body {
font-family: ariel;
font-size: 12px;

background-image:url('/bggradient.jpg');

background-repeat: repeat-x;

margin: auto;
text-align: center;
color:White;
vertical-align: middle;
}
.logInPosition
{
    height: 475px;
    width:375px; 
    position: relative;
    background-repeat: no-repeat;
    background-image: url('backgroundURB.jpg');
    text-align:center;
    margin: auto;
    top:12px;  
}

</style>

</head>
<body>
    <form id="form1" runat="server">
    <div class="login_position">
  
    <p>
        
        <!--<asp:HyperLink ID="RegisterHyperLink" runat="server" EnableViewState="false">Register</asp:HyperLink> if you don't have an account. -->
    </p>
   <asp:Login ID="LoginUser" runat="server" EnableViewState="false" RenderOuterTable="false" OnLoginError="LoginUser_LoginError">
        <LayoutTemplate>
             <span class="failureNotification" style="color:Red;font-size:large;font-weight:bold">
                <asp:Literal ID="FailureText" runat="server"></asp:Literal>
                
             </span>
            
            <div class="logInPosition">
             
                    <legend>Account Information</legend>
                    <p>
                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Username:</asp:Label>
                        <asp:TextBox ID="UserName" placeholder="Your UserName" runat="server" CssClass="textEntry"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" 
                             CssClass="failureNotification" ErrorMessage="User Name is required." ToolTip="User Name is required." 
                             >*</asp:RequiredFieldValidator>
                    </p>
                    <p>
                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                        <asp:TextBox ID="Password" placeholder="Password" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" 
                             CssClass="failureNotification" ErrorMessage="Password is required." ToolTip="Password is required." 
                             >*</asp:RequiredFieldValidator>
                    </p>
                    <p>
                    <%--    <asp:CheckBox ID="RememberMe" runat="server"/>
                        <asp:Label ID="RememberMeLabel" runat="server" AssociatedControlID="RememberMe" CssClass="inline">Keep me logged in</asp:Label>
        --%>            </p>
                <br /><br /><br /> <br /><br /> <br /><br /> <br /><br /> <br /><br />                                                                                
                <p class="submitButton">
                    <asp:Button ID="LoginButton" runat="server" Text="Log In" OnClick="LoginButton_Click" style="height: 26px"/>
                </p>
            </div>
        </LayoutTemplate>
    </asp:Login>
     

    </div>
     
    
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />

    </form>
</body>
</html>
