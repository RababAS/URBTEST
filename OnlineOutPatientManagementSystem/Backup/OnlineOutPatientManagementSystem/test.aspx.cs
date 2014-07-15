using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace OnlineOutPatientManagementSystem
{
    public partial class test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
             // ResourceManager RM = new ResourceManager("ErrorMessages",System.Reflection.Assembly.GetExecutingAssembly());
        //comma

            Label1.Text = "<script type='text/javascript'>hell()</script>";

        }
    }
}