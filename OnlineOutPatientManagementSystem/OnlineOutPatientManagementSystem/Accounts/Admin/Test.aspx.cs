using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineOutPatientManagementSystem.Accounts.Admin
{
    public partial class Test : System.Web.UI.Page
    {
        OnlineOutPatientManagementSystem.ORM.OnLinePrescriptionDataContext OPDbContext = new ORM.OnLinePrescriptionDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            RadGridUserList.DataSource = from users in OPDbContext.AspNetUsers select users;

        }
    }
}