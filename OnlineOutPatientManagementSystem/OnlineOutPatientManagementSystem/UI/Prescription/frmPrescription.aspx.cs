using System;
using System.Data;

using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Web.Script.Services;

using System.Web.Script.Serialization;
using System.Web.UI.HtmlControls;
using Telerik.Web.UI;

using OnlineOutPatientManagementSystem.Report;



namespace OnlineOutPatientManagementSystem.UI.Prescription
{
	public partial class frmPrescription : System.Web.UI.Page
	{
		
		ORM.OnLinePrescriptionDataContext oOnLinePrescriptionDataContext = new ORM.OnLinePrescriptionDataContext();


		protected void Page_Load(object sender, EventArgs e)
		{

			if (IsPostBack)
			{
				
			}

			if (!IsPostBack)
			{

				var typeReportSource = new Telerik.Reporting.TypeReportSource();
				typeReportSource.TypeName = "Telerik.Reporting.Examples.CSharp.ListBoundReport, CSharp.ReportLibrary";

				//this.ReportViewer1.ReportSource = typeReportSource;
			}


			if (!IsPostBack)
			{
				 //string strTmppp = (oOPresDataContext.ClinicVisitHistories.Max(u => u.ClinicVisitID));
				 //int intTmp=Convert.ToInt16(strTmppp);
				 //intTmp = intTmp + 1;
				 //txtVisitID.Text = intTmp.ToString();

				//,Gender,AgeYY,AgeMM,AgeDD

				
				string strVisitID = Request.QueryString["VisitID"];
				string strPatientID = Request.QueryString["PatientID"];
				string strPatientName = Request.QueryString["PatientName"];
				string strGender = Request.QueryString["Gender"];

				string strAgeYY = Request.QueryString["AgeYY"];
				string strAgeMM = Request.QueryString["AgeMM"];
				string strAgeDD = Request.QueryString["AgeDD"];


				txtVisitID.Text = strVisitID;
				txtPID.Text = strPatientID;
				txtName.Text = strPatientName;

				txtSex.Text = strGender;
				txtYear.Text = strAgeYY;
				txtMonth.Text = strAgeMM;
				txtDay.Text = strAgeDD;				
			}
			Set_Focus("txtDrufHis");
		}




