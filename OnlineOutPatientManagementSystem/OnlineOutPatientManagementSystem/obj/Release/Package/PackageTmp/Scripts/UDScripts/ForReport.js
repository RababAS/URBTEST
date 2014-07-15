function ViewReport(URL) {

    var wnd = window.radopen(URL, null);
   
    wnd.setSize(900, 600);
    wnd.moveTo("10px","10px")
    wnd.set_title("Report Viewer");
    wnd.set_visibleStatusbar(false);
    //wnd.showRoundCorner(true);
    return false;

}

