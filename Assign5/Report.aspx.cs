using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Assign5
{
    public partial class Report : System.Web.UI.Page
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
                string Query = "SELECT TOP (5) Title, Description, Cost, Size, Summary, category, ImagePath, Address, owner_email, property_id, visit_count FROM property ORDER BY visit_count DESC";

                SqlCommand checkIDTable = new SqlCommand(Query, dbConnection);
                SqlDataReader idRecords = checkIDTable.ExecuteReader();

                Label2.Text += "<table width='100%'  >";
                Label2.Text += "<tr><th></th><th>Title</th><th>Image</th><th>Description</th><th>Category</th><th>Address</th><th>Cost</th></tr>";
                while (idRecords.Read())
                {
                    Label2.Text += "<tr>";
                    Label2.Text += "<td><a href='propertyinfo.aspx?property_id="
                        + idRecords["property_id"] + "'>View</a></td>";
                    Label2.Text += "<td>"
                        + idRecords["Title"]
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
                       + idRecords["Address"]
                       + "</td>";
                    Label2.Text += "<td>"
                       + idRecords["Cost"]
                       + "</td>";
                    Label2.Text += "</tr>";

                }

                Label2.Text += "</table>";


                idRecords.Close();
                dbConnection.Close();
            }

            catch (SqlException exception)
            {

                Response.Write("<p>Error code " + exception.Number
                    + ": " + exception.Message + "</p>");
            }




        }
    }
}