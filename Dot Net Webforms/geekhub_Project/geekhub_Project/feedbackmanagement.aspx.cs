using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace geekhub_Project
{
    public partial class feedbackmanagement : System.Web.UI.Page
    {
        // Creating the connection string to database here
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            feedbackSubmit();
        }

        void feedbackSubmit()
        {
            try
            {
                // Creating the SQL connection
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    // Open the connection
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    // Insert query
                    string query = "INSERT INTO feedbacktable (full_name, email, feedback) " +
                                   "VALUES (@full_name, @email, @feedback)";

                    // SQL command with parameters
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        // Adding parameters
                        cmd.Parameters.AddWithValue("@full_name", TextBox3.Text.Trim());
                        cmd.Parameters.AddWithValue("@email", TextBox4.Text.Trim());
                        cmd.Parameters.AddWithValue("@feedback", TextBox5.Text.Trim());


                        // Executing the command
                        cmd.ExecuteNonQuery();
                    }
                }

                // Display success message
                Response.Write("<script>alert('Thank you for your feedback');</script>");
            }
            catch (Exception ex)
            {
                // Display error message
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }
    }
}