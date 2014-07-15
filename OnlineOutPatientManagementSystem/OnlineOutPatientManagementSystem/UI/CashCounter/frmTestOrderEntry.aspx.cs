using AjaxControlToolkit;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;


namespace OnlineOutPatientManagementSystem.UI.CashCounter
{
	public partial class frmTestOrderEntry : System.Web.UI.Page
	{
		ORM.OnLinePrescriptionDataContext oOnLinePrescriptionDataContext = new ORM.OnLinePrescriptionDataContext();
		Report.frmReportViewer ofrmReportViewer = new Report.frmReportViewer();

		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				txtNonURBReferredBy.Enabled = false;
				RGTestName.Visible = false;
				txtLabTestID.Text = "0000 0000 000";
				chkFullPaid.Checked = false;

				dtCashRecvDate.SelectedDate = DateTime.Now.Date;
				dtTestDate.SelectedDate = DateTime.Now.Date;

				dtDeliveryDate.SelectedDate = (DateTime.Now.Date);
				dtDeliveryDate.SelectedDate = ((DateTime)dtDeliveryDate.SelectedDate).AddDays(2);

				txtHeight.Text = "00";
				txtHip.Text = "00";
				txtWeight.Text = "00";
				txtWaist.Text = "00";

				

				txtTestFeeTotal.Text = "0.00";
				txtDiscount.Text = "0.00";
				txtTotalAmount.Text = "0.00";
				txtAdvance.Text = "0.00";
				txtDue.Text = "0.00";
				

