using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineOutPatientManagementSystem.Report.ReportMenue
{
	public partial class frmReportPrescription : System.Web.UI.Page
	{
		ORM.OnLinePrescriptionDataContext oOnLinePrescriptionDataContext = new ORM.OnLinePrescriptionDataContext();


		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void txtVisitID_TextChanged(object sender, EventArgs e)
		{
			if (IsPostBack)
			{
				var vVisitID = (from vid in oOnLinePrescriptionDataContext.ClinicVisitHistories
								  where vid.VisitID.Equals(txtVisitID.Text)
								select vid.VisitID).SingleOrDefault();

				var countVisitID = oOnLinePrescriptionDataContext.ClinicVisitHistories.Where(me => me.VisitID == this.txtVisitID.Text).Count();

				if (countVisitID > 0)
				{
					btnPreview.Focus();
				}
				else
				{
					txtVisitID.Text = "";
					
					ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "Showalert();", true);
					Set_Focus("txtVisitID");
				}
			}
		}

		//protected void btnPreview_Click(object sender, EventArgs e)
		//{
		//	ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "openReport();", true);
		//}

		private void Set_Focus(string controlname)
		{
			string strScript;

			strScript = "<script language=javascript> document.all('" + controlname + "').focus() </script>";
			RegisterStartupScript("focus", strScript);
		}
	}
}