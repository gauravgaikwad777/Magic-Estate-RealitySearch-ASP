using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Assign5
{
    public partial class EditProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void Page_LoadComplete(object sender, EventArgs e)
        {
            if (Session["usession"] == null)
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

                string SQLString = "SELECT * FROM usertable WHERE UserID='" + Session["usession"].ToString() + "'";
                SqlCommand checkIDTable = new SqlCommand(SQLString, dbConnection);
                SqlDataReader userdata = checkIDTable.ExecuteReader();
                userdata.Read();

                TextBox1.Text = Convert.ToString(userdata["FirstName"]);
                TextBox2.Text = Convert.ToString(userdata["LastName"]);
                TextBox3.Text = Convert.ToString(userdata["UserID"]);
                TextBox4.Text = Convert.ToString(userdata["Password"]);
                TextBox5.Text = Convert.ToString(userdata["ConfirmPassword"]);
                TextBox6.Text = Convert.ToString(userdata["Email"]);
                TextBox7.Text = Convert.ToString(userdata["SecurityQuestion"]);
                TextBox8.Text = Convert.ToString(userdata["SecurityAnswer"]);
                userdata.Close();
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
            SqlConnection dbConnection = new SqlConnection("");

            try
            {

                dbConnection.Open();
                

                string first = TextBox1.Text;
                string last = TextBox2.Text;
                string userid = TextBox3.Text;
                string pass = TextBox4.Text;
                string cpass = TextBox5.Text;
                string email = TextBox6.Text;
                string securQ = TextBox7.Text;
                string securA = TextBox8.Text;

                string SQLString = "UPDATE usertable SET FirstName='" + first + "',LastName='" + last +
                                                        "', Password='" + pass +
                                                        "', ConfirmPassword='" + cpass +
                                                        "', Email='" + email +
                                                        "', SecurityQuestion='" + securQ +
                                                        "', SecurityAnswer='" + securA +
                                                        "' WHERE UserID='" + Session["usession"].ToString() + "'";
                SqlCommand checkIDTable1 = new SqlCommand(SQLString, dbConnection);
                checkIDTable1.ExecuteNonQuery();

                string sq = "UPDATE logintable SET Password='" + pass + "' WHERE UserID='" + Session["usession"].ToString() + "'";
                SqlCommand checkIDTable = new SqlCommand(sq, dbConnection);
                checkIDTable.ExecuteNonQuery();

                dbConnection.Close();
                Response.Redirect("Confirmation.aspx");

            }
            catch (SqlException exception)
            {

                Response.Write("<p>Error code " + exception.Number
                    + ": " + exception.Message + "</p>");
                Response.Redirect("Login.aspx");
            }

        }

        protected void SignOut_Click(object sender, EventArgs e)
        {
            Session["usession"] = "";
            Session.Clear();
            Response.Redirect("Default.aspx");

        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }

        protected void back_Click(object sender, EventArgs e)
        {
            Response.Redirect("Confirmation.aspx");
        }
    }
}