using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Collections.Specialized;
using System.Configuration;

namespace Assign5
{
    public partial class postad : System.Web.UI.Page
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
            else
            {
                Response.Write("Please verify the file.");
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
                string studentInfo = "INSERT INTO property VALUES('"
                    + title + "', '"
                    + descrip + "', '"
                    + cost + "', '"
                    + size + "', '"
                    + sumarry + "', '"
                    + cat + "','"
                    + ImagePath + "', '"
                    + address + "', '"
                    + owneremail + "', '"
                    + 0 + "')";

                SqlCommand sqlCommand = new SqlCommand(studentInfo, dbConnection);
                sqlCommand.ExecuteNonQuery();
                string idString = "SELECT IDENT_CURRENT('property') AS property_id";
                SqlCommand newID = new SqlCommand(idString, dbConnection);
                SqlDataReader propertyrecord = newID.ExecuteReader();
                propertyrecord.Read();
                string property_id = Convert.ToString(propertyrecord["property_id"]);
                propertyrecord.Close();
                dbConnection.Close();
                SendSubscribeEmails(property_id);
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

        private void SendSubscribeEmails(string PropertyID)
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
                String Query = "select * from usertable where ";
                Query += " costmin <= " + TextBox3.Text;
                Query += " and costmax >= " + TextBox3.Text;
                Query += " and sizemin <= " + TextBox4.Text;
                Query += " and sizemax >= " + TextBox4.Text;
                Query += " and category like '%" + RadioButtonList1.SelectedValue + "%'";
                Query += " and Subscribe = 1 ";

                SqlCommand checkIDTable = new SqlCommand(Query, dbConnection);
                SqlDataReader idRecords = checkIDTable.ExecuteReader();
                while (idRecords.Read())
                {
                    SmtpClient mailClient = new SmtpClient();
                    MailMessage mail = new MailMessage("magicestate3@gmail.com", idRecords["email"].ToString());
                    NameValueCollection appSettings =
      ConfigurationManager.AppSettings;

                    string body = "<br/>Title : " + TextBox1.Text +
                        "<br /> Category : " + RadioButtonList1.SelectedValue +
                        "<br /> Cost : " + TextBox3.Text +
                        "<br /> Size : " + TextBox4.Text +
                        "<br /> Description : " + TextBox2.Text +
                        "<br /> <a href='" + appSettings["SiteRootUrl"] + "/propertyinfo.aspx?property_id=" + PropertyID.ToString() + "'>Click Here </a> to view the property details." +
                       "<br/><br/><br/>" +" <a href='" + appSettings["SiteRootUrl"] +"Unsubscribe.aspx'>Click Here</a> to unsubscribe";



                    mail.Body = body;

                    mail.IsBodyHtml = true;
                    mail.Subject = "Property Posting - Magic Estate";
                    mailClient.Send(mail);

                }




            }
        }

        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("Confirmation.aspx");
        }
    }
}

