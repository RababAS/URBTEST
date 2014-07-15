using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OnlineOutPatientManagementSystem.ORM;
namespace OnlineOutPatientManagementSystem.BL.Classes
{


	public class LookUp
	{
		static OnLinePrescriptionDataContext oOnlinePresescriptionDataContext = new OnLinePrescriptionDataContext();
	   



		public static object GetRespondentStudyName()
		{

			return from study in oOnlinePresescriptionDataContext.lkp_StudyNames orderby study.StudyName select study;
		}


		public static object GetPatientRelation()
		{
			return from Relation in oOnlinePresescriptionDataContext.lkp_Relationships orderby Relation.RelationCode select Relation;
		}

		public static object GetDistrictList()
		{

			return from District in oOnlinePresescriptionDataContext.lkp_Districts
				   orderby District.DistrictName
				   select new { District.DistrictCode, District.DistrictName };
		}

		public static object GetThanaorUpZillaList(string pDistrictCode)
		{ 
		
		return from Thana in oOnlinePresescriptionDataContext.lkp_ThanaUpzillas
			   where Thana.DistrictCode == pDistrictCode
								  orderby Thana.ThanaName
								  select new { Thana.ThanaCode, Thana.ThanaName };
		}
		public static object GetUnionList(string pDistrictCode,string pThanaCode)
		{

			return from Union in oOnlinePresescriptionDataContext.lkp_Unions
				   orderby Union.UnionName
				   where Union.DistrictCode == pDistrictCode &&
						 Union.ThanaCode == pThanaCode
				   select
				   new { Union.UnionCode, Union.UnionName };
		
		}


		public static object GetVillageList(string pDistrictCode, string pThanaCode, string pUnionCode)
		{

			return from Village in oOnlinePresescriptionDataContext.lkp_Villages
				   orderby Village.VillageName
				   where Village.DistrictCode == pDistrictCode &&
						 Village.ThanaCode == pThanaCode &&
						 Village.UnionCode == pUnionCode
				   select new { Village.VillageCode, Village.VillageName };

		}

		public static object GetRegistrationDataForGrid()
		{

			return (from PBasic in oOnlinePresescriptionDataContext.PatientBasicInfos
					orderby PBasic.RegistrationDt
					select new
					{
						PBasic.PatientID,
						PBasic.RegistrationDt,
						PBasic.PatientName,
						PBasic.FatherName,
						PBasic.ContactNo
					}).Take(100);
		
		}


		//Added by shahed
		//Get Single PatientID
		public static object GetPatientID()
		{
			return from PID in oOnlinePresescriptionDataContext.PatientBasicInfos orderby PID.PatientID descending select PID;
		}

		//Get Patient Name
		public static object GetPatientName(string strPID)
		{
			//return from PName in oOnlinePresescriptionDataContext.PatientBasicInfos where PName.PatientName==strPID select PName;
			return from PName in oOnlinePresescriptionDataContext.PatientBasicInfos
				   where PName.PatientName == strPID
				   select new { PName.PatientName};
		}

		//Get ChiefComplainces*************
		public static object GetChiefComplainces()
		{
			return from Relation in oOnlinePresescriptionDataContext.lkp_ChiefComplainces
				   orderby Relation.CCCode
				   where Relation.CCGroup!=""
				   orderby Relation.CCGroup, Relation.CCCode
				   select new 
				   {
					   Relation.CCCode,
					   ChiefComplaince =Relation.CCGroup + " > " + Relation.CC
				   };
		}

		public string GetCustomerName(string strPID)
		{
			var results = from PName in oOnlinePresescriptionDataContext.PatientBasicInfos
			where PName.PatientID == strPID
			select (PName.PatientName);

			return results.FirstOrDefault();
		}

		

	}
}