using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineOutPatientManagementSystem.Report.ReportMenue
{
	public partial class frmReportLabTest : System.Web.UI.Page
	{
		ORM.OnLinePrescriptionDataContext oOnLinePrescriptionDataContext = new ORM.OnLinePrescriptionDataContext();


		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void txtLabTestID_TextChanged(object sender, EventArgs e)
		{
			if (IsPostBack)
			{
				var vLabTest = (from LTid in oOnLinePrescriptionDataContext.LabTestInfos
								where LTid.LabTestID.Equals(txtLabTestID.Text)
								select LTid.LabTestID).SingleOrDefault();

				var countVisitID = oOnLinePrescriptionDataContext.LabTestInfos.Where(me => me.LabTestID == this.txtLabTestID.Text).Count();

				if (countVisitID > 0)
				{
					btnPreview.Focus();
				}
				else
				{
					txtLabTestID.Text = "";

					ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "Showalert();", true);
				}
			}
		}
	}
}