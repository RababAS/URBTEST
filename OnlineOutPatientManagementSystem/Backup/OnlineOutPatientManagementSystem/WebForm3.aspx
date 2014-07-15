<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="OnlineOutPatientManagementSystem.WebForm3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" class="no-js" >
    <head id="Head1" runat="server">
        <title></title>

        <link href="Styles/JQUI/jquery-ui-1.8.21.custom.css" rel="stylesheet" type="text/css" />
        
        <script src="Scripts/jquery-1.7.1.js" type="text/javascript"></script>

        <script src="Scripts/jquery-ui-1.8.21.custom.min.js" type="text/javascript"></script>

       

    </head>
    <body>
        <form id="form1" runat="server">

       
                

                  
                        <div id="accordion">
                            <h4>
                                <a href="#">Receiption</a>
                            </h4>
                            <div>
                                <ul>
                                    <li onclick="RefreshContentForUL('/UI/Receiption/RegistrationGrid.aspx','Registerd Patient')">
                                        <a href="#">Registration</a>
                                    </li>

                                </ul>

                            </div>
                            <h4>
                                <a href="#">Cash Counter</a>
                            </h4>
                            <div>
                                    <ul>
                                    <li onclick="RefreshContentForUL('test.aspx','wndTitle')">
                                        <a href="#">Doctor's Visit</a>
                                    </li>

                                </ul>
                             </div>
                        </div>

         

        

             
               
          

        </form>
 <script   type="text/javascript">


     // The Public Variable for Currnet Container Window
   


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
    