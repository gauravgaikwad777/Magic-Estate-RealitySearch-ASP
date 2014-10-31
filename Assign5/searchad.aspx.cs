using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Assign5
{
    public partial class searchad : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usession"] == null)
            {
                Button2.Visible = false;
                Button4.Visible = false;
            }
           
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
          
            Label2.Text = "";
            string title = TextBox1.Text;
            string cat = DropDownList1.SelectedItem.Value;
            double costmin;
            Boolean costminprovided = false;
            if (Double.TryParse(TextBox9.Text, out costmin))
            {
            costminprovided = true;
            }
            double costmax = -1;
            Boolean costmaxprovided = false;
            if (Double.TryParse(TextBox10.Text, out costmax))
            {
            costmaxprovided = true;
            }
            double sizemin = -1;
            Boolean minSizeprovided = false;
            if(Double.TryParse(TextBox11.Text, out sizemin))
            {
            minSizeprovided =true;
            }
            double sizemax = -1;
            Boolean maxSizeprovided = false;
            if(Double.TryParse(TextBox12.Text, out sizemax))
            {
            maxSizeprovided =true;
            }
            string SQLString = "";

            if (costmin > costmax && costminprovided && costmaxprovided)
            {
                Label4.Text = "Minimum Cost should be smaller than MAximum cosr";
                return;
            }

            if (sizemin > sizemax && minSizeprovided && maxSizeprovided)
            {
                Label3.Text = "Minimum size should be smaller than Maximum size";
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
                string Query = "Select * from property where 1=1 ";
                if (DropDownList1.SelectedIndex > 0)
                {
                    Query += " and category ='" + DropDownList1.SelectedValue + "'";
                }
                if (minSizeprovided)
                    Query += " and cost >= " + costmin;
                if (maxSizeprovided)
                    Query += " and cost <= " + costmax;

                if (minSizeprovided)
                    Query += " and size >= " + sizemin;

                if (maxSizeprovided)
                    Query += " and size <= " + sizemax;

                if (TextBox1.Text.Length > 0)
                    Query += " and Title like '%" + TextBox1.Text +"%'";
                

                SqlCommand checkIDTable = new SqlCommand(Query, dbConnection);
                SqlDataReader idRecords = checkIDTable.ExecuteReader();

                string sessionadmin = (Session["usession"]?? string.Empty).ToString();

                if (string.Equals("MagicEstate", sessionadmin,StringComparison.OrdinalIgnoreCase))
                {

                    Label2.Text += "<table width='100%'  >";
                    Label2.Text += "<tr bgcolor='#828282'><th></th><th>Address</th><th>Image</th><th>Description</th><th>Category</th><th>Cost</th></tr>";
                    while (idRecords.Read())
                    {
                        Label2.Text += "<tr>";
                        Label2.Text += "<td><a href='propertyinfo.aspx?property_id="
                            + idRecords["property_id"] + "'>View</a><br/><a href='UpdateProperty.aspx?property_id="
                            + idRecords["property_id"] + "'>Update</a><br/><a href='DeleteProperty.aspx?property_id="
                            + idRecords["property_id"] + "'>Delete</a><br/></td>";
                        Label2.Text += "<td>"
                           + idRecords["Address"]
                           + "</td>";
                        Label2.Text += "<td><center><img src='" + idRecords["ImagePath"] + "' width='130' height='130' /></center> "
                           + "</td>";
                        Label2.Text += "<td>"
                            + idRecords["Description"]
                            + "</td>";
                        Label2.Text += "<td>"
                            + idRecords["category"]
                            + "</td>";
                        Label2.Text += "<td>"
                           + idRecords["Cost"]
                           + "</td>";
                        Label2.Text += "</tr>";

                    }

                    Label2.Text += "</table>";
                }

                else 
                {
                    Label2.Text += "<table width='100%'  >";
                    Label2.Text += "<tr bgcolor='#828282'><th></th><th>Address</th><th>Image</th><th>Description</th><th>Category</th><th>Cost</th></tr>";
                    while (idRecords.Read())
                    {
                        Label2.Text += "<tr>";
                        Label2.Text += "<td><a href='propertyinfo.aspx?property_id="
                            + idRecords["property_id"] + "'>View</a></td>";
                        Label2.Text += "<td>"
                           + idRecords["Address"]
                           + "</td>";
                        Label2.Text += "<td><center><img src='" + idRecords["ImagePath"] + "' width='130' height='130' /></center> "
                           + "</td>";
                        Label2.Text += "<td>"
                            + idRecords["Description"]
                            + "</td>";
                        Label2.Text += "<td>"
                            + idRecords["category"]
                            + "</td>";
                        Label2.Text += "<td>"
                           + idRecords["Cost"]
                           + "</td>";
                        Label2.Text += "</tr>";

                    }

                    Label2.Text += "</table>";


                }

                
                idRecords.Close();
                dbConnection.Close();
            }

            catch (SqlException exception)
            {

                Response.Write("<p>Error code " + exception.Number
                    + ": " + exception.Message + "</p>");
            }


        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Confirmation.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Session["usession"] = "";
            Session.Clear();
            Response.Redirect("Default.aspx");
        }

        protected void Refresh_Click(object sender, EventArgs e)
        {
            Label2.Text = "";
        }



    }
}