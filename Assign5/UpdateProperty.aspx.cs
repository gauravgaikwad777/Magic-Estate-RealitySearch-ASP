using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Net.Mail;

namespace Assign5
{
    public partial class UpdateProperty : System.Web.UI.Page
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
                string SQLString = "SELECT * FROM property WHERE property_id='" 
                    + Request.QueryString["property_id"] + "'";
                SqlCommand checkIDTable = new SqlCommand(SQLString, dbConnection);
                SqlDataReader userdata = checkIDTable.ExecuteReader();
                userdata.Read();

                TextBox1.Text = Convert.ToString(userdata["Title"]);
                TextBox2.Text = Convert.ToString(userdata["Description"]);
                string category = Convert.ToString(userdata["category"]);
                RadioButtonList1.Items.FindByValue(category).Selected = true;
                TextBox3.Text = Convert.ToString(userdata["Cost"]);
                TextBox4.Text = Convert.ToString(userdata["Size"]);
                TextBox5.Text = Convert.ToString(userdata["Summary"]);
                TextBox6.Text = Convert.ToString(userdata["Address"]);
                string ImagePath = Convert.ToString(userdata["ImagePath"]);
                prop_img.Text="<img src="+ImagePath+" height='80' width='90'/>";
               
                TextBox7.Text = Convert.ToString(userdata["owner_email"]);
         
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
            string title = TextBox1.Text;
            string descrip = TextBox2.Text;
            string cost = TextBox3.Text;
            string size = TextBox4.Text;
            string cat = RadioButtonList1.SelectedItem.Value;
            string sumarry = TextBox5.Text;
            string address = TextBox6.Text;
            string owneremail = TextBox7.Text;

            String ImagePath = "";

            if (uplPhoto.HasFile)
            {
                try
                {
                    uplPhoto.SaveAs(Server.MapPath("~/images/" +
                    uplPhoto.FileName));
                    ImagePath = "images/" +
                    uplPhoto.FileName;
                }
                catch (Exception ex)
                {
                    Response.Write("Error: " + ex.Message.ToString());
                }
            }
            else
            {
                //new one starts
                SqlConnection dbConnection1 = new SqlConnection("; MultipleActiveResultSets=True");
                try
                {
                    dbConnection1.Open();
                 
                    string SQLString = "SELECT * FROM property WHERE property_id='" + Request.QueryString["property_id"] + "'";
                    SqlCommand checkIDTable = new SqlCommand(SQLString, dbConnection1);
                    SqlDataReader idRecords = checkIDTable.ExecuteReader();

                    if (idRecords.Read())
                    {
                      string sq = "UPDATE property SET ImagePath='"
                       + ImagePath + "'WHERE property_id='" + Request.QueryString["property_id"] + "'";
                        SqlCommand checkIDTable1 = new SqlCommand(sq, dbConnection1);
                        checkIDTable1.ExecuteNonQuery();

                        dbConnection1.Close();

                    }

                }
                catch (SqlException exception)
                {
                    Response.Write("<p>Error code " + exception.Number
                             + ": " + exception.Message + "</p>");
                }
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
                string studentInfo = "UPDATE property SET Title='"
                    + title + "', Description='"
                    + descrip + "', Cost='"
                    + cost + "', Size='"
                    + size + "', Summary='"
                    + sumarry + "', category='"
                    + cat + "',ImagePath='"
                    + ImagePath + "', Address='"
                    + address + "', owner_email='"
                    + owneremail + "'WHERE property_id='" + Request.QueryString["property_id"] + "'";

                SqlCommand sqlCommand = new SqlCommand(studentInfo, dbConnection);
                sqlCommand.ExecuteNonQuery();

                dbConnection.Close();

                if (CheckBox1.Checked)
                {
                    SmtpClient mailClient = new SmtpClient();
                    MailMessage mail = new MailMessage("magicestate3@gmail.com", owneremail);

                    string body = "Congratulations, you have successfully posted the property listing!! <br/>Title : " + title +
                        "<br /> Category : " + cat +
                        "<br /> Cost : " + cost +
                        "<br /> Size : " + size +
                        "<br /> Description : " + descrip +
                        "<br /> Summary : " + sumarry +
                        "<br /> Address : " + address +
                        "<br/>";

                    string path = Server.MapPath("images/isulogo.jpg");
                    LinkedResource logo = new LinkedResource(path);
                    logo.ContentId = "MyLogo";
                    AlternateView altview = AlternateView.CreateAlternateViewFromString("<img src=cid:MyLogo/><br />" + body, null, "text/html");
                    altview.LinkedResources.Add(logo);

                    mail.AlternateViews.Add(altview);

                    mail.Subject = "Property Posting Confirmation";
                    mailClient.Send(mail);
                }
            }

            Response.Redirect("Confirmation.aspx");

        }

        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("searchad.aspx");
        }






    }
}