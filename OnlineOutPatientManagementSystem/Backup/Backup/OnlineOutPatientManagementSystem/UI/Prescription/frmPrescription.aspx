<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmPrescription.aspx.cs" 
Inherits="OnlineOutPatientManagementSystem.UI.Prescription.frmPrescription"  EnableEventValidation="false"%>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<%@ Register assembly="AjaxDataControls" namespace="AjaxDataControls" tagprefix="AjaxData" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
	<title>Online Precriptions</title>
	
	<script src="Scripts/jquery-1.7.1.js" type="text/javascript"></script>

		<script src="Scripts/jquery-ui-1.8.21.custom.min.js" type="text/javascript"></script>

		<script src="Scripts/jquery.window.js" type="text/javascript"></script>
		<script src="Scripts/SiteLayout.js" type="text/javascript"></script>

		<script src="Scripts/jquery.window.min.js" type="text/javascript"></script>
	<script src="../../Scripts/jquery-1.4.1-vsdoc.js" type="text/javascript"></script>
	<script src="../../Scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="../../Scripts/jquery-2.0.2.min.js" type="text/javascript"></script>
	<script src="../../Scripts/jsFunctions.js" type="text/javascript"></script>


	<script type="text/javascript"  language="javascript">

	  function PrescriptionID(input) 
			{
				var TheParameterString = '{PatienID:"' + $("#txtPID").val() + '"}';
	 
				$.ajax({
					type: "POST",
					url: "/WebService/LookUp.asmx/GetPatientInfo",
					contentType: "application/json; charset=ut-8",
					data: TheParameterString,
					dataType: "json",

					success: function (data, b) {
							var Record = $.parseJSON(data.d);

//							if (Record.length == 0) {
//							alert("Patien ID Not Found!");
//							$("#txtPID").focus(); return;
//							}

							if (Record.length != 0) {
								$("#ddlRelation").val(Record[0].Relationship);
								$("#txtName").val(Record[0].PatientName);
								$("#txtSex").val(Record[0].PatientSex); 
								$("#txtAge").val(Record[0].PatientAge); 
							}
							
							if (Record.length == 0) {
								$('#ddlRelation').val('');
								$('#txtName').val('');
								$('#txtSex').val('');
								$('#txtAge').val('');
								$("#txtPID").focus(); return;
							}


					},
				});
		}

	  </script>


	<script type="text/javascript">

		//$(document).ready(function () {
			//$("[id*=btnSave]").bind("click", function () {
			 function PrescriptionData() {
				var oPrescriptionGenDataInfo = {};

				oPrescriptionGenDataInfo.strPatientID = $("[id*=txtPID]").val();
				oPrescriptionGenDataInfo.strRelations = $("[id*=ddlRelation]").val();

				oPrescriptionGenDataInfo.strPatientAge = $("[id*=txtAge]").val();
				oPrescriptionGenDataInfo.strDrugHistory = $("[id*=txtDrufHis]").val();
				oPrescriptionGenDataInfo.strDrugAllergy = $("[id*=ddlDrugAllergy]").val();


				oPrescriptionGenDataInfo.strExaAnemia = $("[id*=ddlAnemia]").val();
				oPrescriptionGenDataInfo.strExaOS = $("[id*=ddlOS]").val();
				oPrescriptionGenDataInfo.strExaCervix = $("[id*=ddlCervix]").val();
				oPrescriptionGenDataInfo.strExaSpleen = $("[id*=ddlSpleen]").val();
				oPrescriptionGenDataInfo.strExaClubbing = $("[id*=ddlClubbing]").val();

				oPrescriptionGenDataInfo.strExaVagina = $("[id*=ddlVagina]").val();
				oPrescriptionGenDataInfo.strExaHeart = $("[id*=ddlHeart]").val();
				oPrescriptionGenDataInfo.strExaVulva = $("[id*=ddlVulva]").val();
				oPrescriptionGenDataInfo.strExaJaundice = $("[id*=ddlJaundice]").val();


				oPrescriptionGenDataInfo.strExaSystolic = $("[id*=txtSystolic]").val();
				oPrescriptionGenDataInfo.strExaDiastolic = $("[id*=txtDiastolic]").val();


				oPrescriptionGenDataInfo.strExaL_N = $("[id*=ddlLN]").val();
				oPrescriptionGenDataInfo.strExaPulse = $("[id*=txtPulse]").val();
				oPrescriptionGenDataInfo.strExaLiver = $("[id*=ddlLiver]").val();
				oPrescriptionGenDataInfo.strExaTemp = $("[id*=txtTemp]").val();
				oPrescriptionGenDataInfo.strExaLung = $("[id*=ddlLung]").val();

				oPrescriptionGenDataInfo.strExaWt = $("[id*=txtWeight]").val();
				oPrescriptionGenDataInfo.strExaOedema = $("[id*=ddlOdema]").val();
				oPrescriptionGenDataInfo.strExaOthers = $("[id*=txtOthers]").val();


				oPrescriptionGenDataInfo.strReferredCode = $("[id*=ddlReferred]").val();
				//oPrescriptionGenDataInfo.strReferred = $("#ddlReferred :selected").text();
				oPrescriptionGenDataInfo.strDoctorCode1 = $("[id*=ddlDoctorsName]").val();


				/*$.ajax({
					type: "POST",
					url: "/UI/Prescription/frmPrescription.aspx/SavePrescriptions",
					//url: "/WebService/LookUp.asmx/SavePrescriptions",

					data: '{oPrescriptionGenDataInfo: ' + JSON.stringify(oPrescriptionGenDataInfo) + '}',
					contentType: "application/json; charset=ut-8",
					dataType: "json",


					success: function (response) {
						alert("Prescription data has been added successfully.");
						//window.location.reload();
					},
					error: function (e) {
						alert("Error: " + e.responseText);

					}
				});*/
				return false;
			};
		//});
		</script>


	<style type="text/css">
		#form1
		{
			width: auto;
			display: block;
			margin-top:auto;
			margin-bottom:auto;
			margin-left: auto;
			margin-right:auto;
			width: 100%; 
		}
		#content {
		position: absolute;
		}

		.style1
		{
			text-align: center;
		}
				
		</style>
