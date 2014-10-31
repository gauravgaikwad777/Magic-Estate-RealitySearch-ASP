using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assign5
{
    public partial class EWelcome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SignIn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void SignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("SignUp.aspx");
        }
    }
}