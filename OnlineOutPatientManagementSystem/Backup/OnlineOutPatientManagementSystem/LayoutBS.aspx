<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LayoutBS.aspx.cs" Inherits="OnlineOutPatientManagementSystem.LayoutBS" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
     <meta name="viewport" content="width=device-width" />

    <title></title>


    <!-- CSS Links -->
    <link href="Styles/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="Styles/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />
    
    <!-- Scripts Links -->
<script src="Scripts/jquery-2.0.3.min.js" type="text/javascript"></script>
    <script src="Scripts/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    

</head>
    <body>
        
        <!-- Start fluid Container -->

        <div class="container-fluid">
            <!--Start Menu fluid Row-->
            <div class="row-fluid">
                <div class="span12" style="background-color:blue"> <!--Start Menu Span-->

                <div class="navbar">   <!--Start Navbar Top-->
                    
                <div class="navbar-inner"> <!--Start Navbar Inner-->

                    <div class="container-fluid "> <!--Start Container-->
                        
                        <!--Un Hide Navigation Should goes Here -->
  
                        
                        
                        <!--start hide menu bar-->
                        <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </a>
                        <!--end hide menu bar-->
                        

                        <!--Hide Navigation Should goew Here -->
                        
                        <div class="nav-collapse">  <!--Start Navigation collapse -->
                            
                        <ul class="nav"> <!--Start Nav-->
                                    <!--Start Question-->
                                <li class="dropdown"> 
                                      <a href="#" class="dropdown-toggle"  data-toggle="dropdown"  >
                                        Questionaire
                                        <b class="caret"></b>
                                      </a>
                                  
                                      <ul class="dropdown-menu">
                                 
                                          <li><a href="#" onclick="Test()">View/Edit</a></li>  
                                          <li><a href="#">Print </a></li>  
                                 
                                      </ul>
                                </li> <!--End Question-->

                                    <!--Start Address List-->
                                <li class="dropdown"> 
                                      <a href="#" class="dropdown-toggle"  data-toggle="dropdown">
                                        Address List
                                        <b class="caret"></b>
                                      </a>
                                  
                                      <ul class="dropdown-menu">
                                 
                                            <li><a href='#' >View Master Address List</a></li>
                                            <li><a href='#'>Generate Filtered List</a></li>
                                            <li><a href='#'>Replenish Filtered List</a></li>
                                            <li><a href='#'>Assign List to Field Staff</a></li>
                                 
                                      </ul>
                                </li> <!--End AddressList-->

                            <!--Start Field Staff-->
                                <li class="dropdown"> 
                                      <a href="#" class="dropdown-toggle"  data-toggle="dropdown">
                                        Field Staff
                                        <b class="caret"></b>
                                      </a>
                                  
                                      <ul class="dropdown-menu">
                                 
                                          <li><a href='#'>Add Field Staff</a></li>
                                          <li><a href='#'>Modify Field Staff</a></li>
                                          <li><a href='#'>Delete Field Staff</a></li>
                                 
                                      </ul>
                                </li> <!--End Field Staff-->

                           

                           
                            <li>
                                <a href="#">Reports</a>
                            </li>
                        </ul> <!--End Nav-->

                            

                        
                        </div> <!--Start Navigation collapse -->



                    </div> <!--End Container-->
                
                </div><!--End Navbar Inner-->

            
            </div> <!--End Navbar Top-->
                
                </div> <!--End Menu Span-->
                
                

             </div> <!-- End Menu Row-fluid-->

             <div class="row-fluid" style="background-color:Red;min-height:300px">
                         
             </div>
        
        </div> <!--End Container- Fluid -->
        
      
    </body>

</html>
