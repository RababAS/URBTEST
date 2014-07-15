<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="OnlineOutPatientManagementSystem.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body  >
    <form id="form1" runat="server" >
    <div>
        <asp:TextBox ID="TextBox1" runat="server" placeholder="test"></asp:TextBox>
    
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        <asp:TextBox ID="TextBox2" runat="server" placeholder="test"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Button" OnClientClick="Test(); return false;  " 
            onclick="Button1_Click" />
    </p>
    <p>
        &nbsp;</p>
        
        
     </div>


    </form>
    <script type="text/javascript">

        /// newwindow = window.open("www.urb-bd.org", 'name', 'height=200,width=150');


        function Test() {
            alert("From TEst");
        
        }
    </script>

</body>
</html>
