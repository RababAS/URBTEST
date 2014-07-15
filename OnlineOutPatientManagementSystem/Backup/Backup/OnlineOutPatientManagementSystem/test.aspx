<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="OnlineOutPatientManagementSystem.test" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title></title>
        <script src="Scripts/modernizr.custom.input.js" type="text/javascript"></script>
        <!-- Style Includes -->
        <link href="Styles/css/jquery.window.css" rel="stylesheet" type="text/css" />
        <link href="Styles/JQUI/jquery-ui-1.8.21.custom.css" rel="stylesheet" type="text/css" />

        <!-- JavaScript Includes -->
        <script src="Scripts/jquery-1.3.2.js" type="text/javascript"></script>

        <script src="Scripts/jquery-ui-1.8.21.custom.min.js" type="text/javascript"></script>

        <script src="Scripts/jquery.window.min.js" type="text/javascript"></script>
        


<script type="text/javascript">
    Modernizr.load({

        test: Modernizr.inputtypes.pattern && Modernizr.inputtypes.required && Modernizr.inputtypes.placeholder,
        nope: "scripts/h5f.min.js",
        callback: function (url, result, key) {
            H5F.setup(document.getElementById("form1"));
        }


    });

    function hell()
    { alert("Hello Hell")}
    
</script>
       
    </head>
    <body>
        <form id="form1" runat="server">

            <div>
                <asp:Button ID="Button2" runat="server" Text="Button" onclick="Button2_Click" />
                
                <asp:TextBox ID="TextBox1" pattern=[1-9]{2} title="must be 0.d" runat="server" placeholder="Entere Something" required="true"></asp:TextBox>
                <input id="Button1" type="button" value="button" onclick="test()" />
                <asp:Label   ID="Label1" runat="server" Text="Label"></asp:Label>
               

                <input id="Button3" type="button" value="button" onclick="testa()" /><div>
               
               <div id="dockE" style="background-color:Blue"></div>
               </div>

            </div>

            <div>
            
            <h1 style="font-family:Tempus Sans ITC; font-size:50px; color:white;background-color:#841911">URB Online 
                OutPatient Management System </h1>   


<h1 style="font-family:Edwardian Script ITC; font-size:50px; letter-spacing:2px; font-weight:bold;">URB Online 
    OutPatient Management System</h1>   


<h1 style="font-family:Blackadder ITC; font-size:50px;">URB Online OutPatient 
    Management System </h1>


<h1 style="font-family:Viner Hand ITC; font-size:50px;">URB Online OutPatient 
    Management System </h1>


<h1 style="font-family:#; font-size:50px;">URB Online OutPatient Management System</h1>


            </div>
        </form>

 <script type="text/javascript">
 
            function test() {
            

                var tit = "Rabab";
                var wnd = $.window.getAll();
                for (var i = 0; i < wnd.length; i++) {
                    tit = tit + i;
                }


                    var samw = $("#dockE").window({
                        url: "urb-bd.org", title: tit,
                        dock: 'left',       // change the dock direction: 'left', 'right', 'top', 'bottom'
                        maximizable: false,
                        checkBoundary: true, showRoundCorner: true, x: 1, y: 1
                    });

                  

                       
                }


                function testa() {
                    var wnd = $.window.getAll();
                    wnd[wnd.length-1].select();
                    
                }
        </script>

    </body>
</html>
