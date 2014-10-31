using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Assign5
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usession"] != null)
            {
                Response.Redirect("Confirmation.aspx");
                return;
            }
            TextBox1.Focus();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            SqlConnection dbConnection = new SqlConnection("");

            try
            {
                dbConnection.Open();
                
            }
            catch (SqlException exception)
            {
                Label1.Text="<p>Error code " + exception.Number
                        + ": " + exception.Message + "</p>";
            }
            finally
            {
                Console.Write("Successfully selected the database");
            }
            try
            {

                string SQLString = "SELECT * FROM logintable WHERE UserID='" + TextBox1.Text + "'";
                SqlCommand checkIDTable = new SqlCommand(SQLString, dbConnection);
                SqlDataReader userdata = checkIDTable.ExecuteReader();
                if (userdata.Read())
                {
                    if (userdata["UserID"].Equals(TextBox1.Text) && userdata["Password"].Equals(TextBox2.Text))
                    {
                        Session["usession"] = TextBox1.Text;
                        Response.Redirect("Confirmation.aspx");
                    }
                    else
                    {
                        LinkButtonforgot.Visible = true;
                        Label1.Text="You have entered Wrong Credentials. Please Try Again!!!!";
                    }
                }
                else
                {
                    Label1.Text="You have entered Wrong Credentials. Please Try Again!!!!";
                }
                userdata.Close();
                dbConnection.Close();
            }
            catch (SqlException exception)
            {
                    Label1.Text="<p>Error code " + exception.Number
                    + ": " + exception.Message + "</p>";
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("SignUp.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("StockQuote.aspx");
        }

        protected void LinkButtonforgot_Click(object sender, EventArgs e)
        {
            Response.Redirect("forgotpass.aspx");
        }
    }
}