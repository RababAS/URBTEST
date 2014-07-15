using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineOutPatientManagementSystem.Report
{
	public partial class frmReportViewer : System.Web.UI.Page
	{
		ORM.OnLinePrescriptionDataContext oOnLinePrescriptionDataContext = new ORM.OnLinePrescriptionDataContext();
		string strVisitId;

		public void Page_Load(object sender, EventArgs e)
		{
			//Repoting*********************************************************
			Report.MainPrescription oMainPrescription = new Report.MainPrescription();

			if (Request.QueryString["prmVisitId"] != null)
				strVisitId = Request.QueryString["prmVisitId"];


			oMainPrescription.DataSource = from PresData in oOnLinePrescriptionDataContext.sp_rpt_PrescriptionMain(strVisitId)
										   select PresData;

			rvCommonViewer.Report = oMainPrescription;
			rvCommonViewer.Visible = true;

			//End Repoting*****************************************************
		
		}
	}
}