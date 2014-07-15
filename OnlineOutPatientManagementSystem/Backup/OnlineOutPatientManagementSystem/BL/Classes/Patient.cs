using System.Linq;

namespace OnlineOutPatientManagementSystem.BL.Classes
{
	public class Patient
	{
		
		private ORM.OnLinePrescriptionDataContext oDataContext = new ORM.OnLinePrescriptionDataContext();
		
		public Patient() 
		{ 
		}
		
		public string Verify(ORM.PatientBasicInfo oPatient)
		{
			string sErrorInfo = string.Empty;
			

			//var tmpPat = from BasicInfo in oDataContext.PatientBasicInfos 
			//               let ConValue=(BasicInfo.NationalID==oPatient.NationalID) ? "Duplicate NID" : "Duplicate Parents" 
			//             where (BasicInfo.NationalID == oPatient.NationalID ) select
							 
			//                 new  { BasicInfo.PatientID,BasicInfo.PatientName,BasicInfo.NationalID,
			//                       VerfyField=ConValue};

			//if (tmpPat.Count() > 0)
			//{
			  
			//    sErrorInfo = BL.LocalResourse.ErrorMessages.DuplicateNID;
			//    return sErrorInfo;

			//}

			//Notes: oDataContext ORM SQL data object & oPatient from valu object
			//var varDupLicateFMName = from BasicInfo in oDataContext.PatientBasicInfos

			//            where (BasicInfo.Relationship==oPatient.Relationship &&
			//            BasicInfo.PatientName==oPatient.PatientName && 
			//            BasicInfo.FatherName==oPatient.FatherName)
			//              select new
			//              {
			//                  BasicInfo.PatientID,
			//                  BasicInfo.PatientName,
			//                  BasicInfo.NationalID
			//              };

			//if (varDupLicateFMName.Count() > 0 && oPatient.PatientType==3)
			//{
			//    sErrorInfo = BL.LocalResourse.ErrorMessages.InvalidInfo;
			//    return sErrorInfo;
			//}

			//Added by shahed: Regular
			var varRegAndStaff = from BasicInfo in oDataContext.PatientBasicInfos

								 where (BasicInfo.PatientType==oPatient.PatientType &&
						 BasicInfo.Relationship==oPatient.Relationship &&
						 BasicInfo.PatientName==oPatient.PatientName &&
						 BasicInfo.FatherName==oPatient.FatherName
						 )
						  select new
						  {
							  BasicInfo.PatientID,
							  BasicInfo.PatientName,
							  BasicInfo.NationalID
						  };

			if (varRegAndStaff.Count() > 0 && oPatient.PatientType!=2)
			{
				sErrorInfo = BL.LocalResourse.ErrorMessages.InvalidInfo;
				return sErrorInfo;
			}

			//Added by shahed: Respondant
			var varRespondant = from BasicInfo in oDataContext.PatientBasicInfos

							  where (BasicInfo.StudyName==oPatient.StudyName &&
							  BasicInfo.StudyID==oPatient.StudyID &&
							  BasicInfo.Relationship==oPatient.Relationship &&
							  BasicInfo.PatientName==oPatient.PatientName &&
							  BasicInfo.FatherName==oPatient.FatherName
						 )
						  select new
						  {
							  BasicInfo.PatientID,
							  BasicInfo.PatientName,
							  BasicInfo.NationalID
						  };

			if (varRespondant.Count() > 0 && oPatient.PatientType==2)
			{
				sErrorInfo = BL.LocalResourse.ErrorMessages.InvalidInfo;
				return sErrorInfo;
			}

			return sErrorInfo;
		}




		public bool Register(ORM.PatientBasicInfo oPatient)
		{
			oDataContext.PatientBasicInfos.InsertOnSubmit(oPatient);
			oDataContext.SubmitChanges();
			//oDataContext.PatientBasicInfos.su
			//check exception here
			return true;
		}


		public ORM.PatientBasicInfo GetPatientBasicInfo(string pPatientID)
		{
			return oDataContext.PatientBasicInfos.Single(P=>P.PatientID==pPatientID); 
		}
	}  
}