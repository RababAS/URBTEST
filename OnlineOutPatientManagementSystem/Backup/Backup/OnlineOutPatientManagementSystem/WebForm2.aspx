<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="OnlineOutPatientManagementSystem.WebForm2" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-2.0.2.min.js" type="text/javascript"></script>

    <style>
  p { color:red; margin:5px; cursor:pointer; }
  p.hilite { background:yellow; }
  </style>

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div id="hel">
            <telerik:RadWindowManager ID="RadWindowManager1" runat="server">
            </telerik:RadWindowManager> 
        <asp:TextBox ID="TextBox1" runat="server" required title="Hellow"></asp:TextBox>
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
                <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="Button3">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="ScriptManager1" UpdatePanelCssClass="" />
                            <telerik:AjaxUpdatedControl ControlID="Button3" UpdatePanelCssClass="" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                </AjaxSettings>
            </telerik:RadAjaxManager>
        </div>
        <asp:Button ID="Button1"
            runat="server" Text="Button" onclick="Button1_Click" />
        <asp:DropDownList ID="ddlTest" runat="server">
            <asp:ListItem>a</asp:ListItem>
            <asp:ListItem>a</asp:ListItem>
            <asp:ListItem>b</asp:ListItem>
            <asp:ListItem>c</asp:ListItem>
            <asp:ListItem>d</asp:ListItem>
            <asp:ListItem>e</asp:ListItem>
            <asp:ListItem>f</asp:ListItem>
        </asp:DropDownList>
        <input id="Button2" type="button" value="button" onclick="hel()" /><asp:ScriptManager 
            ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
&nbsp;<p>hello</p>
    
     <asp:Button ID="Button3" runat="server" onclick="Button3_Click" Text="Button" />
    </div>

    <script type="text/javascript">
        var today = new Date.today().toString("dd-mm-yyyy");
        alert(today);
       
        $('p').click(function () {
            

            alert("test");
            // handleControlDisplay(this);
        });  // patient type live end
        $('#ddlTest').change(function () {


            alert("test");
            // handleControlDisplay(this);
        });  // patient type live end

        function hel() {
            $("#hel").children().attr("disabled", "disabled");
            alert("aa");
         }

    </script>
    </form>
</body>
</html>