		[WebMethod(EnableSession = true)]
		[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
		public static object GetPatientInfo(string PatienID)
		{
			ORM.OnLinePrescriptionDataContext oOPresDataContext = new ORM.OnLinePrescriptionDataContext();
			oOPresDataContext.ObjectTrackingEnabled = false;

			//Date calculation*****************************************
			var pDOB = (from age in oOPresDataContext.PatientBasicInfos
									where age.PatientID.Equals(PatienID)
									select age.DateOfBirth).SingleOrDefault();

			DateTime PatienceDOB = Convert.ToDateTime(pDOB);
			DateTime today = DateTime.Now;

			var totalDays = (today - PatienceDOB).TotalDays;

			var totalYears = Math.Truncate(totalDays / 365);
			var totalMonths = Math.Truncate((totalDays % 365) / 30);
			var remainingDays = Math.Truncate((totalDays % 365) % 30);

			string strFinalAge = totalYears + "y-" + totalMonths + "m-" + remainingDays + "d";
			//End Date calculation*****************************************


			var PatientInfo = from Patience in oOPresDataContext.PatientBasicInfos
							  where
								Patience.PatientID == PatienID
							  select new
							  {
								  Relationship = Patience.RelCode,
								  PatientName = Patience.PatientName,
								  PatientSex = Patience.Gender,
								  PatientAge = strFinalAge.ToString()
							  };

			JavaScriptSerializer oJSS = new JavaScriptSerializer();
			return oJSS.Serialize(PatientInfo);
		}

		
		protected void RGChiefCom_ItemCreated(object sender, GridItemEventArgs e)
		{
			try
			{
				if (e.Item is GridEditableItem && (e.Item.IsInEditMode))
				{
					GridEditableItem editableItem = (GridEditableItem)e.Item;
					ChiefComplainceSetupInputManager(editableItem);
				}
			}
			catch (System.Exception)
			{

				ShowErrorMessage();
			}
		}

		protected void RGTreatment_ItemCreated(object sender, GridItemEventArgs e)
		{
			try
			{
				if (e.Item is GridEditableItem && (e.Item.IsInEditMode))
				{
					GridEditableItem editableItem = (GridEditableItem)e.Item;
					TreatmentSetupInputManager(editableItem);
				}
			}
			catch (System.Exception)
			{

				ShowErrorMessage();
			}
		}

		protected void RGDentalSign_ItemCreated(object sender, GridItemEventArgs e)
		{
			try
			{
				if (e.Item is GridEditableItem && (e.Item.IsInEditMode))
				{
					GridEditableItem editableItem = (GridEditableItem)e.Item;
					DentalSignSetupInputManager(editableItem);
				}
			}
			catch (System.Exception)
			{

				ShowErrorMessage();
			}
		}

		protected void RGDentalAdvice_ItemCreated(object sender, GridItemEventArgs e)
		{
			try
			{
				if (e.Item is GridEditableItem && (e.Item.IsInEditMode))
				{
					GridEditableItem editableItem = (GridEditableItem)e.Item;
					DentalAdviceSetupInputManager(editableItem);
				}
			}
			catch (System.Exception)
			{

				ShowErrorMessage();
			}
		}


		private void ChiefComplainceSetupInputManager(GridEditableItem editableItem)
		{
			try
			{
				// style DurationYY column's textbox
				var textBox = ((GridTextBoxColumnEditor)editableItem.EditManager.GetColumnEditor("DurationYY")).TextBoxControl;
				InputSetting inputSetting = ChiefComRadInputManager.GetSettingByBehaviorID("YYNumericTextBoxSetting");

				inputSetting.InitializeOnClient = true;
				inputSetting.TargetControls.Add(new TargetInput(textBox.UniqueID, true));
				inputSetting.Validation.IsRequired = true;

				// style DurationMM column's textbox
				textBox = ((GridTextBoxColumnEditor)editableItem.EditManager.GetColumnEditor("DurationMM")).TextBoxControl;
				inputSetting = ChiefComRadInputManager.GetSettingByBehaviorID("MMNumericTextBoxSetting");

				inputSetting.InitializeOnClient = true;
				inputSetting.TargetControls.Add(new TargetInput(textBox.UniqueID, true));
				inputSetting.Validation.IsRequired = true;

				// style DurationDD column's textbox
				textBox = ((GridTextBoxColumnEditor)editableItem.EditManager.GetColumnEditor("DurationDD")).TextBoxControl;
				inputSetting = ChiefComRadInputManager.GetSettingByBehaviorID("DDNumericTextBoxSetting");

				inputSetting.InitializeOnClient = true;
				inputSetting.TargetControls.Add(new TargetInput(textBox.UniqueID, true));
				inputSetting.Validation.IsRequired = true;

			}
			catch (System.Exception)
			{

				ShowErrorMessage();
			}
		}

		private void TreatmentSetupInputManager(GridEditableItem editableItem)
		{
			try
			{

				// style MedQty column's textbox
				var textBox = ((GridTextBoxColumnEditor)editableItem.EditManager.GetColumnEditor("MedQty")).TextBoxControl;
				InputSetting inputSetting = TreatmentRadInputManager.GetSettingByBehaviorID("MedQtyNumericTextBoxSetting");

				inputSetting.InitializeOnClient = true;
				inputSetting.TargetControls.Add(new TargetInput(textBox.UniqueID, true));
				inputSetting.Validation.IsRequired = true;
			}
			catch (System.Exception)
			{

				ShowErrorMessage();
			}
		}

		private void DentalSignSetupInputManager(GridEditableItem editableItem)
		{
			try
			{

				// style DSTeethNo column's textbox
				var textBox = ((GridTextBoxColumnEditor)editableItem.EditManager.GetColumnEditor("DSTeethNo")).TextBoxControl;
				InputSetting inputSetting = DentalSignRadInputManager.GetSettingByBehaviorID("SignTeethNoNumericTextBoxSetting");

				inputSetting.InitializeOnClient = true;
				inputSetting.TargetControls.Add(new TargetInput(textBox.UniqueID, true));
				inputSetting.Validation.IsRequired = true;
			}
			catch (System.Exception)
			{

				ShowErrorMessage();
			}
		}

		private void DentalAdviceSetupInputManager(GridEditableItem editableItem)
		{
			try
			{

				// style DSTeethNo column's textbox
				var textBox = ((GridTextBoxColumnEditor)editableItem.EditManager.GetColumnEditor("DATeethNo")).TextBoxControl;
				InputSetting inputSetting = DentalAdviceRadInputManager.GetSettingByBehaviorID("DATeethNoNumericTextBoxSetting");

				inputSetting.InitializeOnClient = true;
				inputSetting.TargetControls.Add(new TargetInput(textBox.UniqueID, true));
				inputSetting.Validation.IsRequired = true;
			}
			catch (System.Exception)
			{

				ShowErrorMessage();
			}
		}



		protected void RGChiefCom_ItemInserted(object source, GridInsertedEventArgs e)
		{
			if (e.Exception != null)
			{
				e.ExceptionHandled = true;
				e.KeepInInsertMode = true;

				ShowErrorMessage();
				
			}
			//else
			//{
			//	PrescriptionRadAjaxManager.ResponseScripts.Add(string.Format("window.radalert(\"Data Inserted successfully.\")"));
			//}
		}

		protected void RGProvisionalDx_ItemInserted(object source, GridInsertedEventArgs e)
		{
			if (e.Exception != null)
			{
				e.ExceptionHandled = true;
				e.KeepInInsertMode = true;

				ShowErrorMessage();

			}
			//else
			//{
			//	PrescriptionRadAjaxManager.ResponseScripts.Add(string.Format("window.radalert(\"Data Inserted successfully.\")"));
			//}
		}

		protected void RGDifferentialDx_ItemInserted(object source, GridInsertedEventArgs e)
		{
			if (e.Exception != null)
			{
				e.ExceptionHandled = true;
				e.KeepInInsertMode = true;

				ShowErrorMessage();

			}
			//else
			//{
			//	PrescriptionRadAjaxManager.ResponseScripts.Add(string.Format("window.radalert(\"Data Inserted successfully.\")"));
			//}
		}

		protected void RGConfirmDx_ItemInserted(object source, GridInsertedEventArgs e)
		{
			if (e.Exception != null)
			{
				e.ExceptionHandled = true;
				e.KeepInInsertMode = true;

				ShowErrorMessage();

			}
			//else
			//{
			//	PrescriptionRadAjaxManager.ResponseScripts.Add(string.Format("window.radalert(\"Data Inserted successfully.\")"));
			//}
		}

		protected void RGTreatment_ItemInserted(object source, GridInsertedEventArgs e)
		{
			if (e.Exception != null)
			{
				e.ExceptionHandled = true;
				e.KeepInInsertMode = true;

				ShowErrorMessage();

			}
			//else
			//{
			//	PrescriptionRadAjaxManager.ResponseScripts.Add(string.Format("window.radalert(\"Data Inserted successfully.\")"));
			//}
		}



		protected void RGInvestigations_ItemInserted(object source, GridInsertedEventArgs e)
		{
			if (e.Exception != null)
			{
				e.ExceptionHandled = true;
				e.KeepInInsertMode = true;

				ShowErrorMessage();

			}
			//else
			//{
			//	PrescriptionRadAjaxManager.ResponseScripts.Add(string.Format("window.radalert(\"Data Inserted successfully.\")"));
			//}
		}

		protected void RGPositiveFindings_ItemInserted(object source, GridInsertedEventArgs e)
		{
			if (e.Exception != null)
			{
				e.ExceptionHandled = true;
				e.KeepInInsertMode = true;

				ShowErrorMessage();

			}
			//else
			//{
			//	PrescriptionRadAjaxManager.ResponseScripts.Add(string.Format("window.radalert(\"Data Inserted successfully.\")"));
			//}
		}


		protected void RGNegativeFindings_ItemInserted(object source, GridInsertedEventArgs e)
		{
			if (e.Exception != null)
			{
				e.ExceptionHandled = true;
				e.KeepInInsertMode = true;

				ShowErrorMessage();

			}
			//else
			//{
			//	PrescriptionRadAjaxManager.ResponseScripts.Add(string.Format("window.radalert(\"Data Inserted successfully.\")"));
			//}
		}

		protected void RGDentalSign_ItemInserted(object source, GridInsertedEventArgs e)
		{
			if (e.Exception != null)
			{
				e.ExceptionHandled = true;
				e.KeepInInsertMode = true;

				ShowErrorMessage();

			}
			//else
			//{
			//	PrescriptionRadAjaxManager.ResponseScripts.Add(string.Format("window.radalert(\"Data Inserted successfully.\")"));
			//}
		}

		protected void RGDentalAdvice_ItemInserted(object source, GridInsertedEventArgs e)
		{
			if (e.Exception != null)
			{
				e.ExceptionHandled = true;
				e.KeepInInsertMode = true;

				ShowErrorMessage();

			}
			//else
			//{
			//	PrescriptionRadAjaxManager.ResponseScripts.Add(string.Format("window.radalert(\"Data Inserted successfully.\")"));
			//}
		}

		protected void RGAdvice_ItemInserted(object source, GridInsertedEventArgs e)
		{
			if (e.Exception != null)
			{
				e.ExceptionHandled = true;
				e.KeepInInsertMode = true;

				ShowErrorMessage();

			}
			//else
			//{
			//	PrescriptionRadAjaxManager.ResponseScripts.Add(string.Format("window.radalert(\"Data Inserted successfully.\")"));
			//}
		}




		protected void RGInvestigations_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
		{
			if (e.Item is GridDataItem && e.Item.OwnerTableView.DataSourceID == "AccessDataSource1")
			{
				Label lbl = e.Item.FindControl("numberLabel") as Label;
				lbl.Text = (e.Item.ItemIndex + 1).ToString();
			}
		}

		private void ShowErrorMessage()
		{
			PrescriptionRadAjaxManager.ResponseScripts.Add(string.Format("window.radalert(\"Item you are trying to add is already exist!\")"));
		}

		public void Set_Focus(string controlname)
		{
			string strScript;

			strScript = "<script language=javascript> document.all('" + controlname + "').focus() </script>";
			RegisterStartupScript("focus", strScript);
		}


		protected void btnSave_Click(object sender, EventArgs e)
		{
			//Page.Validate("valGCommon"); 


			if(RGChiefCom.Items.Count<1)
			{
				RGChiefCom.Focus();
				ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "ValGridAlert();", true);
				return;
			}

			if (RGProvisionalDx.Items.Count < 1)
			{
				RGProvisionalDx.Focus();
				ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "ValGridAlert();", true);
				return;
			}
				


