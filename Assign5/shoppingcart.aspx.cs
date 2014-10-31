using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Assign5
{
    public partial class shoppingcart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Labelcart.Text += "<table width='100%' >";
            Labelcart.Text += "<tr bgcolor='#828282'><th>Title</th><th>Description</th><th>Category</th><th>Size</th><th>Summary</th><th>Image</th><th>Cost</th></tr>";
            double totalcost = 0;
            foreach (String item in (List<String>)Session["cart"])
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
                    string SQLString = "SELECT * FROM property WHERE property_id='" + item + "'";
                    SqlCommand checkIDTable = new SqlCommand(SQLString, dbConnection);
                    SqlDataReader idRecords = checkIDTable.ExecuteReader();

                    while (idRecords.Read())
                    {
                        totalcost += (double)idRecords["Cost"]; 

                        Labelcart.Text += "<tr>";
                        Labelcart.Text += "<td><a href='propertyinfo.aspx?property_id=" + Session["cart"] + "'>"
                            + idRecords["Title"]
                            + "</a></td>";
                        Labelcart.Text += "<td>"
                            + idRecords["Description"]
                            + "</td>";
                        Labelcart.Text += "<td>"
                            + idRecords["category"]
                            + "</td>";
                        Labelcart.Text += "<td>"
                           + idRecords["Size"]
                           + "</td>";
                        Labelcart.Text += "<td>"
                           + idRecords["Summary"]
                           + "</td>";
                        Labelcart.Text += "<td><center><img src='" + idRecords["ImagePath"] + "' width='130' height='130' /></center> "
                           + "</td>";
                        Labelcart.Text += "<td>"
                           + idRecords["Cost"]
                           + "</td>";
                        Labelcart.Text += "</tr>";

                    }
                    idRecords.Close();
                    dbConnection.Close();
                }

                catch (SqlException exception)
                {
                    Response.Write("<p>Error code " + exception.Number + ": " + exception.Message + "</p>");
                }

            }
            Labelcart.Text += "</table>";
            lblCheckoutCost.Text = "<table ><tr><td>Total Cost:</td><td>" + totalcost.ToString() + "</td></tr><tr><td>Tax:</td><td>" + (totalcost * 0.08).ToString() + "</td><tr><td>Final Cost:</td><td>" + (totalcost + (totalcost * 0.08)).ToString() + "</td></tr></table>";
            Session["costfinal"] = (totalcost + (totalcost * 0.08)).ToString();
        }

        protected void CheckoutButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("chechkout.aspx");
        }

        protected void ContinueButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("searchad.aspx");
        }
    }
}