using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Assign5
{
    public partial class DeleteProperty : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usession"] == null)
            {
                Response.Redirect("EWelcome.aspx");
                return;
            }
            string sessionadmin = Session["usession"].ToString();
            if (sessionadmin != "MagicEstate")
            {
                Response.Redirect("EWelcome.aspx");
                return;
            }

            SqlConnection dbConnection = new SqlConnection("");
            try
            {
                dbConnection.Open();
                

            }
            catch (SqlException exception)
            {
                Response.Write("<p>Error code " + exception.Number
                        + ": " + exception.Message + "</p>");
            }
            finally
            {
                Console.Write("Successfully selected the database");
            }
            try
            {

                string studentInfo = "DELETE from property WHERE property_id='" + Request.QueryString["property_id"] + "'";

                SqlCommand sqlCommand = new SqlCommand(studentInfo, dbConnection);
                sqlCommand.ExecuteNonQuery();

            }

            catch (SqlException exception)
            {
                Response.Write("<p>Error code " + exception.Number
                    + ": " + exception.Message + "</p>");
                Response.Redirect("Login.aspx");
            }
            finally
            {
                dbConnection.Close();
            }


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("searchad.aspx");
        }
    }
}