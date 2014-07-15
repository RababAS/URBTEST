<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmPrescription.aspx.cs" 
Inherits="OnlineOutPatientManagementSystem.UI.Prescription.frmPrescription"%>


<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<title>Online Precriptions</title>
	
    <script src="../../Scripts/jquery-1.4.1-vsdoc.js" type="text/javascript"></script>

    <script src="../../Scripts/jsFunctions.js"></script>


	<script type="text/javascript"  language="javascript">

		function confirmCancel() {
			var mgs = 'Are you sure that you want to cancel?';
			if (!confirm(mgs)) { return false }
			else {
			    window.location = '/UI/Prescription/frmPrescriptionFrontPage.aspx';
			    return false
				//window.location.reload()
			}
		}




		function openReport() {

		    alert('Data Save successfully.');
		    var strVisitId = document.getElementById('txtVisitID').value;

		    var url = "/Report/frmCommonReportViewer.aspx?prmReportNmae=Prescription &prmVisitId=" + strVisitId;
		    //ViewReport(url);

		    
		    myWindow = window.open(url);
		    myWindow.focus();

		    window.location = '/UI/Prescription/frmPrescriptionFrontPage.aspx';
		}
		
		function ViewReport(URL) {

		    var wnd = window.radopen(URL, null);
		    wnd.set_title("Report Viewer");
		    wnd.setSize(1100, 600);
		    wnd.set_modal(true);
		    wnd.set_visibleStatusbar(false);
		    wnd.showRoundCorner(true);
		    return false;

		}

		function ValGridAlert() {
		    alert('Please add minimum one row.');
		    return false
		}


		function DataSaveAlert() {
		    alert('Data Save successfully.');
		    window.location = '/UI/Prescription/frmPrescriptionFrontPage.aspx';
		}

		function PageOpen() {
		    window.location = '/UI/Prescription/frmPrescriptionFrontPage.aspx';
		    return false
		}


		function OpenPopup() {
			var w = 10;
			var h = 200;
			var left = Number((screen.width / 2) - (w / 2));
			var tops = Number((screen.height / 2) - (h / 2));
			myWindow = window.open("/UI/Prescription/frmPrescriptionPopUp.aspx", "List", "toolbar=no, location=no,status=yes,menubar=no,scrollbars=yes,resizable=no, width='+w+',height='+h+',left='+left+',top='+tops+'");
			myWindow.focus()
			return false;
		}

		function OpenPopupCenter(pageURL, title, w, h) {
			var left = (screen.width - w) / 2;
			var top = (screen.height - h) / 4;  // for 25% - devide by 4  |  for 33% - devide by 3
			var targetWin = window.open(pageURL, title, 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);
		} 

//		function windowOpen() {
//			myWindow = window.open('http://myurl.com', '_blank', 'width=200,height=100, scrollbars=no,resizable=no')
//			myWindow.focus()
//			return false;
//		}

		function checkRange(me) {
			var x = parseInt(me.value, 10);
			if (isNaN(x) || (x < -1 && x > 12)) {
				alert('Enter Year between 0 - 120 range.');
				me.focus();
				return false;
			}
			return true;
		}


		function allowonlynumbers() {
			if (event.keyCode >= 48 && event.keyCode <= 57) {
				return true;

			}

			else {
				alert('Only numbers can be entered.'); return false;

			}
		}

		function DisableSpecialKeyEvents() {
			var nav = window.Event ? true : false;
			document.onkeydown = Keypress_Event;
			function Keypress_Event() {
				if (event.keyCode == 13)
				{ return false; }
			}
		}


	  </script>



	<style type="text/css">
		#Prescription
		{
			width: auto;
			display: block;
			margin-top:auto;
			margin-bottom:50px;
			margin-left: 50px;
			margin-right:50px;            
            background-color:#437DC9;
		}
		#content {
		position: absolute;
		}

		.Header
		{
            color: white;
			text-align: center;
            font-size:xx-large;
            font-weight:bold;
            background-color:red;
            height:100px; 
            background-color:#620F2C;
		}

	    .hidden 
            {
	            display: none;
	        }
           .visible 
           {
                display: block;
           }

           .BanglaCombo 
            {     
            font-family:SutonnyMJ!important;
            font-size:14px !important; 
            }

				
		.auto-style1 {
            height: 23px;
        }

				
		</style>
