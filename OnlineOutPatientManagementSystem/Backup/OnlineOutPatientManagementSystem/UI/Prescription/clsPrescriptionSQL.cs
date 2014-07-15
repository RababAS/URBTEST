using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace OnlineOutPatientManagementSystem.UI.Prescription
{
	public class clsPrescriptionSQL
	{
		//SqlTransaction sqlTrans = null;

		public string sqlConString
		{
			get { return WebConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString; }
		}


		public int executeQuery(string queryString)
		{
			int rowsAffected = 0;
			using (SqlConnection connection = new SqlConnection(sqlConString))
			{
				using (SqlCommand command = new SqlCommand(queryString, connection))
				{
					command.Connection.Open();
					rowsAffected = command.ExecuteNonQuery();
				}
			}
			return rowsAffected;
		}


		public string getSQLvalue(string queryString)
		{
			string strValue;
			using (SqlConnection connection = new SqlConnection(sqlConString))
			{
				//SqlTransaction sqlTran = connection.BeginTransaction();

				using (SqlCommand command = new SqlCommand(queryString, connection))
				{
					command.Connection.Open();
					//command.Transaction = sqlTran;
					strValue = command.ExecuteScalar().ToString();
				}
				//sqlTran.Commit();
				return strValue;
			}
		}



		public Boolean insertCheifComplainceInfo(OnlineOutPatientManagementSystem.UI.Prescription.clsDataTypes.PrescriptionGridDataInfo oPrescriptionDataInfo)
		{

			string queryString = "INSERT INTO [ChiefComplaince] ([VisitID],[CCCode], [DurationYY], [DurationMM],[DurationDD]) " +
								  "VALUES ('" + oPrescriptionDataInfo.strVisitID + "', '" + oPrescriptionDataInfo.strCCCode + "', '" + oPrescriptionDataInfo.strYY + "','" + oPrescriptionDataInfo.strMM + "','" + oPrescriptionDataInfo.strDD + "' )";

			return Convert.ToBoolean(executeQuery(queryString));
		}

		public Boolean insertProvisionalDx(OnlineOutPatientManagementSystem.UI.Prescription.clsDataTypes.PrescriptionGridDataInfo oPrescriptionDataInfo)
		{

			string queryString = "INSERT INTO [ProvisionalDx] ([ProClinicVisitID],[ProvisionalCode]) " +
								  "VALUES ('" + oPrescriptionDataInfo.strVisitID + "', '" + oPrescriptionDataInfo.strProvisionalCode + "' )";

			return Convert.ToBoolean(executeQuery(queryString));
		}

		public Boolean insertDifferentialDx(OnlineOutPatientManagementSystem.UI.Prescription.clsDataTypes.PrescriptionGridDataInfo oPrescriptionDataInfo)
		{

			string queryString = "INSERT INTO [DifferentialDx] ([VisitID],[DifferentialDxCode]) " +
								  "VALUES ('" + oPrescriptionDataInfo.strVisitID + "', '" + oPrescriptionDataInfo.strDifferentialDxCode + "' )";

			return Convert.ToBoolean(executeQuery(queryString));
		}

		public Boolean insertConfirmDx(OnlineOutPatientManagementSystem.UI.Prescription.clsDataTypes.PrescriptionGridDataInfo oPrescriptionDataInfo)
		{

			string queryString = "INSERT INTO [ConfirmDx] ([VisitID],[ConfirmDxCode],[VisitDt]) " +
								  "VALUES ('" + oPrescriptionDataInfo.strVisitID + "', '" + oPrescriptionDataInfo.strConfirmDxCode + "','" + oPrescriptionDataInfo.strVisitDt + "' )";

			return Convert.ToBoolean(executeQuery(queryString));
		}

		public Boolean insertTreatmentx(OnlineOutPatientManagementSystem.UI.Prescription.clsDataTypes.PrescriptionGridDataInfo oPrescriptionDataInfo)
		{

			string queryString = @"INSERT INTO [MedicineDetails] ([VisitID],[MedicineCode],[MedVisitDt],   [MedQty],[FrequencyCode],[TreatmentCode],   [MedicinePrices],[MedDispuse],[MedReqQty],[MedDispuseDt]) " +
								  "VALUES ('" + oPrescriptionDataInfo.strVisitID + "', '" + oPrescriptionDataInfo.strMedicineCode + "', "+
											"'" + oPrescriptionDataInfo.strVisitDt + "', '" + oPrescriptionDataInfo.strMedQty + "'," +
											"'" + oPrescriptionDataInfo.strFrequencyCode + "', '" + oPrescriptionDataInfo.strTreatmentCode + "'," +
											"'" + oPrescriptionDataInfo.strMedicinePrices + "', '" + oPrescriptionDataInfo.strMedDispuse + "'," +
											"'" + oPrescriptionDataInfo.strMedReqQty + "','" + oPrescriptionDataInfo.strMedDispuseDt + "' )";

			return Convert.ToBoolean(executeQuery(queryString));
		}

		public Boolean insertInvestigations(OnlineOutPatientManagementSystem.UI.Prescription.clsDataTypes.PrescriptionGridDataInfo oPrescriptionDataInfo)
		{

			string queryString = "INSERT INTO [Investigations] ([VisitID],[InvestigationsCode],[VisitDt]) " +
								  "VALUES ('" + oPrescriptionDataInfo.strVisitID + "', '" + oPrescriptionDataInfo.strInvestigationsCode + "','" + oPrescriptionDataInfo.strVisitDt + "' )";

			return Convert.ToBoolean(executeQuery(queryString));
		}


		public Boolean insertPositiveFindings(OnlineOutPatientManagementSystem.UI.Prescription.clsDataTypes.PrescriptionGridDataInfo oPrescriptionDataInfo)
		{

			string queryString = "INSERT INTO [PositiveFindings] ([ClinicVisitID],[PositiveCode]) " +
								  "VALUES ('" + oPrescriptionDataInfo.strVisitID + "', '" + oPrescriptionDataInfo.strPositiveCode + "')";

			return Convert.ToBoolean(executeQuery(queryString));
		}

		public Boolean insertNegativeFindings(OnlineOutPatientManagementSystem.UI.Prescription.clsDataTypes.PrescriptionGridDataInfo oPrescriptionDataInfo)
		{

			string queryString = "INSERT INTO [NegativeFindings] ([ClinicVisitID],[NegativeCode]) " +
								  "VALUES ('" + oPrescriptionDataInfo.strVisitID + "', '" + oPrescriptionDataInfo.strNegativeCode + "')";

			return Convert.ToBoolean(executeQuery(queryString));
		}

		public Boolean insertDentalSign(OnlineOutPatientManagementSystem.UI.Prescription.clsDataTypes.PrescriptionGridDataInfo oPrescriptionDataInfo)
		{

			string queryString = "INSERT INTO [DentalSign] ([DenSignVisitID],[DenSignCode],[SignTeethNo]) " +
								  "VALUES ('" + oPrescriptionDataInfo.strVisitID + "', '" + oPrescriptionDataInfo.strDenSignCode + "','" + oPrescriptionDataInfo.strSignTeethNo + "')";

			return Convert.ToBoolean(executeQuery(queryString));
		}

		public Boolean insertDentalAdvice(OnlineOutPatientManagementSystem.UI.Prescription.clsDataTypes.PrescriptionGridDataInfo oPrescriptionDataInfo)
		{

			string queryString = "INSERT INTO [DentalAdvice] ([DenAdviceVisitID],[DenAdviceCode],[DenAdviceTeethNo]) " +
								  "VALUES ('" + oPrescriptionDataInfo.strVisitID + "', '" + oPrescriptionDataInfo.strDenAdviceCode + "','" + oPrescriptionDataInfo.strDenAdviceTeethNo + "')";

			return Convert.ToBoolean(executeQuery(queryString));
		}

		public Boolean insertAdviceBangla(OnlineOutPatientManagementSystem.UI.Prescription.clsDataTypes.PrescriptionGridDataInfo oPrescriptionDataInfo)
		{

			string queryString = "INSERT INTO [AdviceBangla] ([VisitID],[AdviceCode],[VisitDt]) " +
								  "VALUES ('" + oPrescriptionDataInfo.strVisitID + "', '" + oPrescriptionDataInfo.strAdviceCode + "','" + oPrescriptionDataInfo.strVisitDt + "')";

			return Convert.ToBoolean(executeQuery(queryString));
		}


	}
}