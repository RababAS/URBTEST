using System;
using System.Collections.Generic;

using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using System.Web;
using System.Linq;

using System.Web.UI;

namespace OnlineOutPatientManagementSystem.Accounts
{
    public partial class LogIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            var userStore = new UserStore<IdentityUser>();
            var manager = new UserManager<IdentityUser>(userStore);

            IdentityUser user = manager.Find(txtUserName.Text, txtPassword.Text);

            if (user != null)
            {
                var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
                var userIdentity = manager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie);
                
                authenticationManager.SignIn(new AuthenticationProperties() { IsPersistent = false }, userIdentity);

                if (Request.QueryString["ReturnUrl"] == null)
                    Response.Redirect("~/Default.aspx");
				else
					Response.Redirect(Request.QueryString["ReturnUrl"]);

                    
               
             
            }
            else
            {
                lblErrorMessage.Text = "Invalid UserID or Password";
            }
        }

         
    }
}