				Set_Focus("txtPatientId");
			}	
		}


		protected void txtPatientId_TextChanged(object sender, EventArgs e)
		{

			if (IsPostBack)
			{
				var vPatientID = (from pid in oOnLinePrescriptionDataContext.PatientBasicInfos
								  where pid.PatientID.Equals(txtPatientId.Text)
								  select pid.PatientID).SingleOrDefault();

				var countPatientID = oOnLinePrescriptionDataContext.PatientBasicInfos.Where(me => me.PatientID == this.txtPatientId.Text).Count();

				//Reload check***************************
				//var vLavId = (from LbID in oOnLinePrescriptionDataContext.LabTestInfos
				//			  where LbID.PatientID.Equals(txtPatientId.Text)
				//			  select LbID.LabTestID).Max();

				//if(txtLabTestID.Text!="0")
				//{
				//	var vTDate = (from TDt in oOnLinePrescriptionDataContext.LabTestInfos
				//				  where TDt.TestDate.Equals(vLavId)
				//				  select TDt.TestDate).Count();
				//	if (vTDate == 1)
				//		return;
				//}
				//End Reload Check************************

				if (countPatientID > 0)
				{
					var vPatientName = (from pn in oOnLinePrescriptionDataContext.PatientBasicInfos
										where pn.PatientID.Equals(txtPatientId.Text)
										select pn.PatientName).SingleOrDefault();

					txtPatientName.Text = Convert.ToString(vPatientName);

					var pDOB = (from age in oOnLinePrescriptionDataContext.PatientBasicInfos
								where age.PatientID.Equals(txtPatientId.Text)
								select age.DateOfBirth).SingleOrDefault();

					DateTime PatientDOB = Convert.ToDateTime(pDOB);
					DateTime today = DateTime.Now;

					var totalDays = (today - PatientDOB).TotalDays;

					txtYear.Text = Math.Truncate(totalDays / 365).ToString();
					txtMonth.Text = Math.Truncate((totalDays % 365) / 30).ToString();
					txtDay.Text = Math.Truncate((totalDays % 365) % 30).ToString();

					var vStudyID = (from sid in oOnLinePrescriptionDataContext.PatientBasicInfos
											where sid.PatientID.Equals(txtPatientId.Text)
											select sid.StudyID).SingleOrDefault();

					txtStudyPatientId.Text = vStudyID;

					var vStudyName = (from snm in oOnLinePrescriptionDataContext.PatientBasicInfos
									  where snm.PatientID.Equals(txtPatientId.Text)
									  select snm.StudyName).SingleOrDefault();

					txtStudyName.Text = vStudyName;

					var vRelCode = (from rln in oOnLinePrescriptionDataContext.PatientBasicInfos
									  where rln.PatientID.Equals(txtPatientId.Text)
									  select rln.RelCode).SingleOrDefault();

					var vRelDesc = (from rldsc in oOnLinePrescriptionDataContext.lkp_Relationships
									where rldsc.RelCode.Equals(vRelCode)
									select rldsc.RelDesc).SingleOrDefault();


					txtRelation.Text = vRelDesc.ToString();

					var vRegFee = (from snm in oOnLinePrescriptionDataContext.PatientBasicInfos
									  where snm.PatientID.Equals(txtPatientId.Text)
									  select snm.RegistrationFee).SingleOrDefault();

					txtRegistrationFee.Text = vRegFee.ToString();


					//Data insertion into****************************
					ORM.LabTestInfo oLabTestInfo = new ORM.LabTestInfo();
					oLabTestInfo.PatientID = txtPatientId.Text;

					oLabTestInfo.TestDate = dtTestDate.SelectedDate;

					oLabTestInfo.AgeYY = Convert.ToByte(txtYear.Text);
					oLabTestInfo.AgeMM = Convert.ToByte(txtMonth.Text);
					oLabTestInfo.AgeDD = Convert.ToByte(txtDay.Text);

					oOnLinePrescriptionDataContext.LabTestInfos.InsertOnSubmit(oLabTestInfo);
					oOnLinePrescriptionDataContext.SubmitChanges();


					//var vLavId = (from LbID in oOnLinePrescriptionDataContext.LabTestInfos
					//			  where LbID.PatientID.Equals(txtPatientId.Text)
					//			  select LbID.LabTestID.Max()).Single();

					var vLavId2 = (from LbID in oOnLinePrescriptionDataContext.LabTestInfos
								  where LbID.PatientID.Equals(txtPatientId.Text)
								  select LbID.LabTestID).Max();

					txtLabTestID.Text = vLavId2.ToString();


					txtPatientId.Enabled = false;
					RGTestName.Visible = true;
					Set_Focus("txtHeight");
				}
				else
				{
					txtPatientName.Text = "";
					txtYear.Text = "";
					txtMonth.Text = "";
					txtDay.Text = "";
					ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "Showalert();", true);
					Set_Focus("txtPatientId");
				}
			}

			//ddlDoctorName.Focus();
			//Set_Focus("ddlDoctorName");
		}


		protected void RGTestName_ItemInserted(object source, GridInsertedEventArgs e)
		{
			if (e.Exception != null)
			{
				e.ExceptionHandled = true;
				e.KeepInInsertMode = true;

				ShowErrorMessage();

			}	
		}


		protected void RGTestName_ItemDeleted(object source, GridDeletedEventArgs e)
		{
			if (e.Exception != null)
			{
				e.ExceptionHandled = true;
				//e.KeepInInsertMode = true;

				ShowErrorMessage();

			}
		}



		decimal total = 0;
		protected void RGTestName_ItemDataBound(object sender, GridItemEventArgs e)
		{
			if (e.Item is GridDataItem)
			{
				GridDataItem dataItem = e.Item as GridDataItem;
				decimal fieldValue = decimal.Parse(dataItem["TestFee"].Text);
				total += fieldValue;

				txtTestFeeTotal.Text = total.ToString();
				txtTotalAmount.Text = (Convert.ToDecimal(txtTestFeeTotal.Text) - Convert.ToDecimal(txtDiscount.Text)).ToString();
				txtDue.Text = txtTotalAmount.Text;

			}
		}

		protected void btnSave_Click(object sender, EventArgs e)
		{

			//txtTestFeeTotal.Text = (Convert.ToDecimal(txtTestFeeTotal.Text)).ToString();
			//txtDiscount.Text = (Convert.ToDecimal(txtDiscount.Text)).ToString();
			//txtTotalAmount.Text = (Convert.ToDecimal(txtTotalAmount.Text)).ToString();
			//txtAdvance.Text = (Convert.ToDecimal(txtAdvance.Text)).ToString();
			//txtDue.Text = (Convert.ToDecimal(txtDue.Text)).ToString();


			if (RGTestName.Items.Count < 1)
			{
				RGTestName.Focus();
				ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "ValGridAlert();", true);
				return;
			}

			#region TestOrderEntry common data insertion


			var varLID = oOnLinePrescriptionDataContext.LabTestInfos.Where(id => id.LabTestID.Equals(txtLabTestID.Text));

			foreach (var varForecLID in varLID)
			{
				//LabTestID,PatientID,TestDate,DeliveryDate AgeYY    AgeMM AgeDD HeightCM WeightKG HipCM
				varForecLID.DeliveryDate = dtDeliveryDate.SelectedDate;

				varForecLID.HeightCM = Convert.ToSByte(txtHeight.Text);
				varForecLID.WeightKG = Convert.ToSByte(txtWeight.Text);
				varForecLID.HipCM = Convert.ToSByte(txtHip.Text);

				//WaistCM URBDoctor FromOutOfURB,TotalBill,Discount,   DiscountBy,PaidDueBill,PaidBill,PaidYesNo CashRcvdDate 
				varForecLID.WaistCM = Convert.ToSByte(txtWaist.Text);

				if (ddlURBReferredBy.SelectedIndex != 0)
					varForecLID.URBDoctor = Convert.ToSByte(ddlURBReferredBy.SelectedValue);
				else
					varForecLID.URBDoctor = null;


				if (chkNonURBRef.Enabled == true)
					varForecLID.FromOutOfURB = txtNonURBReferredBy.Text;
				else
					varForecLID.FromOutOfURB = null;

				varForecLID.TotalBill = Convert.ToDecimal(txtTotalAmount.Text);

				varForecLID.Discount = Convert.ToDecimal(txtDiscount.Text);

				varForecLID.DiscountBy = txtDiscountBy.Text;
				varForecLID.DueBill = Convert.ToDecimal(txtDue.Text);
				varForecLID.AdvancePayment = Convert.ToDecimal(txtAdvance.Text);

				if (chkFullPaid.Checked)
					varForecLID.PaidStatus = true;
				else
					varForecLID.PaidStatus = false;

				varForecLID.CashRcvdDate = dtCashRecvDate.SelectedDate;


				//RptDelivered RptDeliveredDt ReceivedBy
				varForecLID.RptDelivered = false;
				varForecLID.RptDeliveredDt = dtDeliveryDate.SelectedDate;
				varForecLID.ReceivedBy = null;


			}
			oOnLinePrescriptionDataContext.SubmitChanges();


			//Data insert into TransectionDetail Table	
			ORM.TransectionDetail oTransectionDetail = new ORM.TransectionDetail();

			//TranID,LabTestID,TranDt,TranType,TranAmount
			oTransectionDetail.LabTestID = txtLabTestID.Text;
			oTransectionDetail.TranDt = DateTime.Now;
			oTransectionDetail.TranType = 3;
			oTransectionDetail.TranAmount = Convert.ToDecimal(txtAdvance.Text);



			oOnLinePrescriptionDataContext.TransectionDetails.InsertOnSubmit(oTransectionDetail);
			oOnLinePrescriptionDataContext.SubmitChanges();
			//End Data insert into TransectionDetail Table

			txtPatientId.Enabled = true;

			#endregion TestOrderEntry


			//Report**********************************************************************************
			ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "openReport();", true);
			//End Report******************************************************************************

			//ClearControlled();
		}




		void ClearControlled()
		{
			foreach (Control ctrl in TestOrder.Controls)
			{
				if (ctrl is TextBox)
					((TextBox)ctrl).Text = string.Empty;
				else if (ctrl is DropDownList)
					((DropDownList)ctrl).SelectedIndex = 0;
				else if (ctrl is CascadingDropDown)
					((CascadingDropDown)ctrl).SelectedValue = "0";
				else if (ctrl is CheckBox)
					((CheckBox)ctrl).Checked = false;

				else if (ctrl is RadDatePicker)
					((RadDatePicker)ctrl).SelectedDate = null;

				ddlURBReferredBy.SelectedIndex = 0;
				ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "DataSaveAlert();", true);

				//txtPatientId.Focus();
				Set_Focus("txtPatientId");
				dtCashRecvDate.SelectedDate = DateTime.Now.Date;
				dtTestDate.SelectedDate = DateTime.Now.Date;

				dtDeliveryDate.SelectedDate = (DateTime.Now.Date);
				dtDeliveryDate.SelectedDate = ((DateTime)dtDeliveryDate.SelectedDate).AddDays(2);

				txtHeight.Text = "00";
				txtHip.Text = "00";
				txtWeight.Text = "00";
				txtWaist.Text = "00";

				txtTestFeeTotal.Text = "0.00";
				txtDiscount.Text = "0.00";
				txtTotalAmount.Text = "0.00";
				txtAdvance.Text = "0.00";
				txtDue.Text = "0.00";
			}
		}

		private void Set_Focus(string controlname)
		{
			string strScript;

			strScript = "<script language=javascript> document.all('" + controlname + "').focus() </script>";
			RegisterStartupScript("focus", strScript);
		}


		private void ShowErrorMessage()
		{
			RadAjaxManagerRegistration.ResponseScripts.Add(string.Format("window.radalert(\"Item you are trying to add is already exist!\")"));
		}


		//private void ShowMessage()
		//{
		//	RadAjaxManager1.ResponseScripts.Add(string.Format("window.radalert(\"Data Save successfully.\")"));
		//}

	}
}