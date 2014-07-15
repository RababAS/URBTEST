using System;

namespace OnlineOutPatientManagementSystem.UI.Prescription
{
	public class clsDataTypes
	{
		public class PrescriptionGridDataInfo
		{
			public string strVisitID { get; set; }

			//gvCheifComplaince
			public short strCCCode { get; set; }
			public byte strDD { get; set; }
			public byte strMM { get; set; }
			public byte strYY { get; set; }

			//gvProvisionalDx
			public int strProvisionalCode { get; set; }

			//gvDifferentialDx
			public short strDifferentialDxCode { get; set; }

			//gvConfirmDx
			public short strConfirmDxCode { get; set; }
			public DateTime strVisitDt { get; set; }

			//gvTreatment
			public short strMedicineCode { get; set; }
			//public string strMedVisitDt { get; set; }
			public string strMedQty { get; set; }
			public short strFrequencyCode { get; set; }
			public byte strTreatmentCode { get; set; }
			public string strMedicinePrices { get; set; }
			public string strMedDispuse { get; set; }
			public string strMedReqQty { get; set; }
			public string strMedDispuseDt { get; set; }

			//gvInvestigation
			public short strInvestigationsCode { get; set; }
			//public string strVisitDt { get; set; }

			//gvPostiveFindings
			public short strPositiveCode { get; set; }

			//gvNegativeFindings
			public short strNegativeCode { get; set; }


			//gvDentalSign
			public short strDenSignCode { get; set; }
			public string strSignTeethNo { get; set; }


			//gvDentalAdvice
			public string strDenAdviceCode { get; set; }
			public string strDenAdviceTeethNo { get; set; }

			//ddlAdvice
			public short strAdviceCode { get; set; }

		}

		public class PrescriptionGenDataInfo
		{
			//Basic Infp************************************
			public int strClinicVisitID { get; set; }
			public DateTime strVisitDate { get; set; }
			public string strPatientID { get; set; }
			public byte strRelations { get; set; }
			public byte strPatientAge { get; set; }
			public string strDrugHistory { get; set; }
			public short strDrugAllergy { get; set; }

			
			//On examinatin Info****************************** 
			public byte strExaAnemia { get; set; }
			public byte strExaJaundice { get; set; }
			public byte strExaClubbing { get; set; }
			public byte strExaOdema { get; set; }
			public byte strExaL_N { get; set; }


			public string strExaHeart { get; set; }
			public string strExaLung { get; set; }
			public byte strExaLiver { get; set; }
			public byte strExaSpleen { get; set; }
			public string strExaOthers { get; set; }


			public short strExaSystolic { get; set; }
			public short strExaDiastolic { get; set; }
			public byte strExaPulse { get; set; }
			public short strExaTemp { get; set; }
			public byte strExaWt { get; set; }


			public string strExaVulva { get; set; }
			public string strExaVagina { get; set; }
			public string strExaOS { get; set; }
			public short strExaCervix { get; set; }


			//Other data
			public int strReferredCode { get; set; }
			//public string strReferred { get; set; }
			public short strDoctorCode1 { get; set; }
			public short strDoctorCode2 { get; set; }
			public DateTime strNextVisitDt { get; set; }
			public DateTime strEntryDate { get; set; }

		}

	}
}