using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;

namespace URBControlPanel.Account
{
    public partial class LogInURB : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

           // RegisterHyperLink.NavigateUrl = "Register.aspx?ReturnUrl=" + HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
        
            var userStore = new UserStore<IdentityUser>();
            var manager = new UserManager<IdentityUser>(userStore);

            IdentityUser user = manager.Find(LoginUser.UserName, LoginUser.Password);

            if (user != null)
            {
                var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
                var userIdentity = manager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie);

                authenticationManager.SignIn(new AuthenticationProperties() { IsPersistent = false }, userIdentity);

                if (Request.QueryString["ReturnUrl"] == null)
                    Response.Redirect("../Default.aspx");
                else
                    Response.Redirect(Request.QueryString["ReturnUrl"]);


            }
            else
            {
                LoginUser.FailureText = "Invalid User Name or Password";
                
            }
                
        }

        protected void LoginUser_LoginError(object sender, EventArgs e)
        {
            LoginUser.FailureText = "Invalid User Name or Password";
        }

        
    }
}