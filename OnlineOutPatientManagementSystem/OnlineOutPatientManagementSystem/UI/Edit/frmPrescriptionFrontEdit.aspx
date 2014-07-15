<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmPrescriptionFrontEdit.aspx.cs" 
    Inherits="OnlineOutPatientManagementSystem.UI.Edit.frmPrescriptionFrontEdit" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>Online Prescription</title>


	<style type="text/css">
		#form1
		{
			width: auto;
			display: block;
			margin-top:50px;
			margin-bottom:auto;
			margin-left: 100px;
			margin-right:100px;
            background-color:#5DB680;
		}
		
		.style1
		{
			text-align: left;
		}
		
		.style2
		{
			text-align: right;
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
			
		</style>

<script type="text/javascript"  language="javascript">

    function openPrescription(url) {
        window.opener = self;
        window.close();

        var win = window.open(url, '_blank');
        win.focus();
    }

    function PageOpen() {
        window.location = '/Default.aspx';
        return false
    }

</script>


</head>
<body>
	<form id="form1" runat="server">
	
	<div class="Header">
        <br />
			Prescription Edit
        </div>

    <div style="background-color:white;">
      <a href="../../Default.aspx">Home</a>
    </div>

	<div>
		 <table style="width:100%; height:100%">
			 <tr>
				 <td>
					 <telerik:RadGrid ID="RGVisitHis" runat="server" AllowPaging="True"
						 CellSpacing="0" DataSourceID="SqlDSDoctorVisitInfo" GridLines="None" PageSize="15">
						 
                         <MasterTableView AutoGenerateColumns="False" DataKeyNames="VisitID" AllowFilteringByColumn="True"
							 DataSourceID="SqlDSDoctorVisitInfo">
							 <Columns>

								 <telerik:GridBoundColumn DataField="VisitID"
									 FilterControlAltText="Filter VisitID column" HeaderText="VisitID" 
									 ReadOnly="True" SortExpression="VisitID" UniqueName="VisitID">
                                     <HeaderStyle Width="100px" />
								 </telerik:GridBoundColumn>								

								 <telerik:GridBoundColumn DataField="PatientID" 
									 FilterControlAltText="Filter PatientID column" HeaderText="PatientID" 
									 ReadOnly="True" SortExpression="PatientID" UniqueName="PatientID">
                                     <HeaderStyle Width="100px" />
								 </telerik:GridBoundColumn>

								 <telerik:GridBoundColumn DataField="PatientName" 
									 FilterControlAltText="Filter PatientName column" HeaderText="PatientName" 
									 ReadOnly="True" SortExpression="PatientName" UniqueName="PatientName">
								 </telerik:GridBoundColumn>

                                                            
                                 <telerik:GridBoundColumn DataField="Gender" FilterControlAltText="Filter Gender column" HeaderText="Gender" AllowFiltering="false"
                                     ReadOnly="True" SortExpression="Gender" UniqueName="Gender">
                                     <HeaderStyle Width="50px" />
                                 </telerik:GridBoundColumn>

                                 <telerik:GridBoundColumn DataField="AgeYY" DataType="System.Byte" FilterControlAltText="Filter AgeYY column" AllowFiltering="false"
                                     ReadOnly="True" HeaderText="Age Year" SortExpression="AgeYY" UniqueName="AgeYY">
                                     <HeaderStyle Width="70px" />
                                 </telerik:GridBoundColumn>

                                 <telerik:GridBoundColumn DataField="AgeMM" DataType="System.Byte" FilterControlAltText="Filter AgeMM column" AllowFiltering="false"
                                     ReadOnly="True" HeaderText="Age Month" SortExpression="AgeMM" UniqueName="AgeMM">
                                     <HeaderStyle Width="70px" />
                                 </telerik:GridBoundColumn>

                                 <telerik:GridBoundColumn DataField="AgeDD" DataType="System.Byte" FilterControlAltText="Filter AgeDD column" AllowFiltering="false"
                                     ReadOnly="True" HeaderText="Age Day" SortExpression="AgeDD" UniqueName="AgeDD">
                                     <HeaderStyle Width="70px" />
                                 </telerik:GridBoundColumn>

                                  <telerik:GridBoundColumn DataField="DoctorName" FilterControlAltText="Filter DoctorName column" AllowFiltering="false"
                                     ReadOnly="True" HeaderText="Doctor Name" SortExpression="DoctorName" UniqueName="DoctorName">
                                     <HeaderStyle Width="150px" />
                                 </telerik:GridBoundColumn>

                                 <telerik:GridBoundColumn DataField="EntryDate" DataType="System.DateTime" FilterControlAltText="Filter EntryDate column" AllowFiltering="false"
                                     ReadOnly="True" HeaderText="EntryDate" SortExpression="EntryDate" UniqueName="EntryDate">
                                     <HeaderStyle Width="150px" />
                                 </telerik:GridBoundColumn>

                                                             
                                 <telerik:GridHyperLinkColumn DataNavigateUrlFields="VisitID, PatientID, PatientName,Gender,AgeYY,AgeMM,AgeDD" AllowFiltering="false"
                                     DataNavigateUrlFormatString="~/UI/Edit/frmPrescriptionEdit.aspx?VisitID={0}&PatientID={1}&PatientName={2}&Gender={3}&AgeYY={4}&AgeMM={5}&AgeDD={6}" Text="Edit Prescription" />


							 </Columns>
						 </MasterTableView>
					 </telerik:RadGrid>
				 </td>
			 </tr>

			  <tr>
				 <td>

				 </td>
			 </tr>
		</table>	
	</div>

	<div>
	<table style="width:100%; height:100%">
		<tr >
			<td width="12.5%">
			</td>

			<td width="12.5%">
			</td>

			<td width="12.5%">
			</td>

			<td width="12.5%">
			</td>

			<td width="12.5%">
			</td>

			<td width="12.5%">
			</td>

			

		</tr>
	</table>	
	</div>

	<div>	
	</div>

	<div>	
	</div>

	<div>	
	</div>

	<div>
		<table style="width:100%; height:100%">
			 <tr>
				 <td>
					
					 <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
						<Services>
							<asp:ServiceReference Path="~/WebService/LookUp.asmx" />
						</Services>
					 </cc1:ToolkitScriptManager>
					
				 </td>
			 </tr>

			  <tr>
				 <td>
					 <asp:SqlDataSource ID="SqlDSDoctorVisitInfo" runat="server" 
						 ConnectionString="Data Source=URB-DC\URBSQLSERVER;Initial Catalog=OnLinePrescription;Persist Security Info=True;User ID=urbwebappuser;Password=Pass123" 
						 ProviderName="System.Data.SqlClient" 
						
                          SelectCommand="SELECT dv.VisitID,dv.PatientID, p.PatientName,case when  p.Gender=1 then 'Male' else 'Female' end Gender,dv.AgeYY,dv.AgeMM,dv.AgeDD,
                         ldn.DoctorName,dv.EntryDate FROM DoctorVisitInfo AS dv INNER JOIN PatientBasicInfo AS p ON dv.PatientID = p.PatientID 
                         inner join lkp_DoctorsName as ldn on dv.DoctorCode=ldn.DNCode where dv.Status='2' order by dv.EntryDate desc">
					 </asp:SqlDataSource>
				 </td>
			 </tr>

			 <tr>
				 <td>
					
                     <telerik:RadAjaxManager runat="server" ID="PEditFrontRadAjaxManager" DefaultLoadingPanelID="RadAjaxLoadingPanel1">
                         <AjaxSettings>

                             <telerik:AjaxSetting AjaxControlID="RGVisitHis">
                                 <UpdatedControls>
                                     <telerik:AjaxUpdatedControl ControlID="RGVisitHis" />
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
		</table>		
	</div>

	</form>
</body>
</html>