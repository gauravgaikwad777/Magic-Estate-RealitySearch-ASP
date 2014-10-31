using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.Net.Mail;

namespace Assign5
{
    public partial class forgotpass : System.Web.UI.Page
    {
       

        protected void recover_Click(object sender, EventArgs e)
        {
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

                string SQLString = "SELECT * FROM usertable WHERE UserID='" + TextBox1.Text + "'";
                SqlCommand checkIDTable = new SqlCommand(SQLString, dbConnection);
                SqlDataReader userdata = checkIDTable.ExecuteReader();
                if (userdata.Read())
                {
                    if (userdata["UserID"].Equals(TextBox1.Text))
                    {
                        SmtpClient mailClient = new SmtpClient();
                        MailMessage mail = new MailMessage("magicestate3@gmail.com", userdata["Email"].ToString());
                        mail.IsBodyHtml = true;
                        string body = "Congratulations, you have successfully retrieved your Password !! Your Credentials are as follows: <br/>" +
                            "<br /> Username: " + userdata["UserID"] +
                            "<br /> Password : " + userdata["Password"] +
                            "<br/> If you have any questions or trouble logging on please contact a site administrator.<br/> Thank you! ";

                        mail.Body = body;
                        mail.Subject = "Password Retrieval - Magic Estate";
                        mailClient.Send(mail);
                        Label1.Text = "An Email with your Password has been sent to the email associated with the specified Username above";
                    }
                    else
                    {
                        Label1.Text="You have entered Wrong Username! Please Try Again!!!!";
                    }
                }
                else
                {
                    Label1.Text = "You have entered Wrong Username! Please Try Again!!!!";
                }
                userdata.Close();
                dbConnection.Close();
                
            }
            catch (SqlException exception)
            {
                Response.Write("<p>Error code " + exception.Number
                + ": " + exception.Message + "</p>");
            }

        }

        protected void back_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

    }
}
