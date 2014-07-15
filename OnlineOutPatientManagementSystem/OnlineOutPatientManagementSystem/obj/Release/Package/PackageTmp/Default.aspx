<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="OnlineOutPatientManagementSystem.Default" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" class="no-js" >
    <head runat="server">
        <title></title>

        <link href="Styles/SiteLayout.css" rel="stylesheet" type="text/css" />

        <link href="Styles/css/jquery.window.css" rel="stylesheet" type="text/css" />
        <link href="Styles/JQUI/jquery-ui-1.8.21.custom.css" rel="stylesheet" type="text/css" />
        
        <script src="Scripts/jquery-1.7.1.js" type="text/javascript"></script>

        <script src="Scripts/jquery-ui-1.8.21.custom.min.js" type="text/javascript"></script>

        <script src="Scripts/jquery.window.js" type="text/javascript"></script>
        <script src="Scripts/SiteLayout.js" type="text/javascript"></script>

        <script src="Scripts/jquery.window.min.js" type="text/javascript"></script>
        <script src="Scripts/modernizr-2.6.2.js" type="text/javascript"></script>

    </head>
    <body>
        <form id="form1" runat="server">

            <div id="Wrapper">
                <div id="header_container">
                    <div id="header" class="HedearFont">
                        URB Online OutPatient Management System
                    </div>
                    
                </div>
                <div id='leftcontainer'>
                    
                    <div id="mnuContainer">
                        <div id="accordion">
                            <h4>
                                <a href="#">Receiption</a>
                            </h4>
                            <div>
                                <ul>
                                    <li onclick="RefreshContentForUL('UI/Receiption/RegistrationGrid.aspx','Registerd Patient')">
                                        <a href="#">Registration List</a>
                                    </li>

                                     <li onclick="window.location='UI/Prescription/frmPrescriptionFrontPage.aspx';">
                                        <a href="#">Prescription List</a>
                                    </li> 

                                    <%--<li onclick="RefreshContentForUL('UI/Prescription/frmPrescriptionFrontPage.aspx','Prescription')">
                                        <a href="#">Prescription</a>
                                    </li>--%>

                                                                
                                </ul>

                            </div>


                            <h4>
                                <a href="#">Cash Counter</a>
                            </h4>
                            <div>
                                    <ul>
                                    <li onclick="RefreshContentForUL('UI/CashCounter/frmDoctorVisitInfo.aspx','Doctors Visit Info')">
                                        <a href="#">Doctors Visit Info</a>
                                    </li>

                                    <li onclick="RefreshContentForUL('UI/CashCounter/frmTestOrderEntry.aspx','Test Order Entry')">
                                        <a href="#">Test Order Entry</a>
                                    </li>


                                    <%--<li onclick="RefreshContentForUL('test.aspx','wndTitle')">
                                        <a href="#">Doctor's Visit</a> 
                                    </li>--%>

                                </ul>
                             </div>


                             <h4>
                                <a href="#">Reports</a>
                            </h4>
                            <div>
                                    <ul>
                                        <li onclick="RefreshContentForUL('Report/ReportMenue/frmReportPrescription.aspx','Doctor Visit')">
                                            <a href="#">Prescription</a>
                                        </li> 

                                        <li onclick="RefreshContentForUL('Report/ReportMenue/frmReportDoctorVisitMoneyReceipt.aspx','Money Receipt')">
                                            <a href="#">Doctor Visit Money Receipt</a>
                                        </li> 

                                         <li onclick="RefreshContentForUL('Report/ReportMenue/frmReportLabTest.aspx','Lab Test')">
                                            <a href="#">Report Lab Test</a>
                                        </li> 

                                        <li onclick="RefreshContentForUL('Report/ReportMenue/frmReportDoctorVisit.aspx','Doctor Visit')">
                                            <a href="#">Doctor Visit</a>
                                        </li>

                                   <%-- <li onclick="RefreshContentForUL('Report/ReportMenue/frmReportPrescription.aspx','Prescriptions')">
                                        <a href="#">Prescriptions</a> 
                                    </li>--%>

                                </ul>
                             </div>

                            <h4>
                                <a href="#">Edit Options</a>
                            </h4>
                            <div>
                                 <ul>
                                       <li onclick="window.location='UI/Edit/frmPrescriptionFrontEdit.aspx';">
                                        <a href="#">Prescription Edit</a>
                                    </li> 

                                    <%--<li onclick="RefreshContentForUL('UI/Edit/frmPrescriptionFrontEdit.aspx','Prescription Edit')">
                                        <a href="#">Prescription Edit</a>
                                    </li>--%>                                
                                </ul>
                             </div>


                        </div>

                    </div>

                </div>

                <div id="mnuSeperator" style="text-align:center;">
                    <a href="javascript:mnuView('leftcontainer')" >
                        <img id="mnuSeperatorImg"  src="/Images/minus.png" style="border:none;" />
                    </a>
                    <span style="color:Yellow"> <br />
                        M <br />
                        E <br />
                        N <br />
                        U <br /> </span>
                </div>
                <div id="container">
                    

                </div>
                <div id="footer_container">

                    <div id="footer">
                        (C) 2001-2020 <a href="#">UChicag Research Bangladesh</a> | <a href="#">Privacy Notice</a>  |  <a href="#">Legal</a>
                    </div>
                </div>
            </div>

        </form>
 <script   type="text/javascript">


 // The Public Variable for Currnet Container Window
     var containerWnd = null;

     function test() {
         var aa = $.window.getAll();
         for (var i = 0; i < aa.length;i++ )
             alert(aa[i].getWindowId());
      }



      $(document).ready(function () {
          $("#accordion").accordion();

         /* if (Modernizr.borderradius) {
              $('#container').addClass('borderRadiusStyle');
              
                  alert("hello");
              
          }*/
          

      });
        </script>
    </body>
</html>
    