</head>
<body>
	<form id="form1" runat="server">
		
		<div class="style1" 
			style="font-size:x-large;font-style:normal;font-weight:bold;width:85%;">
			 Prescription
			</div>

			<div class="style1" style="width:85%;">
				<fieldset>
					<legend>Visit ID</legend>
					 <table style="width:100%; height:100%">
						<tr class="style1">
							<td>
								<asp:TextBox ID="txtVisitID" runat="server" ReadOnly="True"></asp:TextBox>
							</td>
						</tr>
					</table>
				</fieldset>
			</div>


		<div style="width:85%; height: 100%;"> 

			<%--1st coloumn start here*************************************************************************************************--%>
			<div style="float:left; width:25%;">
				<%--1.1 coloumn start here*********************************************************************************************--%>
				 <fieldset>
					<legend>Patient's Basic Information</legend>

					 <table style="width:100%; height:100%">
						<tr>
						<td>
					 <asp:Label ID="Label1" runat="server" Text="ID:"></asp:Label>
							</td>
						<td>
					 <asp:Label ID="Label5" runat="server" Text="Relation"></asp:Label>
							</td>
						</tr>
						<tr>
							<td>
								<asp:TextBox ID="txtPID" runat="server" Width="100" onblur="PrescriptionID(this)"></asp:TextBox>
								<asp:RequiredFieldValidator ID="reqvaltxtPID" runat="server" ControlToValidate="txtPID" forecolor="Red"
								 ValidationGroup='valGCommon' ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
							</td>
						<td>
							 <asp:DropDownList ID="ddlRelation" runat="server" EnableLoadOnDemand="true" Width="100">
							</asp:DropDownList>

							<asp:RequiredFieldValidator ID="reqvalddlRelation" runat="server" ControlToValidate="ddlRelation" forecolor="Red"
							ValidationGroup='valGCommon' ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>

							<cc1:CascadingDropDown ID="ccdRelation" TargetControlID="ddlRelation" PromptText="Select Relation"
							PromptValue="" ServicePath="../../WebService/LookUp.asmx" ServiceMethod="GetPatientRelation" runat="server"
							Category="RelationDescription" LoadingText="Loading..." />
							
							</td>
						</tr>
						<tr>
						<td >
					 <asp:Label ID="Label2" runat="server" Text="Name:"></asp:Label>
							</td>
						<td>
					 <asp:Label ID="Label6" runat="server" Text="Sex:"></asp:Label>
							</td>
						</tr>
						<tr>
							<td>
								<asp:TextBox ID="txtName" runat="server" Width="100"></asp:TextBox>
								<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" forecolor="Red"
								 ValidationGroup='valGCommon' ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
							</td>
						<td>
						   <asp:TextBox ID="txtSex" runat="server" Width="100"></asp:TextBox>
						   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtSex" forecolor="Red"
							ValidationGroup='valGCommon' ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
						</td>
						</tr>
						<tr>
						<td>
					 <asp:Label ID="Label3" runat="server" Text="Age:"></asp:Label>
							</td>
							<td>
								<%--<asp:Label ID="Label7" runat="server" Text="Child Age:"></asp:Label>--%>
							</td>
						</tr>
						<tr>
						<td>
						   <asp:TextBox ID="txtAge" runat="server" Width="100"></asp:TextBox>
						   <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtAge" forecolor="Red"
							ValidationGroup='valGCommon' ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
						</td>
						<td>
						  <%-- <asp:TextBox ID="txtChildAge" runat="server"></asp:TextBox>
						   <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtChildAge" forecolor="Red"
							ValidationGroup='valGCommon' ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
						</td>
						</tr>
						<tr>
						<td>
					 <asp:Label ID="Label4" runat="server" Text="Drug History:"></asp:Label>
							</td>
						<td>
					 <asp:Label ID="Label8" runat="server" Text="Drug Allergy:"></asp:Label>
							</td>
						</tr>
						<tr>
						<td>
						   <asp:TextBox ID="txtDrufHis" runat="server" Width="100"></asp:TextBox>
						   <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtDrufHis" forecolor="Red"
							ValidationGroup='valGCommon' ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
						</td>
						<td >
						   <asp:DropDownList ID="ddlDrugAllergy" runat="server" Width="100px">
							</asp:DropDownList>

							<cc1:CascadingDropDown ID="ccddlDrugAllergy" TargetControlID="ddlDrugAllergy" PromptText="Select DrugAllergy"
							PromptValue="" ServicePath="../../WebService/LookUp.asmx" ServiceMethod="GetMedicineName" runat="server"
							Category="TradeName" LoadingText="Loading..." />

							<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddlDrugAllergy" forecolor="Red"
							ValidationGroup='valGCommon' ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
						</td>
						</tr>
						<tr>
						<td></td>
						<td ></td>
						</tr>
					  </table>
				</fieldset>
				
				<%--1.2 coloumn start here*********************************************************************************************--%>
				<div>
					 <fieldset>
						<legend>On Examination Informations</legend>
						<table style="width:100%; height:100%">
						<tr>
						<td class="style5">
						 <asp:Label ID="Label9" runat="server" Text="Anemia:"></asp:Label>
							</td>
						<td class="style5">
						 <asp:Label ID="Label18" runat="server" Text="OS:"></asp:Label>
							</td>
						</tr>
						<tr>
						<td class="style5">
							<asp:DropDownList ID="ddlAnemia" runat="server" Width="100px">
								<%--<asp:ListItem Text="Select Anemia" Value="0"></asp:ListItem>--%>
								<asp:ListItem Text="Yes" Value="1"></asp:ListItem>
								<asp:ListItem Text="No" Value="2"></asp:ListItem>
							</asp:DropDownList>

							<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ddlAnemia" forecolor="Red"
							ValidationGroup='valGCommon' ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>

						</td>
						<td class="style5">
							<asp:DropDownList ID="ddlOS" runat="server" Width="100px">
								<asp:ListItem Text="Yes" Value="1"></asp:ListItem>
								<asp:ListItem Text="No" Value="2"></asp:ListItem>
							</asp:DropDownList>

							<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="ddlOS" forecolor="Red"
							ValidationGroup='valGCommon' ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>

						</td>
						</tr>
						 <tr>
						<td class="style5">
						 <asp:Label ID="Label10" runat="server" Text="Cervix:"></asp:Label>
							 </td>
						<td class="style5">
						 <asp:Label ID="Label19" runat="server" Text="Spleen:"></asp:Label>
							 </td>
						</tr>
						 <tr>
						<td class="style5">
							<asp:DropDownList ID="ddlCervix" runat="server" Width="100px">
								<asp:ListItem Text="Yes" Value="1"></asp:ListItem>
								<asp:ListItem Text="No" Value="2"></asp:ListItem>
							</asp:DropDownList>

							<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="ddlCervix" forecolor="Red"
							ValidationGroup='valGCommon' ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>

							</td>
						<td class="style5">
							<asp:DropDownList ID="ddlSpleen" runat="server" Width="100px">
								<asp:ListItem Text="Yes" Value="1"></asp:ListItem>
								<asp:ListItem Text="No" Value="2"></asp:ListItem>
							</asp:DropDownList>

							<asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="ddlSpleen" forecolor="Red"
							ValidationGroup='valGCommon' ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>

							</td>
						</tr>
						 <tr>
						<td class="style5">
						 <asp:Label ID="Label11" runat="server" Text="Clubbing:"></asp:Label>
							 </td>
						<td class="style5">
						 <asp:Label ID="Label20" runat="server" Text="Vagina:"></asp:Label>
							 </td>
						</tr>
						 <tr>
						<td class="style5">
							<asp:DropDownList ID="ddlClubbing" runat="server" Width="100px">
								<asp:ListItem Text="Yes" Value="1"></asp:ListItem>
								<asp:ListItem Text="No" Value="2"></asp:ListItem>
							</asp:DropDownList>

							<asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="ddlClubbing" forecolor="Red"
							ValidationGroup='valGCommon' ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>

							 </td>
						<td class="style5">
							<asp:DropDownList ID="ddlVagina" runat="server" Width="100px">
								<asp:ListItem Text="Yes" Value="1"></asp:ListItem>
								<asp:ListItem Text="No" Value="2"></asp:ListItem>
							</asp:DropDownList>

							<asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="ddlVagina" forecolor="Red"
							ValidationGroup='valGCommon' ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>

							 </td>
						</tr>
						 <tr>
						<td class="style5">
						 <asp:Label ID="Label12" runat="server" Text="Heart:"></asp:Label>
							 </td>
						<td class="style5">
						 <asp:Label ID="Label21" runat="server" Text="Vulva:"></asp:Label>
							 </td>
						</tr>
						 <tr>
						<td class="style5">
							<asp:DropDownList ID="ddlHeart" runat="server" Width="100px">
								<asp:ListItem Text="Yes" Value="1"></asp:ListItem>
								<asp:ListItem Text="No" Value="2"></asp:ListItem>
							</asp:DropDownList>

							<asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="ddlHeart" forecolor="Red"
							ValidationGroup='valGCommon' ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>

							 </td>
						<td class="style5">
							<asp:DropDownList ID="ddlVulva" runat="server" Width="100px">
								<asp:ListItem Text="Yes" Value="1"></asp:ListItem>
								<asp:ListItem Text="No" Value="2"></asp:ListItem>
							</asp:DropDownList>

							<asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="ddlVulva" forecolor="Red"
							ValidationGroup='valGCommon' ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>


							 </td>
						</tr>
						 <tr>
						<td class="style5">
						 <asp:Label ID="Label13" runat="server" Text="Jaundice:"></asp:Label>
							 </td>
						<td class="style5">
						 <asp:Label ID="Label22" runat="server" Text="Systolic:"></asp:Label>
							 </td>
						</tr>
						 <tr>
						<td class="style5">
							<asp:DropDownList ID="ddlJaundice" runat="server" Width="100px">
								<asp:ListItem Text="Yes" Value="1"></asp:ListItem>
								<asp:ListItem Text="No" Value="2"></asp:ListItem>
							</asp:DropDownList>

							<asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="ddlJaundice" forecolor="Red"
							ValidationGroup='valGCommon' ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>

							 </td>
						<td class="style5">
						   <asp:TextBox ID="txtSystolic" runat="server" Width="100">180</asp:TextBox>

							<asp:RequiredFieldValidator ID="ReqValtxtSystolic" runat="server" ControlToValidate="txtSystolic" forecolor="Red"
							ValidationGroup='valGCommon' ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>

							 </td>
						</tr>

						 <tr>
						<td class="style5">
						 <asp:Label ID="Label28" runat="server" Text="Diastolic:"></asp:Label>
							 </td>
						<td class="style5">
						 <asp:Label ID="Label23" runat="server" Text="Pulse:"></asp:Label>
							 </td>
						</tr>
						 <tr>
						<td class="style5">
							
						   <asp:TextBox ID="txtDiastolic" runat="server" Width="100">80</asp:TextBox>

						   <asp:RequiredFieldValidator ID="ReqvaltxtDiastolic" runat="server" ControlToValidate="txtDiastolic" forecolor="Red"
							ValidationGroup='valGCommon' ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>

						</td>
						<td class="style5">
							<asp:TextBox ID="txtPulse" runat="server" Width="100">60</asp:TextBox>

							<asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ControlToValidate="txtPulse" forecolor="Red"
							ValidationGroup='valGCommon' ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
							 </td>
						</tr>



						 <tr>
						<td class="style5">
						 <asp:Label ID="Label14" runat="server" Text="L/N:"></asp:Label>
							 </td>
						<td class="style5">
						 <asp:Label ID="Label24" runat="server" Text="Temp:"></asp:Label>
							 </td>
						</tr>
						 <tr>
						<td class="style5">
							<asp:DropDownList ID="ddlLN" runat="server" Width="100px">
								<asp:ListItem Text="Yes" Value="1"></asp:ListItem>
								<asp:ListItem Text="No" Value="2"></asp:ListItem>
							</asp:DropDownList>

							<asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="ddlLN" forecolor="Red"
							ValidationGroup='valGCommon' ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>

							 </td>
						<td class="style5">
							<asp:TextBox ID="txtTemp" runat="server" Width="100">95</asp:TextBox>

							<asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ControlToValidate="txtTemp" forecolor="Red"
							ValidationGroup='valGCommon' ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>

							 </td>
						</tr>
						 <tr>
						<td class="style5">
						 <asp:Label ID="Label15" runat="server" Text="Liver:"></asp:Label>
							 </td>
						<td class="style5">
						 <asp:Label ID="Label25" runat="server" Text="Weight:"></asp:Label>
							 </td>
						</tr>
						<tr>
						<td class="style5">
							<asp:DropDownList ID="ddlLiver" runat="server" Width="100px">
								<asp:ListItem Text="Yes" Value="1"></asp:ListItem>
								<asp:ListItem Text="No" Value="2"></asp:ListItem>
							</asp:DropDownList>

							<asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="ddlLiver" forecolor="Red"
							ValidationGroup='valGCommon' ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>

							</td>
						<td class="style5">
							<asp:TextBox ID="txtWeight" runat="server" Width="100">65</asp:TextBox>

							<asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ControlToValidate="txtWeight" forecolor="Red"
							ValidationGroup='valGCommon' ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>

							</td>
						</tr>
						<tr>
						<td class="style5">
						 <asp:Label ID="Label16" runat="server" Text="Lung:"></asp:Label>
							</td>
						<td class="style5">
						 <asp:Label ID="Label26" runat="server" Text="Others:"></asp:Label>
							</td>
						</tr>
						<tr>
						<td class="style5">
							<asp:DropDownList ID="ddlLung" runat="server" Width="100px">
								<asp:ListItem Text="Yes" Value="1"></asp:ListItem>
								<asp:ListItem Text="No" Value="2"></asp:ListItem>
							</asp:DropDownList>

							<asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="ddlLung" forecolor="Red"
							ValidationGroup='valGCommon' ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>

							</td>
						<td class="style5">
							<asp:TextBox ID="txtOthers" runat="server" Width="100">00</asp:TextBox>

							<asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ControlToValidate="txtOthers" forecolor="Red"
							ValidationGroup='valGCommon' ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>

							</td>
						</tr>
						 <tr>
						<td class="style5">
						 <asp:Label ID="Label17" runat="server" Text="Odema:"></asp:Label>
							 </td>
						<td class="style5">
							&nbsp;</td>
						</tr>
						 <tr>
						<td class="style5">
							<asp:DropDownList ID="ddlOdema" runat="server" Width="100px">
								<asp:ListItem Text="Yes" Value="1"></asp:ListItem>
								<asp:ListItem Text="No" Value="2"></asp:ListItem>
							</asp:DropDownList>

							<asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="ddlOdema" forecolor="Red"
							ValidationGroup='valGCommon' ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>

							 </td>
						<td class="style5">
							&nbsp;</td>
						</tr>
						 <tr>
						<td class="style5">&nbsp;</td>
						<td class="style5">&nbsp;</td>
						</tr>
						</table>


					</fieldset>
				</div>
			</div>

			<%--3rd coloumn start here*************************************************************************************************--%>
			 <div style="float:right; width:34%;margin-left:10px;">

				<%--3.0 coloumn start here*********************************************************************************************--%>
				<div>
				<fieldset>
					<legend>Investigations</legend>
					<table style="width:100%; height:100%">
							<tr style="width:100%; height:100%">
								<td>
									<div>
										<asp:gridview ID="gvInvestigation" runat="server" ShowFooter="true" 
											AutoGenerateColumns="false" onrowdeleting="gvInvestigationDelete" 
											onselectedindexchanged="gvInvestigation_SelectedIndexChanged" Width="350px">
											<Columns>
											<asp:BoundField DataField="InvestigationSLNo" HeaderText="SL No" />


												<asp:TemplateField HeaderText="Investigation">
													<ItemTemplate>
					
														<asp:DropDownList ID="ddlInvestigation" runat="server" Width="200">
														</asp:DropDownList>

															<cc1:CascadingDropDown ID="ccddlInvestigation" TargetControlID="ddlInvestigation" PromptText="Select Investigation"
															PromptValue="" ServicePath="../../WebService/LookUp.asmx" ServiceMethod="GetInvestigation" runat="server"
															Category="Investigation" LoadingText="Loading..." />

															<asp:RequiredFieldValidator ID="reqvalInvestigatio" runat="server" ControlToValidate="ddlInvestigation" forecolor="Red"
															ValidationGroup='valGInvestigation' ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
														
													</ItemTemplate>

													<FooterTemplate>
													 <asp:Button ID="btnAddInvestigation" runat="server" Text="Add" ValidationGroup='valGInvestigation'
															onclick="btnAddInvestigation_Click" />
													</FooterTemplate>

												</asp:TemplateField>


												<asp:CommandField ShowDeleteButton="True" />

											</Columns>
											<HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
										</asp:gridview>
									</div>
								</td>
							</tr>
						</table>

						<div>
						</div>
				</fieldset>
				</div>
				<br />
				<%--3.1 coloumn start here*********************************************************************************************--%>
				<fieldset>
					<legend>Findings</legend>
					<table style="width:100%; height:100%">
							<tr style="width:100%; height:100%">
								<td>
									<div>
										<asp:gridview ID="gvPostiveFindings" runat="server" ShowFooter="true" 
											AutoGenerateColumns="false"
											Width="350px" onrowdeleting="gvPostiveFindings_RowDeleting">
											<Columns>
											<asp:BoundField DataField="PostiveFindingsSLNo" HeaderText="SL No" />


												<asp:TemplateField HeaderText="Postive Findings">
													<ItemTemplate>
					
														<asp:DropDownList ID="ddlPostiveFindings" runat="server" Width="200">
														</asp:DropDownList>

															<cc1:CascadingDropDown ID="ccddlPostiveFindings" TargetControlID="ddlPostiveFindings" PromptText="Select Postive Findings"
															PromptValue="" ServicePath="../../WebService/LookUp.asmx" ServiceMethod="GetPostiveFindings" runat="server"
															Category="PositiveType" LoadingText="Loading..." />

															<asp:RequiredFieldValidator ID="reqvalPostiveFindings" runat="server" ControlToValidate="ddlPostiveFindings" forecolor="Red"
															ValidationGroup='valGPostiveFindings' ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
														
													</ItemTemplate>

													<FooterTemplate>
													 <asp:Button ID="btnAddPostiveFindings" runat="server" Text="Add" ValidationGroup='valGPostiveFindings'
															onclick="btnPostiveFindings_Click" />
													</FooterTemplate>

												</asp:TemplateField>


												<asp:CommandField ShowDeleteButton="True" />

											</Columns>
											<HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
										</asp:gridview>
									</div>
								</td>
							</tr>
						</table>
				
						<br />

						<table style="width:100%; height:100%">
							<tr style="width:100%; height:100%">
								<td>
									<div>
										<asp:gridview ID="gvNegativeFindings" runat="server" ShowFooter="true" 
											AutoGenerateColumns="false"
											Width="350px" onrowdeleting="gvNegativeFindings_RowDeleting">
											<Columns>
											<asp:BoundField DataField="NegativeFindingsSLNo" HeaderText="SL No" />


												<asp:TemplateField HeaderText="Negative Findings">
													<ItemTemplate>
					
														<asp:DropDownList ID="ddlNegativeFindings" runat="server" Width="200">
														</asp:DropDownList>

															<cc1:CascadingDropDown ID="ccddlNegativeFindings" TargetControlID="ddlNegativeFindings" PromptText="Select Negative Findings"
															PromptValue="" ServicePath="../../WebService/LookUp.asmx" ServiceMethod="GetNegativeFindings" runat="server"
															Category="NegativeType" LoadingText="Loading..." />

															<asp:RequiredFieldValidator ID="reqvalNegativeFindings" runat="server" ControlToValidate="ddlNegativeFindings"
															forecolor="Red" ValidationGroup='valGNegativeFindings' ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
														
													</ItemTemplate>

													<FooterTemplate>
													 <asp:Button ID="btnAddNegativeFindings" runat="server" Text="Add" ValidationGroup='valGNegativeFindings'
															onclick="btnNegativeFindings_Click" />
													</FooterTemplate>

												</asp:TemplateField>


												<asp:CommandField ShowDeleteButton="True" />

											</Columns>
											<HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
										</asp:gridview>
									</div>
								</td>
							</tr>
						</table>
						<div>
						</div>
				</fieldset>

				<%--3.2 coloumn start here*********************************************************************************************--%>
				<div>
					<fieldset>
					<legend>Dental</legend>
						<table style="width:100%; height:100%">
							<tr style="width:100%; height:100%">
								<td>
									<div>
										<asp:gridview ID="gvDentalSign" runat="server" ShowFooter="true" 
											AutoGenerateColumns="false"
											Width="350px" onrowdeleting="gvDentalSign_RowDeleting">
											<Columns>
											<asp:BoundField DataField="DentalSignSLNo" HeaderText="SL No" />


												<asp:TemplateField HeaderText="Dental Sign">
													<ItemTemplate>
					
														<asp:DropDownList ID="ddlDentalSign" runat="server" Width="110">
														</asp:DropDownList>

															<cc1:CascadingDropDown ID="ccddlDentalSign" TargetControlID="ddlDentalSign" PromptText="Select Dental Sign"
															PromptValue="" ServicePath="../../WebService/LookUp.asmx" ServiceMethod="GetDentalSign" runat="server"
															Category="DenSignType" LoadingText="Loading..." />

															<asp:RequiredFieldValidator ID="reqvalDentalSign" runat="server" ControlToValidate="ddlDentalSign"
															forecolor="Red" ValidationGroup='valGDentalSign' ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
														
													</ItemTemplate>

													<FooterTemplate>
													 <asp:Button ID="btnAddDentalSign" runat="server" Text="Add" ValidationGroup='valGDentalSign'
															onclick="btnDentalSign_Click" />
													</FooterTemplate>

												</asp:TemplateField>

												<asp:TemplateField HeaderText="Sign Teeth No">
													<ItemTemplate>
														<asp:TextBox ID="txtSignTeethNo" runat="server" Width="25"></asp:TextBox>
														<asp:RequiredFieldValidator ID="reqvalSignTeethNo" runat="server" ControlToValidate="txtSignTeethNo" ValidationGroup='valGDentalSign'
														forecolor="Red" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
													</ItemTemplate>
												</asp:TemplateField>

												<asp:CommandField ShowDeleteButton="True" />

											</Columns>
											<HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
										</asp:gridview>
									</div>
								</td>
							</tr>
						</table>
						<br />
						<table style="width:100%; height:100%">
							<tr style="width:100%; height:100%">
								<td>
									<div>
										<asp:gridview ID="gvDentalAdvice" runat="server" ShowFooter="true" 
											AutoGenerateColumns="false"
											Width="350px" onrowdeleting="gvDentalAdvice_RowDeleting">
											<Columns>
											<asp:BoundField DataField="DentalAdviceSLNo" HeaderText="SL No" />


												<asp:TemplateField HeaderText="Dental Advice">
													<ItemTemplate>
					
														<asp:DropDownList ID="ddlDentalAdvice" runat="server" Width="150">
														</asp:DropDownList>

															<cc1:CascadingDropDown ID="ccddlDentalAdvice" TargetControlID="ddlDentalAdvice" PromptText="Select Dental Advice"
															PromptValue="" ServicePath="../../WebService/LookUp.asmx" ServiceMethod="GetDentalAdvice" runat="server"
															Category="DenAdviceType" LoadingText="Loading..." />

															<asp:RequiredFieldValidator ID="reqvalDentalAdvice" runat="server" ControlToValidate="ddlDentalAdvice"
															forecolor="Red" ValidationGroup='valGDentalAdvice' ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
														
													</ItemTemplate>

													<FooterTemplate>
													 <asp:Button ID="btnAddDentalAdvice" runat="server" Text="Add" ValidationGroup='valGDentalAdvice'
															onclick="btnDentalAdvice_Click" />
													</FooterTemplate>

												</asp:TemplateField>

												<asp:TemplateField HeaderText="Teeth No">
													<ItemTemplate>
														<asp:TextBox ID="txtDenAdviceTeethNo" runat="server" Width="25"></asp:TextBox>
														<asp:RequiredFieldValidator ID="reqvalDenAdviceTeethNo" runat="server" ControlToValidate="txtDenAdviceTeethNo" ValidationGroup='valGDentalAdvice'
														forecolor="Red" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
													</ItemTemplate>
												</asp:TemplateField>

												<asp:CommandField ShowDeleteButton="True" />

											</Columns>
											<HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
										</asp:gridview>
									</div>
								</td>
							</tr>
						</table>
						<div>
						</div>
					</fieldset>
				</div>

				 <%--3.3 coloumn start here*********************************************************************************************--%>
				<div>
					<fieldset>
					<legend>Advice & Reference</legend>
					<div>
						<table style="width:100%; height:100%">
							<tr>
								<td>
									<asp:Label ID="lblAdvice" runat="server" Text="Advice"></asp:Label>
								</td>
							</tr>

							<tr>
								<td>
									<table style="width:100%; height:100%">
									<tr style="width:100%; height:100%">
										<td>
											<div>
												<asp:gridview ID="gvAdvice" runat="server" ShowFooter="true" 
													AutoGenerateColumns="false" onrowdeleting="gvAdviceDelete" 
													onselectedindexchanged="gvAdvice_SelectedIndexChanged" Width="350px">
													<Columns>
													<asp:BoundField DataField="AdviceSLNo" HeaderText="SL No" />


														<asp:TemplateField HeaderText="Advice">
															<ItemTemplate>
					
																<asp:DropDownList ID="ddlAdvice" runat="server" Width="150px" 
																Font-Names="SutonnyMJ">
																</asp:DropDownList>

																<cc1:CascadingDropDown ID="ccddlAdvice" TargetControlID="ddlAdvice" PromptText="Select Advice"
																PromptValue="" ServicePath="../../WebService/LookUp.asmx" ServiceMethod="GetAdvice" runat="server"
																Category="Advice" LoadingText="Loading..." />

																<asp:RequiredFieldValidator ID="ReqValAdvice" runat="server" ControlToValidate="ddlAdvice" forecolor="Red"
																ValidationGroup='valGCommon' ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
														
															</ItemTemplate>

															<FooterTemplate>
															 <asp:Button ID="btnAddAdvice" runat="server" Text="Add" ValidationGroup='valGAdvice'
																	onclick="btnAddAdvice_Click" />
															</FooterTemplate>

														</asp:TemplateField>


														<asp:CommandField ShowDeleteButton="True" />

													</Columns>
													<HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
												</asp:gridview>
											</div>
										</td>
									</tr>
								</table>
								</td>
							</tr>

							<tr>
								<td>
									<asp:Label ID="lblReferred" runat="server" Text="Referred"></asp:Label>
								</td>
							</tr>

							<tr>
								<td>
									<asp:DropDownList ID="ddlReferred" runat="server" Width="150px">
									</asp:DropDownList>

									<cc1:CascadingDropDown ID="ccddlReferred" TargetControlID="ddlReferred" PromptText="Select Referred"
									PromptValue="" ServicePath="../../WebService/LookUp.asmx" ServiceMethod="GetReffered" runat="server"
									Category="Reffered_Des" LoadingText="Loading..." />

									<asp:RequiredFieldValidator ID="ReqValReferred" runat="server" ControlToValidate="ddlReferred" forecolor="Red"
									ValidationGroup='valGCommon' ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>

								</td>
							</tr>


							<tr>
								<td>
									<asp:Label ID="Label27" runat="server" Text="Doctors Name"></asp:Label>
								</td>
							</tr>

							<tr>
								<td>
									<asp:DropDownList ID="ddlDoctorsName" runat="server" Width="150px">
									</asp:DropDownList>

									<cc1:CascadingDropDown ID="ccddlDoctorsName" TargetControlID="ddlDoctorsName" PromptText="Select Doctors Name"
										PromptValue="" ServicePath="../../WebService/LookUp.asmx" ServiceMethod="GetDoctorsName" runat="server"
										Category="DoctorsName" LoadingText="Loading..." />

									<asp:RequiredFieldValidator ID="ReqValDoctorsName" runat="server" ControlToValidate="ddlDoctorsName" forecolor="Red"
									ValidationGroup='valGCommon' ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>

								</td>
							</tr>


						</table>
					</div>
				</fieldset>
				</div>

			</div>

			<%--2nd coloumn start here*************************************************************************************************--%>
			<div style="float:right; width:38%; margin-left:10px;">
				
				<%--2.1 coloumn start here*********************************************************************************************--%>
				<div>
					<fieldset>
						<legend>Cheif Complaince</legend>
						<table style="width:100%; height:100%">
							<tr style="width:100%; height:100%">
								<td>
									<div>
										<asp:gridview ID="gvCheifComplaince" runat="server" ShowFooter="true" 
											AutoGenerateColumns="false" onrowdeleting="gvChiefComplainceDelete">
											<Columns>
											<asp:BoundField DataField="ChiefComplainceSLNo" HeaderText="SL No" />

												<asp:TemplateField HeaderText="ChiefComplaince">
													<ItemTemplate>
					
														<asp:DropDownList ID="ddlChiefComplaince" runat="server" Width="120">
														</asp:DropDownList>

														<cc1:CascadingDropDown ID="ccddlChiefComplaince" TargetControlID="ddlChiefComplaince" PromptText="Select ChiefComplaince"
															PromptValue="" ServicePath="../../WebService/LookUp.asmx" ServiceMethod="GetChiefComplaince" runat="server"
															Category="ChiefCom" LoadingText="Loading..." />

														<asp:RequiredFieldValidator ID="valddChifCompaince" runat="server" ControlToValidate="ddlChiefComplaince" forecolor="Red"
														ValidationGroup='valGChifCompaince' ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>

													</ItemTemplate>

													<FooterTemplate>
													 <asp:Button ID="btnAddChifCompaince" runat="server" Text="Add" ValidationGroup='valGChifCompaince'
															onclick="btnAddChiefComplaince_Click" />
													</FooterTemplate>

												</asp:TemplateField>

												<asp:TemplateField HeaderText="YY">
													<ItemTemplate>
														<asp:TextBox ID="txtDurationYY" runat="server" Width="30"></asp:TextBox>
														<asp:RequiredFieldValidator ID="reqvalDurationYY" runat="server" ControlToValidate="txtDurationYY" ValidationGroup='valGChifCompaince'
														forecolor="Red" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
													</ItemTemplate>
												</asp:TemplateField>

												<asp:TemplateField HeaderText="MM">
													<ItemTemplate>
														<asp:TextBox ID="txtDurationMM" runat="server" Width="30"></asp:TextBox>
														<asp:RequiredFieldValidator ID="reqvalDurationMM" runat="server" ControlToValidate="txtDurationMM" ValidationGroup='valGChifCompaince'
														forecolor="Red" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
													</ItemTemplate>
												</asp:TemplateField>

												<asp:TemplateField HeaderText="DD">
													<ItemTemplate>
														<asp:TextBox ID="txtDurationDD" runat="server" Width="30"></asp:TextBox>
														<asp:RequiredFieldValidator ID="reqvalDurationDD" runat="server" ControlToValidate="txtDurationDD" ValidationGroup='valGChifCompaince'
														forecolor="Red" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
													</ItemTemplate>

													

												</asp:TemplateField>


												<asp:CommandField ShowDeleteButton="True" />

											</Columns>
											<HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
										</asp:gridview>
									</div>
								</td>
							</tr>
						</table>
					</fieldset>
				</div>

				<br />

				<%--2.2 coloumn start here*********************************************************************************************--%>
				<div>
					<fieldset>
						<legend>Diagnosis</legend>

						<table style="width:100%; height:100%">
							<tr style="width:100%; height:100%">
								<td>
									<div>
										<asp:gridview ID="gvProvisionalDx" runat="server" ShowFooter="true" 
											AutoGenerateColumns="false"
											onrowdeleting="gvProvisionalDx_RowDeleting">
											<Columns>
											<asp:BoundField DataField="ProvisionalDxSLNo" HeaderText="SL No" />


												<asp:TemplateField HeaderText="Provisional Dx">
													<ItemTemplate>
					
														<asp:DropDownList ID="ddlProvisionalDx" runat="server" Width="270">
														</asp:DropDownList>

															<cc1:CascadingDropDown ID="ccddlProvisionalDx" TargetControlID="ddlProvisionalDx" PromptText="Select Provisional Dx"
															PromptValue="" ServicePath="../../WebService/LookUp.asmx" ServiceMethod="GetProvisionalDx" runat="server"
															Category="PositiveType" LoadingText="Loading..." />

															<asp:RequiredFieldValidator ID="reqvalProvisionalDx" runat="server" ControlToValidate="ddlProvisionalDx" forecolor="Red"
															ValidationGroup='valGProvisionalDx' ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
														
													</ItemTemplate>

													<FooterTemplate>
													 <asp:Button ID="btnAddProvisionalDx" runat="server" Text="Add" ValidationGroup='valGProvisionalDx'
															onclick="btnAddProvisionalDx_Click" />
													</FooterTemplate>

												</asp:TemplateField>


												<asp:CommandField ShowDeleteButton="True" />

											</Columns>
											<HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
										</asp:gridview>
									</div>
								</td>
							</tr>
						</table>
						<br />
						<table style="width:100%; height:100%">
							<tr style="width:100%; height:100%">
								<td>
									<div>
										<asp:gridview ID="gvDifferentialDx" runat="server" ShowFooter="true" 
											AutoGenerateColumns="false"
											onrowdeleting="gvDifferentialDx_RowDeleting">
											<Columns>
											<asp:BoundField DataField="DifferentialDxSLNo" HeaderText="SL No" />


												<asp:TemplateField HeaderText="Differential Dx">
													<ItemTemplate>
					
														<asp:DropDownList ID="ddlProvisionalDx" runat="server" Width="270">
														</asp:DropDownList>

															<cc1:CascadingDropDown ID="ccddlProvisionalDx" TargetControlID="ddlProvisionalDx" PromptText="Select Provisional Dx"
															PromptValue="" ServicePath="../../WebService/LookUp.asmx" ServiceMethod="GetProvisionalDx" runat="server"
															Category="PositiveType" LoadingText="Loading..." />

															<asp:RequiredFieldValidator ID="reqvalDifferentialDx" runat="server" ControlToValidate="ddlProvisionalDx" forecolor="Red"
															ValidationGroup='valGDifferentialDx' ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
														
													</ItemTemplate>

													<FooterTemplate>
													 <asp:Button ID="btnAddDifferentialDx" runat="server" Text="Add" ValidationGroup='valGDifferentialDx'
															onclick="btnDifferentialDx_Click" />
													</FooterTemplate>

												</asp:TemplateField>


												<asp:CommandField ShowDeleteButton="True" />

											</Columns>
											<HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
										</asp:gridview>
									</div>
								</td>
							</tr>
							
							<tr>
								<td>
								<asp:LinkButton ID="lbtnAddNewDifferentialDx" runat="server" onclick="lbtnAdd_Click">Add New Differential Dx</asp:LinkButton>
								&nbsp; &nbsp;
								<asp:LinkButton ID="lbtnCancelDifferentialDx" runat="server" onclick="lbtnCancelDifferentialDx_Click">Cancel Differential Dx</asp:LinkButton>
								</td>
							</tr>
						</table>
				
						<br />
						<table style="width:100%; height:100%">
							<tr style="width:100%; height:100%">
								<td>
									<div>
										<asp:gridview ID="gvConfirmDx" runat="server" ShowFooter="true" 
											AutoGenerateColumns="false"
											onrowdeleting="gvConfirmDx_RowDeleting">
											<Columns>
											<asp:BoundField DataField="ConfirmDxSLNo" HeaderText="SL No" />


												<asp:TemplateField HeaderText="ConfirmDx Dx">
													<ItemTemplate>
					
														<asp:DropDownList ID="ddlProvisionalDx" runat="server" Width="270">
														</asp:DropDownList>

															<cc1:CascadingDropDown ID="ccddlProvisionalDx" TargetControlID="ddlProvisionalDx" PromptText="Select Provisional Dx"
															PromptValue="" ServicePath="../../WebService/LookUp.asmx" ServiceMethod="GetProvisionalDx" runat="server"
															Category="PositiveType" LoadingText="Loading..." />

															<asp:RequiredFieldValidator ID="reqvalConfirmDx" runat="server" ControlToValidate="ddlProvisionalDx" forecolor="Red"
															ValidationGroup='valGConfirmDx' ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
														
													</ItemTemplate>

													<FooterTemplate>
													 <asp:Button ID="btnAddConfirmDx" runat="server" Text="Add" ValidationGroup='valGConfirmDx'
															onclick="btnConfirmDx_Click" />
													</FooterTemplate>

												</asp:TemplateField>


												<asp:CommandField ShowDeleteButton="True" />

											</Columns>
											<HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
										</asp:gridview>
									</div>
								</td>
							</tr>
						</table>
						
						<div>
						</div>
					</fieldset>
				</div>


				<br />

				<div>
					<fieldset>
					<legend>Treatment</legend>
					<table style="width:100%; height:100%">
							<tr style="width:100%; height:100%">
								<td>
									<div>
										<asp:gridview ID="gvTreatment" runat="server" ShowFooter="true" 
											AutoGenerateColumns="false" onrowdeleting="gvTreatmentDelete" 
											onselectedindexchanged="gvTreatment_SelectedIndexChanged" Width="392px">
											<Columns>
											<asp:BoundField DataField="TreatmentSLNo" HeaderText="SL No" />

												<asp:TemplateField HeaderText="Medicine Name">
													<ItemTemplate>
					
														<asp:DropDownList ID="ddlMedicineName" runat="server" EnableLoadOnDemand="true" Width="50">
														</asp:DropDownList>

															<cc1:CascadingDropDown ID="ccddlMedicineName" TargetControlID="ddlMedicineName" PromptText="Select Medicine Name"
															PromptValue="" ServicePath="../../WebService/LookUp.asmx" ServiceMethod="GetMedicineName" runat="server"
															Category="TradeName" LoadingText="Loading..." />

														<asp:RequiredFieldValidator ID="reqvalMedName" runat="server" ControlToValidate="ddlMedicineName" ValidationGroup='valGTreatment'
														forecolor="Red" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>

													</ItemTemplate>

													<FooterTemplate>
													 <asp:Button ID="btnAddTreatment" runat="server" Text="Add" ValidationGroup='valGTreatment'
															onclick="btnAddTreatment_Click" />
													</FooterTemplate>

												</asp:TemplateField>

												<asp:TemplateField HeaderText="Med Qnt">
													<ItemTemplate>
														<asp:TextBox ID="txtMedQnt" runat="server" Width="25"></asp:TextBox>
														<asp:RequiredFieldValidator ID="reqvalMedQnt" runat="server" ControlToValidate="txtMedQnt" ValidationGroup='valGTreatment'
														forecolor="Red" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
													</ItemTemplate>
												</asp:TemplateField>

												<asp:TemplateField HeaderText="Frequency">
													<ItemTemplate>
					
														<asp:DropDownList ID="ddlFrequency" runat="server" EnableLoadOnDemand="true" Width="55">
														</asp:DropDownList>

															<cc1:CascadingDropDown ID="ccddlFrequency" TargetControlID="ddlFrequency" PromptText="Select Frequency"
															PromptValue="" ServicePath="../../WebService/LookUp.asmx" ServiceMethod="GetFrequency" runat="server"
															Category="FrequencyType" LoadingText="Loading..." />

														<asp:RequiredFieldValidator ID="reqvalFrequency" runat="server" ControlToValidate="ddlFrequency" ValidationGroup='valGTreatment'
														forecolor="Red" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>

													</ItemTemplate>
												</asp:TemplateField>

												<asp:TemplateField HeaderText="Treatment">
													<ItemTemplate>
					
														<asp:DropDownList ID="ddlTreatment" runat="server" EnableLoadOnDemand="true" Width="55">
														</asp:DropDownList>

															<cc1:CascadingDropDown ID="ccddlTreatment" TargetControlID="ddlTreatment" PromptText="Select Treatment"
															PromptValue="" ServicePath="../../WebService/LookUp.asmx" ServiceMethod="GetTreatment" runat="server"
															Category="Treatment" LoadingText="Loading..." />

														<asp:RequiredFieldValidator ID="reqvalTreatment" runat="server" ControlToValidate="ddlTreatment" ValidationGroup='valGTreatment'
														forecolor="Red" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>

													</ItemTemplate>


												</asp:TemplateField>


												<asp:CommandField ShowDeleteButton="True" />

											</Columns>
											<HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
										</asp:gridview>
									</div>
								</td>
							</tr>
						</table>

						<div>
						</div>
					</fieldset>
				</div>


			</div>
		</div>

		<div>
		<table style="width:100%; height:100%">
			 <tr>
				 <td>
				 <br />
				 </td>
			</tr>
		</table>
		</div>

		<div class="style1">
		<fieldset>
			<table style="width:100%; height:100%">
			 <tr>
				 <td style="width:20%; height:100%">
					<asp:Button ID="btnAdd" runat="server" Text="Add" align="center" OnClientClick="return false;" />
				 </td>
				 <td style="width:20%; height:100%">
					
					<asp:Button class="clsSave" ID="btnSave" runat="server" 
					onclick="btnSave_Click" 
					Text="Save"/>

				 </td>
				  <td style="width:20%; height:100%">
				  <asp:Button ID="btnCancel" runat="server" Text="Cancel" align="center" 
						  onclick="btnCancel_Click"/>
				 </td>
				 <td style="width:20%; height:100%">
				 <asp:Button ID="btnFind" runat="server" Text="Find" align="center" OnClientClick="return false;"/>
				 </td>
				 <td style="width:20%; height:100%">
				  <asp:Button ID="btnEdit" runat="server" Text="Edit" align="center" OnClientClick="return false;"/>
				 </td>
			 </tr>
			 </table>
			 </fieldset>
		</div>

		<div>
			 <table style="width:100%; height:100%">
			 <tr>
				 <td>
				 </td>
			 </tr>
			 <tr>
				 <td>
					 <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
						<Services>
							<asp:ServiceReference Path="~/WebService/LookUp.asmx" />
						</Services>
					 </cc1:ToolkitScriptManager>
				</td>
			 </tr>
			 </table>
		</div>

	</form>
</body>
</html>
