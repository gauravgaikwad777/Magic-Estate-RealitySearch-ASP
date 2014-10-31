using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Web.UI.WebControls;

namespace Assign5
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            back.Visible = false;
            if(Session["usession"]!=null)
            {
                Panel1.Visible = false;
                back.Visible = true;
                Button2.Visible = false;
                Button1.Enabled = false;
                
            Label6.Text = "Please Sign Out First to Sign Up!<br/>";
            }
            if (Session["usession"] == null)
            {
                Button3.Visible = false;
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                Page.Validate();
                if (Page.IsValid)
                {
                    string first = TextBox1.Text;
                    string last = TextBox2.Text;
                    string UserID = TextBox3.Text;
                    string pass = TextBox4.Text;
                    string cpass = TextBox5.Text;
                    string email = TextBox6.Text;
                    string securQ = TextBox7.Text;
                    string securA = TextBox8.Text;
                    int costmin = Convert.ToInt32(TextBox9.Text);
                    int costmax = Convert.ToInt32(TextBox10.Text);
                    int sizemin = Convert.ToInt32(TextBox11.Text);
                    int sizemax = Convert.ToInt32(TextBox12.Text);

                    string cat = DropDownList1.SelectedItem.Text;

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
                        string SQLString = "SELECT * FROM usertable WHERE UserID='" + TextBox3.Text + "';";
                        SqlCommand checkIDTable = new SqlCommand(SQLString, dbConnection);
                        SqlDataReader cc = checkIDTable.ExecuteReader();

                        if (costmin > costmax)
                        {
                            Label2.Text = "Minimum Cost must be lower them Maximum cost";

                        }

                        if (sizemin > sizemax)
                        {
                            Label4.Text = "Minimum size must be lower them Maximum size";

                        }

                        if (cc.HasRows)
                        {
                            UserAvailability.Text = "<br/><font color=\"red\"><b>User Id already exists</b></font><br/>";
                        }

                        else
                        {
                            cc.Close();
                            Console.Write("Successfully selected the database");
                            string studentInfo = "INSERT INTO usertable VALUES('"
                                + first + "', '"
                                + last + "', '"
                                + UserID + "', '"
                                + pass + "', '"
                                + cpass + "', '"
                                + email + "', '"
                                + securQ + "', '"
                                + securA + "', '"
                                + cat + "', '"
                                + costmin + "', '"
                                + costmax + "', '"
                                + sizemin + "', '"
                                + sizemax + "', '"
                             + "True')";
                            
                            string studentInfo1 = "INSERT INTO logintable VALUES('"
                                + UserID + "', '"
                                + pass + "');";
                            Console.Write("Inserted");
                            SqlCommand sqlCommand = new SqlCommand(studentInfo, dbConnection);
                            sqlCommand.ExecuteNonQuery();
                            SqlCommand sqlCommand1 = new SqlCommand(studentInfo1, dbConnection);
                            sqlCommand1.ExecuteNonQuery();

                            dbConnection.Close();

                            SmtpClient mailClient = new SmtpClient();
                            MailMessage mail = new MailMessage("magicestate3@gmail.com", TextBox6.Text);

                            string body = "Congratulations, you have successfully Signed Up!! <br>" + "Welcome " + TextBox2.Text + ", " + TextBox1.Text +
                                "!!!!!<br /> With Username : <b>" + TextBox3.Text + "</b><br /> and Password :<b> " + TextBox4.Text +
                                "</b><br /> Confirm Password : " + TextBox5.Text +
                                "<br /> EmailID : " + TextBox6.Text +
                                "<br /> Security Question : " + TextBox7.Text +
                                "<br /> Security Answer : " + TextBox8.Text +
                                "<br /> Categories of Interest : " + cat +
                                "<br /> Cost: Min : " + TextBox9.Text + " and Max :" + TextBox10.Text +
                                "<br /> Size: Min : " + TextBox11.Text + " and Max :" + TextBox12.Text + "<br/>";

                            string path = Server.MapPath("images/isulogo.jpg");
                            LinkedResource logo = new LinkedResource(path);
                            logo.ContentId = "MyLogo";
                            AlternateView altview = AlternateView.CreateAlternateViewFromString("<img src=cid:MyLogo/><br />" + body, null, "text/html");
                            altview.LinkedResources.Add(logo);

                            mail.AlternateViews.Add(altview);

                            mail.Subject = "Registration Confirmation";
                            mailClient.Send(mail);
                            Response.Redirect("Registered.aspx");
                        }
                        cc.Close();
                    }
                }
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void back_Click(object sender, EventArgs e)
        {
            Response.Redirect("Confirmation.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Session["usession"] = "";
            Session.Clear();
            Response.Redirect("Default.aspx");
        }

        protected void Username_Changed(object sender, EventArgs e)
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
                string SQLString = "SELECT * FROM usertable WHERE UserID='" + TextBox3.Text + "';";
                SqlCommand checkIDTable = new SqlCommand(SQLString, dbConnection);
                SqlDataReader cc = checkIDTable.ExecuteReader();

                if (cc.HasRows)
                {
                    UserAvailability.Text = "Username taken, sorry.";
                    UserAvailability.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    UserAvailability.Text = "Username available!";
                   
                }
                cc.Close();
                dbConnection.Close();
            }
        }
    }
}