</head>
<body>
	<form id="Prescription" runat="server" DefaultButton="">
		
		<div class="Header">
            <br />
			 Online Prescription
            </div>

        <div style="background-color:white;">
            <asp:LinkButton ID="lnkWPres" Text="WelCome Prescription" OnClientClick="return PageOpen()"  runat="Server" /> 
            <br />
            <br />
        </div>
		
		<div style="display: inline-block;  width:98%;">
            <div>
                <br />
            </div>

			<%--1st coloumn start here*************************************************************************************************--%>
			<div style="float:left; width:38%;">
                <%--1.1 coloumn start here*********************************************************************************************--%>
				 <fieldset>
					<legend id="PBasicInfo">Patient's Basic Information</legend>
                     <table style="width: 100%; height: 100%">

                         <tr>
                             <td style="width: 20%">
                                 <asp:Label ID="Label7" runat="server" Text="Visit ID"></asp:Label>
                             </td>
                             <td style="width: 30%">
                                 <asp:TextBox ID="txtVisitID" runat="server" Width="100" Enabled="false">
                                 </asp:TextBox>
                             </td>

                             <td style="width: 20%">
                                 <asp:Label ID="Label1" runat="server" Text="Patient ID:"></asp:Label>
                             </td>
                             <td style="width: 30%">
                                 <asp:TextBox ID="txtPID" runat="server" Width="100" Enabled="false">
                                 </asp:TextBox>
                             </td>
                         </tr>
                     </table>
                         
                     <table style="width: 100%; height: 100%">
                         <tr>
                             <td style="width: 20%">
                                 <asp:Label ID="Label2" runat="server" Text="Name:"></asp:Label>
                             </td>
                             <td style="width: 80%">
                                 <asp:TextBox ID="txtName" runat="server" Width="320" Enabled="false">
                                 </asp:TextBox>
                             </td>
                         </tr>
                     </table>
                         

                       <table style="width: 100%; height: 100%">
                         <tr>
                             <td style="width: 20%">
                                 <asp:Label ID="lblPatientAge" runat="server" Text="Patient Age :"></asp:Label>
                             </td>
                             <td style="width: 80%">
                                 <table style="width: 100%">
                                     <tr>
                                         <td style="width: 8%">

                                             <asp:Label ID="lblYear" runat="server" Text="Year"></asp:Label>

                                         </td>
                                         <td style="width: 17%">

                                             <asp:TextBox ID="txtYear" runat="server" Width="50px" Enabled="False">00</asp:TextBox>

                                         </td>
                                         <td style="width: 8%">
                                             <asp:Label ID="lblMonth" runat="server" Text="Month"></asp:Label>
                                         </td>
                                         <td style="width: 17%">
                                             <asp:TextBox ID="txtMonth" runat="server" Width="50px" Enabled="False">00</asp:TextBox>
                                         </td>
                                         <td style="width: 8%">
                                             <asp:Label ID="lblDay" runat="server" Text="Day"></asp:Label>
                                         </td>
                                         <td style="width: 17%">
                                             <asp:TextBox ID="txtDay" runat="server" Width="50px" Enabled="False">00</asp:TextBox>
                                         </td>
                                     </tr>
                                 </table>
                             </td>
                         </tr>
                     </table>

                      <table style="width: 100%; height: 100%">
                         <tr>
                             <td style="width: 20%">
                                 <asp:Label ID="Label3" runat="server" Text="Sex:"></asp:Label>
                             </td>
                             <td style="width: 30%">
                                 <asp:TextBox ID="txtSex" runat="server" Width="50" Enabled="false">
                                 </asp:TextBox>
                             </td>

                             <td style="width: 20%">
                                 <asp:Label ID="Label5" runat="server" Text="Allergy:"></asp:Label>
                             </td>
                             <td style="width: 30%">                       
                                 
                                 <telerik:RadComboBox ID="ddlDrugAllergy" Runat="server" Width="110px" EmptyMessage="Select an item"
                                     DataSourceID="SqlDSlkp_MedicineName" DataTextField="TradeName" DataValueField="MNCode">
                                 </telerik:RadComboBox>
                                 
                             </td>
                         </tr>
                     </table>

                     <table style="width: 100%; height: 100%">
                         <tr>
                             <td style="width: 20%">
                                 <asp:Label ID="Label4" runat="server" Text="D History:"></asp:Label>
                             </td>
                             <td style="width: 78%">
                                 <asp:TextBox ID="txtDrufHis" runat="server" Width="320" 
                                     onkeydown = "return (event.keyCode!=13);" 
                                     MaxLength="50"  EmptyMessage="Type Drug History">
                                 </asp:TextBox>
                             </td>
                         </tr>

                     </table>
				</fieldset>
                <br />
				<%--1.2 coloumn start here*********************************************************************************************--%>
				<div>
					 <fieldset>
						<legend>On Examination Informations</legend>
                         <table style="width: 100%; height: 100%">

                             <tr>
                                 <td style="width: 20%">
                                     <asp:Label ID="Label9" runat="server" Text="Anemia:"></asp:Label>
                                 </td>
                                 <td style="width: 25%">
                                     <telerik:RadComboBox ID="ddlAnemia" runat="server" Width="100px">
                                         <Items>
                                             <telerik:RadComboBoxItem runat="server" Text="Positive" Value="1" />
                                             <telerik:RadComboBoxItem runat="server" Selected="True" Text="Negetive" Value="2" />
                                         </Items>
                                     </telerik:RadComboBox>                                 
                                 </td>

                                 <td style="width: 20%">
                                     <asp:Label ID="Label18" runat="server" Text="OS:"></asp:Label>
                                 </td>
                                 <td style="width: 25%">
                                     <telerik:RadComboBox ID="ddlOS" runat="server" Width="100px"
                                         DataTextField="ExamOptionName" DataValueField="ExamOption">
                                         <Items>
                                             <telerik:RadComboBoxItem runat="server" Selected="True"
                                                 Text="N/A" Value="0" />
                                             <telerik:RadComboBoxItem runat="server" Owner="RcboOS" Text="1cm(Close)"
                                                 Value="1" />
                                             <telerik:RadComboBoxItem runat="server" Owner="RcboOS" Text="2cm(Open)"
                                                 Value="2" />
                                             <telerik:RadComboBoxItem runat="server" Text="3cm(Open)" Value="3" />
                                             <telerik:RadComboBoxItem runat="server" Text="4cm(Open)" Value="4" />
                                             <telerik:RadComboBoxItem runat="server" Text="5cm(Open)" Value="5" />
                                             <telerik:RadComboBoxItem runat="server" Text="6cm(Open)" Value="6" />
                                             <telerik:RadComboBoxItem runat="server" Text="7cm(Open)" Value="7" />
                                             <telerik:RadComboBoxItem runat="server" Text="8cm(Open)" Value="8" />
                                             <telerik:RadComboBoxItem runat="server" Text="9cm(Open)" Value="9" />
                                             <telerik:RadComboBoxItem runat="server" Text="10cm(Open)" Value="10" />
                                         </Items>
                                     </telerik:RadComboBox>

                                 </td>
                             </tr>



                             <tr>
                                 <td style="width: 20%">
                                     <asp:Label ID="Label10" runat="server" Text="Cervix:"></asp:Label>
                                 </td>
                                 <td style="width: 25%">
                                     <telerik:RadComboBox ID="ddlCervix" runat="server" Width="100px"
                                         DataTextField="ExamOptionName" DataValueField="ExamOption">
                                         <Items>
                                             <telerik:RadComboBoxItem runat="server" Text="Normal" Value="1" Selected="True" />
                                             <telerik:RadComboBoxItem runat="server" IsSeparator="True" Text="Abnormal" />
                                             <telerik:RadComboBoxItem runat="server" Text="Absent" Value="2" />
                                             <telerik:RadComboBoxItem runat="server" Text="Bleeding" Value="3" />
                                             <telerik:RadComboBoxItem runat="server" Text="Cyst" Value="4" />
                                             <telerik:RadComboBoxItem runat="server" Text="Discharge" Value="5" />
                                             <telerik:RadComboBoxItem runat="server" Text="Erosion" Value="6" />
                                             <telerik:RadComboBoxItem runat="server" Text="Growth" Value="7" />
                                             <telerik:RadComboBoxItem runat="server" Text="Inflammation" Value="8" />
                                             <telerik:RadComboBoxItem runat="server" Text="Polyp" Value="9" />
                                             <telerik:RadComboBoxItem runat="server" Text="Prolapsed" Value="10" />
                                             <telerik:RadComboBoxItem runat="server" Text="Tear" Value="11" />
                                             <telerik:RadComboBoxItem runat="server" Text="Tenderness" Value="12" />
                                             <telerik:RadComboBoxItem runat="server" Text="Ulceration" Value="13" />
                                             <telerik:RadComboBoxItem runat="server" Text="Unhealthy" Value="14" />
                                             <telerik:RadComboBoxItem runat="server" Text="Others" Value="15" />
                                         </Items>
                                     </telerik:RadComboBox>                                   
                                 </td>

                                 <td style="width: 20%">
                                     <asp:Label ID="Label19" runat="server" Text="Spleen:"></asp:Label>
                                 </td>
                                 <td style="width: 25%">
                                     <telerik:RadComboBox ID="ddlSpleen" runat="server" Width="100px">
                                         <Items>
                                             <telerik:RadComboBoxItem runat="server" Text="Palpable" Value="1" />
                                             <telerik:RadComboBoxItem runat="server" Selected="True" Text="Not Palpable"
                                                 Value="2" />
                                         </Items>
                                     </telerik:RadComboBox>
                                    
                                 </td>
                             </tr>


                             <tr>
                                 <td style="width: 20%">
                                     <asp:Label ID="Label11" runat="server" Text="Clubbing:"></asp:Label>
                                 </td>
                                 <td style="width: 25%">
                                     <telerik:RadComboBox ID="ddlClubbing" runat="server" Width="100px">
                                         <Items>
                                             <telerik:RadComboBoxItem runat="server" Text="Positive" Value="1" />
                                             <telerik:RadComboBoxItem runat="server" Selected="True" Text="Negetive"
                                                 Value="2" />
                                         </Items>
                                     </telerik:RadComboBox>
                                 </td>

                                 <td style="width: 20%">
                                     <asp:Label ID="Label20" runat="server" Text="Vagina:"></asp:Label>
                                 </td>
                                 <td style="width: 25%">
                                     <telerik:RadComboBox ID="ddlVagina" runat="server" Width="100px"
                                         DataTextField="ExamOptionName" DataValueField="ExamOption">
                                         <Items>
                                             <telerik:RadComboBoxItem runat="server" Text="Normal" Value="1"
                                                 Selected="True" />
                                             <telerik:RadComboBoxItem runat="server" IsSeparator="True" Text="Abnormal"
                                                 Value="Abnormal" />
                                             <telerik:RadComboBoxItem runat="server" Text="Atbsent" Value="2" />
                                             <telerik:RadComboBoxItem runat="server" Text="Atrophy" Value="3" />
                                             <telerik:RadComboBoxItem runat="server" Text="Bleeding" Value="4" />
                                             <telerik:RadComboBoxItem runat="server" Text="Cyst" Value="5" />
                                             <telerik:RadComboBoxItem runat="server" Text="Discharge" Value="6" />
                                             <telerik:RadComboBoxItem runat="server" Text="Growth" Value="7" />
                                             <telerik:RadComboBoxItem runat="server" Text="Inflamation"
                                                 Value="8" />
                                             <telerik:RadComboBoxItem runat="server" Text="Pain" Value="9" />
                                             <telerik:RadComboBoxItem runat="server" Text="Stenosis" Value="10" />
                                             <telerik:RadComboBoxItem runat="server" Text="Swelling" Value="11" />
                                             <telerik:RadComboBoxItem runat="server" Text="Ulceration" Value="12" />
                                             <telerik:RadComboBoxItem runat="server" Text="Others" Value="13" />
                                         </Items>
                                     </telerik:RadComboBox>                                    
                                 </td>
                             </tr>


                             <tr>
                                 <td style="width: 20%">
                                     <asp:Label ID="Label12" runat="server" Text="Heart:"></asp:Label>
                                 </td>
                                 <td style="width: 25%">
                                     <telerik:RadComboBox ID="ddlHeart" runat="server" Width="100px"
                                         DataTextField="ExamOptionName" DataValueField="ExamOption" DropDownAutoWidth="Enabled">
                                         <Items>
                                             <telerik:RadComboBoxItem runat="server" IsSeparator="True"
                                                 Text="Normal Heart Sounds" Value="0" />
                                             <telerik:RadComboBoxItem runat="server" Text="S1 Heart Sound"
                                                 Value="1" Selected="True" />
                                             <telerik:RadComboBoxItem runat="server" Text="S2 Heart Sound"
                                                 Value="2" />
                                             <telerik:RadComboBoxItem runat="server" IsSeparator="True" Text="Added Sounds"
                                                 Value="3" />
                                             <telerik:RadComboBoxItem runat="server" Text="Click" Value="4" />
                                             <telerik:RadComboBoxItem runat="server" Text="Continuous Murmurs"
                                                 Value="5" />
                                             <telerik:RadComboBoxItem runat="server" Text="Early Diastotic Murmurs"
                                                 Value="6" />
                                             <telerik:RadComboBoxItem runat="server"
                                                 Text="Holosystolic (Pan Systolic) Murmurs"
                                                 Value="7" />
                                             <telerik:RadComboBoxItem runat="server"
                                                 Text="Late Diastolic(Presystolic) Murmurs"
                                                 Value="8" />
                                             <telerik:RadComboBoxItem runat="server" Text="Late Systolic Murmurs"
                                                 Value="9" />
                                             <telerik:RadComboBoxItem runat="server" Text="Mid Diastolic Murmurs"
                                                 Value="10" />
                                             <telerik:RadComboBoxItem runat="server" Text="Mid-Systolic Ejection Murmurs"
                                                 Value="11" />
                                             <telerik:RadComboBoxItem runat="server" Text="Rubs" Value="12" />
                                             <telerik:RadComboBoxItem runat="server" Text="Others" Value="13" />
                                         </Items>
                                     </telerik:RadComboBox>                                   
                                 </td>

                                 <td style="width: 20%">
                                     <asp:Label ID="Label21" runat="server" Text="Vulva:"></asp:Label>
                                 </td>
                                 <td style="width: 25%">
                                     <telerik:RadComboBox ID="ddlVulva" runat="server" Width="100px"
                                         DataTextField="ExamOptionName" DataValueField="ExamOption">
                                         <Items>
                                             <telerik:RadComboBoxItem runat="server" Text="Normal" Value="1"
                                                 Selected="True" />
                                             <telerik:RadComboBoxItem runat="server" IsSeparator="True" Text="Abnormal"
                                                 Value="Abnormal" />
                                             <telerik:RadComboBoxItem runat="server" Text="Atrophy" Value="2" />
                                             <telerik:RadComboBoxItem runat="server" Text="Cyst" Value="3" />
                                             <telerik:RadComboBoxItem runat="server" Text="Erythema" Value="4" />
                                             <telerik:RadComboBoxItem runat="server" Text="Fissures" Value="5" />
                                             <telerik:RadComboBoxItem runat="server" Text="Hypo Pigmentation"
                                                 Value="6" />
                                             <telerik:RadComboBoxItem runat="server" Text="Indurations"
                                                 Value="7" />
                                             <telerik:RadComboBoxItem runat="server" Text="Swelling" Value="8" />
                                             <telerik:RadComboBoxItem runat="server" Text="Tenderness" Value="9" />
                                             <telerik:RadComboBoxItem runat="server" Text="Tumour" Value="10" />
                                             <telerik:RadComboBoxItem runat="server" Text="Ulceration" Value="11" />
                                             <telerik:RadComboBoxItem runat="server" Text="Varicosities"
                                                 Value="12" />
                                             <telerik:RadComboBoxItem runat="server" Text="Others" Value="13" />
                                         </Items>
                                     </telerik:RadComboBox>
                                 </td>
                             </tr>



                             <tr>
                                 <td style="width: 20%">
                                     <asp:Label ID="Label13" runat="server" Text="Jaundice:"></asp:Label>
                                 </td>
                                 <td style="width: 25%">
                                     <telerik:RadComboBox ID="ddlJaundice" runat="server" Width="100px">
                                         <Items>
                                             <telerik:RadComboBoxItem runat="server" Text="Positive" Value="1" />
                                             <telerik:RadComboBoxItem runat="server" Selected="True" Text="Negetive"
                                                 Value="2" />
                                         </Items>
                                     </telerik:RadComboBox>
                                 </td>

                                 <td style="width: 20%">
                                     <asp:Label ID="Label22" runat="server" Text="BP:"></asp:Label>
                                 </td>
                                 <td style="width: 25%">
                                     <telerik:RadNumericTextBox ID="txtSystolic" runat="server" 
                                         ValidationGroup="valGCommon" placeholder="Systolic"
                                         MaxLength="3" MaxValue="250" MinValue="40" Width="48px">
                                         <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                                     </telerik:RadNumericTextBox>

                                     <telerik:RadNumericTextBox ID="txtDiastolic" runat="server" 
                                         ValidationGroup="valGCommon" placeholder="Diastolic"
                                         MaxLength="3" MaxValue="150" MinValue="30" Width="48px">
                                         <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                                     </telerik:RadNumericTextBox>
                                 </td>
                             </tr>



                             <tr>
                                 <td style="width: 20%">
                                     <asp:Label ID="Label14" runat="server" Text="L/N:"></asp:Label>
                                 </td>
                                 <td style="width: 25%">
                                     <telerik:RadComboBox ID="ddlLN" runat="server" Width="100px">
                                         <Items>
                                             <telerik:RadComboBoxItem runat="server" Text="Palpable" Value="1" />
                                             <telerik:RadComboBoxItem runat="server" Selected="True" Text="Not Palpable"
                                                 Value="2" />
                                         </Items>
                                     </telerik:RadComboBox>
                                 </td>

                                 <td style="width: 20%">
                                     <asp:Label ID="Label23" runat="server" Text="Pulse:"></asp:Label>
                                 </td>
                                 <td style="width: 25%">
                                     <telerik:RadNumericTextBox ID="txtPulse" runat="server" ValidationGroup="valGCommon"
                                         MaxLength="3" Width="100px" placeholder="Pulse"
                                         MaxValue="120" MinValue="20" Culture="en-US" DbValueFactor="1" LabelWidth="40px">
                                         <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                                     </telerik:RadNumericTextBox>
                                 </td>

                             </tr>



                             <tr>
                                 <td style="width: 20%">
                                     <asp:Label ID="Label15" runat="server" Text="Liver:"></asp:Label>
                                 </td>
                                 <td style="width: 25%">
                                     <telerik:RadComboBox ID="ddlLiver" runat="server" Width="100px">
                                         <Items>
                                             <telerik:RadComboBoxItem runat="server" Text="Palpable" Value="1" />
                                             <telerik:RadComboBoxItem runat="server" Selected="True" Text="Not Palpable"
                                                 Value="2" />
                                         </Items>
                                     </telerik:RadComboBox>                            
                                 </td>

                                 <td style="width: 20%">
                                     <asp:Label ID="Label24" runat="server" Text="Temp:"></asp:Label>
                                 </td>
                                 <td style="width: 25%">
                                     
                                     <telerik:RadNumericTextBox ID="txtTemp" runat="server" 
                                         ValidationGroup="valGCommon" placeholder="Temparature"
                                         MaxLength="3" MaxValue="109" MinValue="0" Width="100px">
                                         <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                                     </telerik:RadNumericTextBox>
                                     
                                 </td>
                             </tr>



                             <tr>
                                 <td style="width: 20%">
                                     <asp:Label ID="Label16" runat="server" Text="Lung:"></asp:Label>
                                 </td>
                                 <td style="width: 25%">
                                     <telerik:RadComboBox ID="ddlLung" runat="server" Width="100px" DropDownAutoWidth="Enabled"
                                         DataTextField="ExamOptionName" DataValueField="ExamOption">
                                         <Items>
                                             <telerik:RadComboBoxItem runat="server" IsSeparator="True" Text="Breath Sounds" Value="0" Owner="RcboLung" />
                                             <telerik:RadComboBoxItem runat="server" Text="Normal(Vesicular)" Value="1" Owner="RcboLung" Selected="True" />
                                             <telerik:RadComboBoxItem runat="server" Text="Absent" Value="2" Owner="RcboLung" />
                                             <telerik:RadComboBoxItem runat="server" Text="Bronch Vesicular" Value="3" Owner="RcboLung" />
                                             <telerik:RadComboBoxItem runat="server" Text="Bronchial" Value="4" Owner="RcboLung" />
                                             <telerik:RadComboBoxItem runat="server" Text="Diminished" Value="5" Owner="RcboLung" />
                                             <telerik:RadComboBoxItem runat="server" Text="Vesicular with prolonged expiration" Value="6" Owner="RcboLung" />

                                             <telerik:RadComboBoxItem runat="server" IsSeparator="True" Text="Added Sound" Value="7" Owner="RcboLung" />

                                             <telerik:RadComboBoxItem runat="server" Text="Crackles - Fine" Value="8" Owner="RcboLung" />
                                             <telerik:RadComboBoxItem runat="server" Text="Crackles - Coarse" Value="9" Owner="RcboLung" />
                                             <telerik:RadComboBoxItem runat="server" Text="None" Value="10" Owner="RcboLung" />
                                             <telerik:RadComboBoxItem runat="server" Text="Stertor" Value="11" Owner="RcboLung" />
                                             <telerik:RadComboBoxItem runat="server" Text="Stridor" Value="12" Owner="RcboLung" />
                                             <telerik:RadComboBoxItem runat="server" Text="Wheeze/Ronchi" Value="13" Owner="RcboLung" />
                                             <telerik:RadComboBoxItem runat="server" Text="Others" Value="14"
                                                 Owner="RcboLung" />
                                         </Items>
                                     </telerik:RadComboBox>                                    
                                 </td>
                                 <td style="width: 20%">
                                     <asp:Label ID="Label25" runat="server" Text="Weight:"></asp:Label>
                                 </td>
                                 <td style="width: 25%">
                                     
                                     <telerik:RadNumericTextBox ID="txtWeight" Runat="server" Width="100px">
                                     </telerik:RadNumericTextBox>
                                     
                                 </td>

                             </tr>



                             <tr>
                                 <td style="width: 20%">
                                     <asp:Label ID="Label17" runat="server" Text="Odema:"></asp:Label>
                                 </td>
                                 <td style="width: 25%">
                                     <telerik:RadComboBox ID="ddlOdema" runat="server" Width="100px">
                                         <Items>
                                             <telerik:RadComboBoxItem runat="server" Text="Positive" Value="1" />
                                             <telerik:RadComboBoxItem runat="server" Selected="True" Text="Negetive"
                                                 Value="2" />
                                         </Items>
                                     </telerik:RadComboBox>
                                 </td>

                                 <td style="width: 20%">
                                     <asp:Label ID="Label26" runat="server" Text="Others:"></asp:Label>
                                 </td>
                                 <td style="width: 25%">
                                     <telerik:RadTextBox ID="txtOthers" runat="server"
                                         Width="100px" ValidationGroup="valGCommon"  placeholder="Others"
                                         MaxLength="50">
                                     </telerik:RadTextBox>
                                 </td>
                             </tr>



                             <tr>
                                 <td style="width: 20%"></td>
                                 <td style="width: 25%"></td>

                                 <td style="width: 20%"></td>
                                 <td style="width: 25%"></td>
                             </tr>
                         </table>
					</fieldset>
				</div>

                <div>
                    <br />
                </div>

                <div>
                    <fieldset>
                        <legend>Advice & Reference</legend>
                        <div>
                            <table style="width: 100%; height: 100%">

                                <tr>
                                    <td>
                                        <table style="width: 100%; height: 100%">
                                            <tr style="width: 100%; height: 100%">
                                                <td>
                                                    <div>
                                                        Advice
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>

                                <tr>
                                    <td> 
                                        <div>
                                            <telerik:RadGrid ID="RGAdvice" runat="server" CellSpacing="0" GridLines="None"
                                            AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AutoGenerateDeleteColumn="True"
                                            DataSourceID="SqlDSAdvice" AllowPaging="True" OnItemInserted="RGAdvice_ItemInserted" 
                                                PageSize="5" Width="350px" Font-Names="SutonnyMJ">

                                            <ValidationSettings ValidationGroup="VGAdvice" />

                                            <MasterTableView AutoGenerateColumns="False" CommandItemDisplay="Top" DataSourceID="SqlDSAdvice"
                                                DataKeyNames="VisitID, ABCode">
                                                <RowIndicatorColumn Visible="False">
                                                </RowIndicatorColumn>
                                                <Columns>
                                                    
                                                    <telerik:GridTemplateColumn UniqueName="SlNo" HeaderText="SL No">
                                                        <ItemTemplate>
                                                            <%#Container.DataSetIndex+1 %>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="50px" />
                                                    </telerik:GridTemplateColumn>


                                                    <telerik:GridDropDownColumn DataSourceID="SqlDSlkp_AdviceBangla" Display="False" 
                                                        ColumnEditorID="GridDropDownListColumnEditorFontBng" 
                                                        FilterControlAltText="Filter ddAdvice column" HeaderText="AB Code"
                                                        ListTextField="ABDesc" ListValueField="ABCode"
                                                        UniqueName="ddAdvice" DataField="ABCode" 
                                                        AllowAutomaticLoadOnDemand="False" Resizable="False">                                                       

                                                        <ColumnValidationSettings EnableRequiredFieldValidation="True" 
                                                            RenderValidatorBeforeEditor="True">
                                                            <RequiredFieldValidator SetFocusOnError="True" ForeColor="Red">*</RequiredFieldValidator>
                                                        </ColumnValidationSettings>
                                                       
                                                        <FooterStyle CssClass="BanglaCombo" Font-Names="SutonnyMJ" />
                                                        <HeaderStyle CssClass="BanglaCombo" Font-Names="SutonnyMJ" />
                                                       
                                                        <ItemStyle Font-Names="SutonnyMJ" CssClass="BanglaCombo" />
                                                       
                                                    </telerik:GridDropDownColumn>

                                                    <telerik:GridBoundColumn DataField="ABCode" DataType="System.Int16" Display="False"
                                                        FilterControlAltText="Filter ABCode column" HeaderText="ABC" ReadOnly="True"
                                                        SortExpression="ABCode" UniqueName="ABCode">
                                                    </telerik:GridBoundColumn>

                                                    <telerik:GridBoundColumn DataField="ABDesc" FilterControlAltText="Filter ABDesc column"
                                                        HeaderText="AB Desc" ReadOnly="True" SortExpression="ABDesc" UniqueName="ABDesc">
                                                        <ItemStyle Font-Names="SutonnyMJ" />
                                                    </telerik:GridBoundColumn>
                                                </Columns>
                                            </MasterTableView>

                                            <PagerStyle Mode="NumericPages" />

                                        </telerik:RadGrid>
                                        </div>                                                                              
                                    </td>
                                </tr>

                                <tr>
                                    <td></td>
                                </tr>

                                <tr>
                                    <td>
                                        <asp:Label ID="lblReferred" runat="server" Text="Referred"></asp:Label>
                                    </td>
                                </tr>

                                <tr>
                                    <td>                                        
                                                                              
                                        <telerik:RadComboBox ID="ddlReferred" Runat="server" Width="250px" DataSourceID="SqlDSlkp_DoctorsName" 
                                            DataTextField="DoctorName" DataValueField="DNCode" EmptyMessage="Select an item">
                                        </telerik:RadComboBox>
                                                                              
                                    </td>
                                </tr>


                                <tr>
                                    <td>
                                                                                                             
                                    </td>
                                </tr>

                                <tr>
                                    <td>

                                    </td>
                                </tr>


                            </table>
                        </div>
                    </fieldset>
                </div>

			</div>



			
			 <div style="float:right; width:25%;margin-right:10px;">				
				<div>
				<fieldset>
					<legend>Investigations</legend>
					<table style="width:100%; height:100%">
							<tr style="width:100%; height:100%">
								<td>
									<div>
                                        <telerik:RadGrid ID="RGInvestigations" runat="server" CellSpacing="0" GridLines="None" AllowAutomaticDeletes="True" 
                                            AllowAutomaticInserts="True" AutoGenerateDeleteColumn="True" DataSourceID="SqlDSInvestigation" 
                                            AllowPaging="True" OnItemInserted="RGInvestigations_ItemInserted" PageSize="5" Width="270px" 
                                            AutoGenerateHierarchy="True" OnItemDataBound="RGInvestigations_ItemDataBound">
                                            <ValidationSettings ValidationGroup="VGInvestigation" />

                                            <MasterTableView AutoGenerateColumns="False" CommandItemDisplay="Top" 
                                                DataSourceID="SqlDSInvestigation" DataKeyNames="VisitID,InvCode">
                                                <RowIndicatorColumn Visible="True">
                                                </RowIndicatorColumn>
                                                <Columns>
                                                    
                                                    <telerik:GridTemplateColumn UniqueName="SlNo" HeaderText="SL No">
                                                        <ItemTemplate>   
                                                           <%#Container.DataSetIndex+1 %>
                                                       </ItemTemplate>                                                       
                                                        <HeaderStyle Width="50px" />
                                                      </telerik:GridTemplateColumn>
                                                    

                                                    <telerik:GridDropDownColumn DataSourceID="SqlDSlkp_Investigations" Display="False" ColumnEditorID="GridDropDownListColumnEditor"
                                                        FilterControlAltText="Filter ddInvestigationCode column" HeaderText="Investigation Code"
                                                        ListTextField="InvDesc" ListValueField="InvCode" UniqueName="ddInvestigationCode" DataField="InvCode"
                                                        AllowAutomaticLoadOnDemand="False" Resizable="False">

                                                        <ColumnValidationSettings EnableRequiredFieldValidation="True"
                                                            RenderValidatorBeforeEditor="True">
                                                            <RequiredFieldValidator SetFocusOnError="True" ForeColor="Red">*</RequiredFieldValidator>
                                                        </ColumnValidationSettings>
                                                    </telerik:GridDropDownColumn>

                                                   

                                                    <telerik:GridBoundColumn DataField="InvDesc" FilterControlAltText="Filter InvDesc column" 
                                                        HeaderText="Investigations Desc" ReadOnly="True" SortExpression="InvDesc" UniqueName="InvDesc">
                                                    </telerik:GridBoundColumn>
                                                </Columns>
                                            </MasterTableView>
                                            <PagerStyle Mode="NumericPages" />
                                        </telerik:RadGrid>
									</div>
								</td>
							</tr>
						</table>

				</fieldset>
				</div>
				<br />
                 <%--<asp:ListItem Text="Select Anemia" Value="0"></asp:ListItem>--%>
				<fieldset>
					<legend>Findings</legend>
					<table style="width:100%; height:100%">
							<tr style="width:100%; height:100%">
								<td>
                                    <div>
                                        Postive Findings
						            </div>
									<div>
                                         <telerik:RadGrid ID="RGPositiveFindings" runat="server" CellSpacing="0" GridLines="None" 
                                             AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AutoGenerateDeleteColumn="True" 
                                             DataSourceID="SqlDSPositiveFindings" AllowPaging="True" OnItemInserted="RGPositiveFindings_ItemInserted" PageSize="5" Width="270px">

                                             <ValidationSettings ValidationGroup="VGPostiveFindings" />

                                            <MasterTableView AutoGenerateColumns="False" CommandItemDisplay="Top" DataSourceID="SqlDSPositiveFindings" 
                                                DataKeyNames="VisitID,PFCode">
                                                <RowIndicatorColumn Visible="False">
                                                </RowIndicatorColumn>
                                                <Columns>
                                                    
                                                   <telerik:GridTemplateColumn UniqueName="SlNo" HeaderText="SL No">
                                                        <ItemTemplate>
                                                            <%#Container.DataSetIndex+1 %>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="50px" />
                                                    </telerik:GridTemplateColumn>


                                                    <telerik:GridDropDownColumn DataSourceID="SqlDSlkp_PositiveFindings" Display="False" 
                                                        ColumnEditorID="GridDropDownListColumnEditor"
                                                        FilterControlAltText="Filter ddPositiveFindings column" HeaderText="Positive Code"
                                                        ListTextField="PFDesc" ListValueField="PFCode" 
                                                        UniqueName="ddPositiveCode" DataField="PFCode"
                                                        AllowAutomaticLoadOnDemand="False" Resizable="False">

                                                        <ColumnValidationSettings EnableRequiredFieldValidation="True"
                                                            RenderValidatorBeforeEditor="True">
                                                            <RequiredFieldValidator SetFocusOnError="True" ForeColor="Red">*</RequiredFieldValidator>
                                                        </ColumnValidationSettings>
                                                    </telerik:GridDropDownColumn>

                                                    <telerik:GridBoundColumn DataField="PFCode" DataType="System.Int16" Display="False" 
                                                        FilterControlAltText="Filter PFCode column" HeaderText="PC" ReadOnly="True" 
                                                        SortExpression="PFCode" UniqueName="PFCode">
                                                    </telerik:GridBoundColumn>

                                                    <telerik:GridBoundColumn DataField="PFDesc" FilterControlAltText="Filter PFDesc column" 
                                                        HeaderText="PF Des" ReadOnly="True" SortExpression="PFDesc" UniqueName="PFDesc">
                                                    </telerik:GridBoundColumn>
                                                </Columns>
                                            </MasterTableView>
                                            <PagerStyle Mode="NumericPages" />
                                        </telerik:RadGrid>

									</div>
								</td>
							</tr>
						</table>
						
						<br />

						<table style="width:100%; height:100%">
							<tr style="width:100%; height:100%">
								<td>
									<div>
                                        NegativeFindings
									</div>
                                    <div>
                                        <telerik:RadGrid ID="RGNegativeFindings" runat="server" CellSpacing="0" GridLines="None"
                                            AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AutoGenerateDeleteColumn="True"
                                            DataSourceID="SqlDSNegativeFindings" AllowPaging="True" OnItemInserted="RGNegativeFindings_ItemInserted" PageSize="5" Width="270px">

                                            <ValidationSettings ValidationGroup="VGPNegativeFindings" />

                                            <MasterTableView AutoGenerateColumns="False" CommandItemDisplay="Top" DataSourceID="SqlDSNegativeFindings"
                                                DataKeyNames="VisitID, NFCode">
                                                <RowIndicatorColumn Visible="False">
                                                </RowIndicatorColumn>
                                                <Columns>
                                                    
                                                    <telerik:GridTemplateColumn UniqueName="SlNo" HeaderText="SL No">
                                                        <ItemTemplate>
                                                            <%#Container.DataSetIndex+1 %>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="50px" />
                                                    </telerik:GridTemplateColumn>

                                                    <telerik:GridDropDownColumn DataSourceID="SqlDSlkp_NegativeFindings" Display="False"
                                                        ColumnEditorID="GridDropDownListColumnEditor"
                                                        FilterControlAltText="Filter ddNegativeFindings column" HeaderText="Negative Code"
                                                        ListTextField="NFDesc" ListValueField="NFCode"
                                                        UniqueName="ddNegativeCode" DataField="NFCode"
                                                        AllowAutomaticLoadOnDemand="False" Resizable="False">

                                                        <ColumnValidationSettings EnableRequiredFieldValidation="True"
                                                            RenderValidatorBeforeEditor="True">
                                                            <RequiredFieldValidator SetFocusOnError="True" ForeColor="Red">*</RequiredFieldValidator>
                                                        </ColumnValidationSettings>
                                                    </telerik:GridDropDownColumn>

                                                    <telerik:GridBoundColumn DataField="NFCode" DataType="System.Int16" Display="False"
                                                        FilterControlAltText="Filter NFCode column" HeaderText="NC" ReadOnly="True"
                                                        SortExpression="NFCode" UniqueName="NFCode">
                                                    </telerik:GridBoundColumn>

                                                    <telerik:GridBoundColumn DataField="NFDesc" FilterControlAltText="Filter NFDesc column"
                                                        HeaderText="NF Desc" ReadOnly="True" SortExpression="NFDesc" UniqueName="NFDesc">
                                                    </telerik:GridBoundColumn>
                                                </Columns>
                                            </MasterTableView>
                                            <PagerStyle Mode="NumericPages" />
                                        </telerik:RadGrid>
						            </div>
								</td>
							</tr>
						</table>						
				</fieldset>
				<br />
                 <%--<asp:ListItem Text="Select Anemia" Value="0"></asp:ListItem>--%>
				<div>
					<fieldset>
					<legend>Dental</legend>
						<table style="width:100%; height:100%">
							<tr style="width:100%; height:100%">
								<td>
									<div>
                                        Dental Sign
									</div>
                                    <div>                                       
                                        <telerik:RadGrid ID="RGDentalSign" runat="server" CellSpacing="0" GridLines="None"
                                            AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AutoGenerateDeleteColumn="True"
                                            DataSourceID="SqlDSDentalSign" AllowPaging="True" OnItemInserted="RGDentalSign_ItemInserted" PageSize="5" Width="270px" OnItemCreated="RGDentalSign_ItemCreated">


                                            <MasterTableView AutoGenerateColumns="False" CommandItemDisplay="Top" DataSourceID="SqlDSDentalSign"
                                                DataKeyNames="VisitID,DSCode">
                                                <RowIndicatorColumn Visible="False">
                                                </RowIndicatorColumn>
                                                
                                                <Columns>
                                                    
                                                   <telerik:GridTemplateColumn UniqueName="SlNo" HeaderText="SL No">
                                                        <ItemTemplate>
                                                            <%#Container.DataSetIndex+1 %>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="50px" />
                                                    </telerik:GridTemplateColumn>

                                                    <telerik:GridDropDownColumn DataSourceID="SqlDSlkp_DentalSign" Display="False"
                                                        ColumnEditorID="GridDropDownListColumnEditor"
                                                        FilterControlAltText="Filter ddDentalSign column" HeaderText="DenSign Code"
                                                        ListTextField="DSDesc" ListValueField="DSCode"
                                                        UniqueName="ddDenSignCode" DataField="DSCode"
                                                        AllowAutomaticLoadOnDemand="False" Resizable="False">

                                                        <ColumnValidationSettings EnableRequiredFieldValidation="True"
                                                            RenderValidatorBeforeEditor="True">
                                                            <RequiredFieldValidator SetFocusOnError="True" ForeColor="Red" ValidationGroup="VGPDentalSign">*</RequiredFieldValidator>
                                                        </ColumnValidationSettings>
                                                    </telerik:GridDropDownColumn>

                                                    <telerik:GridBoundColumn DataField="DSCode" DataType="System.Int16" Display="False"
                                                        FilterControlAltText="Filter DSCode column" HeaderText="DSC" ReadOnly="True"
                                                        SortExpression="DSCode" UniqueName="DSCode">
                                                    </telerik:GridBoundColumn>

                                                    <telerik:GridBoundColumn DataField="DSDesc" FilterControlAltText="Filter DSDesc column"
                                                        HeaderText="DS Desc" ReadOnly="True" SortExpression="DSDesc" UniqueName="DSDesc">
                                                    </telerik:GridBoundColumn>



                                                    <telerik:GridBoundColumn DataField="DSTeethNo" FilterControlAltText="Filter DSTeethNo column" 
                                                        ColumnEditorID="TextBoxEditor" DataType="System.Byte"
                                                        HeaderText="DS Teeth No" SortExpression="DSTeethNo" UniqueName="DSTeethNo" MaxLength="3">

                                                        <ColumnValidationSettings EnableRequiredFieldValidation="True"
                                                            RenderValidatorBeforeEditor="True">
                                                            <RequiredFieldValidator SetFocusOnError="True" ForeColor="Red" 
                                                                ValidationGroup="VGPDentalSign">*</RequiredFieldValidator>
                                                        </ColumnValidationSettings>
                                                    </telerik:GridBoundColumn>                                                    


                                                </Columns>
                                            </MasterTableView>
                                            <PagerStyle Mode="NumericPages" />

                                            <ValidationSettings ValidationGroup="VGPDentalSign" />

                                            <ClientSettings EnableRowHoverStyle="true" AllowKeyboardNavigation="true">
                                                <KeyboardNavigationSettings EnableKeyboardShortcuts="true" AllowSubmitOnEnter="true" />
                                            </ClientSettings>	

                                        </telerik:RadGrid>
						            </div>
								</td>
							</tr>
						</table>						
						<br />
						<table style="width:100%; height:100%">
							<tr style="width:100%; height:100%">
								<td>
									<div>
                                        Dental Advice
									</div>
                                    <div>
                                        
                                        <telerik:RadGrid ID="RGDentalAdvice" runat="server" CellSpacing="0" GridLines="None"
                                            AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AutoGenerateDeleteColumn="True"
                                            DataSourceID="SqlDSDentalAdvice" AllowPaging="True" OnItemInserted="RGDentalAdvice_ItemInserted" 
                                            PageSize="5" Width="270px" OnItemCreated="RGDentalAdvice_ItemCreated">


                                            <MasterTableView AutoGenerateColumns="False" CommandItemDisplay="Top" DataSourceID="SqlDSDentalAdvice"
                                                DataKeyNames="VisitID,DACode">
                                                <RowIndicatorColumn Visible="False">
                                                </RowIndicatorColumn>

                                                <Columns>
                                                    
                                                   <telerik:GridTemplateColumn UniqueName="SlNo" HeaderText="SL No">
                                                        <ItemTemplate>
                                                            <%#Container.DataSetIndex+1 %>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="50px" />
                                                    </telerik:GridTemplateColumn>

                                                    <telerik:GridDropDownColumn DataSourceID="SqlDSlkp_DentalAdvice" Display="False"
                                                        ColumnEditorID="GridDropDownListColumnEditor"
                                                        FilterControlAltText="Filter ddDentalAdvice column" HeaderText="DA Desc"
                                                        ListTextField="DADesc" ListValueField="DACode"
                                                        UniqueName="ddDentalAdvice" DataField="DACode"
                                                        AllowAutomaticLoadOnDemand="False" Resizable="False">

                                                        <ColumnValidationSettings EnableRequiredFieldValidation="True"
                                                            RenderValidatorBeforeEditor="True">
                                                            <RequiredFieldValidator SetFocusOnError="True" ForeColor="Red" ValidationGroup="VGDentalAdvice">*</RequiredFieldValidator>
                                                        </ColumnValidationSettings>
                                                    </telerik:GridDropDownColumn>

                                                    <telerik:GridBoundColumn DataField="DACode" DataType="System.Int16" Display="False"
                                                        FilterControlAltText="Filter DACode column" HeaderText="DAC" ReadOnly="True"
                                                        SortExpression="DACode" UniqueName="DACode">
                                                    </telerik:GridBoundColumn>

                                                    <telerik:GridBoundColumn DataField="DADesc" FilterControlAltText="Filter DADesc column"
                                                        HeaderText="DA Desc" ReadOnly="True" SortExpression="DADesc" UniqueName="DADesc">
                                                    </telerik:GridBoundColumn>



                                                    <telerik:GridBoundColumn DataField="DATeethNo" FilterControlAltText="Filter DATeethNo column"
                                                        ColumnEditorID="TextBoxEditor" DataType="System.Byte"
                                                        HeaderText="DA Teeth No" SortExpression="DATeethNo" UniqueName="DATeethNo" MaxLength="3">

                                                        <ColumnValidationSettings EnableRequiredFieldValidation="True"
                                                            RenderValidatorBeforeEditor="True">
                                                            <RequiredFieldValidator SetFocusOnError="True" ForeColor="Red"
                                                                ValidationGroup="VGDentalAdvice">*</RequiredFieldValidator>
                                                        </ColumnValidationSettings>
                                                    </telerik:GridBoundColumn>


                                                </Columns>
                                            </MasterTableView>
                                            <PagerStyle Mode="NumericPages" />

                                            <ValidationSettings ValidationGroup="VGDentalAdvice" />

                                            <ClientSettings EnableRowHoverStyle="true" AllowKeyboardNavigation="true">
                                                <KeyboardNavigationSettings EnableKeyboardShortcuts="true" AllowSubmitOnEnter="true" />
                                            </ClientSettings>

                                        </telerik:RadGrid>
						            </div>
								</td>
							</tr>
						</table>
					</fieldset>
				</div>
				<br />
                 

			</div>
			

			<div style="float:left; width:34%; margin-left:10px;">				
				<div>
					<fieldset>
						<legend>Chief Complaince</legend>
						

						<telerik:RadGrid ID="RGChiefCom" runat="server" DataKeyNames="UserLocationsPrimaryKey"
							AllowAutomaticInserts="True" AllowAutomaticUpdates="True" CellSpacing="0" 
							DataSourceID="SqlDSChiefComp" 
							AutoGenerateEditColumn="True" AllowPaging="True" BorderStyle="Solid" PageSize="5" 
							BorderWidth="1px" GridLines="None" onitemcreated="RGChiefCom_ItemCreated" 
							AllowAutomaticDeletes="True" oniteminserted="RGChiefCom_ItemInserted" Width="375px">
							

							<AlternatingItemStyle BorderStyle="Solid" BorderWidth="1px" />
							
							<GroupHeaderItemStyle BorderStyle="Solid" BorderWidth="1px" />
							
							<MasterTableView AutoGenerateColumns="False" CommandItemDisplay="Top" 
								DataKeyNames="VisitID,CCCode" DataSourceID="SqlDSChiefComp"
								TableLayout="Fixed">
								<Columns>

                                    <telerik:GridTemplateColumn UniqueName="SlNo" HeaderText="SL No">
                                        <ItemTemplate>
                                            <%#Container.DataSetIndex+1 %>
                                        </ItemTemplate>
                                        <HeaderStyle Width="50px" />
                                    </telerik:GridTemplateColumn>

									<telerik:GridDropDownColumn DataSourceID="SqlDSlkp_ChiefCom" Display="False" ColumnEditorID="CCCodeColumnEditor"
										FilterControlAltText="Filter ddCCCode column" HeaderText="CC Code" 
										ListTextField="CG" ListValueField="CCCode" UniqueName="ddCCCode" DataField="CCCode" 
										AllowAutomaticLoadOnDemand="False" Resizable="False">
										
                                        <ColumnValidationSettings EnableRequiredFieldValidation="True" 
											RenderValidatorBeforeEditor="True">
											<RequiredFieldValidator SetFocusOnError="True" forecolor="Red">*</RequiredFieldValidator>
										</ColumnValidationSettings>
									</telerik:GridDropDownColumn>



									<telerik:GridBoundColumn DataField="CCG" DataType="System.Int16" 
										FilterControlAltText="Filter CCCode column" HeaderText="CC Code Des" ReadOnly="True" 
										SortExpression="CCCode" UniqueName="CCCode">
										<HeaderStyle Width="150px" />
										<ItemStyle Width="150px" />
									</telerik:GridBoundColumn>




									<telerik:GridBoundColumn DataField="DurationYY" DataType="System.Byte" ColumnEditorID="TextBoxEditor"
										FilterControlAltText="Filter DurationYY column" HeaderText="YY"
										SortExpression="DurationYY" UniqueName="DurationYY" MaxLength="3">

										<ColumnValidationSettings EnableRequiredFieldValidation="True" 
											RenderValidatorBeforeEditor="True">
											<RequiredFieldValidator SetFocusOnError="True" forecolor="Red" ValidationGroup="VGChiefComplaince">*</RequiredFieldValidator>
										</ColumnValidationSettings>

										

									</telerik:GridBoundColumn>

									<telerik:GridBoundColumn DataField="DurationMM" DataType="System.Byte" ColumnEditorID="TextBoxEditor"
										FilterControlAltText="Filter DurationMM column" HeaderText="MM" 
										SortExpression="DurationMM" UniqueName="DurationMM"  MaxLength="2">

										<ColumnValidationSettings EnableRequiredFieldValidation="True" 
											RenderValidatorBeforeEditor="True">
											<RequiredFieldValidator SetFocusOnError="True" forecolor="Red" ValidationGroup="VGChiefComplaince">*</RequiredFieldValidator>
										</ColumnValidationSettings>
									</telerik:GridBoundColumn>

									<telerik:GridBoundColumn DataField="DurationDD" DataType="System.Byte" ColumnEditorID="TextBoxEditor"
										FilterControlAltText="Filter DurationDD column" HeaderText="DD" 
										SortExpression="DurationDD" UniqueName="DurationDD"  MaxLength="2">

										<ColumnValidationSettings EnableRequiredFieldValidation="True" 
											RenderValidatorBeforeEditor="True">
											<RequiredFieldValidator SetFocusOnError="True" forecolor="Red" ValidationGroup="VGChiefComplaince">*</RequiredFieldValidator>
										</ColumnValidationSettings>
									</telerik:GridBoundColumn>

									<telerik:GridButtonColumn ConfirmText="Delete this Item?" ConfirmDialogType="RadWindow"
										ConfirmTitle="Delete" ButtonType="ImageButton" CommandName="Delete" />

								</Columns>

								<ItemStyle BorderStyle="Solid" />
								<PagerStyle Mode="NumericPages" />
							</MasterTableView>

							<EditItemStyle BorderStyle="Solid" BorderWidth="1px" />
							<FooterStyle BorderStyle="Solid" BorderWidth="1px" />
							<HeaderStyle BorderStyle="Solid" BorderWidth="1px" />
							<FilterItemStyle BorderStyle="Solid" BorderWidth="1px" />
							<CommandItemStyle BorderStyle="Solid" BorderWidth="1px" />
							<ActiveItemStyle BorderStyle="Solid" BorderWidth="1px" />
							<ItemStyle BorderStyle="Solid" BorderWidth="1px" />
							<PagerStyle BorderStyle="Solid" Mode="NumericPages" BorderWidth="1px" />
							<SelectedItemStyle BorderStyle="Solid" BorderWidth="1px" />

							
							<ValidationSettings ValidationGroup="VGChiefComplaince" />

							
							<ClientSettings EnableRowHoverStyle="true" AllowKeyboardNavigation="true">
								 <KeyboardNavigationSettings EnableKeyboardShortcuts="true" AllowSubmitOnEnter="true" />								
							</ClientSettings>


						</telerik:RadGrid>

					</fieldset>
				</div>

				<br />

				<%--<asp:ListItem Text="Select Anemia" Value="0"></asp:ListItem>--%>
				<div>
					<fieldset>
						<legend>Diagnosis</legend>
                        <div>
                            Provisional Dx
                        </div>
                        <table style="width: 100%; height: 100%">
                            <tr style="width: 100%; height: 100%">
                                <td>
                                    <div>
                                        <telerik:RadGrid ID="RGProvisionalDx" runat="server" CellSpacing="0" GridLines="None" 
                                            AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AutoGenerateDeleteColumn="True" 
                                            DataSourceID="SqlDSProvisionalDx" AllowPaging="True" OnItemInserted="RGProvisionalDx_ItemInserted" PageSize="5" Width="375px">
                                            
                                            <ValidationSettings ValidationGroup="VGProvisionalDx" />
                                            
                                            <MasterTableView AutoGenerateColumns="False" CommandItemDisplay="Top" DataSourceID="SqlDSProvisionalDx" 
                                                DataKeyNames="VisitID,PDCode">
                                                <RowIndicatorColumn Visible="False">
                                                </RowIndicatorColumn>
                                                <Columns>
                                                   
                                                    <telerik:GridTemplateColumn UniqueName="SlNo" HeaderText="SL No">
                                                        <ItemTemplate>
                                                            <%#Container.DataSetIndex+1 %>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="50px" />
                                                    </telerik:GridTemplateColumn>

                                                    <telerik:GridDropDownColumn DataSourceID="SqlDSlkp_ProvisionalDx" Display="False" 
                                                        ColumnEditorID="GridDropDownListColumnEditor"
                                                        FilterControlAltText="Filter ddProvisionalDxCode column" HeaderText="ProvisionalDx Code"
                                                        ListTextField="PDDesc" ListValueField="PDCode" UniqueName="ddProvisionalDxCode" 
                                                        DataField="PDCode"
                                                        AllowAutomaticLoadOnDemand="False" Resizable="False">

                                                        <ColumnValidationSettings EnableRequiredFieldValidation="True"
                                                            RenderValidatorBeforeEditor="True">
                                                            <RequiredFieldValidator SetFocusOnError="True" ForeColor="Red">*</RequiredFieldValidator>
                                                        </ColumnValidationSettings>
                                                    </telerik:GridDropDownColumn>

                                                    <telerik:GridBoundColumn DataField="PDCode" DataType="System.Int16" Display="False" 
                                                        FilterControlAltText="Filter PDCode column" HeaderText="PC" ReadOnly="True" 
                                                        SortExpression="PDCode" UniqueName="PDCode">
                                                    </telerik:GridBoundColumn>

                                                    <telerik:GridBoundColumn DataField="PDDesc" FilterControlAltText="Filter PDDesc column" 
                                                        HeaderText="PDDesc Des" ReadOnly="True" SortExpression="PDDesc" UniqueName="PDDesc">
                                                    </telerik:GridBoundColumn>
                                                </Columns>
                                            </MasterTableView>
                                            <PagerStyle Mode="NumericPages" />
                                        </telerik:RadGrid>

                                    </div>
                                </td>
                            </tr>
                        </table>
						<br />
						<table style="width:100%; height:100%">
							<tr style="width:100%; height:100%">
								<td>
									<div>
                                        Differential Dx
									</div>

                                    <div>
                                         <telerik:RadGrid ID="RGDifferentialDx" runat="server" CellSpacing="0" GridLines="None" 
                                            AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AutoGenerateDeleteColumn="True" 
                                            DataSourceID="SqlDSDifferentialDx" AllowPaging="True" OnItemInserted="RGDifferentialDx_ItemInserted" PageSize="5" Width="375px">
                                            
                                            <ValidationSettings ValidationGroup="VGDifferentialDx" />
                                            
                                            <MasterTableView AutoGenerateColumns="False" CommandItemDisplay="Top" DataSourceID="SqlDSDifferentialDx" 
                                                DataKeyNames="VisitID,PDCode">
                                                <RowIndicatorColumn Visible="False">
                                                </RowIndicatorColumn>
                                                <Columns>
                                                    
                                                   <telerik:GridTemplateColumn UniqueName="SlNo" HeaderText="SL No">
                                                        <ItemTemplate>
                                                            <%#Container.DataSetIndex+1 %>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="50px" />
                                                    </telerik:GridTemplateColumn>

                                                    <telerik:GridDropDownColumn DataSourceID="SqlDSlkp_ProvisionalDx" Display="False" 
                                                        ColumnEditorID="GridDropDownListColumnEditor"
                                                        FilterControlAltText="Filter ddProvisionalDxCode column" HeaderText="ProvisionalDx Code"
                                                        ListTextField="PDDesc" ListValueField="PDCode" UniqueName="ddProvisionalDxCode" 
                                                        DataField="PDCode"
                                                        AllowAutomaticLoadOnDemand="False" Resizable="False">

                                                        <ColumnValidationSettings EnableRequiredFieldValidation="True"
                                                            RenderValidatorBeforeEditor="True">
                                                            <RequiredFieldValidator SetFocusOnError="True" ForeColor="Red">*</RequiredFieldValidator>
                                                        </ColumnValidationSettings>
                                                    </telerik:GridDropDownColumn>

                                                    <telerik:GridBoundColumn DataField="PDCode" DataType="System.Int16" Display="False" 
                                                        FilterControlAltText="Filter PDCode column" HeaderText="PC" ReadOnly="True" 
                                                        SortExpression="PDCode" UniqueName="PDCode">
                                                    </telerik:GridBoundColumn>

                                                    <telerik:GridBoundColumn DataField="DifferentialDx" FilterControlAltText="Filter DifferentialDx column" 
                                                        HeaderText="DifferentialDx Des" ReadOnly="True" SortExpression="DifferentialDx" UniqueName="DifferentialDx">
                                                    </telerik:GridBoundColumn>
                                                </Columns>
                                            </MasterTableView>
                                            <PagerStyle Mode="NumericPages" />
                                        </telerik:RadGrid>
						            </div>
								</td>
							</tr>
							
							</table>
				
						<br />
						<table style="width:100%; height:100%">
							<tr style="width:100%; height:100%">
								<td>
									<div>
                                        Confirm Dx
									</div>

                                    <div>
                                        
                                         <telerik:RadGrid ID="RGConfirmDx" runat="server" CellSpacing="0" GridLines="None" 
                                            AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AutoGenerateDeleteColumn="True" 
                                            DataSourceID="SqlDSConfirmDx" AllowPaging="True" OnItemInserted="RGConfirmDx_ItemInserted" PageSize="5" Width="375px">
                                            
                                            <ValidationSettings ValidationGroup="VGConfirmDx" />
                                            
                                            <MasterTableView AutoGenerateColumns="False" CommandItemDisplay="Top" DataSourceID="SqlDSConfirmDx" 
                                                DataKeyNames="VisitID,PDCode">
                                                <RowIndicatorColumn Visible="False">
                                                </RowIndicatorColumn>
                                                <Columns>
                                                    
                                                    <telerik:GridTemplateColumn UniqueName="SlNo" HeaderText="SL No">
                                                        <ItemTemplate>
                                                            <%#Container.DataSetIndex+1 %>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="50px" />
                                                    </telerik:GridTemplateColumn>

                                                    <telerik:GridDropDownColumn DataSourceID="SqlDSlkp_ProvisionalDx" Display="False" 
                                                        ColumnEditorID="GridDropDownListColumnEditor"
                                                        FilterControlAltText="Filter ddProvisionalDxCode column" HeaderText="ProvisionalDx Code"
                                                        ListTextField="PDDesc" ListValueField="PDCode" UniqueName="ddProvisionalDxCode" 
                                                        DataField="PDCode"
                                                        AllowAutomaticLoadOnDemand="False" Resizable="False">

                                                        <ColumnValidationSettings EnableRequiredFieldValidation="True"
                                                            RenderValidatorBeforeEditor="True">
                                                            <RequiredFieldValidator SetFocusOnError="True" ForeColor="Red">*</RequiredFieldValidator>
                                                        </ColumnValidationSettings>
                                                    </telerik:GridDropDownColumn>

                                                    <telerik:GridBoundColumn DataField="PDCode" DataType="System.Int16" Display="False" 
                                                        FilterControlAltText="Filter PDCode column" HeaderText="PC" ReadOnly="True" 
                                                        SortExpression="PDCode" UniqueName="PDCode">
                                                    </telerik:GridBoundColumn>

                                                    <telerik:GridBoundColumn DataField="ConfirmDx" FilterControlAltText="Filter ConfirmDx column" 
                                                        HeaderText="ConfirmDx Des" ReadOnly="True" SortExpression="ConfirmDx" UniqueName="ConfirmDx">
                                                    </telerik:GridBoundColumn>
                                                </Columns>
                                            </MasterTableView>
                                            <PagerStyle Mode="NumericPages" />
                                        </telerik:RadGrid>

						            </div>
								</td>
							</tr>
						</table>
					</fieldset>
				</div>


				<br />

				<div>
					<fieldset>
					<legend>Treatment</legend>
					<table style="width:92%; height:100%">
							<tr style="width:100%; height:100%">
								<td>
									<div>
                                        <telerik:RadGrid ID="RGTreatment" runat="server" CellSpacing="0" GridLines="None" 
                                            AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AutoGenerateDeleteColumn="True" 
                                            DataSourceID="SqlDSTreatment" AllowPaging="True" OnItemInserted="RGTreatment_ItemInserted" PageSize="5" 
                                            OnItemCreated="RGTreatment_ItemCreated" Width="375px">
                                            

                                            <MasterTableView AutoGenerateColumns="False" CommandItemDisplay="Top" DataSourceID="SqlDSTreatment" 
                                                DataKeyNames="VisitID,MNCode,FreCode,TreCode">
                                                <RowIndicatorColumn Visible="False">
                                                </RowIndicatorColumn>
                                                
                                                <Columns>
                                                    
                                                    <telerik:GridTemplateColumn UniqueName="SlNo" HeaderText="SL No">
                                                        <ItemTemplate>
                                                            <%#Container.DataSetIndex+1 %>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="50px" />
                                                    </telerik:GridTemplateColumn>

                                                   <%-- DD-01--%>
                                                    <telerik:GridDropDownColumn DataSourceID="SqlDSlkp_MedicineName" Display="False" 
                                                        ColumnEditorID="GridDropDownListColumnEditorSm"
                                                        FilterControlAltText="Filter ddMNCode column" HeaderText="Medicine Code"
                                                        ListTextField="TradeName" ListValueField="MNCode"
                                                         UniqueName="ddMNCode" DataField="MNCode"
                                                        AllowAutomaticLoadOnDemand="False" Resizable="False">

                                                        <ColumnValidationSettings EnableRequiredFieldValidation="True"
                                                            RenderValidatorBeforeEditor="True">
                                                            <RequiredFieldValidator SetFocusOnError="True" ForeColor="Red">*</RequiredFieldValidator>
                                                        </ColumnValidationSettings>
                                                    </telerik:GridDropDownColumn>

                                                    <telerik:GridBoundColumn DataField="MedQty" FilterControlAltText="Filter MedQty column" 
                                                        ColumnEditorID="TextBoxEditor" DataType="System.Byte"
                                                        HeaderText="MedQty" SortExpression="MedQty" UniqueName="MedQty"  MaxLength="3">

                                                        <ColumnValidationSettings EnableRequiredFieldValidation="True"
                                                            RenderValidatorBeforeEditor="True">
                                                            <RequiredFieldValidator SetFocusOnError="True" ForeColor="Red" ValidationGroup="VGTreatment">*</RequiredFieldValidator>
                                                        </ColumnValidationSettings>
                                                    </telerik:GridBoundColumn>



                                                     <%-- DD-02--%>
                                                    <telerik:GridDropDownColumn DataSourceID="SqlDSlkp_Frequency" Display="False" 
                                                        ColumnEditorID="GridDropDownListColumnEditorSm"
                                                        FilterControlAltText="Filter ddFreCode column" HeaderText="Frequency Code"
                                                        ListTextField="FreDesc" ListValueField="FreCode"
                                                         UniqueName="ddFreCode" DataField="FreCode"
                                                        AllowAutomaticLoadOnDemand="False" Resizable="False">

                                                        <ColumnValidationSettings EnableRequiredFieldValidation="True"
                                                            RenderValidatorBeforeEditor="True">
                                                            <RequiredFieldValidator SetFocusOnError="True" ForeColor="Red">*</RequiredFieldValidator>
                                                        </ColumnValidationSettings>
                                                    </telerik:GridDropDownColumn>

                                                     <%-- DD-03--%>
                                                    <telerik:GridDropDownColumn DataSourceID="SqlDSlkp_Treatment" Display="False" 
                                                        ColumnEditorID="GridDropDownListColumnEditorSm"
                                                        FilterControlAltText="Filter ddTreCode column" HeaderText="TreDesc Code"
                                                        ListTextField="TreDesc" ListValueField="TreCode"
                                                         UniqueName="ddTreCode" DataField="TreCode"
                                                        AllowAutomaticLoadOnDemand="False" Resizable="False">

                                                        <ColumnValidationSettings EnableRequiredFieldValidation="True"
                                                            RenderValidatorBeforeEditor="True">
                                                            <RequiredFieldValidator SetFocusOnError="True" ForeColor="Red">*</RequiredFieldValidator>
                                                        </ColumnValidationSettings>
                                                    </telerik:GridDropDownColumn>


                                                    <%--Row: 01--%>
                                                    <telerik:GridBoundColumn DataField="MNCode" DataType="System.Int16" Display="False" 
                                                        FilterControlAltText="Filter MNCode column" HeaderText="MC" 
                                                        ReadOnly="True" SortExpression="MNCode" UniqueName="MNCode">
                                                    </telerik:GridBoundColumn>

                                                    <telerik:GridBoundColumn DataField="TradeName" FilterControlAltText="Filter TradeName column" 
                                                        HeaderText="Trade Name" ReadOnly="True" SortExpression="TradeName" UniqueName="TradeName">
                                                    </telerik:GridBoundColumn>

                                                     <%--Row: 02--%>
                                                    <telerik:GridBoundColumn DataField="FreCode" DataType="System.Int16" Display="False" 
                                                        FilterControlAltText="Filter FreCode column" HeaderText="FC" 
                                                        ReadOnly="True" SortExpression="FreCode" UniqueName="FreCode">
                                                    </telerik:GridBoundColumn>

                                                    <telerik:GridBoundColumn DataField="FreDesc" FilterControlAltText="Filter FreDesc column" 
                                                        HeaderText="Frequency Type" ReadOnly="True" SortExpression="FreDesc" UniqueName="FreDesc">
                                                    </telerik:GridBoundColumn>

                                                     <%--Row: 03--%>
                                                    <telerik:GridBoundColumn DataField="TreCode" DataType="System.Int16" Display="False" 
                                                        FilterControlAltText="Filter TreCode column" HeaderText="TC" 
                                                        ReadOnly="True" SortExpression="TreCode" UniqueName="TreCode">
                                                    </telerik:GridBoundColumn>

                                                    <telerik:GridBoundColumn DataField="TreDesc" FilterControlAltText="Filter TreDesc column" 
                                                        HeaderText="TreDesc" ReadOnly="True" SortExpression="TreDesc" UniqueName="TreDesc">
                                                    </telerik:GridBoundColumn>


                                                </Columns>
                                            </MasterTableView>
                                            <PagerStyle Mode="NumericPages" />

                                            <ValidationSettings ValidationGroup="VGTreatment" />


                                            <ClientSettings EnableRowHoverStyle="true" AllowKeyboardNavigation="true">
                                                <KeyboardNavigationSettings EnableKeyboardShortcuts="true" AllowSubmitOnEnter="true" />
                                            </ClientSettings>

                                        </telerik:RadGrid>
									</div>
								</td>
							</tr>
						</table>
					</fieldset>
				</div>

                <div>
                    <br />
                </div>

                <div style="width: 100%; height: 100%">
                    <fieldset>
                        <table style="width: 100%; height: 100%">
                            <tr>
                                <td style="width: 20%; height: 100%">&nbsp;</td>
                                <td style="width: 20%; height: 100%">

                                    <asp:Button class="clsSave" ID="btnSave" runat="server" Text="Save"
                                        OnClick="btnSave_Click"></asp:Button>
                                </td>
                                <td style="width: 20%; height: 100%">
                                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" align="center"
                                        OnClientClick="return confirmCancel()" />
                                </td>
                                <td style="width: 20%; height: 100%">&nbsp;</td>
                                <td style="width: 20%; height: 100%">&nbsp;</td>
                            </tr>
                        </table>
                    </fieldset>
                     <br />
                </div>

			</div>
		</div>



        <div class="hidden">
                <div>
                    <table style="width: 90%; height: 100%">
                        <tr>
                            <td>
                                <br />
                            </td>
                        </tr>
                    </table>
                </div>

		<div style="width:90%; height:100%">
		</div>

		<div style="width:90%; height:100%">
		</div>



		<div>
			 <table style="width:90%; height:100%">
			 <tr>
				 <td>
                     &nbsp;</td>
			 </tr>
			 <tr>
				 <td>
                     <telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
                     </telerik:RadScriptManager>
				</td>
			 </tr>

            <tr>
                <td>
                    &nbsp;</td>
            </tr>

			 </table>
		</div>

		<div>
			 <table style="width:90%; height:100%">
			 <tr>
				 <td>

				 </td>
			 </tr>

			  <tr>
				 <td>
					<telerik:GridDropDownListColumnEditor ID="CCCodeColumnEditor" DropDownStyle-Width="345" runat="server" /> 
				 </td>
			 </tr>

            <tr>
                <td>
                    <telerik:GridDropDownListColumnEditor ID="GridDropDownListColumnEditor"
                        DropDownStyle-Width="200" runat="server" />
                </td>
            </tr>

            <tr>
                <td>
                   <telerik:GridDropDownListColumnEditor ID="GridDropDownListColumnEditorSm" DropDownStyle-Width="150" runat="server" />
                </td>
            </tr>

                 <tr>
                     <td>
                         <telerik:GridDropDownListColumnEditor ID="GridDropDownListColumnEditorFontBng"
                             DropDownStyle-Font-Names="SutonnyMJ"
                        DropDownStyle-Width="200" runat="server" />
                     </td>
                 </tr>
                                   

                  <tr>
                     <td>

                     </td>
                 </tr>

                  <tr>
                     <td class="auto-style1">

                     </td>
                 </tr>

			 <tr>
				 <td>
					<telerik:GridTextBoxColumnEditor ID="TextBoxEditor" 
					TextBoxStyle-Width="50" 
					runat="server" />
				 </td>
			 </tr>

                 <tr>
                     <td>
                         <telerik:RadInputManager runat="server" ID="ChiefComRadInputManager" Enabled="true">

                             <telerik:NumericTextBoxSetting BehaviorID="YYNumericTextBoxSetting" Type="Number"
                                 AllowRounding="true" DecimalDigits="0" MinValue="0" MaxValue="120">
                             </telerik:NumericTextBoxSetting>

                             <telerik:NumericTextBoxSetting BehaviorID="DDNumericTextBoxSetting" Type="Number"
                                 AllowRounding="true" DecimalDigits="0" MinValue="0" MaxValue="30">
                             </telerik:NumericTextBoxSetting>

                             <telerik:NumericTextBoxSetting BehaviorID="MMNumericTextBoxSetting" Type="Number"
                                 AllowRounding="true" DecimalDigits="0" MinValue="0" MaxValue="11">
                             </telerik:NumericTextBoxSetting>

                             <telerik:NumericTextBoxSetting BehaviorID="MedQtyNumericTextBoxSetting" Type="Number"
                                 AllowRounding="true" DecimalDigits="0" MinValue="0" MaxValue="150">
                             </telerik:NumericTextBoxSetting>

                         </telerik:RadInputManager>
                     </td>
                 </tr>


                 <tr>
                     <td>
                         <telerik:RadInputManager runat="server" ID="TreatmentRadInputManager" Enabled="true">

                             <telerik:NumericTextBoxSetting BehaviorID="MedQtyNumericTextBoxSetting" Type="Number"
                                 AllowRounding="true" DecimalDigits="0" MinValue="0" MaxValue="150">
                             </telerik:NumericTextBoxSetting>

                         </telerik:RadInputManager>
                     </td>
                 </tr>

                  <tr>
                     <td>
                         <telerik:RadInputManager runat="server" ID="DentalSignRadInputManager" Enabled="true">

                             <telerik:NumericTextBoxSetting BehaviorID="SignTeethNoNumericTextBoxSetting" Type="Number"
                                 AllowRounding="true" DecimalDigits="0" MinValue="0" MaxValue="32">
                             </telerik:NumericTextBoxSetting>

                         </telerik:RadInputManager>
                     </td>
                 </tr>

                  <tr>
                     <td>
                         <telerik:RadInputManager runat="server" ID="DentalAdviceRadInputManager" Enabled="true">

                             <telerik:NumericTextBoxSetting BehaviorID="DATeethNoNumericTextBoxSetting" Type="Number"
                                 AllowRounding="true" DecimalDigits="0" MinValue="0" MaxValue="32">
                             </telerik:NumericTextBoxSetting>

                         </telerik:RadInputManager>
                     </td>
                 </tr>


  
                 <tr>
                     <td>
                         <telerik:RadAjaxManager runat="server" ID="PrescriptionRadAjaxManager" DefaultLoadingPanelID="RadAjaxLoadingPanel1">
                             <AjaxSettings>

                                 <telerik:AjaxSetting AjaxControlID="RGChiefCom">
                                     <UpdatedControls>
                                         <telerik:AjaxUpdatedControl ControlID="RGChiefCom" />

                                         <telerik:AjaxUpdatedControl ControlID="RGProvisionalDx" />
                                         <telerik:AjaxUpdatedControl ControlID="RGDifferentialDx" />

                                         <telerik:AjaxUpdatedControl ControlID="RGConfirmDx" />


                                         <telerik:AjaxUpdatedControl ControlID="RGInvestigations" />

                                         <telerik:AjaxUpdatedControl ControlID="RGPositiveFindings" />
                                         
                                         <telerik:AjaxUpdatedControl ControlID="RGNegativeFindings" />

                                         <telerik:AjaxUpdatedControl ControlID="RGDentalSign" />

                                         <telerik:AjaxUpdatedControl ControlID="RGAdvice" />

                                         <telerik:AjaxUpdatedControl ControlID="ChiefComRadInputManager" />
                                         
                                     </UpdatedControls>
                                 </telerik:AjaxSetting>

                             </AjaxSettings>

                            <AjaxSettings>
                                 <telerik:AjaxSetting AjaxControlID="RGTreatment">
                                     <UpdatedControls>
                                         <telerik:AjaxUpdatedControl ControlID="RGTreatment" />
                                         <telerik:AjaxUpdatedControl ControlID="TreatmentRadInputManager" />
                                     </UpdatedControls>
                                 </telerik:AjaxSetting>
                             </AjaxSettings>
                             
                              <AjaxSettings>
                                 <telerik:AjaxSetting AjaxControlID="RGDentalSign">
                                     <UpdatedControls>
                                         <telerik:AjaxUpdatedControl ControlID="RGDentalSign" />
                                         <telerik:AjaxUpdatedControl ControlID="DentalSignRadInputManager" />
                                     </UpdatedControls>
                                 </telerik:AjaxSetting>
                             </AjaxSettings>

                              <AjaxSettings>
                                 <telerik:AjaxSetting AjaxControlID="RGDentalAdvice">
                                     <UpdatedControls>
                                         <telerik:AjaxUpdatedControl ControlID="RGDentalAdvice" />
                                         <telerik:AjaxUpdatedControl ControlID="DentalAdviceRadInputManager" />
                                     </UpdatedControls>
                                 </telerik:AjaxSetting>
                             </AjaxSettings>

                         </telerik:RadAjaxManager>
                     </td>
                 </tr>


                 <tr>
                     <td>
                        
                     </td>
                 </tr>

                 <tr>
                     <td>
                         <telerik:RadWindowManager ID="RadWindowManager" runat="server">
                         </telerik:RadWindowManager>
                     </td>
                 </tr>

			  <tr>
				 <td>
					
				 </td>
			 </tr>

			  <tr>
				 <td>
					
				 </td>
			 </tr>

			 <tr>
				 <td>
					 
					 <asp:SqlDataSource ID="SqlDSChiefComp" runat="server" 
						 ConnectionString="<%$ ConnectionStrings:OnLinePrescriptionConnectionString %>" 
						 ProviderName="System.Data.SqlClient" 

						 SelectCommand="SELECT c.VisitID, l.CCCode, l.CCGroup + ' &gt; ' + l.CCDesc AS CCG, c.DurationYY, c.DurationMM, c.DurationDD 
                         FROM ChiefComplaince AS c INNER JOIN lkp_ChiefComplaince AS l ON c.CCCode = l.CCCode WHERE (c.VisitID = @VisitID)"
						 

                         DeleteCommand="DELETE FROM [ChiefComplaince] WHERE [VisitID] = @VisitID AND [CCCode] = @CCCode" 

						 InsertCommand="INSERT INTO [ChiefComplaince] ([VisitID], [CCCode], [DurationYY], [DurationMM], [DurationDD]) 
                            VALUES (@VisitID, @CCCode, @DurationYY, @DurationMM, @DurationDD)" 

						 UpdateCommand="UPDATE [ChiefComplaince] SET [DurationYY] = @DurationYY, [DurationMM] = @DurationMM, [DurationDD] = @DurationDD WHERE [VisitID] = @VisitID AND [CCCode] = @CCCode">
						 
                         <DeleteParameters>
							 <asp:Parameter Name="VisitID" Type="String" />							
						 </DeleteParameters>

						 <InsertParameters>
							 
							  <asp:ControlParameter ControlID="txtVisitID" Name="VisitID" PropertyName="Text" Type="String" />
							  <asp:SessionParameter SessionField="ddCCCode" Name="CCCode" Type="Int32" />

							 <asp:Parameter Name="DurationYY" Type="Byte" />
							 <asp:Parameter Name="DurationMM" Type="Byte" />
							 <asp:Parameter Name="DurationDD" Type="Byte" />
						 </InsertParameters>

						 <SelectParameters>
							 <asp:ControlParameter ControlID="txtVisitID" Name="VisitID" PropertyName="Text" Type="String" />
						 </SelectParameters>

					 	<UpdateParameters>
							<asp:Parameter Name="DurationYY" Type="Byte" />
							<asp:Parameter Name="DurationMM" Type="Byte" />
							<asp:Parameter Name="DurationDD" Type="Byte" />
							<asp:Parameter Name="VisitID" Type="String" />
							<asp:Parameter Name="CCCode" Type="Int16" />
						 </UpdateParameters>
					 </asp:SqlDataSource>
					 
				</td>
			 </tr>

			  <tr>
				 <td>
					 
					 <asp:SqlDataSource ID="SqlDSlkp_ChiefCom" runat="server" 
						 ConnectionString="<%$ ConnectionStrings:OnLinePrescriptionConnectionString %>"
						 ProviderName="System.Data.SqlClient" 
						 SelectCommand="SELECT CCCode, CCGroup + ' &gt; ' + CCDesc AS CG FROM lkp_ChiefComplaince WHERE (CCGroup &lt;&gt; '') ORDER BY CG">
					 </asp:SqlDataSource>
					 
				</td>
			 </tr>

                 <tr>
                     <td>&nbsp;</td>
                 </tr>

			 <tr>
				 <td>
					 <asp:SqlDataSource ID="SqlDSProvisionalDx" runat="server" 
                         ConnectionString="<%$ ConnectionStrings:OnLinePrescriptionConnectionString %>" 
                         DeleteCommand="DELETE FROM [ProvisionalDx] WHERE [VisitID] = @VisitID AND [PDCode] = @PDCode" 
                         InsertCommand="INSERT INTO [ProvisionalDx] ([VisitID], [PDCode]) VALUES (@VisitID, @PDCode)" 

                          SelectCommand="select p.VisitID, lp.PDCode,lp.PDGroup + '&gt; ' + lp.PDDesc AS PDDesc 
                         from [ProvisionalDx] p inner join [lkp_ProvisionalDx] as lp on p.PDCode=lp.PDCode WHERE ([VisitID] = @VisitID)">

                         <DeleteParameters>
                             <asp:Parameter Name="VisitID" Type="String" />
                             <asp:Parameter Name="PDCode" Type="Int32" />
                         </DeleteParameters>

                         <InsertParameters>
                             <asp:ControlParameter ControlID="txtVisitID" Name="VisitID" PropertyName="Text" Type="String" />
                             <asp:SessionParameter SessionField="ddProvisionalDxCode" Name="PDCode" Type="Int32" />
                         </InsertParameters>

                         <SelectParameters>
                             <asp:ControlParameter ControlID="txtVisitID" Name="VisitID" PropertyName="Text" Type="String" />
                         </SelectParameters>
                         
                     </asp:SqlDataSource>
                 </td>
			 </tr>
              
                 <tr>
                     <td>

                         <asp:SqlDataSource ID="SqlDSlkp_ProvisionalDx" runat="server"
                             ConnectionString="<%$ ConnectionStrings:OnLinePrescriptionConnectionString %>"
                             
                             SelectCommand="SELECT PDCode,PDGroup + '&gt; ' + PDDesc AS PDDesc FROM [lkp_ProvisionalDx]">

                         </asp:SqlDataSource>

                     </td>
                 </tr>

                 <tr>
                     <td>

                     </td>
                 </tr>

                  <tr>
                     <td>
                         <asp:SqlDataSource ID="SqlDSDifferentialDx" runat="server"
                             ConnectionString="<%$ ConnectionStrings:OnLinePrescriptionConnectionString %>"
                             DeleteCommand="DELETE FROM [DifferentialDx] WHERE [VisitID] = @VisitID AND [DDCode] = @PDCode"
                             InsertCommand="INSERT INTO [DifferentialDx] ([VisitID], [DDCode]) VALUES (@VisitID, @PDCode)"
                             SelectCommand="select d.VisitID, lp.PDCode,lp.PDGroup + '&gt; ' + lp.PDDesc AS DifferentialDx 
                         from [DifferentialDx] d inner join [lkp_ProvisionalDx] as lp on d.DDCode=lp.PDCode WHERE ([VisitID] = @VisitID)">


                             <DeleteParameters>
                                 <asp:Parameter Name="VisitID" Type="String" />
                                 <asp:Parameter Name="DDCode" Type="Int16" />
                             </DeleteParameters>

                             <InsertParameters>
                                 <asp:ControlParameter ControlID="txtVisitID" Name="VisitID" PropertyName="Text" Type="String" />
                                 <asp:SessionParameter SessionField="ddProvisionalDxCode" Name="PDCode" Type="Int32" />
                             </InsertParameters>

                             <SelectParameters>
                                 <asp:ControlParameter ControlID="txtVisitID" Name="VisitID" PropertyName="Text" Type="String" />
                             </SelectParameters>

                         </asp:SqlDataSource>
                     </td>
                 </tr>

                  <tr>
                     <td>

                     </td>
                 </tr>

                  <tr>
                     <td>
                         <asp:SqlDataSource ID="SqlDSConfirmDx" runat="server"
                             ConnectionString="<%$ ConnectionStrings:OnLinePrescriptionConnectionString %>"
                             DeleteCommand="DELETE FROM [ConfirmDx] WHERE [VisitID] = @VisitID AND [CDCode] = @PDCode"
                             InsertCommand="INSERT INTO [ConfirmDx] ([VisitID], [CDCode]) VALUES (@VisitID, @PDCode)"

                            SelectCommand="select c.VisitID, lp.PDCode,lp.PDGroup + '&gt; ' + lp.PDDesc AS ConfirmDx 
                         from [ConfirmDx] c inner join [lkp_ProvisionalDx] as lp on c.CDCode=lp.PDCode WHERE ([VisitID] = @VisitID)">

                            


                             <DeleteParameters>
                                 <asp:Parameter Name="VisitID" Type="String" />
                                 <asp:Parameter Name="CDCode" Type="Int16" />
                             </DeleteParameters>

                             <InsertParameters>
                                 <asp:ControlParameter ControlID="txtVisitID" Name="VisitID" PropertyName="Text" Type="String" />
                                 <asp:SessionParameter SessionField="ddProvisionalDxCode" Name="PDCode" Type="Int32" />
                             </InsertParameters>

                             <SelectParameters>
                                 <asp:ControlParameter ControlID="txtVisitID" Name="VisitID" PropertyName="Text" Type="String" />
                             </SelectParameters>                           

                         </asp:SqlDataSource>
                     </td>
                 </tr>

                 <tr>
                     <td>

                     </td>
                 </tr>

                 <tr>
                     <td>
                         <asp:SqlDataSource ID="SqlDSTreatment" runat="server" 
                             ConnectionString="<%$ ConnectionStrings:OnLinePrescriptionConnectionString %>" 
                             DeleteCommand="DELETE FROM [MedicineDetails] WHERE [VisitID] = @VisitID AND [MNCode] = @MNCode" 
                             
                             InsertCommand="INSERT INTO [MedicineDetails] ([VisitID], [MNCode], [MedQty], [FreCode], [TreCode], 
                             [MedicinePrice], [MedDispuse], [MedReqQty], [MedDispuseDt]) VALUES (@VisitID, @MNCode, @MedQty, 
                             @FreCode, @TreCode, (SELECT MedicinePrice FROM lkp_MedicineName where MNCode=@MNCode) , 0, 0, 0)"

                              
                            SelectCommand="select md.VisitID,md.MedQty,lm.MNCode,lm.TradeName,lm.MedicinePrice,lf.FreCode,
                            lf.FreDesc,lt.TreCode,lt.TreDesc from [MedicineDetails] as md
                            inner join lkp_MedicineName lm on md.MNCode=lm.MNCode
                            inner join lkp_Frequency lf on md.FreCode=lf.FreCode
                            inner join lkp_Treatment lt on md.TreCode=lt.TreCode
                            WHERE ([VisitID] = @VisitID)" 
                             

                             UpdateCommand="UPDATE [MedicineDetails] SET [MedQty] = @MedQty, [FreCode] = @FreCode, [TreCode] = @TreCode, 
                             [MedicinePrice] = @MedicinePrice, [MedDispuse] = @MedDispuse, [MedReqQty] = @MedReqQty, [MedDispuseDt] = @MedDispuseDt 
                             WHERE [VisitID] = @VisitID AND [MNCode] = @MNCode">
                             
                             <DeleteParameters>
                                 <asp:Parameter Name="VisitID" Type="String" />
                                 <asp:Parameter Name="MNCode" Type="Int16" />
                             </DeleteParameters>
                             
                             <InsertParameters>
                                 <asp:ControlParameter ControlID="txtVisitID" Name="VisitID" PropertyName="Text" Type="String" />
                                 <asp:SessionParameter SessionField="ddMNCode" Name="MNCode" Type="Int32" />
                                 
                                 <asp:Parameter Name="MedQty" Type="Int16" />

                                 <asp:SessionParameter SessionField="ddFreCode" Name="FreCode" Type="Int32" />
                                 <asp:SessionParameter SessionField="ddTreCode" Name="TreCode" Type="Int32" />

                                 <asp:Parameter Name="MedicinePrice" Type="Decimal" />

                             </InsertParameters>

                             

                             <SelectParameters>
                                 <asp:ControlParameter ControlID="txtVisitID" Name="VisitID" PropertyName="Text" Type="String" />
                             </SelectParameters>
                            
                              <UpdateParameters>
                                 <asp:Parameter Name="MedQty" Type="Int16" />
                                 <asp:Parameter Name="FreCode" Type="Int16" />
                                 <asp:Parameter Name="TreCode" Type="Byte" />
                                 <asp:Parameter Name="MedicinePrice" Type="Decimal" />
                                 <asp:Parameter Name="MedDispuse" Type="Boolean" />
                                 <asp:Parameter Name="MedReqQty" Type="Int16" />
                                 <asp:Parameter Name="MedDispuseDt" Type="DateTime" />
                                 <asp:Parameter Name="VisitID" Type="String" />
                                 <asp:Parameter Name="MNCode" Type="Int16" />
                             </UpdateParameters>
                         </asp:SqlDataSource>
                     </td>
                 </tr>

                  <tr>
                     <td>
                         <asp:SqlDataSource ID="SqlDSlkp_MedicineName" runat="server" ConnectionString="<%$ ConnectionStrings:OnLinePrescriptionConnectionString %>" 
                             SelectCommand="SELECT [MNCode], [TradeName] FROM [lkp_MedicineName]"></asp:SqlDataSource>
                     </td>
                 </tr>

                  <tr>
                     <td>
                         <asp:SqlDataSource ID="SqlDSlkp_Frequency" runat="server" ConnectionString="<%$ ConnectionStrings:OnLinePrescriptionConnectionString %>" SelectCommand="SELECT [FreCode], [FreDesc] FROM [lkp_Frequency]"></asp:SqlDataSource>
                     </td>
                 </tr>

                  <tr>
                     <td>
                         <asp:SqlDataSource ID="SqlDSlkp_Treatment" runat="server" ConnectionString="<%$ ConnectionStrings:OnLinePrescriptionConnectionString %>" SelectCommand="SELECT [TreCode], [TreDesc] FROM [lkp_Treatment]"></asp:SqlDataSource>
                     </td>
                 </tr>

                 <tr>
                     <td>

                     </td>
                 </tr>

                 <tr>
                     <td>

                         <asp:SqlDataSource ID="SqlDSInvestigation" runat="server" 
                             ConnectionString="<%$ ConnectionStrings:OnLinePrescriptionConnectionString %>"
         
                             DeleteCommand="DELETE FROM [Investigations] WHERE [VisitID] = @VisitID AND [InvCode] = @InvCode" 

                             InsertCommand="INSERT INTO [Investigations] ([VisitID], [InvCode]) VALUES (@VisitID, @InvCode)" 
                             
                             SelectCommand="select i.VisitID, i.InvCode,lkp.InvDesc FROM [Investigations] i
                             inner join lkp_Investigations as lkp on i.InvCode=lkp.InvCode WHERE ([VisitID] = @VisitID)">
                                                            
                             <DeleteParameters>
                                 <asp:Parameter Name="VisitID" Type="String" />
                                 <asp:Parameter Name="InvCode" Type="Int16" />
                             </DeleteParameters>
                             
                             <InsertParameters>
                                 <asp:ControlParameter ControlID="txtVisitID" Name="VisitID" PropertyName="Text" Type="String" />
                                 <asp:SessionParameter SessionField="ddInvestigationCode" Name="InvCode" Type="Int32" />
                             </InsertParameters>
                             
                             <SelectParameters>
                                 <asp:ControlParameter ControlID="txtVisitID" Name="VisitID" PropertyName="Text" Type="String" />
                             </SelectParameters>
                                                                                 
                         </asp:SqlDataSource>

                     </td>
                 </tr>

			  <tr>
				 <td>

                     <asp:SqlDataSource ID="SqlDSlkp_Investigations" runat="server"
                         ConnectionString="<%$ ConnectionStrings:OnLinePrescriptionConnectionString %>"
                         SelectCommand="SELECT InvCode,InvDesc FROM [lkp_Investigations]"></asp:SqlDataSource>

				</td>
			 </tr>

                 <tr>
                     <td>
                     </td>
                 </tr>

                  <tr>
                     <td>
                         <asp:SqlDataSource ID="SqlDSPositiveFindings" runat="server" 
                             ConnectionString="<%$ ConnectionStrings:OnLinePrescriptionConnectionString %>" 
                             DeleteCommand="DELETE FROM [PositiveFindings] WHERE [VisitID] = @VisitID AND [PFCode] = @PFCode" 
                             InsertCommand="INSERT INTO [PositiveFindings] ([VisitID], [PFCode]) VALUES (@VisitID, @PFCode)" 
                             
                              SelectCommand="select p.VisitID, p.PFCode,lkp.PFDesc FROM [PositiveFindings] p
                             inner join lkp_PositiveFindings as lkp on p.PFCode=lkp.PFCode WHERE ([VisitID] = @VisitID)">
                             
                             <DeleteParameters>
                                 <asp:Parameter Name="VisitID" Type="String" />
                                 <asp:Parameter Name="PFCode" Type="Int16" />
                             </DeleteParameters>
                             
                             <InsertParameters>
                                <asp:ControlParameter ControlID="txtVisitID" Name="VisitID" PropertyName="Text" Type="String" />
                                 <asp:Parameter Name="PFCode" Type="Int16" />
                             </InsertParameters>
                             
                             <SelectParameters>
                                 <asp:ControlParameter ControlID="txtVisitID" Name="VisitID" PropertyName="Text" Type="String" />
                             </SelectParameters>
                             
                         </asp:SqlDataSource>
                     </td>
                 </tr>

                  <tr>
                     <td>
                         <asp:SqlDataSource ID="SqlDSlkp_PositiveFindings" runat="server"
                         ConnectionString="<%$ ConnectionStrings:OnLinePrescriptionConnectionString %>"
                         SelectCommand="SELECT PFCode,PFDesc FROM [lkp_PositiveFindings]"></asp:SqlDataSource>
                     </td>
                 </tr>

                 <tr>
                     <td></td>
                 </tr>

                 <tr>
                     <td>
                         <asp:SqlDataSource ID="SqlDSNegativeFindings" runat="server"
                             ConnectionString="<%$ ConnectionStrings:OnLinePrescriptionConnectionString %>"
                             DeleteCommand="DELETE FROM [NegativeFindings] WHERE [VisitID] = @VisitID AND [NFCode] = @NFCode"
                             InsertCommand="INSERT INTO [NegativeFindings] ([VisitID], [NFCode]) VALUES (@VisitID, @NFCode)"
                             SelectCommand="select n.VisitID, n.NFCode,lkp.NFDesc FROM [NegativeFindings] n
                             inner join lkp_NegativeFindings as lkp on n.NFCode=lkp.NFCode WHERE ([VisitID] = @VisitID)">


                             <DeleteParameters>
                                 <asp:Parameter Name="VisitID" Type="String" />
                                 <asp:Parameter Name="NFCode" Type="Int16" />
                             </DeleteParameters>

                             <InsertParameters>
                                <asp:ControlParameter ControlID="txtVisitID" Name="VisitID" PropertyName="Text" Type="String" />
                                 <asp:Parameter Name="NFCode" Type="Int16" />
                             </InsertParameters>

                             <SelectParameters>
                                 <asp:ControlParameter ControlID="txtVisitID" Name="VisitID" PropertyName="Text" Type="String" />
                             </SelectParameters>

                         </asp:SqlDataSource>
                     </td>
                 </tr>

                 <tr>
                     <td>
                         <asp:SqlDataSource ID="SqlDSlkp_NegativeFindings" runat="server"
                         ConnectionString="<%$ ConnectionStrings:OnLinePrescriptionConnectionString %>"
                         SelectCommand="SELECT NFCode,NFDesc FROM [lkp_NegativeFindings]"></asp:SqlDataSource>
                     </td>
                 </tr>

                 <tr>
                     <td></td>
                 </tr>

                 <tr>
                     <td>
                         <asp:SqlDataSource ID="SqlDSDentalSign" runat="server"
                             ConnectionString="<%$ ConnectionStrings:OnLinePrescriptionConnectionString %>"
                             DeleteCommand="DELETE FROM [DentalSign] WHERE [VisitID] = @VisitID AND [DSCode] = @DSCode"
                             InsertCommand="INSERT INTO [DentalSign] ([VisitID], [DSCode], [DSTeethNo]) VALUES (@VisitID, @DSCode, @DSTeethNo)"
                             
                             
                             SelectCommand="select ds.VisitID, ds.DSCode,ds.DSTeethNo,lkp.DSDesc FROM [DentalSign] ds
                             inner join lkp_DentalSign as lkp on ds.DSCode=lkp.DSCode WHERE ([VisitID] = @VisitID)"

                             UpdateCommand="UPDATE [DentalSign] SET [DSTeethNo] = @DSTeethNo WHERE [VisitID] = @VisitID AND [DSCode] = @DSCode">


                             <DeleteParameters>
                                 <asp:Parameter Name="VisitID" Type="String" />
                                 <asp:Parameter Name="DSCode" Type="Int32" />
                             </DeleteParameters>

                             <InsertParameters>
                                 <asp:ControlParameter ControlID="txtVisitID" Name="VisitID" PropertyName="Text" Type="String" />
                                 <asp:Parameter Name="DSCode" Type="Int32" />
                                 <asp:Parameter Name="DSTeethNo" Type="String" />
                             </InsertParameters>

                             <SelectParameters>
                                 <asp:ControlParameter ControlID="txtVisitID" Name="VisitID" PropertyName="Text" Type="String" />
                             </SelectParameters>

                             <UpdateParameters>
                                 <asp:Parameter Name="DSTeethNo" Type="String" />
                                 <asp:Parameter Name="VisitID" Type="String" />
                                 <asp:Parameter Name="DSCode" Type="Int32" />
                             </UpdateParameters>

                         </asp:SqlDataSource>
                     </td>
                 </tr>

                 <tr>
                     <td>
                          <asp:SqlDataSource ID="SqlDSlkp_DentalSign" runat="server"
                         ConnectionString="<%$ ConnectionStrings:OnLinePrescriptionConnectionString %>"
                         SelectCommand="SELECT DSCode,DSDesc FROM [lkp_DentalSign]"></asp:SqlDataSource>
                     </td>
                 </tr>

                  <tr>
                     <td></td>
                 </tr>

                  <tr>
                     <td>
                         <asp:SqlDataSource ID="SqlDSDentalAdvice" runat="server"
                             ConnectionString="<%$ ConnectionStrings:OnLinePrescriptionConnectionString %>"
                             DeleteCommand="DELETE FROM [DentalAdvice] WHERE [VisitID] = @VisitID AND [DACode] = @DACode"
                             InsertCommand="INSERT INTO [DentalAdvice] ([VisitID], [DACode], [DATeethNo]) VALUES (@VisitID, @DACode, @DATeethNo)"
                             
                             
                            SelectCommand="select da.VisitID, da.DACode,da.DATeethNo,lkp.DADesc FROM [DentalAdvice] da
                             inner join lkp_DentalAdvice as lkp on da.DACode=lkp.DACode WHERE ([VisitID] = @VisitID)"

                             UpdateCommand="UPDATE [DentalAdvice] SET [DATeethNo] = @DATeethNo WHERE [VisitID] = @VisitID AND [DACode] = @DACode">


                             <DeleteParameters>
                                 <asp:Parameter Name="VisitID" Type="String" />
                                 <asp:Parameter Name="DACode" Type="Int16" />
                             </DeleteParameters>

                             <InsertParameters>
                                 <asp:ControlParameter ControlID="txtVisitID" Name="VisitID" PropertyName="Text" Type="String" />
                                 <asp:Parameter Name="DACode" Type="Int16" />
                                 <asp:Parameter Name="DATeethNo" Type="String" />
                             </InsertParameters>

                             <SelectParameters>
                                 <asp:ControlParameter ControlID="txtVisitID" Name="VisitID" PropertyName="Text" Type="String" />
                             </SelectParameters>

                             <UpdateParameters>
                                 <asp:Parameter Name="DATeethNo" Type="String" />
                                 <asp:Parameter Name="VisitID" Type="String" />
                                 <asp:Parameter Name="DACode" Type="Int16" />
                             </UpdateParameters>

                         </asp:SqlDataSource>
                     </td>
                 </tr>

                 <tr>
                     <td>
                          <asp:SqlDataSource ID="SqlDSlkp_DentalAdvice" runat="server"
                         ConnectionString="<%$ ConnectionStrings:OnLinePrescriptionConnectionString %>"
                         SelectCommand="SELECT DACode,DADesc FROM [lkp_DentalAdvice]"></asp:SqlDataSource>
                     </td>
                 </tr>

                 <tr>
                     <td></td>
                 </tr>

                 <tr>
                     <td>
                         <asp:SqlDataSource ID="SqlDSAdvice" runat="server"
                             ConnectionString="<%$ ConnectionStrings:OnLinePrescriptionConnectionString %>"
                             DeleteCommand="DELETE FROM [AdviceBangla] WHERE [VisitID] = @VisitID AND [ABCode] = @ABCode"
                             InsertCommand="INSERT INTO [AdviceBangla] ([VisitID], [ABCode]) VALUES (@VisitID, @ABCode)"
                             
                             SelectCommand="select a.VisitID, a.ABCode,lkp.ABDesc FROM [AdviceBangla] a
                             inner join lkp_AdviceBangla as lkp on a.ABCode=lkp.ABCode WHERE ([VisitID] = @VisitID)">


                             <DeleteParameters>
                                 <asp:Parameter Name="VisitID" Type="String" />
                                 <asp:Parameter Name="ABCode" Type="Int16" />
                             </DeleteParameters>

                             <InsertParameters>
                                 <asp:ControlParameter ControlID="txtVisitID" Name="VisitID" PropertyName="Text" Type="String" />
                                 <asp:Parameter Name="ABCode" Type="Int16" />
                             </InsertParameters>

                             <SelectParameters>
                                 <asp:ControlParameter ControlID="txtVisitID" Name="VisitID" PropertyName="Text" Type="String" />
                             </SelectParameters>

                         </asp:SqlDataSource>
                     </td>
                 </tr>

                 <tr>
                     <td>
                         <asp:SqlDataSource ID="SqlDSlkp_AdviceBangla" runat="server"
                         ConnectionString="<%$ ConnectionStrings:OnLinePrescriptionConnectionString %>"
                         SelectCommand="SELECT ABCode,ABDesc FROM [lkp_AdviceBangla]"></asp:SqlDataSource>
                     </td>
                 </tr>

                 <tr>
                     <td></td>
                 </tr>

                  <tr>
                     <td>
                                              
                     </td>
                 </tr>

                  <tr>
                     <td>
                         <asp:SqlDataSource ID="SqlDSlkp_DoctorsName" runat="server"
                             ConnectionString="<%$ ConnectionStrings:OnLinePrescriptionConnectionString %>"
                             SelectCommand="SELECT DNCode,DoctorName FROM [lkp_DoctorsName]"></asp:SqlDataSource>
                     </td>
                 </tr>

                  <tr>
                     <td></td>
                 </tr>
			 </table>
		</div>
        </div>

        
		
	</form>
</body>
</html>
