using OnlineOutPatientManagementSystem.ORM;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace OnlineOutPatientManagementSystem.UI.Receiption
{
	public partial class frmRegistration : System.Web.UI.Page
	{

		string strDist;
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				RdpDOB.MaxDate = DateTime.Now;

				ddlPatientType.Items.Insert(0, new ListItem(string.Empty, string.Empty));
				
				ddlStudyName.DataSource = BL.Classes.LookUp.GetRespondentStudyName();
				ddlStudyName.DataBind();
				ddlStudyName.SelectedValue = "None";

				ddlRelationship.DataSource = BL.Classes.LookUp.GetPatientRelation();
				ddlRelationship.DataBind();
				ddlRelationship.SelectedValue = "9";
			}
		}



		protected void btnSave_Click(object sender, EventArgs e)
		{
			ORM.OnLinePrescriptionDataContext oOnLinePrescriptionDataContext = new ORM.OnLinePrescriptionDataContext();
			PatientBasicInfo oPatietnBasicInfo = new PatientBasicInfo();
			
			
			//PatientID,RegistrationDt,PatientType,StudyName,StudyID,EmployeeID,RelCode,PatientName,MaritalStatus,Gender,
			oPatietnBasicInfo.RegistrationDt = DateTime.Now;
			oPatietnBasicInfo.PatientType = byte.Parse(ddlPatientType.SelectedValue);

			if (byte.Parse(ddlPatientType.SelectedValue) == 2)
			{
				oPatietnBasicInfo.StudyName = ddlStudyName.SelectedValue;
				oPatietnBasicInfo.StudyID = txtStudyPatientId.Text;
			}
			else if (byte.Parse(ddlPatientType.SelectedValue) == 3)
				oPatietnBasicInfo.StudyID = txtEmployeeId.Text;

			if (txtEmployeeId.Enabled == true)
				oPatietnBasicInfo.EmployeeID = txtEmployeeId.Text;
			else
				oPatietnBasicInfo.EmployeeID = null;

			
			oPatietnBasicInfo.RelCode = byte.Parse(ddlRelationship.SelectedValue);
			oPatietnBasicInfo.PatientName = txtPatientName.Text;
			oPatietnBasicInfo.MaritalStatus = byte.Parse(ddlMaritalStatus.SelectedValue);
			oPatietnBasicInfo.Gender = byte.Parse(ddlSex.SelectedValue);


			//SpouseName,FatherName,MotherName,DateOfBirth,NationalID,ContactNo,AreaCode,PDistrict,PThana,PUnion,
			oPatietnBasicInfo.SpouseName = txtSpouseName.Text;
			oPatietnBasicInfo.FatherName = txtFathersName.Text;
			oPatietnBasicInfo.MotherName = txtMothersName.Text;

			//DateOfBirth
			if (chkDOB.Checked)
				oPatietnBasicInfo.DateOfBirth = RdpDOB.SelectedDate;
			else
			{
				int AgeTotalDays;
				AgeTotalDays = int.Parse(RNtxtAgeMonth.Text) * 30 + int.Parse(RNtxtAgeDay.Text) + int.Parse(RNtxtAgeYear.Text) * 365;				
				oPatietnBasicInfo.DateOfBirth = DateTime.Now.AddDays(-AgeTotalDays);
			}
			//DateOfBirth

			oPatietnBasicInfo.NationalID = txtNID.Text;
			oPatietnBasicInfo.ContactNo = txtMobile.Text;

			
			var varAreaCode = (from lkpAreDet in oOnLinePrescriptionDataContext.lkp_AreaDetails
							   where lkpAreDet.DistCode.Equals(ddlDistrict.SelectedValue) &&
							   lkpAreDet.ThanaCode.Equals(ddlThana.SelectedValue)
							   select lkpAreDet.AreaCode).SingleOrDefault();
			oPatietnBasicInfo.AreaCode = varAreaCode;

			oPatietnBasicInfo.PDistrict = ddlDistrict.SelectedValue;
			oPatietnBasicInfo.PThana = ddlThana.SelectedValue;
			oPatietnBasicInfo.PUnion = txtUnion.Text;



			//PVillage,PAddress,RegistrationFee,MedDiscount,TestDiscount,Remarks
			oPatietnBasicInfo.PVillage = txtVillage.Text;
			oPatietnBasicInfo.PAddress = txtAddress.Text;

			//var varRegFee = oOnLinePrescriptionDataContext.lkp_Relationships.Where(id => id.RelMedDiscount.Equals(ddlRelationship.SelectedValue));

			var varRegFeeMax = oOnLinePrescriptionDataContext.lkp_RegistrationFees.Max(x => x.RFTaka);

			
			var varMedDis = (from lkpRel in oOnLinePrescriptionDataContext.lkp_Relationships
							 where lkpRel.RelCode.Equals(ddlRelationship.SelectedValue)
							 select lkpRel.RelMedDiscount).SingleOrDefault();

			var varTestDis = (from lkpRel in oOnLinePrescriptionDataContext.lkp_Relationships
							 where lkpRel.RelCode.Equals(ddlRelationship.SelectedValue)
							 select lkpRel.RelTestDiscount).SingleOrDefault();


			oPatietnBasicInfo.RegistrationFee = varRegFeeMax;
			oPatietnBasicInfo.MedDiscount = varMedDis;
			oPatietnBasicInfo.TestDiscount = varTestDis;

			oPatietnBasicInfo.Remarks = txtRemarks.Text;
			


			//Create Error message Object
			BL.Classes.Patient oPatient = new BL.Classes.Patient();
			string sError = oPatient.Verify(oPatietnBasicInfo);

			if (string.IsNullOrEmpty(sError))
				oPatient.Register(oPatietnBasicInfo);
			else
			{
				RadWindowManager.RadAlert(sError, 200, 200, "Alert!!", null);
				return;

			}

			ClearControlled();
			//May be function generation
			//lblForFunctionCall.Text = "<script type='text/javascript'>returnToParent();</script>";			
		}


		void ClearControlled()
		{
			foreach (Control ctrl in Registration.Controls)
			{
				if (ctrl is TextBox)
					((TextBox)ctrl).Text = string.Empty;
				else if (ctrl is DropDownList)
					((DropDownList)ctrl).SelectedIndex = 0;
				else if (ctrl is CheckBox)
					((CheckBox)ctrl).Checked = true;

				//RadDatePicker
				RdpDOB.Clear();
				RNtxtAgeYear.Text = "";
				RNtxtAgeMonth.Text = "";
				RNtxtAgeDay.Text = "";

				ccddlDistrict.SelectedValue = "0";
				ccddlThana.SelectedValue = "0";

				ddlStudyName.SelectedIndex = 0;


				ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "DataSaveAlert();", true);


				Set_Focus("ddlPatientType");
			}
		}

		private void Set_Focus(string controlname)
		{
			string strScript;

			strScript = "<script language=javascript> document.all('" + controlname + "').focus() </script>";
			RegisterStartupScript("focus", strScript);
		}


	}
}