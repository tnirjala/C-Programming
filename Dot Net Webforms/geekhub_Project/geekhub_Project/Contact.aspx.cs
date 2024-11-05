using System;
using System.Data.SqlClient;
using System.Configuration;

namespace geekhub_Project
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string name = txtName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string message = txtMessage.Text.Trim();

            // Connection string from Web.config
            string connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO ContactMessages (Name, Email, Message) VALUES (@Name, @Email, @Message)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Message", message);

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    lblMessage.Text = "Thank you for reaching out! We will get back to you soon.";
                }
                catch (SqlException ex)
                {
                    lblMessage.Text = "There was an error submitting your message. Please try again later.";
                    // Log exception details for further investigation
                    Console.WriteLine("SQL Error: " + ex.Message);
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "There was an error submitting your message. Please try again later.";
                    // Log exception details for further investigation
                    Console.WriteLine("Error: " + ex.Message);
                }
            }

            // Clear the form after submission
            txtName.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtMessage.Text = string.Empty;
        }
    }
}
