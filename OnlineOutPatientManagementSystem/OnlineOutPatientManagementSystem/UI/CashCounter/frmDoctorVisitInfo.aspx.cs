using AjaxControlToolkit;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineOutPatientManagementSystem.UI.CashCounter
{
	public partial class frmDoctorVisitInfo : System.Web.UI.Page
	{
		ORM.OnLinePrescriptionDataContext oOnLinePrescriptionDataContext = new ORM.OnLinePrescriptionDataContext();

		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{			
				//txtPatientId.Focus();
				Set_Focus("txtPatientId");
				ddlDoctorName.Items.Insert(0, new ListItem(string.Empty, string.Empty));
			}
		}

		

		private string PatientAge()
		{
			//Date calculation*****************************************
			var pDOB = (from age in oOnLinePrescriptionDataContext.PatientBasicInfos
						where age.PatientID.Equals(txtPatientId.Text)
						select age.DateOfBirth).SingleOrDefault();

			DateTime PatientDOB = Convert.ToDateTime(pDOB);
			DateTime today = DateTime.Now;

			var totalDays = (today - PatientDOB).TotalDays;

			var totalYears = Math.Truncate(totalDays / 365);
			var totalMonths = Math.Truncate((totalDays % 365) / 30);
			var remainingDays = Math.Truncate((totalDays % 365) % 30);

			string strFinalAge = totalYears + "y-" + totalMonths + "m-" + remainingDays + "d";
			return strFinalAge;
			//End Date calculation*****************************************
		}
		

		protected void txtPatientId_TextChanged(object sender, EventArgs e)
		{
			if (IsPostBack)
			{
				var vPatientID = (from pid in oOnLinePrescriptionDataContext.PatientBasicInfos
								  where pid.PatientID.Equals(txtPatientId.Text)
								  select pid.PatientID).SingleOrDefault();
				
				var countPatientID = oOnLinePrescriptionDataContext.PatientBasicInfos.Where(me => me.PatientID == this.txtPatientId.Text).Count();	

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

					totalDays = totalDays + 1;

					txtYear.Text = Math.Truncate(totalDays / 365).ToString();
					txtMonth.Text = Math.Truncate((totalDays % 365) / 30).ToString();
					txtDay.Text = Math.Truncate((totalDays % 365) % 30).ToString();

					var vRegistrationFee = (from rf in oOnLinePrescriptionDataContext.PatientBasicInfos
											where rf.PatientID.Equals(txtPatientId.Text)
											select rf.RegistrationFee).SingleOrDefault();

					int intRegistrationFee = Convert.ToInt16(vRegistrationFee);

					if (intRegistrationFee > 0)
						chkRegistrationFee.Checked = true;
					else
						chkRegistrationFee.Checked = false;
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
			Set_Focus("ddlDoctorName");
		}


		protected void btnMoneyReceipt_Click(object sender, EventArgs e)
		{

			ORM.DoctorVisitInfo oDoctorVisitInfo = new ORM.DoctorVisitInfo();

			oDoctorVisitInfo.PatientID = txtPatientId.Text;
			oDoctorVisitInfo.AgeYY = Convert.ToByte(txtYear.Text);
			oDoctorVisitInfo.AgeMM = Convert.ToByte(txtMonth.Text);
			oDoctorVisitInfo.AgeDD = Convert.ToByte(txtDay.Text);

			oDoctorVisitInfo.DoctorCode = Convert.ToByte(ddlDoctorName.SelectedValue);
			oDoctorVisitInfo.DoctorFee = Convert.ToDecimal(ddlDoctorFee.SelectedValue);
			oDoctorVisitInfo.ReceivedBy = 12345;
			oDoctorVisitInfo.Remarks = txtRemarks.Text;
			oDoctorVisitInfo.EntryDate = DateTime.Now;
			oDoctorVisitInfo.Status = 1;

			oOnLinePrescriptionDataContext.DoctorVisitInfos.InsertOnSubmit(oDoctorVisitInfo);
			oOnLinePrescriptionDataContext.SubmitChanges();

			ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "openReport();", true);

			
			ClearControlled();

		}

		void ClearControlled()
		{
			foreach (Control ctrl in DoctorVisitInfo.Controls)
			{
				//if (ctrl is TextBox)
				//	((TextBox)ctrl).Text = string.Empty;
				 if (ctrl is DropDownList)
					((DropDownList)ctrl).SelectedIndex = 0;
				else if (ctrl is CascadingDropDown)
					((CascadingDropDown)ctrl).SelectedValue = "0";
				else if (ctrl is CheckBox)
					((CheckBox)ctrl).Checked = false;
				//ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "DataSaveAlert();", true);
				
				//txtPatientId.Focus();
				Set_Focus("txtPatientId");
			}
		}

		private void Set_Focus(string controlname)
		{
			string strScript;

			strScript = "<script language=javascript> document.all('" + controlname + "').focus() </script>";
			RegisterStartupScript("focus", strScript);
		}

		private void ShowMessage()
		{
			RadAjaxManager1.ResponseScripts.Add(string.Format("window.radalert(\"Data Save successfully.\")"));
		}
	}
}