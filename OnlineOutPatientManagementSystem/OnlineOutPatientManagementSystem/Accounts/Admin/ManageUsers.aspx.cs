using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using System.Collections;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using OnlineOutPatientManagementSystem.CommonCls;

namespace OnlineOutPatientManagementSystem.Accounts.Admin
{
    public partial class ManageUsers : System.Web.UI.Page
    {
        OnlineOutPatientManagementSystem.ORM.OnLinePrescriptionDataContext OPDbContext = new ORM.OnLinePrescriptionDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
           // RadGridUserList.DataSource = from users in OPDbContext.AspNetUsers select users;
            
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
          

        }

        protected void RadGridUserList_InsertCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            var editableitem = ((GridEditableItem)e.Item);
            UserControl userControl = (UserControl)e.Item.FindControl(GridEditFormItem.EditFormUserControlID);


           
            ///
            var useStore = new UserStore<AppUser>(new ApplicationDbContext());
            var manager = new UserManager<AppUser>(useStore);

          

            string LogInUserName=(editableitem.FindControl("RtxtLoginID") as RadTextBox).Text.Trim();
          
            var user = new AppUser { UserName = LogInUserName, FName = (editableitem.FindControl("RtxtFirstName") as RadTextBox).Text, LName = (editableitem.FindControl("RtxtLastName") as RadTextBox).Text };
            IdentityResult result = manager.Create(user, (editableitem.FindControl("RtxtPassword") as RadTextBox).Text);
           
            
            if (result.Succeeded)
            {
                //Get The Current Created UserInfo
                AppUser CreatedUser = manager.FindByName(LogInUserName);

                var RoleAddResult = manager.AddToRole(CreatedUser.Id.Trim(), (editableitem.FindControl("RDDListRole") as RadDropDownList).SelectedItem.Text.Trim());

                lblMessage.Text = string.Format("User {0} is creted successfully", user.UserName);
            }
              
            else
            {

                lblMessage.Text = result.Errors.FirstOrDefault();
                e.Canceled = true;
            }
                    
            
            
        
        }
        


    }
}