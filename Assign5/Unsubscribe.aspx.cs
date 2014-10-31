using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assign5
{
    public partial class Unsubscribe : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUnsubscribe_Click(object sender, EventArgs e)
        {
            SqlConnection dbConnection = new SqlConnection("");

            try
            {

                dbConnection.Open();
                

                string SQLString = "UPDATE usertable SET Subscribe=0 WHERE UserID='" + txtUsername.Text + "'";
                SqlCommand checkIDTable1 = new SqlCommand(SQLString, dbConnection);
                checkIDTable1.ExecuteNonQuery();

                dbConnection.Close();
            }
            catch (SqlException exception)
            {

                Response.Write("<p>Error code " + exception.Number
                    + ": " + exception.Message + "</p>");
               
            }
            Response.Redirect("Default.aspx");
        }
    }
}