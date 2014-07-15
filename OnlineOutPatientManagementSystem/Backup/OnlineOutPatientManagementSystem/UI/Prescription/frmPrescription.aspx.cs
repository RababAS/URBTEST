using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Services;
using System.Web.Script.Services;
using AjaxControlToolkit;

using System.Transactions;
using IsolationLevel = System.Transactions.IsolationLevel;
using System.Web.Script.Serialization;



namespace OnlineOutPatientManagementSystem.UI.Prescription
{
	public partial class frmPrescription : System.Web.UI.Page
	{
		clsPresGridValidations oclsPresGridValidations = new clsPresGridValidations();
		ORM.OnLinePrescriptionDataContext oOPresDataContext = new ORM.OnLinePrescriptionDataContext();
		UI.Prescription.clsDataTypes.PrescriptionGridDataInfo oPrescriptionGridDataInfo = new clsDataTypes.PrescriptionGridDataInfo();
		UI.Prescription.clsDataTypes.PrescriptionGenDataInfo oPrescriptionGenDataInfo = new clsDataTypes.PrescriptionGenDataInfo();

		//public int intUpdateRowIndex;

		protected void Page_Load(object sender, EventArgs e)
		{
			// The Page is accessed for the first time.

			if (IsPostBack)
			{
				
			}
			if (!IsPostBack)
			{
				lbtnCancelDifferentialDx.Visible = false;

				txtVisitID.Text = (oOPresDataContext.ClinicVisitHistories.Max(u => u.ClinicVisitID) + 1).ToString();

				#region ChiefComplaince load
				// Initialize the DataTable and store it in ViewState.
				if (!Page.IsPostBack)
				{
					InitialChiefComplaince();
				}

				#endregion ChiefComplaince load

				#region ProvisionalDx Dx load
				// Initialize the DataTable and store it in ViewState.
				if (!Page.IsPostBack)
				{
					InitialProvisionalDx();
				}

				#endregion ProvisionalDx Dx Load

				#region Differential Dx load
				//// Initialize the DataTable and store it in ViewState.
				//if (!Page.IsPostBack)
				//{
				//    InitialDifferentialDx();
				//}

				#endregion Differential Dx Load

				#region Confirm Dx load
				// Initialize the DataTable and store it in ViewState.
				if (!Page.IsPostBack)
				{
					InitialConfirmDx();
				}

				#endregion Confirm Dx Load



				#region Treatment load
				// Initialize the DataTable and store it in ViewState.
				if (!Page.IsPostBack)
				{
					InitialTreatment();
				}

				#endregion Treatment load

				#region Investigation load
				// Initialize the DataTable and store it in ViewState.
				if (!Page.IsPostBack)
				{
					InitialInvestigation();
				}

				#endregion Investigation load

				#region Postive Findings load
				// Initialize the DataTable and store it in ViewState.
				if (!Page.IsPostBack)
				{
					InitialPostiveFindings();
				}

				#endregion Postive Findings load

				#region Negative Findings load
				// Initialize the DataTable and store it in ViewState.
				if (!Page.IsPostBack)
				{
					InitialNegativeFindings();
				}

				#endregion Negative Findings load

				#region Dental Sign load
				// Initialize the DataTable and store it in ViewState.
				if (!Page.IsPostBack)
				{
					InitialDentalSign();
				}

				#endregion Dental Sign load

				#region Dental Advice load
				// Initialize the DataTable and store it in ViewState.
				if (!Page.IsPostBack)
				{
					InitialDentalAdvice();
				}

				#endregion Dental Advice load

				#region Advice load
				// Initialize the DataTable and store it in ViewState.
				if (!Page.IsPostBack)
				{
					InitialAdvice();
				}

				#endregion Advice load

			}
		}

		#region Add,delete ChiefComplaince

		private void InitialChiefComplaince()
		{
			DataTable dtChiefComplaince = new DataTable();
			DataRow drChiefComplaince = null;

			dtChiefComplaince.Columns.Add(new DataColumn("ChiefComplainceSLNo", typeof(string)));
			dtChiefComplaince.Columns.Add(new DataColumn("ChiefComplaince", typeof(string)));
			dtChiefComplaince.Columns.Add(new DataColumn("DurationYY", typeof(string)));
			dtChiefComplaince.Columns.Add(new DataColumn("DurationMM", typeof(string)));
			dtChiefComplaince.Columns.Add(new DataColumn("DurationDD", typeof(string)));


			drChiefComplaince = dtChiefComplaince.NewRow();

			drChiefComplaince["ChiefComplainceSLNo"] = 1;
			drChiefComplaince["ChiefComplaince"] = string.Empty;
			drChiefComplaince["DurationYY"] = string.Empty;
			drChiefComplaince["DurationMM"] = string.Empty;
			drChiefComplaince["DurationDD"] = string.Empty;


			dtChiefComplaince.Rows.Add(drChiefComplaince);

			//Store the DataTable in ViewState
			ViewState["ChiefComplainceCurrentTable"] = dtChiefComplaince;

			gvCheifComplaince.DataSource = dtChiefComplaince;
			gvCheifComplaince.DataBind();
		}

		private void AddNewChiefComplainceToGrid()
		{
			string strddlPass = "ddlChiefComplaince";
			if (oclsPresGridValidations.GridDublicateCheck(gvCheifComplaince, strddlPass) == true)
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "msg", "alert('Item you are trying to add is already exist!')", true);
				return;
			}

			int rowIndex = 0;
			
			if (ViewState["ChiefComplainceCurrentTable"] != null)
			{
				DataTable dtChiefComplaince = (DataTable)ViewState["ChiefComplainceCurrentTable"];
				DataRow drChiefComplaince = null;

				if (dtChiefComplaince.Rows.Count > 0)
				{
					for (int i = 1; i <= dtChiefComplaince.Rows.Count; i++)
					{
						//extract the TextBox values
						DropDownList autoChiefComplaincee = (DropDownList)gvCheifComplaince.Rows[rowIndex].Cells[1].FindControl("ddlChiefComplaince");
						TextBox autotxtDurationYY = (TextBox)gvCheifComplaince.Rows[rowIndex].Cells[2].FindControl("txtDurationYY");
						TextBox autotxtDurationMM = (TextBox)gvCheifComplaince.Rows[rowIndex].Cells[3].FindControl("txtDurationMM");
						TextBox autotxtDurationDD = (TextBox)gvCheifComplaince.Rows[rowIndex].Cells[4].FindControl("txtDurationDD");


						drChiefComplaince = dtChiefComplaince.NewRow();
						drChiefComplaince["ChiefComplainceSLNo"] = i + 1;

						dtChiefComplaince.Rows[i - 1]["ChiefComplaince"] = autoChiefComplaincee.SelectedValue;
						dtChiefComplaince.Rows[i - 1]["DurationYY"] = autotxtDurationYY.Text;
						dtChiefComplaince.Rows[i - 1]["DurationMM"] = autotxtDurationMM.Text;
						dtChiefComplaince.Rows[i - 1]["DurationDD"] = autotxtDurationDD.Text;


						rowIndex++;
					}

					dtChiefComplaince.Rows.Add(drChiefComplaince);
					ViewState["ChiefComplainceCurrentTable"] = dtChiefComplaince;

					gvCheifComplaince.DataSource = dtChiefComplaince;
					gvCheifComplaince.DataBind();
				}
			}
			else
			{
				Response.Write("ViewState is null");
			}

