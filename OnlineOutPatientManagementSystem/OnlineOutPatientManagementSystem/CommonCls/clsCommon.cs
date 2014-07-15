using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
namespace OnlineOutPatientManagementSystem.CommonCls
{
	public class clsCommon
	{
		//public void Set_Focus(string controlname)
		//{
		//	string strScript;

		//	strScript = "<script language=javascript> document.all('" + controlname + "').focus() </script>";
		//	RegisterStartupScript("focus", strScript);
		//}
	}
    public class AppUser : IdentityUser
    {
        public string FName { get; set; }
        public string LName { get; set; }
    }
    public class ApplicationDbContext : IdentityDbContext<AppUser>
    {
        public ApplicationDbContext()
            : base("DefaultConnection")
        {
        }
    }
}