			#region Prescription common data insertion


			var varVID = oOnLinePrescriptionDataContext.ClinicVisitHistories.Where(id => id.VisitID.Equals(txtVisitID.Text));

			foreach (var varForecVID in varVID)
			{
				//VisitID,PatientID,VisitDate,DrugHistory,DrugAllergy,Anemia,Cervix,Clubbing,Heart,Jaundice,

				//oClinicVisitHistory.VisitID = txtDrufHis.Text;
				//oClinicVisitHistory.PatientID = txtDrufHis.Text;
				varForecVID.VisitDate = DateTime.Now;
				varForecVID.DrugHistory = txtDrufHis.Text;

				if (ddlDrugAllergy.EmptyMessage == "Select an item")
					varForecVID.DrugAllergy = 0;
				else
					varForecVID.DrugAllergy = Convert.ToByte(ddlDrugAllergy.SelectedValue);

				varForecVID.Anemia = Convert.ToByte(ddlAnemia.SelectedValue);
				varForecVID.Cervix = Convert.ToByte(ddlCervix.SelectedValue);
				varForecVID.Clubbing = Convert.ToByte(ddlClubbing.SelectedValue);
				varForecVID.Heart = ddlHeart.SelectedValue;
				varForecVID.Jaundice = Convert.ToByte(ddlJaundice.SelectedValue);



				//L_N,Liver,Lung,Oedema,OS,Spleen,Vagina,Vulva,Systolic,Diastolic,
				varForecVID.L_N = Convert.ToByte(ddlLN.SelectedValue);
				varForecVID.Liver = Convert.ToByte(ddlLiver.SelectedValue);
				varForecVID.Lung = ddlLung.SelectedValue;
				varForecVID.Oedema = Convert.ToByte(ddlOdema.SelectedValue);
				varForecVID.OS = ddlOS.SelectedValue;

				varForecVID.Spleen = Convert.ToByte(ddlSpleen.SelectedValue);
				varForecVID.Vagina = ddlVagina.SelectedValue;
				varForecVID.Vulva = ddlVulva.SelectedValue;


				if (txtSystolic.Text == "")
					varForecVID.Systolic = 0;
				else
					varForecVID.Systolic = Convert.ToByte(txtSystolic.Text);

				if (txtDiastolic.Text == "")
					varForecVID.Diastolic = 0;
				else
					varForecVID.Diastolic = Convert.ToByte(txtDiastolic.Text);



				//Pulse,Temperature,Weight,Others,ReferredCode,DoctorCode1,DoctorCode2,NextVisitDt


				if (txtPulse.Text == "")
					varForecVID.Pulse = 0;
				else
					varForecVID.Pulse = Convert.ToByte(txtPulse.Text);

				if (txtTemp.Text == "")
					varForecVID.Temperature = 0;
				else
					varForecVID.Temperature = Convert.ToByte(txtTemp.Text);

				if (txtWeight.Text == "")
					varForecVID.Weight = 0;
				else
					varForecVID.Weight = Convert.ToByte(txtWeight.Text);
				
				varForecVID.Others = txtOthers.Text;

				if (ddlReferred.EmptyMessage == "Select an item")
					varForecVID.ReferredCode = 0;
				else
					varForecVID.ReferredCode = Convert.ToInt16(ddlReferred.SelectedValue);
				//varForecVID.DoctorCode1 = Convert.ToByte(ddlDoctorsName.SelectedValue);
				//varForecVID.DoctorCode2 = null;
				varForecVID.NextVisitDt = null;
			}		
			oOnLinePrescriptionDataContext.SubmitChanges();


			//ORM.DoctorVisitInfo oDoctorVisitInfo = new ORM.DoctorVisitInfo();
			//oDoctorVisitInfo.Status = 2;
			//oOnLinePrescriptionDataContext.DoctorVisitInfos.InsertOnSubmit(oDoctorVisitInfo);
			//oOnLinePrescriptionDataContext.SubmitChanges();

			//string strVisitID = txtVisitID.Text;

			ORM.DoctorVisitInfo varDVI = (from DVI in oOnLinePrescriptionDataContext.DoctorVisitInfos
										  where DVI.VisitID == txtVisitID.Text
										  select DVI).SingleOrDefault();

			varDVI.Status = 2;


			oOnLinePrescriptionDataContext.SubmitChanges();


			//ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "DataSaveAlert();", true);

			ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "openReport();", true);


			#endregion Prescription common data insertion
		}

	}
}

