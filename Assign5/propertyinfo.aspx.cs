using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Xml;
using System.IO;

namespace Assign5
{
    public partial class propertyinfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
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
                string SQLString = "SELECT * FROM property WHERE property_id='" + Request.QueryString["property_id"] + "'";
                SqlCommand checkIDTable = new SqlCommand(SQLString, dbConnection);
                SqlDataReader idRecords = checkIDTable.ExecuteReader();

                if (idRecords.Read())
                {

                    int v = Convert.ToInt32(idRecords["visit_count"]) + 1;

                    string sq = "UPDATE property SET visit_count='" + v + "' WHERE property_id='" + Request.QueryString["property_id"] + "'";
                    SqlCommand checkIDTable1 = new SqlCommand(sq, dbConnection);
                    checkIDTable1.ExecuteNonQuery();
                   
                    Labelproperty.Text = "<h3> " + idRecords["Title"] + " </h3>";
                    Labelproperty.Text += "<img src='" + idRecords["ImagePath"] + "' style='width: 300px; height: 300px; color:black; border-radius:20px; border:2px solid black'/>";
                    Labelproperty.Text += "<b>Detailed information</b>: <br/>" + idRecords["Description"] + " <br />";
                    Labelproperty.Text += "<b>Cost</b>: $" + idRecords["Cost"] + " <br />";
                    Labelproperty.Text += "<b>Size</b>: sqmt" + idRecords["Size"] + " <br />";
                    Labelproperty.Text += "<b>Summary</b>: " + idRecords["Summary"] + " <br />";
                    Labelproperty.Text += "<b>Category<b>: " + idRecords["category"] + " <br /><br />";
                    
                    string address = (DBNull.Value.Equals(idRecords["Address"]) ? "" : idRecords["Address"].ToString());
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "ScriptKey", "initialize('" + address + "');", true);
                    try
                    {

                        System.Net.HttpWebRequest obj = (System.Net.HttpWebRequest)System.Net.WebRequest.Create("http://www.zillow.com/webservice/GetSearchResults.htm?zws-id=X1-ZWz1docp5aqn0r_13bwv&address=" + address.Split(',')[0].ToString().Replace(" ","") + "&citystatezip=" + (address.Split(',').Length > 1 ? address.Split(',')[1].ToString():"IL"));
                        var Response = obj.GetResponse();
                        StreamReader htr = new StreamReader(Response.GetResponseStream(), System.Text.Encoding.GetEncoding("utf-8"));
                        String strdata = htr.ReadToEnd();
                        htr.Close();
                        Response.Close();

                        XmlDocument doc = new XmlDocument();
                        doc.LoadXml(strdata);
                        
                        XmlNode result=doc.ChildNodes[1].SelectSingleNode("response/results");

                        foreach (XmlNode res in result.ChildNodes)
                        {
                            XmlNode graphsanddata = res.SelectSingleNode("links/graphsanddata");
                            if (graphsanddata != null)
                            { 
                            lblZillowData.Text = "<a target='_blank' style='color:black;' href='" + graphsanddata.InnerText + "'><h2>Surrounding Properties from Zillow</h2></a>";
                            break;
                            }

                        }
                    }
                    catch
                    {

                    }

                }
                idRecords.Close();
                dbConnection.Close();


            }
            catch (SqlException exception)
            {
                Response.Write("<p>Error code " + exception.Number + ": " + exception.Message + "</p>");
            }
          


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["cart"] == null)
            {

                List<String> list = new List<string>();
                list.Add(Request.QueryString["property_id"]);
                Session["cart"] = list;
            }
            else
            {
                List<String> list = (List<String>)Session["cart"];
                list.Add(Request.QueryString["property_id"]);
                Session["cart"] = list;

            }

            Response.Redirect("shoppingcart.aspx");
            
        }

        public void back_Click(object sender, EventArgs e)
        {
            Response.Redirect("searchad.aspx");
        }

        public void buttonblue_Click(object sender, EventArgs e)
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
                string SQLString = "SELECT * FROM property WHERE property_id='" + Request.QueryString["property_id"] + "'";
                SqlCommand checkIDTable = new SqlCommand(SQLString, dbConnection);
                SqlDataReader idRecords = checkIDTable.ExecuteReader();

                if (idRecords.Read())
                {

                    string useremail = email.Text;
                    SmtpClient mailClient = new SmtpClient();
                    MailMessage mail = new MailMessage("magicestate3@gmail.com", idRecords["owner_email"].ToString());
                    MailAddress copy = new MailAddress("magicestate3@gmail.com");
                    mail.CC.Add(copy);
                    mail.IsBodyHtml = true;
                    string body = name.Text + " has requested for more information! <br/><br/>Property Title : " + idRecords["Title"] + "<br/>Property ID : " + idRecords["property_id"] + "<br/>User Email id : " + email.Text + "<br/>User Message : " + comment.Text +
                        "<br />" + "Reply to " + "<a href='https://redbirdmail.illinoisstate.edu/horde/imp/compose.php?to=" + email.Text + "' target+'_blank'>" + email.Text + "</a>";


                    mail.Subject = "Request For More Information about the Property";
                    mail.Body = body;

                    mailClient.Send(mail);

                }
            }

            catch (SqlException exception)
            {
                Response.Write("<p>Error code " + exception.Number + ": " + exception.Message + "</p>");
            }
        }

       

        protected void scheduleapp_Click(object sender, EventArgs e)
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
                string SQLString = "SELECT * FROM property WHERE property_id='" + Request.QueryString["property_id"] + "'";
                SqlCommand checkIDTable = new SqlCommand(SQLString, dbConnection);
                SqlDataReader idRecords = checkIDTable.ExecuteReader();

                if (idRecords.Read())
                {

                    string useremail = email_sche.Text;
                    SmtpClient mailClient = new SmtpClient();
                    MailMessage mail = new MailMessage("magicestate3@gmail.com", idRecords["owner_email"].ToString());
                    MailAddress copy = new MailAddress("magicestate3@gmail.com");
                    mail.CC.Add(copy);
                    mail.IsBodyHtml = true;
                    string body = name_sche.Text + " has requested for Scheduling an appointment! <br/><br/>Property Title : " 
                        + idRecords["Title"] + "<br/>Property ID : " 
                        + idRecords["property_id"] + "<br/>User Email id : " 
                        + email_sche.Text + "<br/>Subject : " + subject.Text +
                        "<br/>Date : " + Calendar1.SelectedDate.Date.ToShortDateString() +
                        "<br/>Time : " + time_sche.SelectedItem.Text +
                        "<br />Reply to : <a href='https://redbirdmail.illinoisstate.edu/horde/imp/compose.php?to=" + email.Text + "' target+'_blank'>" + email.Text + "</a>";


                    mail.Subject = "MAGIC ESTATE: Schedule an appointmet for Property";
                    mail.Body = body;

                    mailClient.Send(mail);

                }
            }

            catch (SqlException exception)
            {
                Response.Write("<p>Error code " + exception.Number + ": " + exception.Message + "</p>");
            }

        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            e.Day.IsSelectable = e.Day.Date >= DateTime.Now;
        }

       
        
    }
}