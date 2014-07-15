
/// <reference path="jquery-1.3.2.js" />
/// <reference path="jquery-2.0.2.min.js" />

// For Broser Dependency as  many browser does'nt support window.load
$(window).resize(function () {
    if ($(window).width() > 480)
        AdjustContainer();
    //else
    //{ $("mnuSeperator span").text("Menu")}

    //$("#leftcontainer").css("height", $("#footer").offset().top- $("#header").height());

});
// For Broser Dependency  many browser does'nt support window.resize 
$(window).load(function () {

    if ($(window).width() > 480)
        AdjustContainer();

});

// Adjust the layout after Createing Default Form Layout in SiteLaoyout CSS

function AdjustContainer() {
    // any element height=height+margin-top+margin-bottom+padding-top+padding-bottom+border-top+border-bottom

    var containerHeight = $("#header_container").outerHeight();
    var containerTop = $("#footer_container").offset().top - containerHeight;

    $("#leftcontainer").css("top", containerHeight);
    $("#leftcontainer").css("height", containerTop);
    $("#container").css("top", containerHeight);
    $("#container").css("height", containerTop);
    $("#mnuSeperator").css("top", containerHeight);
    $("#mnuSeperator").css("height", containerTop);
 
    JQWindowsAdjustment();

    /*if (containerWnd != null) {
    containerWnd.resize($("#container").innerWidth() - 21, $("#container").innerHeight());
    //containerWnd.setTitle( "Hello");
    }*/
}

//this is for jQuery Windows adjustment in the container DIIV

function JQWindowsAdjustment() {
    curActivteWindows = $.window.getAll();

    for (var i = 0; i < curActivteWindows.length; i++)
        curActivteWindows[i].resize($("#container").innerWidth() - 21, $("#container").innerHeight())
}

// For Menu Hide and Show

function mnuView(mnuName) {

    var mnu;

    mnu = document.getElementById(mnuName);

    mnu.style.display = (mnu.style.display != 'none' ? 'none' : 'block');

    if (mnu.style.display == 'block') {
        document.getElementById('container').style.width = '73.5%';
        // $("#container").style['margin-left'] = '25%';
        //document.getElementById('container').style['margin-left'] = '25

        $("#container").css('margin-left', '25%');
        $("#mnuSeperatorImg").attr('src', 'Images/minus.png');
    }
    else {
        document.getElementById('container').style.width = '93.5%';
        //document.getElementById('container').style['margin-left']= '30%';

        $("#container").css('margin-left', '5%');
        $("#mnuSeperatorImg").attr('src', 'Images/plus.png');

    }

    if (containerWnd != null) {
        containerWnd.resize($("#container").innerWidth() - 21, $("#container").innerHeight());

    }
    
    JQWindowsAdjustment();
    
    /*if (containerWnd != null) {
    containerWnd.resize($("#container").innerWidth() - 21, $("#container").innerHeight());

    }*/
    //el.style.display = (el.style.display != 'none' ? 'none' : '' );       
}

// This Function is used to navigate different page.

function RefreshContentForUL(URL, wndTitle) {

    //$.window({ title: "rabab",showModal:true });

    var containerHeight = $("#container").innerHeight();
    var containerWidth = $("#container").innerWidth() - 21;

    var allWnd = $.window.getAll();
    for (var i = 0;i < allWnd.length;i++) {
        if (allWnd[i].getTitle() == wndTitle) {
            $.window.hideAll();
            allWnd[i].show();
           
           
            return;
        }

    }
    $.window.hideAll();
    // assign the dock area
    containerWnd = $("#container").window({
        url: URL,
        title:wndTitle,
        dock: 'left',       // change the dock direction: 'left', 'right', 'top', 'bottom'
        showFooter:false,
        checkBoundary: true,
        animationSpeed: 200,  // set animation speed
        minWinLong: 180,       // set minimized window long dimension width in pixel
        maximizable:false,bookmarkable:false,
        height: containerHeight, width: containerWidth

    });

    containerWnd.move(0, 0);
    containerWnd.select();
    //containerWnd.select();
    
}