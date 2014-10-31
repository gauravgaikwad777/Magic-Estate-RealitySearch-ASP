using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assign5
{
    public partial class chechkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lbltotalcost.Text=" Cost: $" +Session["costfinal"].ToString()+" ";
        }

        protected void shipButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Shipped.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("shoppingcart.aspx");
        }
    }
}