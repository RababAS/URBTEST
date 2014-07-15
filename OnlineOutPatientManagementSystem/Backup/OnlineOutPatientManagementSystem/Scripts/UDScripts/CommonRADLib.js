
function OpenWindow(URL, wndName,IsModal,Title)
{

    var wnd = window.radopen(URL, wndName);

    wnd.set_title(Title);
    wnd.setSize($(window).width(), $(window).height());
    wnd.moveTo(0, 0);
    wnd.set_visibleStatusbar(false);
  // wnd.set_modal(IsModal);
    
    
    //wnd.set_width($(window).width());
    //wnd.set_height($(window).height());
    
    //wnd.set_autoSize(true);
    
    return false;
}
/// <reference path="../../UI/Receiption/Registration.aspx" />


function BtnAdd_onclick() {

    OpenWindow("../../UI/Receiption/Registration.aspx", "wndRegistration", true, "Patient Registration");


}



function OnClientClose(oWnd, args) {
    //get the transferred arguments
    var arg = args.get_argument();

    try {
        if (arg.DataSave=="Yes") {
            __doPostBack();
        }
        

    }
    catch (e) {

        return false;
    }

    function CloseThisWindow() {
        var oWnd = GetRadWindow();

        //Close the RadWindow and send the argument to the parent page
        oWnd.close();
    }
}








function GetRadWindow() {
    var oWindow = null;
    if (window.radWindow) oWindow = window.radWindow;
    else if (window.frameElement.radWindow) oWindow = window.frameElement.radWindow;
    return oWindow;
}

function returnToParent() {
    //create the argument that will be returned to the parent page

 //   if (isNaN(document.getElementById("txtVisitNo").value + 1))
   //     return;
    var oArg = new Object();

    //get the city's name
  
    
        oArg.VisitNo = "Hello"; //document.getElementById("txtVisitNo").value;

        
    //get a reference to the current RadWindow
    var oWnd = GetRadWindow();




    //Close the RadWindow and send the argument to the parent page
            oWnd.close(oArg);

    

}