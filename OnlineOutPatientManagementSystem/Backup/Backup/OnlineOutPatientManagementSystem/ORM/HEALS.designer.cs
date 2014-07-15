﻿#pragma warning disable 1591
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.18408
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace OnlineOutPatientManagementSystem.ORM
{
	using System.Data.Linq;
	using System.Data.Linq.Mapping;
	using System.Data;
	using System.Collections.Generic;
	using System.Reflection;
	using System.Linq;
	using System.Linq.Expressions;
	using System.ComponentModel;
	using System;
	
	
	[global::System.Data.Linq.Mapping.DatabaseAttribute(Name="HEALS")]
	public partial class HEALSDataContext : System.Data.Linq.DataContext
	{
		
		private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
		
	#region Extensibility Method Definitions
	partial void OnCreated();
	partial void InsertRespondentInfo(RespondentInfo instance);
	partial void UpdateRespondentInfo(RespondentInfo instance);
	partial void DeleteRespondentInfo(RespondentInfo instance);
	#endregion
		
		public HEALSDataContext() : 
				base(global::System.Configuration.ConfigurationManager.ConnectionStrings["HEALSConnectionString1"].ConnectionString, mappingSource)
		{
			OnCreated();
		}
		
		public HEALSDataContext(string connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public HEALSDataContext(System.Data.IDbConnection connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public HEALSDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public HEALSDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public System.Data.Linq.Table<RespondentInfo> RespondentInfos
		{
			get
			{
				return this.GetTable<RespondentInfo>();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.RespondentInfo")]
	public partial class RespondentInfo : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private string _RespondentID;
		
		private string _StudyName;
		
		private string _ResName;
		
		private string _SpouseID;
		
		private string _SpouseName;
		
		private string _FatherName;
		
		private string _MotherName;
		
		private string _MotherID;
		
		private string _F_H_Sp_Name;
		
		private System.Nullable<int> _ResAge;
		
		private System.Nullable<int> _CurAge;
		
		private System.Nullable<System.DateTime> _RecruitmentDt;
		
		private System.Nullable<int> _ResSex;
		
		private System.Nullable<int> _VillageCode;
		
		private System.Nullable<int> _ParaCode;
		
		private string _ParaName;
		
		private string _VillageName;
		
		private string _Status;
		
		private System.Nullable<System.DateTime> _DateOfDeath;
		
		private string _ResID_StudyName;
		
		private string _BESTID;
		
		private System.Nullable<int> _DoctorID;
		
		private System.Nullable<int> _OperatorID;
		
		private System.Nullable<System.DateTime> _InterviewDate;
		
		private string _NationalID;
		
		private string _MobileNo;
		
		private System.Nullable<double> _GPS_LAT;
		
		private System.Nullable<double> _GPS_LONG;
		
		private bool _Eligibility;
		
		private System.Nullable<int> _InterviewerID;
		
		private System.Nullable<System.DateTime> _LastUpdateDate;
		
		private System.Nullable<int> _VHWCode;
		
		private string _DistName;
		
		private string _ThanaName;
		
		private string _FixUnion;
		
	#region Extensibility Method Definitions
	partial void OnLoaded();
	partial void OnValidate(System.Data.Linq.ChangeAction action);
	partial void OnCreated();
	partial void OnRespondentIDChanging(string value);
	partial void OnRespondentIDChanged();
	partial void OnStudyNameChanging(string value);
	partial void OnStudyNameChanged();
	partial void OnResNameChanging(string value);
	partial void OnResNameChanged();
	partial void OnSpouseIDChanging(string value);
	partial void OnSpouseIDChanged();
	partial void OnSpouseNameChanging(string value);
	partial void OnSpouseNameChanged();
	partial void OnFatherNameChanging(string value);
	partial void OnFatherNameChanged();
	partial void OnMotherNameChanging(string value);
	partial void OnMotherNameChanged();
	partial void OnMotherIDChanging(string value);
	partial void OnMotherIDChanged();
	partial void OnF_H_Sp_NameChanging(string value);
	partial void OnF_H_Sp_NameChanged();
	partial void OnResAgeChanging(System.Nullable<int> value);
	partial void OnResAgeChanged();
	partial void OnCurAgeChanging(System.Nullable<int> value);
	partial void OnCurAgeChanged();
	partial void OnRecruitmentDtChanging(System.Nullable<System.DateTime> value);
	partial void OnRecruitmentDtChanged();
	partial void OnResSexChanging(System.Nullable<int> value);
	partial void OnResSexChanged();
	partial void OnVillageCodeChanging(System.Nullable<int> value);
	partial void OnVillageCodeChanged();
	partial void OnParaCodeChanging(System.Nullable<int> value);
	partial void OnParaCodeChanged();
	partial void OnParaNameChanging(string value);
	partial void OnParaNameChanged();
	partial void OnVillageNameChanging(string value);
	partial void OnVillageNameChanged();
	partial void OnStatusChanging(string value);
	partial void OnStatusChanged();
	partial void OnDateOfDeathChanging(System.Nullable<System.DateTime> value);
	partial void OnDateOfDeathChanged();
	partial void OnResID_StudyNameChanging(string value);
	partial void OnResID_StudyNameChanged();
	partial void OnBESTIDChanging(string value);
	partial void OnBESTIDChanged();
	partial void OnDoctorIDChanging(System.Nullable<int> value);
	partial void OnDoctorIDChanged();
	partial void OnOperatorIDChanging(System.Nullable<int> value);
	partial void OnOperatorIDChanged();
	partial void OnInterviewDateChanging(System.Nullable<System.DateTime> value);
	partial void OnInterviewDateChanged();
	partial void OnNationalIDChanging(string value);
	partial void OnNationalIDChanged();
	partial void OnMobileNoChanging(string value);
	partial void OnMobileNoChanged();
	partial void OnGPS_LATChanging(System.Nullable<double> value);
	partial void OnGPS_LATChanged();
	partial void OnGPS_LONGChanging(System.Nullable<double> value);
	partial void OnGPS_LONGChanged();
	partial void OnEligibilityChanging(bool value);
	partial void OnEligibilityChanged();
	partial void OnInterviewerIDChanging(System.Nullable<int> value);
	partial void OnInterviewerIDChanged();
	partial void OnLastUpdateDateChanging(System.Nullable<System.DateTime> value);
	partial void OnLastUpdateDateChanged();
	partial void OnVHWCodeChanging(System.Nullable<int> value);
	partial void OnVHWCodeChanged();
	partial void OnDistNameChanging(string value);
	partial void OnDistNameChanged();
	partial void OnThanaNameChanging(string value);
	partial void OnThanaNameChanged();
	partial void OnFixUnionChanging(string value);
	partial void OnFixUnionChanged();
	#endregion
		
		public RespondentInfo()
		{
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_RespondentID", DbType="NVarChar(6) NOT NULL", CanBeNull=false, IsPrimaryKey=true)]
		public string RespondentID
		{
			get
			{
				return this._RespondentID;
			}
			set
			{
				if ((this._RespondentID != value))
				{
					this.OnRespondentIDChanging(value);
					this.SendPropertyChanging();
					this._RespondentID = value;
					this.SendPropertyChanged("RespondentID");
					this.OnRespondentIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_StudyName", DbType="NVarChar(20) NOT NULL", CanBeNull=false, IsPrimaryKey=true)]
		public string StudyName
		{
			get
			{
				return this._StudyName;
			}
			set
			{
				if ((this._StudyName != value))
				{
					this.OnStudyNameChanging(value);
					this.SendPropertyChanging();
					this._StudyName = value;
					this.SendPropertyChanged("StudyName");
					this.OnStudyNameChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ResName", DbType="NVarChar(50)")]
		public string ResName
		{
			get
			{
				return this._ResName;
			}
			set
			{
				if ((this._ResName != value))
				{
					this.OnResNameChanging(value);
					this.SendPropertyChanging();
					this._ResName = value;
					this.SendPropertyChanged("ResName");
					this.OnResNameChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_SpouseID", DbType="NVarChar(6)")]
		public string SpouseID
		{
			get
			{
				return this._SpouseID;
			}
			set
			{
				if ((this._SpouseID != value))
				{
					this.OnSpouseIDChanging(value);
					this.SendPropertyChanging();
					this._SpouseID = value;
					this.SendPropertyChanged("SpouseID");
					this.OnSpouseIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_SpouseName", DbType="NVarChar(50)")]
		public string SpouseName
		{
			get
			{
				return this._SpouseName;
			}
			set
			{
				if ((this._SpouseName != value))
				{
					this.OnSpouseNameChanging(value);
					this.SendPropertyChanging();
					this._SpouseName = value;
					this.SendPropertyChanged("SpouseName");
					this.OnSpouseNameChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_FatherName", DbType="NVarChar(50)")]
		public string FatherName
		{
			get
			{
				return this._FatherName;
			}
			set
			{
				if ((this._FatherName != value))
				{
					this.OnFatherNameChanging(value);
					this.SendPropertyChanging();
					this._FatherName = value;
					this.SendPropertyChanged("FatherName");
					this.OnFatherNameChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_MotherName", DbType="NVarChar(50)")]
		public string MotherName
		{
			get
			{
				return this._MotherName;
			}
			set
			{
				if ((this._MotherName != value))
				{
					this.OnMotherNameChanging(value);
					this.SendPropertyChanging();
					this._MotherName = value;
					this.SendPropertyChanged("MotherName");
					this.OnMotherNameChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_MotherID", DbType="NVarChar(6)")]
		public string MotherID
		{
			get
			{
				return this._MotherID;
			}
			set
			{
				if ((this._MotherID != value))
				{
					this.OnMotherIDChanging(value);
					this.SendPropertyChanging();
					this._MotherID = value;
					this.SendPropertyChanged("MotherID");
					this.OnMotherIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_F_H_Sp_Name", DbType="NVarChar(50)")]
		public string F_H_Sp_Name
		{
			get
			{
				return this._F_H_Sp_Name;
			}
			set
			{
				if ((this._F_H_Sp_Name != value))
				{
					this.OnF_H_Sp_NameChanging(value);
					this.SendPropertyChanging();
					this._F_H_Sp_Name = value;
					this.SendPropertyChanged("F_H_Sp_Name");
					this.OnF_H_Sp_NameChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ResAge", DbType="Int")]
		public System.Nullable<int> ResAge
		{
			get
			{
				return this._ResAge;
			}
			set
			{
				if ((this._ResAge != value))
				{
					this.OnResAgeChanging(value);
					this.SendPropertyChanging();
					this._ResAge = value;
					this.SendPropertyChanged("ResAge");
					this.OnResAgeChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_CurAge", DbType="Int")]
		public System.Nullable<int> CurAge
		{
			get
			{
				return this._CurAge;
			}
			set
			{
				if ((this._CurAge != value))
				{
					this.OnCurAgeChanging(value);
					this.SendPropertyChanging();
					this._CurAge = value;
					this.SendPropertyChanged("CurAge");
					this.OnCurAgeChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_RecruitmentDt", DbType="DateTime")]
		public System.Nullable<System.DateTime> RecruitmentDt
		{
			get
			{
				return this._RecruitmentDt;
			}
			set
			{
				if ((this._RecruitmentDt != value))
				{
					this.OnRecruitmentDtChanging(value);
					this.SendPropertyChanging();
					this._RecruitmentDt = value;
					this.SendPropertyChanged("RecruitmentDt");
					this.OnRecruitmentDtChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ResSex", DbType="Int")]
		public System.Nullable<int> ResSex
		{
			get
			{
				return this._ResSex;
			}
			set
			{
				if ((this._ResSex != value))
				{
					this.OnResSexChanging(value);
					this.SendPropertyChanging();
					this._ResSex = value;
					this.SendPropertyChanged("ResSex");
					this.OnResSexChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_VillageCode", DbType="Int")]
		public System.Nullable<int> VillageCode
		{
			get
			{
				return this._VillageCode;
			}
			set
			{
				if ((this._VillageCode != value))
				{
					this.OnVillageCodeChanging(value);
					this.SendPropertyChanging();
					this._VillageCode = value;
					this.SendPropertyChanged("VillageCode");
					this.OnVillageCodeChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ParaCode", DbType="Int")]
		public System.Nullable<int> ParaCode
		{
			get
			{
				return this._ParaCode;
			}
			set
			{
				if ((this._ParaCode != value))
				{
					this.OnParaCodeChanging(value);
					this.SendPropertyChanging();
					this._ParaCode = value;
					this.SendPropertyChanged("ParaCode");
					this.OnParaCodeChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ParaName", DbType="NVarChar(50)")]
		public string ParaName
		{
			get
			{
				return this._ParaName;
			}
			set
			{
				if ((this._ParaName != value))
				{
					this.OnParaNameChanging(value);
					this.SendPropertyChanging();
					this._ParaName = value;
					this.SendPropertyChanged("ParaName");
					this.OnParaNameChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_VillageName", DbType="NVarChar(50)")]
		public string VillageName
		{
			get
			{
				return this._VillageName;
			}
			set
			{
				if ((this._VillageName != value))
				{
					this.OnVillageNameChanging(value);
					this.SendPropertyChanging();
					this._VillageName = value;
					this.SendPropertyChanged("VillageName");
					this.OnVillageNameChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Status", DbType="NVarChar(50)")]
		public string Status
		{
			get
			{
				return this._Status;
			}
			set
			{
				if ((this._Status != value))
				{
					this.OnStatusChanging(value);
					this.SendPropertyChanging();
					this._Status = value;
					this.SendPropertyChanged("Status");
					this.OnStatusChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_DateOfDeath", DbType="DateTime")]
		public System.Nullable<System.DateTime> DateOfDeath
		{
			get
			{
				return this._DateOfDeath;
			}
			set
			{
				if ((this._DateOfDeath != value))
				{
					this.OnDateOfDeathChanging(value);
					this.SendPropertyChanging();
					this._DateOfDeath = value;
					this.SendPropertyChanged("DateOfDeath");
					this.OnDateOfDeathChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ResID_StudyName", DbType="NVarChar(20)")]
		public string ResID_StudyName
		{
			get
			{
				return this._ResID_StudyName;
			}
			set
			{
				if ((this._ResID_StudyName != value))
				{
					this.OnResID_StudyNameChanging(value);
					this.SendPropertyChanging();
					this._ResID_StudyName = value;
					this.SendPropertyChanged("ResID_StudyName");
					this.OnResID_StudyNameChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_BESTID", DbType="NVarChar(6)")]
		public string BESTID
		{
			get
			{
				return this._BESTID;
			}
			set
			{
				if ((this._BESTID != value))
				{
					this.OnBESTIDChanging(value);
					this.SendPropertyChanging();
					this._BESTID = value;
					this.SendPropertyChanged("BESTID");
					this.OnBESTIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_DoctorID", DbType="Int")]
		public System.Nullable<int> DoctorID
		{
			get
			{
				return this._DoctorID;
			}
			set
			{
				if ((this._DoctorID != value))
				{
					this.OnDoctorIDChanging(value);
					this.SendPropertyChanging();
					this._DoctorID = value;
					this.SendPropertyChanged("DoctorID");
					this.OnDoctorIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_OperatorID", DbType="Int")]
		public System.Nullable<int> OperatorID
		{
			get
			{
				return this._OperatorID;
			}
			set
			{
				if ((this._OperatorID != value))
				{
					this.OnOperatorIDChanging(value);
					this.SendPropertyChanging();
					this._OperatorID = value;
					this.SendPropertyChanged("OperatorID");
					this.OnOperatorIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_InterviewDate", DbType="DateTime")]
		public System.Nullable<System.DateTime> InterviewDate
		{
			get
			{
				return this._InterviewDate;
			}
			set
			{
				if ((this._InterviewDate != value))
				{
					this.OnInterviewDateChanging(value);
					this.SendPropertyChanging();
					this._InterviewDate = value;
					this.SendPropertyChanged("InterviewDate");
					this.OnInterviewDateChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_NationalID", DbType="NVarChar(17)")]
		public string NationalID
		{
			get
			{
				return this._NationalID;
			}
			set
			{
				if ((this._NationalID != value))
				{
					this.OnNationalIDChanging(value);
					this.SendPropertyChanging();
					this._NationalID = value;
					this.SendPropertyChanged("NationalID");
					this.OnNationalIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_MobileNo", DbType="NVarChar(11)")]
		public string MobileNo
		{
			get
			{
				return this._MobileNo;
			}
			set
			{
				if ((this._MobileNo != value))
				{
					this.OnMobileNoChanging(value);
					this.SendPropertyChanging();
					this._MobileNo = value;
					this.SendPropertyChanged("MobileNo");
					this.OnMobileNoChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_GPS_LAT", DbType="Float")]
		public System.Nullable<double> GPS_LAT
		{
			get
			{
				return this._GPS_LAT;
			}
			set
			{
				if ((this._GPS_LAT != value))
				{
					this.OnGPS_LATChanging(value);
					this.SendPropertyChanging();
					this._GPS_LAT = value;
					this.SendPropertyChanged("GPS_LAT");
					this.OnGPS_LATChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_GPS_LONG", DbType="Float")]
		public System.Nullable<double> GPS_LONG
		{
			get
			{
				return this._GPS_LONG;
			}
			set
			{
				if ((this._GPS_LONG != value))
				{
					this.OnGPS_LONGChanging(value);
					this.SendPropertyChanging();
					this._GPS_LONG = value;
					this.SendPropertyChanged("GPS_LONG");
					this.OnGPS_LONGChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Eligibility", DbType="Bit NOT NULL")]
		public bool Eligibility
		{
			get
			{
				return this._Eligibility;
			}
			set
			{
				if ((this._Eligibility != value))
				{
					this.OnEligibilityChanging(value);
					this.SendPropertyChanging();
					this._Eligibility = value;
					this.SendPropertyChanged("Eligibility");
					this.OnEligibilityChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_InterviewerID", DbType="Int")]
		public System.Nullable<int> InterviewerID
		{
			get
			{
				return this._InterviewerID;
			}
			set
			{
				if ((this._InterviewerID != value))
				{
					this.OnInterviewerIDChanging(value);
					this.SendPropertyChanging();
					this._InterviewerID = value;
					this.SendPropertyChanged("InterviewerID");
					this.OnInterviewerIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_LastUpdateDate", DbType="DateTime")]
		public System.Nullable<System.DateTime> LastUpdateDate
		{
			get
			{
				return this._LastUpdateDate;
			}
			set
			{
				if ((this._LastUpdateDate != value))
				{
					this.OnLastUpdateDateChanging(value);
					this.SendPropertyChanging();
					this._LastUpdateDate = value;
					this.SendPropertyChanged("LastUpdateDate");
					this.OnLastUpdateDateChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_VHWCode", DbType="Int")]
		public System.Nullable<int> VHWCode
		{
			get
			{
				return this._VHWCode;
			}
			set
			{
				if ((this._VHWCode != value))
				{
					this.OnVHWCodeChanging(value);
					this.SendPropertyChanging();
					this._VHWCode = value;
					this.SendPropertyChanged("VHWCode");
					this.OnVHWCodeChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_DistName", DbType="NVarChar(50)")]
		public string DistName
		{
			get
			{
				return this._DistName;
			}
			set
			{
				if ((this._DistName != value))
				{
					this.OnDistNameChanging(value);
					this.SendPropertyChanging();
					this._DistName = value;
					this.SendPropertyChanged("DistName");
					this.OnDistNameChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ThanaName", DbType="NVarChar(50)")]
		public string ThanaName
		{
			get
			{
				return this._ThanaName;
			}
			set
			{
				if ((this._ThanaName != value))
				{
					this.OnThanaNameChanging(value);
					this.SendPropertyChanging();
					this._ThanaName = value;
					this.SendPropertyChanged("ThanaName");
					this.OnThanaNameChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_FixUnion", DbType="NVarChar(50)")]
		public string FixUnion
		{
			get
			{
				return this._FixUnion;
			}
			set
			{
				if ((this._FixUnion != value))
				{
					this.OnFixUnionChanging(value);
					this.SendPropertyChanging();
					this._FixUnion = value;
					this.SendPropertyChanged("FixUnion");
					this.OnFixUnionChanged();
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
}
#pragma warning restore 1591
