using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineOutPatientManagementSystem.Report.ReportMenue
{
	public partial class frmReportDoctorVisitMoneyReceipt : System.Web.UI.Page
	{
		ORM.OnLinePrescriptionDataContext oOnLinePrescriptionDataContext = new ORM.OnLinePrescriptionDataContext();



		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void txtPatientID_TextChanged(object sender, EventArgs e)
		{
			if (IsPostBack)
			{
				var vtxtPatientID = (from pid in oOnLinePrescriptionDataContext.PatientBasicInfos
								where pid.PatientID.Equals(txtPatientID.Text)
								select pid.PatientID).SingleOrDefault();

				var countPatientID = oOnLinePrescriptionDataContext.PatientBasicInfos.Where(me => me.PatientID == this.txtPatientID.Text).Count();

				if (countPatientID > 0)
				{
					btnPreview.Focus();
				}
				else
				{
					txtPatientID.Text = "";
					ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "Showalert();", true);
				}
			}
		}




	}
}