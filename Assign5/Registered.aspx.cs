using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Assign5
{
    public partial class Registered : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usession"] == null)
            {
                Response.Redirect("EWelcome.aspx");
                return;
            }

            //Label1.Text = Request.QueryString["Parameter"];
            //Response.Write(Label1.Text);
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
                    Label1.Text = "<h3>Welcome " + userdata["FirstName"] + ", " + userdata["LastName"] + " </h3>";
                Label1.Text += "Your UserId is <b>" + userdata["UserID"] + "</b> <br />";
                Label1.Text += "Your Password id " + userdata["Password"] + " <br />";
                Label1.Text += "You Email ID is " + userdata["Email"] + " <br />";
                Label1.Text += "Security Question : " + userdata["SecurityQuestion"] + " <br />";
                Label1.Text += "Security Answers : " + userdata["SecurityAnswer"];

                userdata.Close();
                dbConnection.Close();
            }
            catch (SqlException exception)
            {
                Response.Write("<p>Error code " + exception.Number
                + ": " + exception.Message + "</p>");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("confirmation.aspx");
        }


    }
}