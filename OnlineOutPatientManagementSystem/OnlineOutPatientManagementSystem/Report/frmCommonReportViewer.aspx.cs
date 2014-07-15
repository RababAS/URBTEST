using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineOutPatientManagementSystem.Report
{
	public partial class frmCommonReportViewer : System.Web.UI.Page
	{
		ORM.OnLinePrescriptionDataContext oOnLinePrescriptionDataContext = new ORM.OnLinePrescriptionDataContext();
		string strVisitId, strPatientID, strLabTestID, strStartDate, strEndDate,strReportName;
		

		protected void Page_Load(object sender, EventArgs e)
		{
			
			strVisitId = string.IsNullOrEmpty(Request.QueryString["prmVisitId"]) ? "" : Request.QueryString["prmVisitId"];
			strPatientID = string.IsNullOrEmpty(Request.QueryString["prmPatientId"]) ? "" : Request.QueryString["prmPatientId"];
			strLabTestID = string.IsNullOrEmpty(Request.QueryString["prmLabTestID"]) ? "" : Request.QueryString["prmLabTestID"];

			strStartDate = string.IsNullOrEmpty(Request.QueryString["prmStartDate"]) ? "" : Request.QueryString["prmStartDate"].Trim();
			strEndDate = string.IsNullOrEmpty(Request.QueryString["prmEndDate"]) ? "" : Request.QueryString["prmEndDate"].Trim();



			//DateTime date1 = DateTime.ParseExact(strStartDate, "dd/mm/YYYY", null);
			//DateTime date2 = DateTime.ParseExact(strEndDate, "dd/mm/YYYY", null);


			strReportName = string.IsNullOrEmpty(Request.QueryString["prmReportNmae"]) ? "" : Request.QueryString["prmReportNmae"];


			
			switch (strReportName.Trim())
				{
					case "Prescription": 
						{
							Report.MainPrescription oMainPrescription = new Report.MainPrescription();

							oMainPrescription.DataSource = from PresData in oOnLinePrescriptionDataContext.sp_rpt_PrescriptionMain(strVisitId)
														   select PresData;

							rvCommonReportViewer.Report = oMainPrescription;
							rvCommonReportViewer.Visible = true;

						break;
						}

					case "DoctorVisitMoneyReceipt":
						{
							Report.DoctorVisitMoneyReceipt oDoctorVisitMoneyReceipt = new Report.DoctorVisitMoneyReceipt();

							oDoctorVisitMoneyReceipt.DataSource = from PresData in oOnLinePrescriptionDataContext.sp_rpt_DoctorVisitMoneyReceipt(strPatientID)
														   select PresData;

							rvCommonReportViewer.Report = oDoctorVisitMoneyReceipt;
							rvCommonReportViewer.Visible = true;

							break;
						}

					case "LabTest":
						{
							Report.LabTestOrderMain oLabTestOrderMain = new Report.LabTestOrderMain();

							oLabTestOrderMain.DataSource = from PresData in oOnLinePrescriptionDataContext.sp_rpt_LabTestOrder(strLabTestID)
																  select PresData;

							rvCommonReportViewer.Report = oLabTestOrderMain;
							rvCommonReportViewer.Visible = true;

							break;
						}

					case "DailyDoctorVisit":
						{
							Report.DailyDoctorVisit oDailyDoctorVisit = new Report.DailyDoctorVisit();

							oDailyDoctorVisit.DataSource = from PresData in oOnLinePrescriptionDataContext.sp_rpt_DailyDoctorVisit(Convert.ToDateTime(strStartDate),Convert.ToDateTime(strEndDate))
																  select PresData;

							rvCommonReportViewer.Report = oDailyDoctorVisit;
							rvCommonReportViewer.Visible = true;

							break;
						}

					default:
						break;
				}
			
		}
	}
}