			//Set Previous Data on Postbacks
			SetChiefComplaincePreviousData();
		}

		private void SetChiefComplaincePreviousData()
		{
			int rowIndex = 0;
			if (ViewState["ChiefComplainceCurrentTable"] != null)
			{
				DataTable dtChiefComplaince = (DataTable)ViewState["ChiefComplainceCurrentTable"];
				if (dtChiefComplaince.Rows.Count > 0)
				{
					for (int i = 0; i < dtChiefComplaince.Rows.Count; i++)
					{
						//extract the TextBox values
						CascadingDropDown autoChiefComplaincee = (CascadingDropDown)gvCheifComplaince.Rows[rowIndex].Cells[1].FindControl("ccddlChiefComplaince");
						//DropDownList autoChiefComplaincee = (DropDownList)gvCheifComplaince.Rows[rowIndex].Cells[1].FindControl("ddlChiefComplaince");
						TextBox autotxtDurationYY = (TextBox)gvCheifComplaince.Rows[rowIndex].Cells[2].FindControl("txtDurationYY");
						TextBox autotxtDurationMM = (TextBox)gvCheifComplaince.Rows[rowIndex].Cells[3].FindControl("txtDurationMM");
						TextBox autotxtDurationDD = (TextBox)gvCheifComplaince.Rows[rowIndex].Cells[4].FindControl("txtDurationDD");


						autoChiefComplaincee.SelectedValue = dtChiefComplaince.Rows[i]["ChiefComplaince"].ToString();
						autotxtDurationYY.Text = dtChiefComplaince.Rows[i]["DurationYY"].ToString();
						autotxtDurationMM.Text = dtChiefComplaince.Rows[i]["DurationMM"].ToString();
						autotxtDurationDD.Text = dtChiefComplaince.Rows[i]["DurationDD"].ToString();

						rowIndex++;
					}
				}
			}
		}

		protected void btnAddChiefComplaince_Click(object sender, EventArgs e)
		{
			AddNewChiefComplainceToGrid();
		}


		protected void gvChiefComplainceDelete(object sender, GridViewDeleteEventArgs e)
		{
			SetChiefComplainceRowData();

			if (ViewState["ChiefComplainceCurrentTable"] != null)
			{
				DataTable dtChiefComplaince = (DataTable)ViewState["ChiefComplainceCurrentTable"];
				DataRow drCurrentRow = null;
				int rowIndex = Convert.ToInt32(e.RowIndex);

				if (dtChiefComplaince.Rows.Count == 1) InitialChiefComplaince();

				else if (dtChiefComplaince.Rows.Count > 1)
				{
					dtChiefComplaince.Rows.Remove(dtChiefComplaince.Rows[rowIndex]);
					drCurrentRow = dtChiefComplaince.NewRow();
					ViewState["ChiefComplainceCurrentTable"] = dtChiefComplaince;

					gvCheifComplaince.DataSource = dtChiefComplaince;
					gvCheifComplaince.DataBind();

					for (int i = 0; i < gvCheifComplaince.Rows.Count - 1; i++)
					{
						gvCheifComplaince.Rows[i].Cells[0].Text = Convert.ToString(i + 1);
					}
					SetChiefComplaincePreviousData();
				}
			}
		}


		private void SetChiefComplainceRowData()
		{
			int rowIndex = 0;

			if (ViewState["ChiefComplainceCurrentTable"] != null)
			{
				DataTable dtChiefComplaince = (DataTable)ViewState["ChiefComplainceCurrentTable"];
				DataRow drCurrentRow = null;

				if (dtChiefComplaince.Rows.Count > 0)
				{
					for (int i = 1; i <= dtChiefComplaince.Rows.Count; i++)
					{
						//extract the TextBox values
						DropDownList autoChiefComplaincee = (DropDownList)gvCheifComplaince.Rows[rowIndex].Cells[1].FindControl("ddlChiefComplaince");
						TextBox autotxtDurationYY = (TextBox)gvCheifComplaince.Rows[rowIndex].Cells[2].FindControl("txtDurationYY");
						TextBox autotxtDurationMM = (TextBox)gvCheifComplaince.Rows[rowIndex].Cells[3].FindControl("txtDurationMM");
						TextBox autotxtDurationDD = (TextBox)gvCheifComplaince.Rows[rowIndex].Cells[4].FindControl("txtDurationDD");


						drCurrentRow = dtChiefComplaince.NewRow();
						drCurrentRow["ChiefComplainceSLNo"] = i + 1;

						dtChiefComplaince.Rows[i - 1]["ChiefComplaince"] = autoChiefComplaincee.SelectedValue;
						dtChiefComplaince.Rows[i - 1]["DurationYY"] = autotxtDurationYY.Text;
						dtChiefComplaince.Rows[i - 1]["DurationMM"] = autotxtDurationMM.Text;
						dtChiefComplaince.Rows[i - 1]["DurationDD"] = autotxtDurationDD.Text;


						rowIndex++;
					}

					ViewState["ChiefComplainceCurrentTable"] = dtChiefComplaince;
					//grvStudentDetails.DataSource = dtCurrentTable;
					//grvStudentDetails.DataBind();
				}
			}
			else
			{
				Response.Write("ViewState is null");
			}
			//SetPreviousData();
		}

		#endregion Add,delete ChiefComplaince


		#region Add,delete ProvisionalDx Dx

		private void InitialProvisionalDx()
		{
			DataTable dtProvisionalDx = new DataTable();
			DataRow drProvisionalDx = null;

			dtProvisionalDx.Columns.Add(new DataColumn("ProvisionalDxSLNo", typeof(string)));
			dtProvisionalDx.Columns.Add(new DataColumn("ProvisionalDx", typeof(string)));



			drProvisionalDx = dtProvisionalDx.NewRow();

			drProvisionalDx["ProvisionalDxSLNo"] = 1;
			drProvisionalDx["ProvisionalDx"] = string.Empty;



			dtProvisionalDx.Rows.Add(drProvisionalDx);

			//Store the DataTable in ViewState
			ViewState["ProvisionalDxCurrentTable"] = dtProvisionalDx;

			gvProvisionalDx.DataSource = dtProvisionalDx;
			gvProvisionalDx.DataBind();
		}

		private void AddNewProvisionalDxToGrid()
		{
			string strddlPass = "ddlProvisionalDx";
			if (oclsPresGridValidations.GridDublicateCheck(gvProvisionalDx, strddlPass) == true)
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "msg", "alert('Item you are trying to add is already exist!')", true);
				return;
			}

			int rowIndex = 0;

			if (ViewState["ProvisionalDxCurrentTable"] != null)
			{
				DataTable dtProvisionalDx = (DataTable)ViewState["ProvisionalDxCurrentTable"];
				DataRow drProvisionalDx = null;

				if (dtProvisionalDx.Rows.Count > 0)
				{
					for (int i = 1; i <= dtProvisionalDx.Rows.Count; i++)
					{
						//extract the TextBox values
						DropDownList autoddlProvisionalDx = (DropDownList)gvProvisionalDx.Rows[rowIndex].Cells[1].FindControl("ddlProvisionalDx");

						drProvisionalDx = dtProvisionalDx.NewRow();
						drProvisionalDx["ProvisionalDxSLNo"] = i + 1;

						dtProvisionalDx.Rows[i - 1]["ProvisionalDx"] = autoddlProvisionalDx.SelectedValue;

						rowIndex++;
					}

					dtProvisionalDx.Rows.Add(drProvisionalDx);
					ViewState["ProvisionalDxCurrentTable"] = dtProvisionalDx;

					gvProvisionalDx.DataSource = dtProvisionalDx;
					gvProvisionalDx.DataBind();
				}
			}
			else
			{
				Response.Write("ViewState is null");
			}

			//Set Previous Data on Postbacks
			SetProvisionalDxPreviousData();

		}

		private void SetProvisionalDxPreviousData()
		{
			int rowIndex = 0;
			if (ViewState["ProvisionalDxCurrentTable"] != null)
			{
				DataTable dtProvisionalDx = (DataTable)ViewState["ProvisionalDxCurrentTable"];
				if (dtProvisionalDx.Rows.Count > 0)
				{
					for (int i = 0; i < dtProvisionalDx.Rows.Count; i++)
					{
						//extract the TextBox values
						CascadingDropDown autoddlProvisionalDx = (CascadingDropDown)gvProvisionalDx.Rows[rowIndex].Cells[1].FindControl("ccddlProvisionalDx");


						autoddlProvisionalDx.SelectedValue = dtProvisionalDx.Rows[i]["ProvisionalDx"].ToString();

						rowIndex++;
					}
				}
			}
		}

		protected void btnAddProvisionalDx_Click(object sender, EventArgs e)
		{
			AddNewProvisionalDxToGrid();
		}


		protected void gvProvisionalDx_RowDeleting(object sender, GridViewDeleteEventArgs e)
		{
			SetgvProvisionalDxRowData();

			if (ViewState["ProvisionalDxCurrentTable"] != null)
			{
				DataTable dtProvisionalDx = (DataTable)ViewState["ProvisionalDxCurrentTable"];
				DataRow drCurrentRow = null;
				int rowIndex = Convert.ToInt32(e.RowIndex);
				if (dtProvisionalDx.Rows.Count == 1) InitialProvisionalDx();

				else if (dtProvisionalDx.Rows.Count > 1)
				{
					dtProvisionalDx.Rows.Remove(dtProvisionalDx.Rows[rowIndex]);
					drCurrentRow = dtProvisionalDx.NewRow();
					ViewState["ProvisionalDxCurrentTable"] = dtProvisionalDx;

					gvProvisionalDx.DataSource = dtProvisionalDx;
					gvProvisionalDx.DataBind();

					for (int i = 0; i < gvProvisionalDx.Rows.Count - 1; i++)
					{
						gvProvisionalDx.Rows[i].Cells[0].Text = Convert.ToString(i + 1);
					}
					SetProvisionalDxPreviousData();


				}

			}
		}


		private void SetgvProvisionalDxRowData()
		{
			int rowIndex = 0;

			if (ViewState["ProvisionalDxCurrentTable"] != null)
			{
				DataTable dtProvisionalDx = (DataTable)ViewState["ProvisionalDxCurrentTable"];
				DataRow drProvisionalDx = null;

				if (dtProvisionalDx.Rows.Count > 0)
				{
					for (int i = 1; i <= dtProvisionalDx.Rows.Count; i++)
					{
						//extract the TextBox values
						DropDownList autoddlddlProvisionalDx = (DropDownList)gvProvisionalDx.Rows[rowIndex].Cells[1].FindControl("ddlProvisionalDx");

						drProvisionalDx = dtProvisionalDx.NewRow();
						drProvisionalDx["ProvisionalDxSLNo"] = i + 1;

						dtProvisionalDx.Rows[i - 1]["ProvisionalDx"] = autoddlddlProvisionalDx.SelectedValue;


						rowIndex++;
					}

					ViewState["ProvisionalDxCurrentTable"] = dtProvisionalDx;
					//grvStudentDetails.DataSource = dtCurrentTable;
					//grvStudentDetails.DataBind();
				}
			}
			else
			{
				Response.Write("ViewState is null");
			}
			//SetPreviousData();
		}



		#endregion Add,delete ProvisionalDx Dx


		#region Add,delete Differential Dx

		private void InitialDifferentialDx()
		{
			DataTable dtDifferentialDx = new DataTable();
			DataRow drDifferentialDx = null;

			dtDifferentialDx.Columns.Add(new DataColumn("DifferentialDxSLNo", typeof(string)));
			dtDifferentialDx.Columns.Add(new DataColumn("DifferentialDx", typeof(string)));



			drDifferentialDx = dtDifferentialDx.NewRow();

			drDifferentialDx["DifferentialDxSLNo"] = 1;
			drDifferentialDx["DifferentialDx"] = string.Empty;



			dtDifferentialDx.Rows.Add(drDifferentialDx);

			//Store the DataTable in ViewState
			ViewState["DifferentialDxCurrentTable"] = dtDifferentialDx;

			gvDifferentialDx.DataSource = dtDifferentialDx;
			gvDifferentialDx.DataBind();
		}

		private void AddNewDifferentialDxToGrid()
		{
			string strddlPass = "ddlProvisionalDx";
			if (oclsPresGridValidations.GridDublicateCheck(gvDifferentialDx, strddlPass) == true)
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "msg", "alert('Item you are trying to add is already exist!')", true);
				return;
			}

			int rowIndex = 0;

			if (ViewState["DifferentialDxCurrentTable"] != null)
			{
				DataTable dtDifferentialDx = (DataTable)ViewState["DifferentialDxCurrentTable"];
				DataRow drDifferentialDx = null;

				if (dtDifferentialDx.Rows.Count > 0)
				{
					for (int i = 1; i <= dtDifferentialDx.Rows.Count; i++)
					{
						//extract the TextBox values
						DropDownList autoddlDifferentialDx = (DropDownList)gvDifferentialDx.Rows[rowIndex].Cells[1].FindControl("ddlProvisionalDx");

						drDifferentialDx = dtDifferentialDx.NewRow();
						drDifferentialDx["DifferentialDxSLNo"] = i + 1;

						dtDifferentialDx.Rows[i - 1]["DifferentialDx"] = autoddlDifferentialDx.SelectedValue;

						rowIndex++;
					}

					dtDifferentialDx.Rows.Add(drDifferentialDx);
					ViewState["DifferentialDxCurrentTable"] = dtDifferentialDx;

					gvDifferentialDx.DataSource = dtDifferentialDx;
					gvDifferentialDx.DataBind();
				}
			}
			else
			{
				Response.Write("ViewState is null");
			}

			//Set Previous Data on Postbacks
			SetDifferentialDxPreviousData();
		}

		private void SetDifferentialDxPreviousData()
		{
			int rowIndex = 0;
			if (ViewState["DifferentialDxCurrentTable"] != null)
			{
				DataTable dtDifferentialDx = (DataTable)ViewState["DifferentialDxCurrentTable"];
				if (dtDifferentialDx.Rows.Count > 0)
				{
					for (int i = 0; i < dtDifferentialDx.Rows.Count; i++)
					{
						//extract the TextBox values
						CascadingDropDown autoddlDifferentialDx = (CascadingDropDown)gvDifferentialDx.Rows[rowIndex].Cells[1].FindControl("ccddlProvisionalDx");


						autoddlDifferentialDx.SelectedValue = dtDifferentialDx.Rows[i]["DifferentialDx"].ToString();

						rowIndex++;
					}
				}
			}
		}

		protected void btnDifferentialDx_Click(object sender, EventArgs e)
		{
			AddNewDifferentialDxToGrid();
		}


		protected void gvDifferentialDx_RowDeleting(object sender, GridViewDeleteEventArgs e)
		{
			SetgvDifferentialDxRowData();

			if (ViewState["DifferentialDxCurrentTable"] != null)
			{
				DataTable dtDifferentialDx = (DataTable)ViewState["DifferentialDxCurrentTable"];
				DataRow drCurrentRow = null;
				int rowIndex = Convert.ToInt32(e.RowIndex);
				if (dtDifferentialDx.Rows.Count == 1) InitialDifferentialDx();

				else if (dtDifferentialDx.Rows.Count > 1)
				{
					dtDifferentialDx.Rows.Remove(dtDifferentialDx.Rows[rowIndex]);
					drCurrentRow = dtDifferentialDx.NewRow();
					ViewState["DifferentialDxCurrentTable"] = dtDifferentialDx;

					gvDifferentialDx.DataSource = dtDifferentialDx;
					gvDifferentialDx.DataBind();

					for (int i = 0; i < gvDifferentialDx.Rows.Count - 1; i++)
					{
						gvDifferentialDx.Rows[i].Cells[0].Text = Convert.ToString(i + 1);
					}
					SetDifferentialDxPreviousData();

					
				}

			}
		}


		private void SetgvDifferentialDxRowData()
		{
			int rowIndex = 0;

			if (ViewState["DifferentialDxCurrentTable"] != null)
			{
				DataTable dtDifferentialDx = (DataTable)ViewState["DifferentialDxCurrentTable"];
				DataRow drDifferentialDx = null;

				if (dtDifferentialDx.Rows.Count > 0)
				{
					for (int i = 1; i <= dtDifferentialDx.Rows.Count; i++)
					{
						//extract the TextBox values
						DropDownList autoddlddlDifferentialDx = (DropDownList)gvDifferentialDx.Rows[rowIndex].Cells[1].FindControl("ddlProvisionalDx");

						drDifferentialDx = dtDifferentialDx.NewRow();
						drDifferentialDx["DifferentialDxSLNo"] = i + 1;

						dtDifferentialDx.Rows[i - 1]["DifferentialDx"] = autoddlddlDifferentialDx.SelectedValue;


						rowIndex++;
					}

					ViewState["DifferentialDxCurrentTable"] = dtDifferentialDx;
					//grvStudentDetails.DataSource = dtCurrentTable;
					//grvStudentDetails.DataBind();
				}
			}
			else
			{
				Response.Write("ViewState is null");
			}
			//SetPreviousData();
		}



		#endregion Add,delete Differential Dx

		#region Add,delete Confirm Dx

		private void InitialConfirmDx()
		{
			DataTable dtConfirmDx = new DataTable();
			DataRow drConfirmDx = null;

			dtConfirmDx.Columns.Add(new DataColumn("ConfirmDxSLNo", typeof(string)));
			dtConfirmDx.Columns.Add(new DataColumn("ConfirmDx", typeof(string)));



			drConfirmDx = dtConfirmDx.NewRow();

			drConfirmDx["ConfirmDxSLNo"] = 1;
			drConfirmDx["ConfirmDx"] = string.Empty;



			dtConfirmDx.Rows.Add(drConfirmDx);

			//Store the DataTable in ViewState
			ViewState["ConfirmDxCurrentTable"] = dtConfirmDx;

			gvConfirmDx.DataSource = dtConfirmDx;
			gvConfirmDx.DataBind();
		}

		private void AddNewConfirmDxToGrid()
		{
			string strddlPass = "ddlProvisionalDx";
			if (oclsPresGridValidations.GridDublicateCheck(gvConfirmDx, strddlPass) == true)
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "msg", "alert('Item you are trying to add is already exist!')", true);
				return;
			}

			int rowIndex = 0;

			if (ViewState["ConfirmDxCurrentTable"] != null)
			{
				DataTable dtConfirmDx = (DataTable)ViewState["ConfirmDxCurrentTable"];
				DataRow drConfirmDx = null;

				if (dtConfirmDx.Rows.Count > 0)
				{
					for (int i = 1; i <= dtConfirmDx.Rows.Count; i++)
					{
						//extract the TextBox values
						DropDownList autoddlConfirmDx = (DropDownList)gvConfirmDx.Rows[rowIndex].Cells[1].FindControl("ddlProvisionalDx");

						drConfirmDx = dtConfirmDx.NewRow();
						drConfirmDx["ConfirmDxSLNo"] = i + 1;

						dtConfirmDx.Rows[i - 1]["ConfirmDx"] = autoddlConfirmDx.SelectedValue;

						rowIndex++;
					}

					dtConfirmDx.Rows.Add(drConfirmDx);
					ViewState["ConfirmDxCurrentTable"] = dtConfirmDx;

					gvConfirmDx.DataSource = dtConfirmDx;
					gvConfirmDx.DataBind();
				}
			}
			else
			{
				Response.Write("ViewState is null");
			}

			//Set Previous Data on Postbacks
			SetConfirmDxPreviousData();
		}

		private void SetConfirmDxPreviousData()
		{
			int rowIndex = 0;
			if (ViewState["ConfirmDxCurrentTable"] != null)
			{
				DataTable dtConfirmDx = (DataTable)ViewState["ConfirmDxCurrentTable"];
				if (dtConfirmDx.Rows.Count > 0)
				{
					for (int i = 0; i < dtConfirmDx.Rows.Count; i++)
					{
						//extract the TextBox values
						CascadingDropDown autoddlConfirmDx = (CascadingDropDown)gvConfirmDx.Rows[rowIndex].Cells[1].FindControl("ccddlProvisionalDx");


						autoddlConfirmDx.SelectedValue = dtConfirmDx.Rows[i]["ConfirmDx"].ToString();

						rowIndex++;
					}
				}
			}
		}

		protected void btnConfirmDx_Click(object sender, EventArgs e)
		{
			AddNewConfirmDxToGrid();
		}


		protected void gvConfirmDx_RowDeleting(object sender, GridViewDeleteEventArgs e)
		{
			SetgvConfirmDxRowData();

			if (ViewState["ConfirmDxCurrentTable"] != null)
			{
				DataTable dtConfirmDx = (DataTable)ViewState["ConfirmDxCurrentTable"];
				DataRow drCurrentRow = null;
				int rowIndex = Convert.ToInt32(e.RowIndex);
				if (dtConfirmDx.Rows.Count == 1) InitialConfirmDx();

				else if (dtConfirmDx.Rows.Count > 1)
				{
					dtConfirmDx.Rows.Remove(dtConfirmDx.Rows[rowIndex]);
					drCurrentRow = dtConfirmDx.NewRow();
					ViewState["ConfirmDxCurrentTable"] = dtConfirmDx;

					gvConfirmDx.DataSource = dtConfirmDx;
					gvConfirmDx.DataBind();

					for (int i = 0; i < gvConfirmDx.Rows.Count - 1; i++)
					{
						gvConfirmDx.Rows[i].Cells[0].Text = Convert.ToString(i + 1);
					}
					SetConfirmDxPreviousData();


				}

			}
		}


		private void SetgvConfirmDxRowData()
		{
			int rowIndex = 0;

			if (ViewState["ConfirmDxCurrentTable"] != null)
			{
				DataTable dtConfirmDx = (DataTable)ViewState["ConfirmDxCurrentTable"];
				DataRow drConfirmDx = null;

				if (dtConfirmDx.Rows.Count > 0)
				{
					for (int i = 1; i <= dtConfirmDx.Rows.Count; i++)
					{
						//extract the TextBox values
						DropDownList autoddlddlConfirmDx = (DropDownList)gvConfirmDx.Rows[rowIndex].Cells[1].FindControl("ddlProvisionalDx");

						drConfirmDx = dtConfirmDx.NewRow();
						drConfirmDx["ConfirmDxSLNo"] = i + 1;

						dtConfirmDx.Rows[i - 1]["ConfirmDx"] = autoddlddlConfirmDx.SelectedValue;


						rowIndex++;
					}

					ViewState["ConfirmDxCurrentTable"] = dtConfirmDx;
					//grvStudentDetails.DataSource = dtCurrentTable;
					//grvStudentDetails.DataBind();
				}
			}
			else
			{
				Response.Write("ViewState is null");
			}
			//SetPreviousData();
		}



		#endregion Add,delete Confirm Dx



		#region Add,delete Treatment

		private void InitialTreatment()
		{
			DataTable dtTreatment = new DataTable();
			DataRow drTreatment = null;

			dtTreatment.Columns.Add(new DataColumn("TreatmentSLNo", typeof(string)));
			dtTreatment.Columns.Add(new DataColumn("MedicineName", typeof(string)));
			dtTreatment.Columns.Add(new DataColumn("MedQnt", typeof(string)));
			dtTreatment.Columns.Add(new DataColumn("Frequency", typeof(string)));
			dtTreatment.Columns.Add(new DataColumn("Treatment", typeof(string)));


			drTreatment = dtTreatment.NewRow();

			drTreatment["TreatmentSLNo"] = 1;
			drTreatment["MedicineName"] = string.Empty;
			drTreatment["MedQnt"] = string.Empty;
			drTreatment["Frequency"] = string.Empty;
			drTreatment["Treatment"] = string.Empty;


			dtTreatment.Rows.Add(drTreatment);

			//Store the DataTable in ViewState
			ViewState["TreatmentCurrentTable"] = dtTreatment;

			gvTreatment.DataSource = dtTreatment;
			gvTreatment.DataBind();
		}

		private void AddNewTreatmentToGrid()
		{
			string strddlPass = "ddlMedicineName";
			if (oclsPresGridValidations.GridDublicateCheck(gvTreatment, strddlPass) == true)
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "msg", "alert('Item you are trying to add is already exist!')", true);
				return;
			}

			int rowIndex = 0;

			if (ViewState["TreatmentCurrentTable"] != null)
			{
				DataTable dtTreatment = (DataTable)ViewState["TreatmentCurrentTable"];
				DataRow drTreatment = null;

				if (dtTreatment.Rows.Count > 0)
				{
					for (int i = 1; i <= dtTreatment.Rows.Count; i++)
					{
						//extract the TextBox values
						DropDownList autoddlMedicineName = (DropDownList)gvTreatment.Rows[rowIndex].Cells[1].FindControl("ddlMedicineName");
						TextBox autotxtMedQnt = (TextBox)gvTreatment.Rows[rowIndex].Cells[2].FindControl("txtMedQnt");
						DropDownList autoddlFrequency = (DropDownList)gvTreatment.Rows[rowIndex].Cells[3].FindControl("ddlFrequency");
						DropDownList autoddlTreatment = (DropDownList)gvTreatment.Rows[rowIndex].Cells[4].FindControl("ddlTreatment");


						drTreatment = dtTreatment.NewRow();
						drTreatment["TreatmentSLNo"] = i + 1;

						dtTreatment.Rows[i - 1]["MedicineName"] = autoddlMedicineName.SelectedValue;
						dtTreatment.Rows[i - 1]["MedQnt"] = autotxtMedQnt.Text;
						dtTreatment.Rows[i - 1]["Frequency"] = autoddlFrequency.SelectedValue;
						dtTreatment.Rows[i - 1]["Treatment"] = autoddlTreatment.SelectedValue;
						

						rowIndex++;
					}

					dtTreatment.Rows.Add(drTreatment);
					ViewState["TreatmentCurrentTable"] = dtTreatment;

					gvTreatment.DataSource = dtTreatment;
					gvTreatment.DataBind();
				}
			}
			else
			{
				Response.Write("ViewState is null");
			}

			//Set Previous Data on Postbacks
			SetTreatmentPreviousData();
		}

		private void SetTreatmentPreviousData()
		{
			int rowIndex = 0;
			if (ViewState["TreatmentCurrentTable"] != null)
			{
				DataTable dtTreatment = (DataTable)ViewState["TreatmentCurrentTable"];
				if (dtTreatment.Rows.Count > 0)
				{
					for (int i = 0; i < dtTreatment.Rows.Count; i++)
					{
						//extract the TextBox values
						CascadingDropDown autoddlMedicineName = (CascadingDropDown)gvTreatment.Rows[rowIndex].Cells[1].FindControl("ccddlMedicineName");
						TextBox autotxtMedQnt = (TextBox)gvTreatment.Rows[rowIndex].Cells[2].FindControl("txtMedQnt");
						CascadingDropDown autoddlFrequency = (CascadingDropDown)gvTreatment.Rows[rowIndex].Cells[3].FindControl("ccddlFrequency");
						CascadingDropDown autoddlTreatment = (CascadingDropDown)gvTreatment.Rows[rowIndex].Cells[4].FindControl("ccddlTreatment");


						autoddlMedicineName.SelectedValue = dtTreatment.Rows[i]["MedicineName"].ToString();
						autotxtMedQnt.Text = dtTreatment.Rows[i]["MedQnt"].ToString();
						autoddlFrequency.SelectedValue = dtTreatment.Rows[i]["Frequency"].ToString();
						autoddlTreatment.SelectedValue = dtTreatment.Rows[i]["Treatment"].ToString();

						rowIndex++;
					}
				}
			}
		}

		protected void btnAddTreatment_Click(object sender, EventArgs e)
		{
			AddNewTreatmentToGrid();
		}


		protected void gvTreatmentDelete(object sender, GridViewDeleteEventArgs e)
		{
			SetTreatmentRowData();

			if (ViewState["TreatmentCurrentTable"] != null)
			{
				DataTable dtTreatment = (DataTable)ViewState["TreatmentCurrentTable"];
				DataRow drCurrentRow = null;
				int rowIndex = Convert.ToInt32(e.RowIndex);

				if (dtTreatment.Rows.Count == 1) InitialTreatment();

				else if (dtTreatment.Rows.Count > 1)
				{
					dtTreatment.Rows.Remove(dtTreatment.Rows[rowIndex]);
					drCurrentRow = dtTreatment.NewRow();
					ViewState["TreatmentCurrentTable"] = dtTreatment;

					gvTreatment.DataSource = dtTreatment;
					gvTreatment.DataBind();

					for (int i = 0; i < gvTreatment.Rows.Count - 1; i++)
					{
						gvTreatment.Rows[i].Cells[0].Text = Convert.ToString(i + 1);
					}
					SetTreatmentPreviousData();
				}
			}
		}


		private void SetTreatmentRowData()
		{
			int rowIndex = 0;

			if (ViewState["TreatmentCurrentTable"] != null)
			{
				DataTable dtTreatment = (DataTable)ViewState["TreatmentCurrentTable"];
				DataRow drCurrentRow = null;

				if (dtTreatment.Rows.Count > 0)
				{
					for (int i = 1; i <= dtTreatment.Rows.Count; i++)
					{
						//extract the TextBox values
						//extract the TextBox values
						DropDownList autoddlMedicineName = (DropDownList)gvTreatment.Rows[rowIndex].Cells[1].FindControl("ddlMedicineName");
						TextBox autotxtMedQnt = (TextBox)gvTreatment.Rows[rowIndex].Cells[2].FindControl("txtMedQnt");
						DropDownList autoddlFrequency = (DropDownList)gvTreatment.Rows[rowIndex].Cells[3].FindControl("ddlFrequency");
						DropDownList autoddlTreatment = (DropDownList)gvTreatment.Rows[rowIndex].Cells[4].FindControl("ddlTreatment");

						drCurrentRow = dtTreatment.NewRow();
						drCurrentRow["TreatmentSLNo"] = i + 1;

						dtTreatment.Rows[i - 1]["MedicineName"] = autoddlMedicineName.SelectedValue;
						dtTreatment.Rows[i - 1]["MedQnt"] = autotxtMedQnt.Text;
						dtTreatment.Rows[i - 1]["Frequency"] = autoddlFrequency.SelectedValue;
						dtTreatment.Rows[i - 1]["Treatment"] = autoddlTreatment.SelectedValue;

						rowIndex++;
					}

					ViewState["TreatmentCurrentTable"] = dtTreatment;
					//grvStudentDetails.DataSource = dtCurrentTable;
					//grvStudentDetails.DataBind();
				}
			}
			else
			{
				Response.Write("ViewState is null");
			}
			//SetPreviousData();
		}


		protected void gvTreatment_SelectedIndexChanged(object sender, EventArgs e)
		{

		}


		#endregion Add,delete Treatment

		#region Add,delete Investigation

		private void InitialInvestigation()
		{
			DataTable dtInvestigation = new DataTable();
			DataRow drInvestigation = null;

			dtInvestigation.Columns.Add(new DataColumn("InvestigationSLNo", typeof(string)));
			dtInvestigation.Columns.Add(new DataColumn("Investigation", typeof(string)));



			drInvestigation = dtInvestigation.NewRow();

			drInvestigation["InvestigationSLNo"] = 1;
			drInvestigation["Investigation"] = string.Empty;



			dtInvestigation.Rows.Add(drInvestigation);

			//Store the DataTable in ViewState
			ViewState["InvestigationCurrentTable"] = dtInvestigation;

			gvInvestigation.DataSource = dtInvestigation;
			gvInvestigation.DataBind();
		}

		private void AddNewInvestigationToGrid()
		{
			string strddlPass = "ddlInvestigation";
			if (oclsPresGridValidations.GridDublicateCheck(gvInvestigation, strddlPass) == true)
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "msg", "alert('Item you are trying to add is already exist!')", true);
				return;
			}

			int rowIndex = 0;

			if (ViewState["InvestigationCurrentTable"] != null)
			{
				DataTable dtInvestigation = (DataTable)ViewState["InvestigationCurrentTable"];
				DataRow drInvestigation = null;

				if (dtInvestigation.Rows.Count > 0)
				{
					for (int i = 1; i <= dtInvestigation.Rows.Count; i++)
					{
						//extract the TextBox values
						DropDownList autoddlInvestigation = (DropDownList)gvInvestigation.Rows[rowIndex].Cells[1].FindControl("ddlInvestigation");

						drInvestigation = dtInvestigation.NewRow();
						drInvestigation["InvestigationSLNo"] = i + 1;

						dtInvestigation.Rows[i - 1]["Investigation"] = autoddlInvestigation.SelectedValue;

						rowIndex++;
					}

					dtInvestigation.Rows.Add(drInvestigation);
					ViewState["InvestigationCurrentTable"] = dtInvestigation;

					gvInvestigation.DataSource = dtInvestigation;
					gvInvestigation.DataBind();
				}
			}
			else
			{
				Response.Write("ViewState is null");
			}

			//Set Previous Data on Postbacks
			SetInvestigationPreviousData();
		}

		private void SetInvestigationPreviousData()
		{
			int rowIndex = 0;
			if (ViewState["InvestigationCurrentTable"] != null)
			{
				DataTable dtInvestigation = (DataTable)ViewState["InvestigationCurrentTable"];
				if (dtInvestigation.Rows.Count > 0)
				{
					for (int i = 0; i < dtInvestigation.Rows.Count; i++)
					{
						//extract the TextBox values
						CascadingDropDown autoddlInvestigation = (CascadingDropDown)gvInvestigation.Rows[rowIndex].Cells[1].FindControl("ccddlInvestigation");


						autoddlInvestigation.SelectedValue = dtInvestigation.Rows[i]["Investigation"].ToString();

						rowIndex++;
					}
				}
			}
		}

		protected void btnAddInvestigation_Click(object sender, EventArgs e)
		{

			AddNewInvestigationToGrid();
		}


		protected void gvInvestigationDelete(object sender, GridViewDeleteEventArgs e)
		{
			SetgvInvestigationRowData();

			if (ViewState["InvestigationCurrentTable"] != null)
			{
				DataTable dtInvestigation = (DataTable)ViewState["InvestigationCurrentTable"];
				DataRow drCurrentRow = null;
				int rowIndex = Convert.ToInt32(e.RowIndex);

				if (dtInvestigation.Rows.Count == 1) InitialInvestigation();
				
				else if (dtInvestigation.Rows.Count > 1)
				{
					dtInvestigation.Rows.Remove(dtInvestigation.Rows[rowIndex]);
					drCurrentRow = dtInvestigation.NewRow();
					ViewState["InvestigationCurrentTable"] = dtInvestigation;

					gvInvestigation.DataSource = dtInvestigation;
					gvInvestigation.DataBind();

					for (int i = 0; i < gvInvestigation.Rows.Count - 1; i++)
					{
						gvInvestigation.Rows[i].Cells[0].Text = Convert.ToString(i + 1);
					}
					SetInvestigationPreviousData();
				}
			}
		}


		private void SetgvInvestigationRowData()
		{
			int rowIndex = 0;

			if (ViewState["InvestigationCurrentTable"] != null)
			{
				DataTable dtInvestigation = (DataTable)ViewState["InvestigationCurrentTable"];
				DataRow drCurrentRow = null;

				if (dtInvestigation.Rows.Count > 0)
				{
					for (int i = 1; i <= dtInvestigation.Rows.Count; i++)
					{
						//extract the TextBox values
						DropDownList autoddlddlInvestigation = (DropDownList)gvInvestigation.Rows[rowIndex].Cells[1].FindControl("ddlInvestigation");

						drCurrentRow = dtInvestigation.NewRow();
						drCurrentRow["InvestigationSLNo"] = i + 1;

						dtInvestigation.Rows[i - 1]["Investigation"] = autoddlddlInvestigation.SelectedValue;


						rowIndex++;
					}

					ViewState["InvestigationCurrentTable"] = dtInvestigation;
					//grvStudentDetails.DataSource = dtCurrentTable;
					//grvStudentDetails.DataBind();
				}
			}
			else
			{
				Response.Write("ViewState is null");
			}
			//SetPreviousData();
		}


		protected void gvInvestigation_SelectedIndexChanged(object sender, EventArgs e)
		{

		}


		#endregion Add,delete Investigation

		#region Add,delete Postive Findings

		private void InitialPostiveFindings()
		{
			DataTable dtPostiveFindings = new DataTable();
			DataRow drPostiveFindings = null;

			dtPostiveFindings.Columns.Add(new DataColumn("PostiveFindingsSLNo", typeof(string)));
			dtPostiveFindings.Columns.Add(new DataColumn("PostiveFindings", typeof(string)));



			drPostiveFindings = dtPostiveFindings.NewRow();

			drPostiveFindings["PostiveFindingsSLNo"] = 1;
			drPostiveFindings["PostiveFindings"] = string.Empty;



			dtPostiveFindings.Rows.Add(drPostiveFindings);

			//Store the DataTable in ViewState
			ViewState["PostiveFindingsCurrentTable"] = dtPostiveFindings;

			gvPostiveFindings.DataSource = dtPostiveFindings;
			gvPostiveFindings.DataBind();
		}

		private void AddNewPostiveFindingsToGrid()
		{
			string strddlPass = "ddlPostiveFindings";
			if (oclsPresGridValidations.GridDublicateCheck(gvPostiveFindings, strddlPass) == true)
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "msg", "alert('Item you are trying to add is already exist!')", true);
				return;
			}

			int rowIndex = 0;

			if (ViewState["PostiveFindingsCurrentTable"] != null)
			{
				DataTable dtPostiveFindings = (DataTable)ViewState["PostiveFindingsCurrentTable"];
				DataRow drPostiveFindings = null;

				if (dtPostiveFindings.Rows.Count > 0)
				{
					for (int i = 1; i <= dtPostiveFindings.Rows.Count; i++)
					{
						//extract the TextBox values
						DropDownList autoddlPostiveFindings = (DropDownList)gvPostiveFindings.Rows[rowIndex].Cells[1].FindControl("ddlPostiveFindings");

						drPostiveFindings = dtPostiveFindings.NewRow();
						drPostiveFindings["PostiveFindingsSLNo"] = i + 1;

						dtPostiveFindings.Rows[i - 1]["PostiveFindings"] = autoddlPostiveFindings.SelectedValue;

						rowIndex++;
					}

					dtPostiveFindings.Rows.Add(drPostiveFindings);
					ViewState["PostiveFindingsCurrentTable"] = dtPostiveFindings;

					gvPostiveFindings.DataSource = dtPostiveFindings;
					gvPostiveFindings.DataBind();
				}
			}
			else
			{
				Response.Write("ViewState is null");
			}

			//Set Previous Data on Postbacks
			SetPositiveFindingsPreviousData();
		}

		private void SetPositiveFindingsPreviousData()
		{
			int rowIndex = 0;
			if (ViewState["PostiveFindingsCurrentTable"] != null)
			{
				DataTable dtPostiveFindings = (DataTable)ViewState["PostiveFindingsCurrentTable"];
				if (dtPostiveFindings.Rows.Count > 0)
				{
					for (int i = 0; i < dtPostiveFindings.Rows.Count; i++)
					{
						//extract the TextBox values
						CascadingDropDown autoddlPostiveFindings = (CascadingDropDown)gvPostiveFindings.Rows[rowIndex].Cells[1].FindControl("ccddlPostiveFindings");


						autoddlPostiveFindings.SelectedValue = dtPostiveFindings.Rows[i]["PostiveFindings"].ToString();

						rowIndex++;
					}
				}
			}
		}

		protected void btnPostiveFindings_Click(object sender, EventArgs e)
		{
			AddNewPostiveFindingsToGrid();
		}


		protected void gvPostiveFindings_RowDeleting(object sender, GridViewDeleteEventArgs e)
		{
			SetgvPostiveFindingsRowData();

			if (ViewState["PostiveFindingsCurrentTable"] != null)
			{
				DataTable dtPostiveFindings = (DataTable)ViewState["PostiveFindingsCurrentTable"];
				DataRow drCurrentRow = null;
				int rowIndex = Convert.ToInt32(e.RowIndex);
				if (dtPostiveFindings.Rows.Count == 1) InitialPostiveFindings();

				else if (dtPostiveFindings.Rows.Count > 1)
				{
					dtPostiveFindings.Rows.Remove(dtPostiveFindings.Rows[rowIndex]);
					drCurrentRow = dtPostiveFindings.NewRow();
					ViewState["PostiveFindingsCurrentTable"] = dtPostiveFindings;

					gvPostiveFindings.DataSource = dtPostiveFindings;
					gvPostiveFindings.DataBind();

					for (int i = 0; i < gvPostiveFindings.Rows.Count - 1; i++)
					{
						gvPostiveFindings.Rows[i].Cells[0].Text = Convert.ToString(i + 1);
					}
					SetPositiveFindingsPreviousData();
				}

			}
		}


		private void SetgvPostiveFindingsRowData()
		{
			int rowIndex = 0;

			if (ViewState["PostiveFindingsCurrentTable"] != null)
			{
				DataTable dtPostiveFindings = (DataTable)ViewState["PostiveFindingsCurrentTable"];
				DataRow drPostiveFindings = null;

				if (dtPostiveFindings.Rows.Count > 0)
				{
					for (int i = 1; i <= dtPostiveFindings.Rows.Count; i++)
					{
						//extract the TextBox values
						DropDownList autoddlddlPostiveFindings = (DropDownList)gvPostiveFindings.Rows[rowIndex].Cells[1].FindControl("ddlPostiveFindings");

						drPostiveFindings = dtPostiveFindings.NewRow();
						drPostiveFindings["PostiveFindingsSLNo"] = i + 1;

						dtPostiveFindings.Rows[i - 1]["PostiveFindings"] = autoddlddlPostiveFindings.SelectedValue;


						rowIndex++;
					}

					ViewState["PostiveFindingsCurrentTable"] = dtPostiveFindings;
					//grvStudentDetails.DataSource = dtCurrentTable;
					//grvStudentDetails.DataBind();
				}
			}
			else
			{
				Response.Write("ViewState is null");
			}
			//SetPreviousData();
		}



		#endregion Add,delete Postive Findings

		#region Add,delete Negative Findings

		private void InitialNegativeFindings()
		{
			DataTable dtNegativeFindings = new DataTable();
			DataRow drNegativeFindings = null;

			dtNegativeFindings.Columns.Add(new DataColumn("NegativeFindingsSLNo", typeof(string)));
			dtNegativeFindings.Columns.Add(new DataColumn("NegativeFindings", typeof(string)));



			drNegativeFindings = dtNegativeFindings.NewRow();

			drNegativeFindings["NegativeFindingsSLNo"] = 1;
			drNegativeFindings["NegativeFindings"] = string.Empty;



			dtNegativeFindings.Rows.Add(drNegativeFindings);

			//Store the DataTable in ViewState
			ViewState["NegativeFindingsCurrentTable"] = dtNegativeFindings;

			gvNegativeFindings.DataSource = dtNegativeFindings;
			gvNegativeFindings.DataBind();
		}

		private void AddNewNegativeFindingsToGrid()
		{
			string strddlPass = "ddlNegativeFindings";
			if (oclsPresGridValidations.GridDublicateCheck(gvNegativeFindings, strddlPass) == true)
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "msg", "alert('Item you are trying to add is already exist!')", true);
				return;
			}

			int rowIndex = 0;

			if (ViewState["NegativeFindingsCurrentTable"] != null)
			{
				DataTable dtNegativeFindings = (DataTable)ViewState["NegativeFindingsCurrentTable"];
				DataRow drNegativeFindings = null;

				if (dtNegativeFindings.Rows.Count > 0)
				{
					for (int i = 1; i <= dtNegativeFindings.Rows.Count; i++)
					{
						//extract the TextBox values
						DropDownList autoddlNegativeFindings = (DropDownList)gvNegativeFindings.Rows[rowIndex].Cells[1].FindControl("ddlNegativeFindings");

						drNegativeFindings = dtNegativeFindings.NewRow();
						drNegativeFindings["NegativeFindingsSLNo"] = i + 1;

						dtNegativeFindings.Rows[i - 1]["NegativeFindings"] = autoddlNegativeFindings.SelectedValue;

						rowIndex++;
					}

					dtNegativeFindings.Rows.Add(drNegativeFindings);
					ViewState["NegativeFindingsCurrentTable"] = dtNegativeFindings;

					gvNegativeFindings.DataSource = dtNegativeFindings;
					gvNegativeFindings.DataBind();
				}
			}
			else
			{
				Response.Write("ViewState is null");
			}

			//Set Previous Data on Postbacks
			SetNegativeFindingsPreviousData();
		}

		private void SetNegativeFindingsPreviousData()
		{
			int rowIndex = 0;
			if (ViewState["NegativeFindingsCurrentTable"] != null)
			{
				DataTable dtNegativeFindings = (DataTable)ViewState["NegativeFindingsCurrentTable"];
				if (dtNegativeFindings.Rows.Count > 0)
				{
					for (int i = 0; i < dtNegativeFindings.Rows.Count; i++)
					{
						//extract the TextBox values
						CascadingDropDown autoddlNegativeFindings = (CascadingDropDown)gvNegativeFindings.Rows[rowIndex].Cells[1].FindControl("ccddlNegativeFindings");


						autoddlNegativeFindings.SelectedValue = dtNegativeFindings.Rows[i]["NegativeFindings"].ToString();

						rowIndex++;
					}
				}
			}
		}

		protected void btnNegativeFindings_Click(object sender, EventArgs e)
		{
			AddNewNegativeFindingsToGrid();
		}


		protected void gvNegativeFindings_RowDeleting(object sender, GridViewDeleteEventArgs e)
		{
			SetgvNegativeFindingsRowData();

			if (ViewState["NegativeFindingsCurrentTable"] != null)
			{
				DataTable dtNegativeFindings = (DataTable)ViewState["NegativeFindingsCurrentTable"];
				DataRow drCurrentRow = null;
				int rowIndex = Convert.ToInt32(e.RowIndex);
				if (dtNegativeFindings.Rows.Count == 1) InitialNegativeFindings();

				else if (dtNegativeFindings.Rows.Count > 1)
				{
					dtNegativeFindings.Rows.Remove(dtNegativeFindings.Rows[rowIndex]);
					drCurrentRow = dtNegativeFindings.NewRow();
					ViewState["NegativeFindingsCurrentTable"] = dtNegativeFindings;

					gvNegativeFindings.DataSource = dtNegativeFindings;
					gvNegativeFindings.DataBind();

					for (int i = 0; i < gvNegativeFindings.Rows.Count - 1; i++)
					{
						gvNegativeFindings.Rows[i].Cells[0].Text = Convert.ToString(i + 1);
					}
					SetNegativeFindingsPreviousData();
				}

			}
		}


		private void SetgvNegativeFindingsRowData()
		{
			int rowIndex = 0;

			if (ViewState["NegativeFindingsCurrentTable"] != null)
			{
				DataTable dtNegativeFindings = (DataTable)ViewState["NegativeFindingsCurrentTable"];
				DataRow drNegativeFindings = null;

				if (dtNegativeFindings.Rows.Count > 0)
				{
					for (int i = 1; i <= dtNegativeFindings.Rows.Count; i++)
					{
						//extract the TextBox values
						DropDownList autoddlddlNegativeFindings = (DropDownList)gvNegativeFindings.Rows[rowIndex].Cells[1].FindControl("ddlNegativeFindings");

						drNegativeFindings = dtNegativeFindings.NewRow();
						drNegativeFindings["NegativeFindingsSLNo"] = i + 1;

						dtNegativeFindings.Rows[i - 1]["NegativeFindings"] = autoddlddlNegativeFindings.SelectedValue;


						rowIndex++;
					}

					ViewState["NegativeFindingsCurrentTable"] = dtNegativeFindings;
					//grvStudentDetails.DataSource = dtCurrentTable;
					//grvStudentDetails.DataBind();
				}
			}
			else
			{
				Response.Write("ViewState is null");
			}
			//SetPreviousData();
		}



		#endregion Add,delete Negative Findings

		#region Add,delete Dental Sign

		private void InitialDentalSign()
		{
			DataTable dtDentalSign = new DataTable();
			DataRow drDentalSign = null;

			dtDentalSign.Columns.Add(new DataColumn("DentalSignSLNo", typeof(string)));
			dtDentalSign.Columns.Add(new DataColumn("DentalSign", typeof(string)));
			dtDentalSign.Columns.Add(new DataColumn("SignTeethNo", typeof(string)));


			drDentalSign = dtDentalSign.NewRow();

			drDentalSign["DentalSignSLNo"] = 1;
			drDentalSign["DentalSign"] = string.Empty;
			drDentalSign["SignTeethNo"] = string.Empty;


			dtDentalSign.Rows.Add(drDentalSign);

			//Store the DataTable in ViewState
			ViewState["DentalSignCurrentTable"] = dtDentalSign;

			gvDentalSign.DataSource = dtDentalSign;
			gvDentalSign.DataBind();
		}

		private void AddNewDentalSignToGrid()
		{
			string strddlPass = "ddlDentalSign";
			if (oclsPresGridValidations.GridDublicateCheck(gvDentalSign, strddlPass) == true)
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "msg", "alert('Item you are trying to add is already exist!')", true);
				return;
			}

			int rowIndex = 0;

			if (ViewState["DentalSignCurrentTable"] != null)
			{
				DataTable dtDentalSign = (DataTable)ViewState["DentalSignCurrentTable"];
				DataRow drDentalSign = null;

				if (dtDentalSign.Rows.Count > 0)
				{
					for (int i = 1; i <= dtDentalSign.Rows.Count; i++)
					{
						//extract the TextBox values
						DropDownList autoddlDentalSign = (DropDownList)gvDentalSign.Rows[rowIndex].Cells[1].FindControl("ddlDentalSign");
						TextBox autotxtSignTeethNo = (TextBox)gvDentalSign.Rows[rowIndex].Cells[2].FindControl("txtSignTeethNo");

						drDentalSign = dtDentalSign.NewRow();
						drDentalSign["DentalSignSLNo"] = i + 1;

						dtDentalSign.Rows[i - 1]["DentalSign"] = autoddlDentalSign.SelectedValue;
						dtDentalSign.Rows[i - 1]["SignTeethNo"] = autotxtSignTeethNo.Text;

						rowIndex++;
					}

					dtDentalSign.Rows.Add(drDentalSign);
					ViewState["DentalSignCurrentTable"] = dtDentalSign;

					gvDentalSign.DataSource = dtDentalSign;
					gvDentalSign.DataBind();
				}
			}
			else
			{
				Response.Write("ViewState is null");
			}

			//Set Previous Data on Postbacks
			SetDentalSignPreviousData();
		}

		private void SetDentalSignPreviousData()
		{
			int rowIndex = 0;
			if (ViewState["DentalSignCurrentTable"] != null)
			{
				DataTable dtDentalSign = (DataTable)ViewState["DentalSignCurrentTable"];
				if (dtDentalSign.Rows.Count > 0)
				{
					for (int i = 0; i < dtDentalSign.Rows.Count; i++)
					{
						//extract the TextBox values
						CascadingDropDown autoddlDentalSign = (CascadingDropDown)gvDentalSign.Rows[rowIndex].Cells[1].FindControl("ccddlDentalSign");
						TextBox autotxtSignTeethNo = (TextBox)gvDentalSign.Rows[rowIndex].Cells[2].FindControl("txtSignTeethNo");


						autoddlDentalSign.SelectedValue = dtDentalSign.Rows[i]["DentalSign"].ToString();
						autotxtSignTeethNo.Text = dtDentalSign.Rows[i]["SignTeethNo"].ToString();

						rowIndex++;
					}
				}
			}
		}

		protected void btnDentalSign_Click(object sender, EventArgs e)
		{
			AddNewDentalSignToGrid();
		}


		protected void gvDentalSign_RowDeleting(object sender, GridViewDeleteEventArgs e)
		{
			SetgvDentalSignRowData();

			if (ViewState["DentalSignCurrentTable"] != null)
			{
				DataTable dtDentalSign = (DataTable)ViewState["DentalSignCurrentTable"];
				DataRow drCurrentRow = null;
				int rowIndex = Convert.ToInt32(e.RowIndex);
				if (dtDentalSign.Rows.Count == 1) InitialDentalSign();

				else if (dtDentalSign.Rows.Count > 1)
				{
					dtDentalSign.Rows.Remove(dtDentalSign.Rows[rowIndex]);
					drCurrentRow = dtDentalSign.NewRow();
					ViewState["DentalSignCurrentTable"] = dtDentalSign;

					gvDentalSign.DataSource = dtDentalSign;
					gvDentalSign.DataBind();

					for (int i = 0; i < gvDentalSign.Rows.Count - 1; i++)
					{
						gvDentalSign.Rows[i].Cells[0].Text = Convert.ToString(i + 1);
					}
					SetDentalSignPreviousData();
				}

			}
		}


		private void SetgvDentalSignRowData()
		{
			int rowIndex = 0;

			if (ViewState["DentalSignCurrentTable"] != null)
			{
				DataTable dtDentalSign = (DataTable)ViewState["DentalSignCurrentTable"];
				DataRow drDentalSign = null;

				if (dtDentalSign.Rows.Count > 0)
				{
					for (int i = 1; i <= dtDentalSign.Rows.Count; i++)
					{
						//extract the TextBox values
						DropDownList autoddlddlDentalSign = (DropDownList)gvDentalSign.Rows[rowIndex].Cells[1].FindControl("ddlDentalSign");
						TextBox autotxtSignTeethNo = (TextBox)gvDentalSign.Rows[rowIndex].Cells[2].FindControl("txtSignTeethNo");


						drDentalSign = dtDentalSign.NewRow();
						drDentalSign["DentalSignSLNo"] = i + 1;

						dtDentalSign.Rows[i - 1]["DentalSign"] = autoddlddlDentalSign.SelectedValue;
						dtDentalSign.Rows[i - 1]["SignTeethNo"] = autotxtSignTeethNo.Text;


						rowIndex++;
					}

					ViewState["DentalSignCurrentTable"] = dtDentalSign;
					//grvStudentDetails.DataSource = dtCurrentTable;
					//grvStudentDetails.DataBind();
				}
			}
			else
			{
				Response.Write("ViewState is null");
			}
			//SetPreviousData();
		}



		#endregion Add,delete Dental Sign

		#region Add,delete Dental Advice

		private void InitialDentalAdvice()
		{
			DataTable dtDentalAdvice = new DataTable();
			DataRow drDentalAdvice = null;

			dtDentalAdvice.Columns.Add(new DataColumn("DentalAdviceSLNo", typeof(string)));
			dtDentalAdvice.Columns.Add(new DataColumn("DentalAdvice", typeof(string)));
			dtDentalAdvice.Columns.Add(new DataColumn("DenAdviceTeethNo", typeof(string)));


			drDentalAdvice = dtDentalAdvice.NewRow();

			drDentalAdvice["DentalAdviceSLNo"] = 1;
			drDentalAdvice["DentalAdvice"] = string.Empty;
			drDentalAdvice["DenAdviceTeethNo"] = string.Empty;


			dtDentalAdvice.Rows.Add(drDentalAdvice);

			//Store the DataTable in ViewState
			ViewState["DentalAdviceCurrentTable"] = dtDentalAdvice;

			gvDentalAdvice.DataSource = dtDentalAdvice;
			gvDentalAdvice.DataBind();
		}

		private void AddNewDentalAdviceToGrid()
		{
			string strddlPass = "ddlDentalAdvice";
			if (oclsPresGridValidations.GridDublicateCheck(gvDentalAdvice, strddlPass) == true)
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "msg", "alert('Item you are trying to add is already exist!')", true);
				return;
			}

			int rowIndex = 0;

			if (ViewState["DentalAdviceCurrentTable"] != null)
			{
				DataTable dtDentalAdvice = (DataTable)ViewState["DentalAdviceCurrentTable"];
				DataRow drDentalAdvice = null;

				if (dtDentalAdvice.Rows.Count > 0)
				{
					for (int i = 1; i <= dtDentalAdvice.Rows.Count; i++)
					{
						//extract the TextBox values
						DropDownList autoddlDentalAdvice = (DropDownList)gvDentalAdvice.Rows[rowIndex].Cells[1].FindControl("ddlDentalAdvice");
						TextBox autotxtDenAdviceTeethNo = (TextBox)gvDentalAdvice.Rows[rowIndex].Cells[2].FindControl("txtDenAdviceTeethNo");

						drDentalAdvice = dtDentalAdvice.NewRow();
						drDentalAdvice["DentalAdviceSLNo"] = i + 1;

						dtDentalAdvice.Rows[i - 1]["DentalAdvice"] = autoddlDentalAdvice.SelectedValue;
						dtDentalAdvice.Rows[i - 1]["DenAdviceTeethNo"] = autotxtDenAdviceTeethNo.Text;

						rowIndex++;
					}

					dtDentalAdvice.Rows.Add(drDentalAdvice);
					ViewState["DentalAdviceCurrentTable"] = dtDentalAdvice;

					gvDentalAdvice.DataSource = dtDentalAdvice;
					gvDentalAdvice.DataBind();
				}
			}
			else
			{
				Response.Write("ViewState is null");
			}

			//Set Previous Data on Postbacks
			SetDentalAdvicePreviousData();
		}

		private void SetDentalAdvicePreviousData()
		{
			int rowIndex = 0;
			if (ViewState["DentalAdviceCurrentTable"] != null)
			{
				DataTable dtDentalAdvice = (DataTable)ViewState["DentalAdviceCurrentTable"];
				if (dtDentalAdvice.Rows.Count > 0)
				{
					for (int i = 0; i < dtDentalAdvice.Rows.Count; i++)
					{
						//extract the TextBox values
						CascadingDropDown autoddlDentalAdvice = (CascadingDropDown)gvDentalAdvice.Rows[rowIndex].Cells[1].FindControl("ccddlDentalAdvice");
						TextBox autotxtDenAdviceTeethNo = (TextBox)gvDentalAdvice.Rows[rowIndex].Cells[2].FindControl("txtDenAdviceTeethNo");


						autoddlDentalAdvice.SelectedValue = dtDentalAdvice.Rows[i]["DentalAdvice"].ToString();
						autotxtDenAdviceTeethNo.Text = dtDentalAdvice.Rows[i]["DenAdviceTeethNo"].ToString();


						rowIndex++;
					}
				}
			}
		}

		protected void btnDentalAdvice_Click(object sender, EventArgs e)
		{
			AddNewDentalAdviceToGrid();
		}


		protected void gvDentalAdvice_RowDeleting(object sender, GridViewDeleteEventArgs e)
		{
			SetgvDentalAdviceRowData();

			if (ViewState["DentalAdviceCurrentTable"] != null)
			{
				DataTable dtDentalAdvice = (DataTable)ViewState["DentalAdviceCurrentTable"];
				DataRow drCurrentRow = null;
				int rowIndex = Convert.ToInt32(e.RowIndex);
				if (dtDentalAdvice.Rows.Count == 1) InitialDentalAdvice();

				else if (dtDentalAdvice.Rows.Count > 1)
				{
					dtDentalAdvice.Rows.Remove(dtDentalAdvice.Rows[rowIndex]);
					drCurrentRow = dtDentalAdvice.NewRow();
					ViewState["DentalAdviceCurrentTable"] = dtDentalAdvice;

					gvDentalAdvice.DataSource = dtDentalAdvice;
					gvDentalAdvice.DataBind();

					for (int i = 0; i < gvDentalAdvice.Rows.Count - 1; i++)
					{
						gvDentalAdvice.Rows[i].Cells[0].Text = Convert.ToString(i + 1);
					}
					SetDentalAdvicePreviousData();
				}

			}
		}


		private void SetgvDentalAdviceRowData()
		{
			int rowIndex = 0;

			if (ViewState["DentalAdviceCurrentTable"] != null)
			{
				DataTable dtDentalAdvice = (DataTable)ViewState["DentalAdviceCurrentTable"];
				DataRow drDentalAdvice = null;

				if (dtDentalAdvice.Rows.Count > 0)
				{
					for (int i = 1; i <= dtDentalAdvice.Rows.Count; i++)
					{
						//extract the TextBox values
						DropDownList autoddlddlDentalAdvice = (DropDownList)gvDentalAdvice.Rows[rowIndex].Cells[1].FindControl("ddlDentalAdvice");
						TextBox autotxtDenAdviceTeethNo = (TextBox)gvDentalAdvice.Rows[rowIndex].Cells[2].FindControl("txtDenAdviceTeethNo");

						drDentalAdvice = dtDentalAdvice.NewRow();
						drDentalAdvice["DentalAdviceSLNo"] = i + 1;

						dtDentalAdvice.Rows[i - 1]["DentalAdvice"] = autoddlddlDentalAdvice.SelectedValue;
						dtDentalAdvice.Rows[i - 1]["DenAdviceTeethNo"] = autotxtDenAdviceTeethNo.Text;


						rowIndex++;
					}

					ViewState["DentalAdviceCurrentTable"] = dtDentalAdvice;
					//grvStudentDetails.DataSource = dtCurrentTable;
					//grvStudentDetails.DataBind();
				}
			}
			else
			{
				Response.Write("ViewState is null");
			}
			//SetPreviousData();
		}



		#endregion Add,delete Dental Advice

		#region Add,delete Advice

		private void InitialAdvice()
		{
			DataTable dtAdvice = new DataTable();
			DataRow drAdvice = null;

			dtAdvice.Columns.Add(new DataColumn("AdviceSLNo", typeof(string)));
			dtAdvice.Columns.Add(new DataColumn("Advice", typeof(string)));



			drAdvice = dtAdvice.NewRow();

			drAdvice["AdviceSLNo"] = 1;
			drAdvice["Advice"] = string.Empty;



			dtAdvice.Rows.Add(drAdvice);

			//Store the DataTable in ViewState
			ViewState["AdviceCurrentTable"] = dtAdvice;

			gvAdvice.DataSource = dtAdvice;
			gvAdvice.DataBind();
		}

		private void AddNewAdviceToGrid()
		{
			string strddlPass = "ddlAdvice";
			if (oclsPresGridValidations.GridDublicateCheck(gvAdvice, strddlPass) == true)
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "msg", "alert('Item you are trying to add is already exist!')", true);
				return;
			}

			int rowIndex = 0;

			if (ViewState["AdviceCurrentTable"] != null)
			{
				DataTable dtAdvice = (DataTable)ViewState["AdviceCurrentTable"];
				DataRow drAdvice = null;

				if (dtAdvice.Rows.Count > 0)
				{
					for (int i = 1; i <= dtAdvice.Rows.Count; i++)
					{
						//extract the TextBox values
						DropDownList autoddlAdvice = (DropDownList)gvAdvice.Rows[rowIndex].Cells[1].FindControl("ddlAdvice");

						drAdvice = dtAdvice.NewRow();
						drAdvice["AdviceSLNo"] = i + 1;

						dtAdvice.Rows[i - 1]["Advice"] = autoddlAdvice.SelectedValue;

						rowIndex++;
					}

					dtAdvice.Rows.Add(drAdvice);
					ViewState["AdviceCurrentTable"] = dtAdvice;

					gvAdvice.DataSource = dtAdvice;
					gvAdvice.DataBind();
				}
			}
			else
			{
				Response.Write("ViewState is null");
			}

			//Set Previous Data on Postbacks
			SetAdvicePreviousData();
		}

		private void SetAdvicePreviousData()
		{
			int rowIndex = 0;
			if (ViewState["AdviceCurrentTable"] != null)
			{
				DataTable dtAdvice = (DataTable)ViewState["AdviceCurrentTable"];
				if (dtAdvice.Rows.Count > 0)
				{
					for (int i = 0; i < dtAdvice.Rows.Count; i++)
					{
						//extract the TextBox values
						CascadingDropDown autoddlAdvice = (CascadingDropDown)gvAdvice.Rows[rowIndex].Cells[1].FindControl("ccddlAdvice");


						autoddlAdvice.SelectedValue = dtAdvice.Rows[i]["Advice"].ToString();

						rowIndex++;
					}
				}
			}
		}

		protected void btnAddAdvice_Click(object sender, EventArgs e)
		{

			AddNewAdviceToGrid();
		}


		protected void gvAdviceDelete(object sender, GridViewDeleteEventArgs e)
		{
			SetgvAdviceRowData();

			if (ViewState["AdviceCurrentTable"] != null)
			{
				DataTable dtAdvice = (DataTable)ViewState["AdviceCurrentTable"];
				DataRow drCurrentRow = null;
				int rowIndex = Convert.ToInt32(e.RowIndex);

				if (dtAdvice.Rows.Count == 1) InitialAdvice();

				else if (dtAdvice.Rows.Count > 1)
				{
					dtAdvice.Rows.Remove(dtAdvice.Rows[rowIndex]);
					drCurrentRow = dtAdvice.NewRow();
					ViewState["AdviceCurrentTable"] = dtAdvice;

					gvAdvice.DataSource = dtAdvice;
					gvAdvice.DataBind();

					for (int i = 0; i < gvAdvice.Rows.Count - 1; i++)
					{
						gvAdvice.Rows[i].Cells[0].Text = Convert.ToString(i + 1);
					}
					SetAdvicePreviousData();
				}
			}
		}


		private void SetgvAdviceRowData()
		{
			int rowIndex = 0;

			if (ViewState["AdviceCurrentTable"] != null)
			{
				DataTable dtAdvice = (DataTable)ViewState["AdviceCurrentTable"];
				DataRow drCurrentRow = null;

				if (dtAdvice.Rows.Count > 0)
				{
					for (int i = 1; i <= dtAdvice.Rows.Count; i++)
					{
						//extract the TextBox values
						DropDownList autoddlddlAdvice = (DropDownList)gvAdvice.Rows[rowIndex].Cells[1].FindControl("ddlAdvice");

						drCurrentRow = dtAdvice.NewRow();
						drCurrentRow["AdviceSLNo"] = i + 1;

						dtAdvice.Rows[i - 1]["Advice"] = autoddlddlAdvice.SelectedValue;


						rowIndex++;
					}

					ViewState["AdviceCurrentTable"] = dtAdvice;
					//grvStudentDetails.DataSource = dtCurrentTable;
					//grvStudentDetails.DataBind();
				}
			}
			else
			{
				Response.Write("ViewState is null");
			}
			//SetPreviousData();
		}


		protected void gvAdvice_SelectedIndexChanged(object sender, EventArgs e)
		{

		}

		#endregion Add,delete Advice



		protected void btnSave_Click(object sender, EventArgs e)
		{
			Page.Validate("valGCommon");

			Page.Validate("valGChifCompaince");

			Page.Validate("valGProvisionalDx");
			Page.Validate("valGDifferentialDx");
			Page.Validate("valGConfirmDx");

			Page.Validate("valGTreatment");
			Page.Validate("valGInvestigation");


			Page.Validate("valGPostiveFindings");
			Page.Validate("valGNegativeFindings");
			Page.Validate("valGDentalSign");

			Page.Validate("valGDentalAdvice");
			Page.Validate("valGPostiveFindings");
			Page.Validate("valGPostiveFindings");
			Page.Validate("valGAdvice");  

			//ORM.OnLinePrescriptionDataContext oOPresDataContext = new ORM.OnLinePrescriptionDataContext();
			//UI.Prescription.clsDataTypes.PrescriptionGridDataInfo oPrescriptionGridDataInfo = new clsDataTypes.PrescriptionGridDataInfo();
			//UI.Prescription.clsDataTypes.PrescriptionGenDataInfo oPrescriptionGenDataInfo = new clsDataTypes.PrescriptionGenDataInfo();

			
			
			int intMaxClnVisutId = oOPresDataContext.ClinicVisitHistories.Max(u => u.ClinicVisitID) + 1;
			DateTime dtTranDate = DateTime.Now;



			UI.Prescription.clsPrescriptionSQL oclsPrescriptionSQL = new clsPrescriptionSQL();


			if (Page.IsValid)
			{
				var option = new TransactionOptions();
				option.IsolationLevel = IsolationLevel.ReadCommitted;
				option.Timeout = TimeSpan.FromMinutes(5);
				using (var scope = new TransactionScope(TransactionScopeOption.Suppress, option))
				{
					try
					{
						Application.Lock();
						
						#region Prescription common data insertion
						ORM.ClinicVisitHistory oClinicVisitHistory = new ORM.ClinicVisitHistory();

						//Get Basic Infp data types
						oPrescriptionGenDataInfo.strPatientID = txtPID.Text;
						oPrescriptionGenDataInfo.strRelations = Convert.ToByte(ddlRelation.SelectedValue);
						oPrescriptionGenDataInfo.strPatientAge = Convert.ToByte(txtAge.Text);
						oPrescriptionGenDataInfo.strDrugHistory = txtDrufHis.Text;

						//Get On examinatin Info data types
						oPrescriptionGenDataInfo.strExaAnemia = Convert.ToByte(ddlAnemia.SelectedValue);
						oPrescriptionGenDataInfo.strExaJaundice = Convert.ToByte(ddlJaundice.SelectedValue);
						oPrescriptionGenDataInfo.strExaClubbing = Convert.ToByte(ddlClubbing.SelectedValue);
						oPrescriptionGenDataInfo.strExaOdema = Convert.ToByte(ddlOdema.SelectedValue);
						oPrescriptionGenDataInfo.strExaL_N = Convert.ToByte(ddlLN.SelectedValue);


						oPrescriptionGenDataInfo.strExaHeart = ddlHeart.SelectedValue;
						oPrescriptionGenDataInfo.strExaLung = ddlLung.SelectedValue;
						oPrescriptionGenDataInfo.strExaLiver = Convert.ToByte(ddlLiver.SelectedValue);
						oPrescriptionGenDataInfo.strExaSpleen = Convert.ToByte(ddlSpleen.SelectedValue);
						oPrescriptionGenDataInfo.strExaOthers = txtOthers.Text;


						//Get Blood Pressure data types
						oPrescriptionGenDataInfo.strExaSystolic = Convert.ToByte(txtSystolic.Text);
						oPrescriptionGenDataInfo.strExaDiastolic =  Convert.ToByte(txtDiastolic.Text);

						oPrescriptionGenDataInfo.strExaPulse = Convert.ToByte(txtPulse.Text);
						oPrescriptionGenDataInfo.strExaTemp = Convert.ToByte(txtTemp.Text);
						oPrescriptionGenDataInfo.strExaWt = Convert.ToByte(txtWeight.Text);


						oPrescriptionGenDataInfo.strExaVulva = ddlVulva.SelectedValue;
						oPrescriptionGenDataInfo.strExaVagina = ddlVagina.SelectedValue;
						oPrescriptionGenDataInfo.strExaOS = ddlOS.SelectedValue;
						oPrescriptionGenDataInfo.strExaCervix = Convert.ToByte(ddlCervix.SelectedValue);

						//Get Common data types
						oPrescriptionGenDataInfo.strReferredCode = Convert.ToInt16(ddlReferred.SelectedValue);
						oPrescriptionGenDataInfo.strDoctorCode1 = Convert.ToByte(ddlDoctorsName.SelectedValue);


						//Pass Basic Info data types************************************
						oClinicVisitHistory.ClinicVisitID = intMaxClnVisutId;
						oClinicVisitHistory.VisitDate = DateTime.Now;

						oClinicVisitHistory.PatientID = oPrescriptionGenDataInfo.strPatientID;
						oClinicVisitHistory.Relations = oPrescriptionGenDataInfo.strRelations;

						oClinicVisitHistory.PatientAge = oPrescriptionGenDataInfo.strPatientAge;
						oClinicVisitHistory.DrugHistory = oPrescriptionGenDataInfo.strDrugHistory;

						oClinicVisitHistory.DrugAllergy = oPrescriptionGenDataInfo.strDrugAllergy;

						//Pass On examinatin Info data types****************************** 
						oClinicVisitHistory.ExaAnemia = oPrescriptionGenDataInfo.strExaAnemia;
						oClinicVisitHistory.ExaJaundice = oPrescriptionGenDataInfo.strExaJaundice;
						oClinicVisitHistory.ExaClubbing = oPrescriptionGenDataInfo.strExaClubbing;
						oClinicVisitHistory.ExaOedema = oPrescriptionGenDataInfo.strExaOdema;
						oClinicVisitHistory.ExaL_N = oPrescriptionGenDataInfo.strExaL_N;

						oClinicVisitHistory.ExaHeart = oPrescriptionGenDataInfo.strExaHeart;
						oClinicVisitHistory.ExaLung = oPrescriptionGenDataInfo.strExaLung;
						oClinicVisitHistory.ExaLiver = oPrescriptionGenDataInfo.strExaLiver;
						oClinicVisitHistory.ExaSpleen = oPrescriptionGenDataInfo.strExaSpleen;
						oClinicVisitHistory.ExaOthers = oPrescriptionGenDataInfo.strExaOthers;

						//Pass Blood Pressure data types
						oClinicVisitHistory.ExaSystolic = oPrescriptionGenDataInfo.strExaSystolic;
						oClinicVisitHistory.ExaDiastolic = oPrescriptionGenDataInfo.strExaDiastolic;

						oClinicVisitHistory.ExaPulse = oPrescriptionGenDataInfo.strExaPulse;
						oClinicVisitHistory.ExaTemp = oPrescriptionGenDataInfo.strExaTemp;
						oClinicVisitHistory.ExaWt = oPrescriptionGenDataInfo.strExaWt;


						oClinicVisitHistory.ExaVulva = oPrescriptionGenDataInfo.strExaVulva;
						oClinicVisitHistory.ExaVagina = oPrescriptionGenDataInfo.strExaVagina;
						oClinicVisitHistory.ExaOS = oPrescriptionGenDataInfo.strExaOS;
						oClinicVisitHistory.ExaCervix = oPrescriptionGenDataInfo.strExaCervix;



						//Pass Other data data types
						oClinicVisitHistory.ReferredCode = oPrescriptionGenDataInfo.strReferredCode;
						oClinicVisitHistory.DoctorCode1 = oPrescriptionGenDataInfo.strDoctorCode1;

						oClinicVisitHistory.DoctorCode2 = null;
						oClinicVisitHistory.NextVisitDt = null;
						oClinicVisitHistory.EntryDate = DateTime.Now;


						oOPresDataContext.ClinicVisitHistories.InsertOnSubmit(oClinicVisitHistory);
						oOPresDataContext.SubmitChanges();
						#endregion Prescription common data insertion


						//gvCheifComplaince Grid data insert**************************************
						ORM.ChiefComplaince oChiefComplaince = new ORM.ChiefComplaince();
						for (int i = 0; i < gvCheifComplaince.Rows.Count; i++)
						{
							oPrescriptionGridDataInfo.strCCCode = Convert.ToInt16(((DropDownList)gvCheifComplaince.Rows[i].FindControl("ddlChiefComplaince")).SelectedValue);
							oPrescriptionGridDataInfo.strYY = Convert.ToByte(((TextBox)gvCheifComplaince.Rows[i].FindControl("txtDurationYY")).Text);
							oPrescriptionGridDataInfo.strMM = Convert.ToByte(((TextBox)gvCheifComplaince.Rows[i].FindControl("txtDurationMM")).Text);
							oPrescriptionGridDataInfo.strDD = Convert.ToByte(((TextBox)gvCheifComplaince.Rows[i].FindControl("txtDurationDD")).Text);

							oChiefComplaince.VisitID = intMaxClnVisutId;
							oChiefComplaince.CCCode = oPrescriptionGridDataInfo.strCCCode;
							oChiefComplaince.DurationYY = oPrescriptionGridDataInfo.strYY;						
							oChiefComplaince.DurationMM = oPrescriptionGridDataInfo.strMM;
							oChiefComplaince.DurationDD = oPrescriptionGridDataInfo.strDD;
							
							oOPresDataContext.ChiefComplainces.InsertOnSubmit(oChiefComplaince);
							oOPresDataContext.SubmitChanges();

						}

						InitialChiefComplaince();

						//gvProvisionalDx Grid data insert**************************************
						ORM.ProvisionalDx oProvisionalDx = new ORM.ProvisionalDx();
						for (int i = 0; i < gvProvisionalDx.Rows.Count; i++)
						{
							//oPrescriptionDataInfo.strVisitID = strVisitID;
							oPrescriptionGridDataInfo.strProvisionalCode = Convert.ToInt16(((DropDownList)gvProvisionalDx.Rows[i].FindControl("ddlProvisionalDx")).SelectedValue);

							oProvisionalDx.ProClinicVisitID = intMaxClnVisutId;
							oProvisionalDx.ProvisionalCode = oPrescriptionGridDataInfo.strProvisionalCode;

							oOPresDataContext.ProvisionalDxes.InsertOnSubmit(oProvisionalDx);
							oOPresDataContext.SubmitChanges();

						}
						InitialProvisionalDx();

						//gvDifferentialDx Grid data insert**************************************
						if (gvDifferentialDx.Visible == true)
						{
							ORM.DifferentialDx oDifferentialDx = new ORM.DifferentialDx();
							for (int i = 0; i < gvDifferentialDx.Rows.Count; i++)
							{
								//oPrescriptionDataInfo.strVisitID = strVisitID;
								oPrescriptionGridDataInfo.strDifferentialDxCode = Convert.ToInt16(((DropDownList)gvDifferentialDx.Rows[i].FindControl("ddlProvisionalDx")).SelectedValue);

								oDifferentialDx.VisitID = intMaxClnVisutId;
								oDifferentialDx.DifferentialDxCode = oPrescriptionGridDataInfo.strDifferentialDxCode;

								oOPresDataContext.DifferentialDxes.InsertOnSubmit(oDifferentialDx);
								oOPresDataContext.SubmitChanges();
							}
							InitialDifferentialDx();
						}						

						//gvConfirmDx Grid data insert**************************************
						ORM.ConfirmDx oConfirmDx = new ORM.ConfirmDx();
						for (int i = 0; i < gvConfirmDx.Rows.Count; i++)
						{
							oPrescriptionGridDataInfo.strConfirmDxCode = Convert.ToInt16(((DropDownList)gvConfirmDx.Rows[i].FindControl("ddlProvisionalDx")).SelectedValue);

							oConfirmDx.VisitID = intMaxClnVisutId;
							oConfirmDx.ConfirmDxCode = oPrescriptionGridDataInfo.strConfirmDxCode;
							oConfirmDx.VisitDt = dtTranDate;

							oOPresDataContext.ConfirmDxes.InsertOnSubmit(oConfirmDx);
							oOPresDataContext.SubmitChanges();
						}
						InitialConfirmDx();


						//gvTreatment Grid data insert**************************************
						ORM.MedicineDetail oMedicineDetail = new ORM.MedicineDetail();
						for (int i = 0; i < gvTreatment.Rows.Count; i++)
						{
							oPrescriptionGridDataInfo.strMedicineCode = Convert.ToInt16(((DropDownList)gvTreatment.Rows[i].FindControl("ddlMedicineName")).SelectedValue);
							oPrescriptionGridDataInfo.strMedQty = Convert.ToString(((TextBox)gvTreatment.Rows[i].FindControl("txtMedQnt")).Text);
							oPrescriptionGridDataInfo.strFrequencyCode = Convert.ToInt16(((DropDownList)gvTreatment.Rows[i].FindControl("ddlFrequency")).SelectedValue);
							oPrescriptionGridDataInfo.strTreatmentCode = Convert.ToByte(((DropDownList)gvTreatment.Rows[i].FindControl("ddlTreatment")).SelectedValue);


							string strMedicinePrice = (from c in oOPresDataContext.lkp_MedicineNames
													   where c.MedicineCode == oPrescriptionGridDataInfo.strMedicineCode
													   select c.MedicinePrice).SingleOrDefault().ToString();
							

							oMedicineDetail.VisitID = intMaxClnVisutId;
							oMedicineDetail.MedicineCode = oPrescriptionGridDataInfo.strMedicineCode;
							oMedicineDetail.MedVisitDt = dtTranDate;
							oMedicineDetail.FrequencyCode = oPrescriptionGridDataInfo.strFrequencyCode;
							oMedicineDetail.TreatmentCode = oPrescriptionGridDataInfo.strTreatmentCode;

							//oMedicineDetail.MedicinePrices =  Convert.ToDecimal(strMedname);
							oMedicineDetail.MedicinePrices = Convert.ToDecimal(strMedicinePrice);
							oMedicineDetail.MedDispuseDt = null;
							oMedicineDetail.MedReqQty = null;
							oMedicineDetail.MedDispuseDt = null;



							oOPresDataContext.MedicineDetails.InsertOnSubmit(oMedicineDetail);
							oOPresDataContext.SubmitChanges();

						}
						InitialTreatment();

						//gvInvestigation Grid data insert**************************************
						ORM.Investigation oInvestigation = new ORM.Investigation();
						for (int i = 0; i < gvInvestigation.Rows.Count; i++)
						{
							oPrescriptionGridDataInfo.strInvestigationsCode = Convert.ToInt16(((DropDownList)gvInvestigation.Rows[i].FindControl("ddlInvestigation")).SelectedValue);

							oInvestigation.VisitID = intMaxClnVisutId;
							oInvestigation.InvestigationsCode = oPrescriptionGridDataInfo.strInvestigationsCode;
							oInvestigation.VisitDt = dtTranDate;

							oOPresDataContext.Investigations.InsertOnSubmit(oInvestigation);
							oOPresDataContext.SubmitChanges();
						}
						InitialInvestigation();

						//gvPostiveFindings Grid data insert**************************************
						ORM.PositiveFinding oPositiveFinding = new ORM.PositiveFinding();
						for (int i = 0; i < gvPostiveFindings.Rows.Count; i++)
						{
							oPrescriptionGridDataInfo.strPositiveCode = Convert.ToInt16(((DropDownList)gvPostiveFindings.Rows[i].FindControl("ddlPostiveFindings")).SelectedValue);

							oPositiveFinding.ClinicVisitID = intMaxClnVisutId;
							oPositiveFinding.PositiveCode = oPrescriptionGridDataInfo.strPositiveCode;

							oOPresDataContext.PositiveFindings.InsertOnSubmit(oPositiveFinding);
							oOPresDataContext.SubmitChanges();
						}
						InitialPostiveFindings();

						
						//gvNegativeFindings Grid data insert**************************************
						ORM.NegativeFinding oNegativeFinding = new ORM.NegativeFinding();
						for (int i = 0; i < gvNegativeFindings.Rows.Count; i++)
						{
							oPrescriptionGridDataInfo.strNegativeCode = Convert.ToInt16(((DropDownList)gvNegativeFindings.Rows[i].FindControl("ddlNegativeFindings")).SelectedValue);

							oNegativeFinding.ClinicVisitID = intMaxClnVisutId;
							oNegativeFinding.NegativeCode = oPrescriptionGridDataInfo.strNegativeCode;

							oOPresDataContext.NegativeFindings.InsertOnSubmit(oNegativeFinding);
							oOPresDataContext.SubmitChanges();

						}
						InitialNegativeFindings();

						//gvDentalSign Grid data insert**************************************
						ORM.DentalSign oDentalSign = new ORM.DentalSign();
						for (int i = 0; i < gvDentalSign.Rows.Count; i++)
						{
							oPrescriptionGridDataInfo.strDenSignCode = Convert.ToInt16(((DropDownList)gvDentalSign.Rows[i].FindControl("ddlDentalSign")).SelectedValue);
							oPrescriptionGridDataInfo.strSignTeethNo = Convert.ToString(((TextBox)gvDentalSign.Rows[i].FindControl("txtSignTeethNo")).Text);

							oDentalSign.DenSignVisitID = intMaxClnVisutId;
							oDentalSign.DenSignCode = oPrescriptionGridDataInfo.strDenSignCode;
							oDentalSign.SignTeethNo = oPrescriptionGridDataInfo.strSignTeethNo;

							oOPresDataContext.DentalSigns.InsertOnSubmit(oDentalSign);
							oOPresDataContext.SubmitChanges();
						}
						InitialDentalSign();

						//gvDentalAdvice Grid data insert**************************************
						ORM.DentalAdvice oDentalAdvice = new ORM.DentalAdvice();
						for (int i = 0; i < gvDentalAdvice.Rows.Count; i++)
						{
							oPrescriptionGridDataInfo.strDenAdviceCode = Convert.ToString(((DropDownList)gvDentalAdvice.Rows[i].FindControl("ddlDentalAdvice")).SelectedValue);
							oPrescriptionGridDataInfo.strDenAdviceTeethNo = Convert.ToString(((TextBox)gvDentalAdvice.Rows[i].FindControl("txtDenAdviceTeethNo")).Text);

							oDentalAdvice.DenAdviceVisitID = intMaxClnVisutId;
							oDentalAdvice.DenAdviceCode = oPrescriptionGridDataInfo.strDenSignCode;
							oDentalAdvice.DenAdviceTeethNo = oPrescriptionGridDataInfo.strSignTeethNo;

							oOPresDataContext.DentalAdvices.InsertOnSubmit(oDentalAdvice);
							oOPresDataContext.SubmitChanges();

						}
						InitialDentalAdvice();

						////ddlAdvice Grid data insert**************************************
						//for (int i = 0; i < ddlAdvice.Items.Count; i++)
						//{
						//    oPrescriptionDataInfo.strAdviceCode = Convert.ToString(((DropDownList)gvDentalAdvice.Rows[i].FindControl("ddlDentalAdvice")).SelectedValue);

						//    new clsPrescriptionSQL().insertAdviceBangla(oPrescriptionDataInfo);
						//}
						//ddlAdvice.SelectedIndex = 0;



						//gvAdvice Grid data insert**************************************
						ORM.AdviceBangla oAdviceBangla = new ORM.AdviceBangla();
						for (int i = 0; i < gvAdvice.Rows.Count; i++)
						{
							oPrescriptionGridDataInfo.strAdviceCode = Convert.ToByte(((DropDownList)gvAdvice.Rows[i].FindControl("ddlAdvice")).SelectedValue);

							oAdviceBangla.VisitID = intMaxClnVisutId;
							oAdviceBangla.AdviceCode = oPrescriptionGridDataInfo.strAdviceCode;
							oAdviceBangla.VisitDt = dtTranDate;

							oOPresDataContext.AdviceBanglas.InsertOnSubmit(oAdviceBangla);
							oOPresDataContext.SubmitChanges();
						}
						InitialAdvice();


						scope.Complete();
						Response.Redirect(Request.Url.AbsoluteUri);
						ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "msg", "alert('Data Save Successfully.')", true);
						
						//sqlTran.Commit();
					}
					catch (Exception ex)
					{
						// Handle the exception if the transaction fails to commit.
						Console.WriteLine(ex.Message);

						try
						{
							// Attempt to roll back the transaction.
							//sqlTran.Rollback();
							Transaction.Current.Rollback();
						}
						catch (Exception exRollback)
						{
							// Throws an InvalidOperationException if the connection 
							// is closed or the transaction has already been rolled 
							// back on the server.
							Console.WriteLine(exRollback.Message);
						}
					}

					finally
					{
						Application.UnLock();
					}
				}
			}
		}

	
		protected void btnCancel_Click(object sender, EventArgs e)
		{
			this.ClientScript.RegisterClientScriptBlock(this.GetType(), "Close", "window.close()", true);
		}




		protected void lbtnAdd_Click(object sender, EventArgs e)
		{
			#region Differential Dx load
			// Initialize the DataTable and store it in ViewState.
			if (Page.IsPostBack)
			{
				InitialDifferentialDx();
				gvDifferentialDx.Visible = true;
			}

			#endregion Differential Dx Load

			lbtnAddNewDifferentialDx.Visible = false;
			lbtnCancelDifferentialDx.Visible = true;

			gvDifferentialDx.Visible = true;
		}

		protected void lbtnCancelDifferentialDx_Click(object sender, EventArgs e)
		{

			for (int i = 0; i <= gvDifferentialDx.Rows.Count; i++)
				gvDifferentialDx.DeleteRow(i);


			gvDifferentialDx.Visible = false;
			lbtnAddNewDifferentialDx.Visible = true;
			lbtnCancelDifferentialDx.Visible = false;
		}


	}
}

