using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Assign5
{
    public partial class Confirmation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usession"] == null)
            {
                Response.Redirect("EWelcome.aspx");
                return;
            }
            string sessionadmin = Session["usession"].ToString();
            if (sessionadmin!="MagicEstate")
            {
                Button1.Visible = false;
            }
            else
            {
                Button1.Visible = true;
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

                string SQLString = "SELECT * FROM usertable WHERE UserID='" + Session["usession"] + "'";
                SqlCommand checkIDTable = new SqlCommand(SQLString, dbConnection);
                SqlDataReader userdata = checkIDTable.ExecuteReader();

                if (userdata.Read())
                {
                    Label1.Text = "<h3>Welcome " + userdata["LastName"] + ", " + userdata["FirstName"] + " </h3>";
                    Label1.Text += "Your Username is " + userdata["UserID"] + " <br />";
                    Label1.Text += "You Email ID is " + userdata["Email"] + " <br />";
                    
                }
                userdata.Close();
                dbConnection.Close();
            }
            catch (SqlException exception)
            {
                Response.Write("<p>Error code " + exception.Number + ": " + exception.Message + "</p>");
            }
        }

        protected void Edit_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditProfile.aspx");
        }

        protected void SignOut_Click(object sender, EventArgs e)
        {
            Session["usession"] = "";
            Session.Clear();

            Response.Redirect("Login.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("postad.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("searchad.aspx");
        }
    }
}