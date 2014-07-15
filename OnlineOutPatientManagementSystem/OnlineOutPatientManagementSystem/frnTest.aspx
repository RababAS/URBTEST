<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frnTest.aspx.cs" Inherits="OnlineOutPatientManagementSystem.frnTest" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>
        <div>
            <input id="Button1" type="button" value="button" onclick="ViewReport('test');" />
    </div>
    </form>

    <script type="text/javascript">

        function ViewReport(URL) {

            var wnd = window.radopen(URL, null);
            wnd.set_title("Report Viewer");
            wnd.setSize(1100, 600);
            wnd.set_modal(true);
            wnd.set_visibleStatusbar(false);
            wnd.showRoundCorner(true);
            return false;

        }


    </script>
</body>
</html>
