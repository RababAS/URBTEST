using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace OnlineOutPatientManagementSystem.UI.Receiption
{
	public partial class RegistrationGrid : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			LoadGridData();
		}
		public void LoadGridData()
		{
			RGridPatientView.DataSource=null;
			RGridPatientView.DataSource = BL.Classes.LookUp.GetRegistrationDataForGrid();
			RGridPatientView.DataBind();
		}
	}
}