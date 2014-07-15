using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using OnlineOutPatientManagementSystem.CommonCls;
namespace OnlineOutPatientManagementSystem.Accounts.Admin
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnRegister_Click(object sender, EventArgs e)
        {

            var useStore = new UserStore<AppUser>(new ApplicationDbContext());
            var manager = new UserManager<AppUser>(useStore);

           // var user = new ApplicationUser() { UserName = model.UserName.Trim(), FirstName = model.FName, LastName = model.LName };
            
            
            //var user = new IdentityUser { UserName = TextBox1.Text };
            var user = new AppUser { UserName = TextBox1.Text,FName="rabab",LName="shams" };
            IdentityResult result = manager.Create(user, TextBox2.Text);
            if (result.Succeeded)
                Label1.Text = string.Format("user {0} creted successfully", user.Id);
            else
                Label1.Text = result.Errors.FirstOrDefault();   
        }
        
    }
}