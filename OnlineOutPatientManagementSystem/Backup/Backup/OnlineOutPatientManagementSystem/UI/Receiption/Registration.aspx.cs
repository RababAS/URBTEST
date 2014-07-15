using System;
using System.Web.UI.WebControls;
using OnlineOutPatientManagementSystem.ORM;
using System.Web.UI;

using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using OnlineOutPatientManagementSystem.UI.Receiption;


namespace OnlineOutPatientManagementSystem.UI
{
	public partial class Registration : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				ddlStudyName.DataSource =BL.Classes.LookUp.GetRespondentStudyName();
				ddlStudyName.DataBind();
				ddlStudyName.SelectedValue = "None";

				ddlRelationship.DataSource = BL.Classes.LookUp.GetPatientRelation();
				ddlRelationship.DataBind();
				ddlRelationship.SelectedValue = "9";
				PopulateDistrict();
			}
		}


		private void PopulateDistrict()
		{
			ddlDistrict.DataSource = BL.Classes.LookUp.GetDistrictList();
			ddlDistrict.DataBind();
			ddlDistrict.SelectedValue = "67";
			// will move
			PopulateThana();
		}


		protected void ddlDistrict_SelectedIndexChanged(object sender, EventArgs e)
		{
			PopulateThana();
			ddlUnion.Items.Clear();
			ddlVillage.Items.Clear();
		}

		private void PopulateThana()
		{
			//ddlThana.Items.Clear();
			ddlUnion.Items.Clear();
			ddlVillage.Items.Clear();
			ddlThana.DataSource = BL.Classes.LookUp.GetThanaorUpZillaList(ddlDistrict.SelectedValue);
			ddlThana.DataBind();
			ddlThana.Items.Add(new ListItem("Select Thana", "00"));
			ddlThana.SelectedValue = "00";
		}


		protected void ddlThana_SelectedIndexChanged(object sender, EventArgs e)
		{
			ddlVillage.Items.Clear();
			ddlUnion.DataSource = BL.Classes.LookUp.GetUnionList(ddlDistrict.SelectedValue, ddlThana.SelectedValue);
			ddlUnion.DataBind();
			ddlUnion.Items.Add(new ListItem("Select Union", "00"));
			ddlUnion.SelectedValue = "00";
		}


		protected void ddlUnion_SelectedIndexChanged(object sender, EventArgs e)
		{
			ddlVillage.DataSource = BL.Classes.LookUp.GetVillageList(ddlDistrict.SelectedValue, ddlThana.SelectedValue, ddlUnion.SelectedValue);
			ddlVillage.DataBind();
			ddlVillage.Items.Add(new ListItem("Select Village", "00"));
			ddlVillage.SelectedValue = "00";
		}


		//Save data *******************************************************************************************************************************************
		protected void btnSave_Click(object sender, EventArgs e)
		{
			//
			//ddlThana.Attributes.Add("onchange", " return VerifyThana();");
			ddlThana.Attributes.Add("onClick", "return VerifyThana()");

			//Create ORM Object
			PatientBasicInfo oPatietnBasicInfo = new PatientBasicInfo();

			//Patient type
			oPatietnBasicInfo.PatientType = byte.Parse(ddlPatientType.SelectedValue);

			if (byte.Parse(ddlPatientType.SelectedValue) == 2)
			{
				oPatietnBasicInfo.StudyName = ddlStudyName.SelectedValue;
				oPatietnBasicInfo.StudyID = txtStudyPatientId.Text;
			}
			else if (byte.Parse(ddlPatientType.SelectedValue) == 3)
				oPatietnBasicInfo.StudyID = txtEmployeeId.Text;

			oPatietnBasicInfo.Relationship = byte.Parse(ddlRelationship.SelectedValue);
			//End Patient type


			//Patient Basic Information
			oPatietnBasicInfo.PatientName = txtPatientName.Text;
			oPatietnBasicInfo.FatherName = txtFathersName.Text;
			oPatietnBasicInfo.MotherName = txtMothersName.Text;
			//Check
			oPatietnBasicInfo.Gender = byte.Parse(ddlSex.SelectedValue);
			//need a check here for MS
			oPatietnBasicInfo.MaritalStatus = byte.Parse(ddlMaritalStatus.SelectedValue);
			oPatietnBasicInfo.SpouseName = txtSpouseName.Text;
			//End Patient Basic Information


			//NID & Mobile
			oPatietnBasicInfo.NationalID = txtNID.Text;
			oPatietnBasicInfo.ContactNo = txtMobile.Text;
			//End NID & Mobile

			//Patient Address
			oPatietnBasicInfo.PDistrict = ddlDistrict.SelectedValue;
			oPatietnBasicInfo.PThana = ddlThana.SelectedValue;
			oPatietnBasicInfo.PUnion = ddlUnion.SelectedValue;
			oPatietnBasicInfo.PVillage = ddlVillage.SelectedValue;

			oPatietnBasicInfo.PAddress = txtAddress.Text;
			oPatietnBasicInfo.Remarks = txtRemarks.Text;
			oPatietnBasicInfo.RegistrationDt = DateTime.Now;
			//End Patient Address


			//Age Info
			if (chkDOB.Checked)
				oPatietnBasicInfo.DateOfBirth = RdpDOB.SelectedDate;
			else
			{
				int AgeTotalDays;
				AgeTotalDays = int.Parse(RNtxtAgeMonth.Text) * 30 + int.Parse(RNtxtAgeDay.Text) + int.Parse(RNtxtAgeYear.Text) * 365;
				oPatietnBasicInfo.PatientAge = String.Concat(RNtxtAgeDay.Text, 'D', RNtxtAgeMonth.Text, 'M', RNtxtAgeYear.Text, 'Y');
				oPatietnBasicInfo.DateOfBirth = DateTime.Now.AddDays(-AgeTotalDays);
			}
			//End Age Info


			//Create Error message Object
			BL.Classes.Patient oPatient = new BL.Classes.Patient();
			string sError= oPatient.Verify(oPatietnBasicInfo);

			if (string.IsNullOrEmpty(sError))
				oPatient.Register(oPatietnBasicInfo);
			else
			{
				RadWindowManager.RadAlert(sError, 200, 200, "Alert!!", null);
				return;

			}

			//May be function generation
			lblForFunctionCall.Text = "<script type='text/javascript'>returnToParent();</script>";
			//\\End Save data **********************************************************************************************************************************

			//Refresh Registration Grid
			//RegistrationGrid ORegistrationGrid=new RegistrationGrid();
			//ORegistrationGrid.LoadGridData();
		}

		protected void ddlPatientType_SelectedIndexChanged(object sender, EventArgs e)
		{

		}

	}
}