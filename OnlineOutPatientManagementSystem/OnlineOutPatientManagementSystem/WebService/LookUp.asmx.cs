using System.Linq;
using System.Web.Services;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Collections.Generic;
using AjaxControlToolkit;
using System.Configuration;
using System.Data.SqlClient;
using System;
using System.Collections.Specialized;




namespace OnlineOutPatientManagementSystem.WebService
{
	/// <summary>
	/// Summary description for LookUp
	/// </summary>
	[WebService(Namespace = "http://tempuri.org/")]
	[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
	[System.ComponentModel.ToolboxItem(false)]
	// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
	[System.Web.Script.Services.ScriptService]


	public class LookUp : System.Web.Services.WebService
	{
		[WebMethod]
		public string HelloWorld()
		{
			return "Hello World";
		}

		[WebMethod(EnableSession = true)]
		[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
		public object GetPatientInfo(string PatienID)
		{
			ORM.OnLinePrescriptionDataContext oOPresDataContext = new ORM.OnLinePrescriptionDataContext();
			oOPresDataContext.ObjectTrackingEnabled = false;
			 
			var PatientInfo = (from pid in oOPresDataContext.PatientBasicInfos
									  where pid.PatientID.Equals(PatienID)
									  select pid.PatientID).SingleOrDefault();
						 
			JavaScriptSerializer oJSS = new JavaScriptSerializer();
			return oJSS.Serialize(PatientInfo);
		}


		[WebMethod(EnableSession = true)]
		[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
		public object GetRespondentInfo(string StudyName,string RespondentID)
		{
			ORM.HEALSDataContext oHealsDataContext = new ORM.HEALSDataContext();
			oHealsDataContext.ObjectTrackingEnabled = false;
			var resInfo = from Respondents in oHealsDataContext.RespondentInfos
						   let value  =  Respondents.Status
						  where
							  Respondents.StudyName == StudyName &&
							  Respondents.RespondentID==RespondentID
						  select new
							  {ResID=Respondents.RespondentID,
								StudyName=Respondents.StudyName,
								ResName=Respondents.ResName,
								ResSex=Respondents.ResSex,
								ResReqDate=Respondents.RecruitmentDt,
								ResAge=Respondents.ResAge,
								ResFatherName=Respondents.FatherName,
								ResMotherName=Respondents.MotherName,
								ResSpouseName=Respondents.SpouseName,
								ResStatus=value 
							  };

			JavaScriptSerializer oJSS = new JavaScriptSerializer();
			return oJSS.Serialize(resInfo); 
		}



		[WebMethod(EnableSession = true)]
		[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
		public object GetStaffInfo(string StaffID)
		{
			ORM.OnLinePrescriptionDataContext oOPresDataContext = new ORM.OnLinePrescriptionDataContext();
			oOPresDataContext.ObjectTrackingEnabled = false;
			var staffInfo = from Staffs in oOPresDataContext.lkp_StaffInfos    
						  where
							  Staffs.StaffID== StaffID 
						  select new
						  {
								Staffs.StaffID,
								Staffs.StaffName,
								StaffDOB= Staffs.DateOfBirth,
								Staffs.StaffSex
							};

			JavaScriptSerializer oJSS = new JavaScriptSerializer();
			return oJSS.Serialize(staffInfo); ;
		}



		[WebMethod(EnableSession = true)]
		[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
		public object GetPatientBasicInfoById(string patientID)
		{
			ORM.OnLinePrescriptionDataContext oHealsDataContext = new ORM.OnLinePrescriptionDataContext();
			oHealsDataContext.ObjectTrackingEnabled = false;

			var resInfo = from Respondents in oHealsDataContext.lkp_StaffInfos

						  where
							  Respondents.StaffID == patientID
						  select new
						  {
							  ResID = Respondents.StaffID,
							  ResName = Respondents.StaffName,
							  ResSex = Respondents.StaffSex,
							  ResAge = Respondents.StaffAge
						  };

			JavaScriptSerializer oJSS = new JavaScriptSerializer();
			return oJSS.Serialize(resInfo);
		}


		//Added by shahed********************************************
		[WebMethod]
		public CascadingDropDownNameValue[] GetChiefComplaince(string knownCategoryValues, string category)
		{
			ORM.OnLinePrescriptionDataContext oOPresDataContext = new ORM.OnLinePrescriptionDataContext();
			oOPresDataContext.ObjectTrackingEnabled = false;

			IEnumerable<CascadingDropDownNameValue> vals = null;
			//short targetID = 0;
			ORM.lkp_ChiefComplaince olkp_ChiefComplaince = new ORM.lkp_ChiefComplaince();

			vals = (from ChiefCom in oOPresDataContext.lkp_ChiefComplainces
					where ChiefCom.CCGroup != null
					select new CascadingDropDownNameValue
					{
						name = ChiefCom.CCDesc,
						value = ChiefCom.CCCode.ToString(),
					}).OrderBy(t => t.name);
			return vals.ToArray<CascadingDropDownNameValue>(); 
		}


		[WebMethod(EnableSession = true)]
		[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
		public static string GetChiefComplaince2()
		{
			ORM.OnLinePrescriptionDataContext oOPresDataContext = new ORM.OnLinePrescriptionDataContext();
			oOPresDataContext.ObjectTrackingEnabled = false;

			var ChiefComp = (from ChiefCom in oOPresDataContext.lkp_ChiefComplainces
					where ChiefCom.CCGroup != null
					select new CascadingDropDownNameValue
					{
						name = ChiefCom.CCDesc,
						value = ChiefCom.CCCode.ToString(),
					}).OrderBy(t => t.name);

			JavaScriptSerializer oJSS = new JavaScriptSerializer();
			return oJSS.Serialize(ChiefComp);
		}


		[WebMethod]
		public CascadingDropDownNameValue[] GetPatientRelation(string knownCategoryValues, string category)
		{
			ORM.OnLinePrescriptionDataContext oOPresDataContext = new ORM.OnLinePrescriptionDataContext();
			oOPresDataContext.ObjectTrackingEnabled = false;

			IEnumerable<CascadingDropDownNameValue> vals = null;
			vals = (from Relationships in oOPresDataContext.lkp_Relationships
					select new CascadingDropDownNameValue
					{
						name = Relationships.RelDesc,
						value = Relationships.RelCode.ToString(),
					}).OrderBy(t => t.name);
			return vals.ToArray<CascadingDropDownNameValue>();
		}

		[WebMethod]
		public CascadingDropDownNameValue[] GetProvisionalDx(string knownCategoryValues, string category)
		{
			ORM.OnLinePrescriptionDataContext oOPresDataContext = new ORM.OnLinePrescriptionDataContext();
			oOPresDataContext.ObjectTrackingEnabled = false;

			IEnumerable<CascadingDropDownNameValue> vals = null;
			vals = (from Relationships in oOPresDataContext.lkp_ProvisionalDxes
					select new CascadingDropDownNameValue
					{
						name = Relationships.PDDesc,
						value = Relationships.PDCode.ToString(),
					}).OrderBy(t => t.name);
			return vals.ToArray<CascadingDropDownNameValue>();
		}


		[WebMethod]
		public CascadingDropDownNameValue[] GetMedicineName(string knownCategoryValues, string category)
		{
			ORM.OnLinePrescriptionDataContext oOPresDataContext = new ORM.OnLinePrescriptionDataContext();
			oOPresDataContext.ObjectTrackingEnabled = false;

			IEnumerable<CascadingDropDownNameValue> vals = null;
			vals = (from Relationships in oOPresDataContext.lkp_MedicineNames
					select new CascadingDropDownNameValue
					{
						name = Relationships.TradeName,
						value = Relationships.MCCode.ToString(),
					}).OrderBy(t => t.name);
			return vals.ToArray<CascadingDropDownNameValue>();
		}

		[WebMethod]
		public CascadingDropDownNameValue[] GetFrequency(string knownCategoryValues, string category)
		{
			ORM.OnLinePrescriptionDataContext oOPresDataContext = new ORM.OnLinePrescriptionDataContext();
			oOPresDataContext.ObjectTrackingEnabled = false;

			IEnumerable<CascadingDropDownNameValue> vals = null;
			vals = (from Relationships in oOPresDataContext.lkp_Frequencies
					select new CascadingDropDownNameValue
					{
						name = Relationships.FreDesc,
						value = Relationships.FreCode.ToString(),
					}).OrderBy(t => t.name);
			return vals.ToArray<CascadingDropDownNameValue>();
		}


		[WebMethod]
		public CascadingDropDownNameValue[] GetTreatment(string knownCategoryValues, string category)
		{
			ORM.OnLinePrescriptionDataContext oOPresDataContext = new ORM.OnLinePrescriptionDataContext();
			oOPresDataContext.ObjectTrackingEnabled = false;

			IEnumerable<CascadingDropDownNameValue> vals = null;
			vals = (from Relationships in oOPresDataContext.lkp_Treatments
					select new CascadingDropDownNameValue
					{
						name = Relationships.TreDesc,
						value = Relationships.TreCode.ToString(),
					}).OrderBy(t => t.name);
			return vals.ToArray<CascadingDropDownNameValue>();
		}

		[WebMethod]
		public CascadingDropDownNameValue[] GetInvestigation(string knownCategoryValues, string category)
		{
			ORM.OnLinePrescriptionDataContext oOPresDataContext = new ORM.OnLinePrescriptionDataContext();
			oOPresDataContext.ObjectTrackingEnabled = false;

			IEnumerable<CascadingDropDownNameValue> vals = null;
			vals = (from Relationships in oOPresDataContext.lkp_Investigations
					select new CascadingDropDownNameValue
					{
						name = Relationships.InvDesc,
						value = Relationships.InvCode.ToString(),
					}).OrderBy(t => t.name);
			return vals.ToArray<CascadingDropDownNameValue>();
		}


		[WebMethod]
		public CascadingDropDownNameValue[] GetPostiveFindings(string knownCategoryValues, string category)
		{
			ORM.OnLinePrescriptionDataContext oOPresDataContext = new ORM.OnLinePrescriptionDataContext();
			oOPresDataContext.ObjectTrackingEnabled = false;

			IEnumerable<CascadingDropDownNameValue> vals = null;
			vals = (from Relationships in oOPresDataContext.lkp_PositiveFindings
					select new CascadingDropDownNameValue
					{
						name = Relationships.PFDesc,
						value = Relationships.PFCode.ToString(),
					}).OrderBy(t => t.name);
			return vals.ToArray<CascadingDropDownNameValue>();
		}

		[WebMethod]
		public CascadingDropDownNameValue[] GetNegativeFindings(string knownCategoryValues, string category)
		{
			ORM.OnLinePrescriptionDataContext oOPresDataContext = new ORM.OnLinePrescriptionDataContext();
			oOPresDataContext.ObjectTrackingEnabled = false;

			IEnumerable<CascadingDropDownNameValue> vals = null;
			vals = (from Relationships in oOPresDataContext.lkp_NegativeFindings
					select new CascadingDropDownNameValue
					{
						name = Relationships.NFDesc,
						value = Relationships.NFCode.ToString(),
					}).OrderBy(t => t.name);
			return vals.ToArray<CascadingDropDownNameValue>();
		}


		[WebMethod]
		public CascadingDropDownNameValue[] GetDentalSign(string knownCategoryValues, string category)
		{
			ORM.OnLinePrescriptionDataContext oOPresDataContext = new ORM.OnLinePrescriptionDataContext();
			oOPresDataContext.ObjectTrackingEnabled = false;

			IEnumerable<CascadingDropDownNameValue> vals = null;
			vals = (from Relationships in oOPresDataContext.lkp_DentalSigns
					select new CascadingDropDownNameValue
					{
						name = Relationships.DSDesc,
						value = Relationships.DSCode.ToString(),
					}).OrderBy(t => t.name);
			return vals.ToArray<CascadingDropDownNameValue>();
		}

		[WebMethod]
		public CascadingDropDownNameValue[] GetDentalAdvice(string knownCategoryValues, string category)
		{
			ORM.OnLinePrescriptionDataContext oOPresDataContext = new ORM.OnLinePrescriptionDataContext();
			oOPresDataContext.ObjectTrackingEnabled = false;

			IEnumerable<CascadingDropDownNameValue> vals = null;
			vals = (from Relationships in oOPresDataContext.lkp_DentalAdvices
					select new CascadingDropDownNameValue
					{
						name = Relationships.DADesc,
						value = Relationships.DACode.ToString(),
					}).OrderBy(t => t.name);
			return vals.ToArray<CascadingDropDownNameValue>();
		}

		[WebMethod]
		public CascadingDropDownNameValue[] GetAdvice(string knownCategoryValues, string category)
		{
			ORM.OnLinePrescriptionDataContext oOPresDataContext = new ORM.OnLinePrescriptionDataContext();
			oOPresDataContext.ObjectTrackingEnabled = false;

			IEnumerable<CascadingDropDownNameValue> vals = null;
			vals = (from Relationships in oOPresDataContext.lkp_AdviceBanglas
					select new CascadingDropDownNameValue
					{
						name = Relationships.ABDesc,
						value = Relationships.ABCode.ToString(),
					}).OrderBy(t => t.name);
			return vals.ToArray<CascadingDropDownNameValue>();
		}

		[WebMethod]
		public CascadingDropDownNameValue[] GetDoctorsName(string knownCategoryValues, string category)
		{
			ORM.OnLinePrescriptionDataContext oOPresDataContext = new ORM.OnLinePrescriptionDataContext();
			oOPresDataContext.ObjectTrackingEnabled = false;

			IEnumerable<CascadingDropDownNameValue> vals = null;
			vals = (from Relationships in oOPresDataContext.lkp_DoctorsNames
					where Relationships.Status==true
					select new CascadingDropDownNameValue
					{
						name = Relationships.DoctorName,
						value = Relationships.DNCode.ToString(),
					}).OrderBy(t => t.name);
			return vals.ToArray<CascadingDropDownNameValue>();
		}

		[WebMethod]
		public CascadingDropDownNameValue[] GetReffered(string knownCategoryValues, string category)
		{
			ORM.OnLinePrescriptionDataContext oOPresDataContext = new ORM.OnLinePrescriptionDataContext();
			oOPresDataContext.ObjectTrackingEnabled = false;

			IEnumerable<CascadingDropDownNameValue> vals = null;
			vals = (from Relationships in oOPresDataContext.lkp_Reffereds
					select new CascadingDropDownNameValue
					{
						name = Relationships.RefDesc,
						value = Relationships.RefCode.ToString(),
					}).OrderBy(t => t.name);
			return vals.ToArray<CascadingDropDownNameValue>();
		}


		[WebMethod]
		public CascadingDropDownNameValue[] GetDistrictList()
		{
			ORM.OnLinePrescriptionDataContext oOPresDataContext = new ORM.OnLinePrescriptionDataContext();
			//oOPresDataContext.ObjectTrackingEnabled = false;

			IEnumerable<CascadingDropDownNameValue> vals = null;
			vals = (from AreaD in oOPresDataContext.lkp_AreaDetails.Distinct()
					select new CascadingDropDownNameValue
					{
						name = AreaD.DistName,
						value = AreaD.DistCode.ToString()
					}).Distinct().OrderBy(t => t.name);
			return vals.ToArray<CascadingDropDownNameValue>();
		}


		[WebMethod]
		public CascadingDropDownNameValue[] GetThanaorUpZillaList(string knownCategoryValues, string category)
		{
			ORM.OnLinePrescriptionDataContext oOPresDataContext = new ORM.OnLinePrescriptionDataContext();
			//oOPresDataContext.ObjectTrackingEnabled = false;

			StringDictionary kv = CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
			string varCat;
			varCat = kv["DistCode"];

			IEnumerable<CascadingDropDownNameValue> vals = null;
			vals = (from AreaD in oOPresDataContext.lkp_AreaDetails.Distinct()
					where (AreaD.DistCode == varCat)
					select new CascadingDropDownNameValue
					{
						name = AreaD.ThanaName,
						value = AreaD.ThanaCode.ToString()
					}).Distinct().OrderBy(t => t.name);
			return vals.ToArray<CascadingDropDownNameValue>();
		}


	[WebMethod]
    public CascadingDropDownNameValue[] GetThanaorUpZillaList2(string knownCategoryValues, string category)
    {
		StringDictionary kv = CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
		string varCat;
		varCat = kv["DistCode"];
		List<CascadingDropDownNameValue> Values = new List<CascadingDropDownNameValue>();


		StringDictionary kv2 = CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
		string varDivCode;
		varDivCode = kv["DivCode"];

        using (ORM.OnLinePrescriptionDataContext oOnLinePrescriptionDataContext = new ORM.OnLinePrescriptionDataContext())
        {
            var AreaQuery = from AreaD in oOnLinePrescriptionDataContext.lkp_AreaDetails
							where (AreaD.DivCode == varDivCode && AreaD.DistCode == varCat)
                        select new {  
							AreaD.ThanaCode, 
							AreaD.ThanaName  
						}
                        into AreaResult
                        select AreaResult;


                foreach (var AreaResult in AreaQuery)
                    {
						string ID = AreaResult.ThanaCode;
						string Name = AreaResult.ThanaName;
                        Values.Add(new CascadingDropDownNameValue(Name, Convert.ToString(ID)));
                    }
                    //return Values.ToArray();
			return Values.ToArray<CascadingDropDownNameValue>();
            }
        }



	[WebMethod]
	public CascadingDropDownNameValue[] GetDoctorNameList()
	{
		ORM.OnLinePrescriptionDataContext oOPresDataContext = new ORM.OnLinePrescriptionDataContext();
		//oOPresDataContext.ObjectTrackingEnabled = false;

		IEnumerable<CascadingDropDownNameValue> vals = null;
		vals = (from DName in oOPresDataContext.lkp_DoctorsNames
				select new CascadingDropDownNameValue
				{
					name = DName.DoctorName,
					value = DName.DNCode.ToString()
				}).Distinct().OrderBy(t => t.name);
		return vals.ToArray<CascadingDropDownNameValue>();
	}



	[WebMethod]
	public CascadingDropDownNameValue[] GetDoctorFee(string knownCategoryValues, string category)
	{
		ORM.OnLinePrescriptionDataContext oOPresDataContext = new ORM.OnLinePrescriptionDataContext();
		//oOPresDataContext.ObjectTrackingEnabled = false;

		StringDictionary kv = CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
		short varCat;
		varCat = Convert.ToSByte(kv["DNCode"]);


		IEnumerable<CascadingDropDownNameValue> vals = null;
		vals = (from AreaD in oOPresDataContext.lkp_DoctorsNames
				where (AreaD.DNCode == varCat)
				select new CascadingDropDownNameValue
				{
					name =  AreaD.DoctorFee.ToString(),
					value = AreaD.DNCode.ToString()
				});
		return vals.ToArray<CascadingDropDownNameValue>();
	}



	[WebMethod]
	public CascadingDropDownNameValue[] GetReferredList()
	{
		ORM.OnLinePrescriptionDataContext oOPresDataContext = new ORM.OnLinePrescriptionDataContext();
		//oOPresDataContext.ObjectTrackingEnabled = false;

		IEnumerable<CascadingDropDownNameValue> vals = null;
		vals = (from Rfd in oOPresDataContext.lkp_Reffereds
				select new CascadingDropDownNameValue
				{
					name = Rfd.RefDesc,
					value = Rfd.RefCode.ToString()
				}).Distinct().OrderBy(t => t.name);
		return vals.ToArray<CascadingDropDownNameValue>();
	}


	[WebMethod]
	public CascadingDropDownNameValue[] GetDrugAllergyList()
	{
		ORM.OnLinePrescriptionDataContext oOPresDataContext = new ORM.OnLinePrescriptionDataContext();
		//oOPresDataContext.ObjectTrackingEnabled = false;

		IEnumerable<CascadingDropDownNameValue> vals = null;
		vals = (from Mname in oOPresDataContext.lkp_MedicineNames
				select new CascadingDropDownNameValue
				{
					name = Mname.TradeName,
					value = Mname.MNCode.ToString()
				}).Distinct().OrderBy(t => t.name);
		return vals.ToArray<CascadingDropDownNameValue>();
	}




		//[WebMethod]
		//[ScriptMethod]
		//public static void SavePrescriptions(OnlineOutPatientManagementSystem.UI.Prescription.clsDataTypes.PrescriptionGenDataInfo oPrescriptionGenDataInfo)
		//{
			//ORM.OnLinePrescriptionDataContext oOPresDataContext = new ORM.OnLinePrescriptionDataContext();
			//ORM.ClinicVisitHistory oClinicVisitHistory = new ORM.ClinicVisitHistory();

			////Basic Infp************************************
			////int intMaxClnVisutId = oOPresDataContext.ClinicVisitHistories.Max(u => u.ClinicVisitID) + 1;

			//oClinicVisitHistory.VisitID = oOPresDataContext.ClinicVisitHistories.Max(u => u.VisitID) + 1;
			//oClinicVisitHistory.VisitDate = DateTime.Now;

			//oClinicVisitHistory.PatientID = oPrescriptionGenDataInfo.strPatientID;
			//oClinicVisitHistory.RelCode = oPrescriptionGenDataInfo.strRelations;

			//oClinicVisitHistory.PatientAgeYY = oPrescriptionGenDataInfo.strPatientAgeYY;
			//oClinicVisitHistory.PatientAgeMM = oPrescriptionGenDataInfo.strPatientAgeMM;
			//oClinicVisitHistory.PatientAgeDD = oPrescriptionGenDataInfo.strPatientAgeDD;

			//oClinicVisitHistory.DrugHistory = oPrescriptionGenDataInfo.strDrugHistory;

			//oClinicVisitHistory.DrugAllergy = oPrescriptionGenDataInfo.strDrugAllergy;
	
			////On examinatin Info****************************** 
			//oClinicVisitHistory.ExaAnemia = oPrescriptionGenDataInfo.strExaAnemia;
			//oClinicVisitHistory.ExaJaundice = oPrescriptionGenDataInfo.strExaJaundice;
			//oClinicVisitHistory.ExaClubbing = oPrescriptionGenDataInfo.strExaClubbing;
			//oClinicVisitHistory.ExaOedema = oPrescriptionGenDataInfo.strExaOdema;
			//oClinicVisitHistory.ExaL_N = oPrescriptionGenDataInfo.strExaL_N;

			//oClinicVisitHistory.ExaHeart = oPrescriptionGenDataInfo.strExaHeart;
			//oClinicVisitHistory.ExaLung = oPrescriptionGenDataInfo.strExaLung;
			//oClinicVisitHistory.ExaLiver = oPrescriptionGenDataInfo.strExaLiver;
			//oClinicVisitHistory.ExaSpleen = oPrescriptionGenDataInfo.strExaSpleen;
			//oClinicVisitHistory.ExaOthers = oPrescriptionGenDataInfo.strExaOthers;

			////Blood Pressure
			//oClinicVisitHistory.ExaSystolic = oPrescriptionGenDataInfo.strExaSystolic;
			//oClinicVisitHistory.ExaDiastolic = oPrescriptionGenDataInfo.strExaDiastolic;


			//oClinicVisitHistory.ExaSystolic = oPrescriptionGenDataInfo.strExaSystolic;
			//oClinicVisitHistory.ExaDiastolic = oPrescriptionGenDataInfo.strExaDiastolic;
			//oClinicVisitHistory.ExaPulse = oPrescriptionGenDataInfo.strExaPulse;
			//oClinicVisitHistory.ExaTemp = oPrescriptionGenDataInfo.strExaTemp;
			//oClinicVisitHistory.ExaWt = oPrescriptionGenDataInfo.strExaWt;


			//oClinicVisitHistory.ExaVulva = oPrescriptionGenDataInfo.strExaVulva;
			//oClinicVisitHistory.ExaVagina = oPrescriptionGenDataInfo.strExaVagina;
			//oClinicVisitHistory.ExaOS = oPrescriptionGenDataInfo.strExaOS;
			//oClinicVisitHistory.ExaCervix = oPrescriptionGenDataInfo.strExaCervix;



			////Other data
			//oClinicVisitHistory.ReferredCode = oPrescriptionGenDataInfo.strReferredCode;
			////oClinicVisitHistory.Referred = oPrescriptionGenDataInfo.strReferred;
			//oClinicVisitHistory.DoctorCode1 = oPrescriptionGenDataInfo.strDoctorCode1;

			////oPrescriptionGenDataInfo.strDoctorCode2;
			//oClinicVisitHistory.DoctorCode2 = null;

			//oClinicVisitHistory.NextVisitDt = null;
			//oClinicVisitHistory.EntryDate = DateTime.Now;

			////Adds an entity in a pending insert state to this System.Data.Linq.Table<TEntity>and parameter is the entity which to be added
			//oOPresDataContext.ClinicVisitHistories.InsertOnSubmit(oClinicVisitHistory);
			//// executes the appropriate commands to implement the changes to the database
			//oOPresDataContext.SubmitChanges();
		//}




	}
}
