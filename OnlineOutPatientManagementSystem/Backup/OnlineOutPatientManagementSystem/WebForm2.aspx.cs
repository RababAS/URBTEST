using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace OnlineOutPatientManagementSystem
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //// Define the name and type of the client scripts on the page.
            //String csname1 = "PopupScript";
            //Type cstype = this.GetType();

            //// Get a ClientScriptManager reference from the Page class.
            //ClientScriptManager cs = Page.ClientScript;

            //// Check to see if the startup script is already registered.
            //if (!cs.IsStartupScriptRegistered(cstype, csname1))
            //{
            //    StringBuilder cstext1 = new StringBuilder();
            //    cstext1.Append("<script type=text/javascript> alert('Hello World!') </");
            //    cstext1.Append("script>");

            //    cs.RegisterStartupScript(cstype, csname1, cstext1.ToString());
            //}


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string radalertscript = "<script language='javascript'>function f(){alert('Welcome to RadWindow for <strong>ASP.NET AJAX</strong>!'); </script>";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "radalert", radalertscript);

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            RadWindowManager1.RadAlert("Please Find a Prescription First!!", 200, 200, "Alert!!", null);
            return;
            RadAjaxManager1.ResponseScripts.Add(string.Format("window.radalert(\"Duplicate Data!\")"));
            TextBox1.Text = "dadsf";
        }
    }
}