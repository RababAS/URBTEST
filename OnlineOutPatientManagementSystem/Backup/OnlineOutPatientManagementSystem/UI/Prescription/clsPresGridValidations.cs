using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace OnlineOutPatientManagementSystem.UI.Prescription
{
	public class clsPresGridValidations
	{
		public bool GridDublicateCheck(GridView gvDupValCheck, string strddlPass)
		{
			int TotalRecord = gvDupValCheck.Rows.Count;
			DropDownList ddlAddNew = (DropDownList)gvDupValCheck.Rows[TotalRecord - 1].Cells[1].FindControl(strddlPass);
			int rowIndex = 0;

			if (TotalRecord > 1)
			{
				for (int i = 0; i < TotalRecord - 1; i++)
				{
					DropDownList ddlCompare = (DropDownList)gvDupValCheck.Rows[rowIndex].Cells[1].FindControl(strddlPass);
					if (ddlAddNew.SelectedValue == ddlCompare.SelectedValue)
					{
						ddlAddNew.Focus();
						return true;
					}
					rowIndex++;
				}
			}

			return false;
		}
	}
}