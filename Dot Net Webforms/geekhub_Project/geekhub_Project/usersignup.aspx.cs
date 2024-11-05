using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace geekhub_Project
{
    public partial class usersignup : System.Web.UI.Page
    {
        // Creating the connection string to database here
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Page load logic, if any, can be added here
        }

        // Signup button click event
        protected void Button1_Click(object sender, EventArgs e)
        {
            // Check if the user already exists
            if (checkMemberExists())
            {
                // Show alert if user exists
                Response.Write("<script>alert('User exists, try another User ID');</script>");
            }
            else
            {
                // Sign up the new user
                signUpNewUser();
            }
        }

        // Method to check if the user already exists in the database
        bool checkMemberExists()
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

                    // SQL query to check if user exists
                    string query = "SELECT * FROM usersignup WHERE user_id = @user_id";

                    // SQL command with parameter
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@user_id", TextBox8.Text.Trim());

                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        // Check if any rows are returned
                        return dt.Rows.Count >= 1;
                    }
                }
            }
            catch (Exception ex)
            {
                // Display error message
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                return false;
            }
        }

        // Method to sign up a new user
        void signUpNewUser()
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
                    string query = "INSERT INTO usersignup (full_name, dob, contact_no, email, provinces, city, pincode, full_address, user_id, password, account_status) " +
                                   "VALUES (@full_name, @dob, @contact_no, @email, @provinces, @city, @pincode, @full_address, @user_id, @password, @account_status)";

                    // SQL command with parameters
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        // Adding parameters
                        cmd.Parameters.AddWithValue("@full_name", TextBox1.Text.Trim());
                        cmd.Parameters.AddWithValue("@dob", TextBox2.Text.Trim());
                        cmd.Parameters.AddWithValue("@contact_no", TextBox3.Text.Trim());
                        cmd.Parameters.AddWithValue("@email", TextBox4.Text.Trim());
                        cmd.Parameters.AddWithValue("@provinces", DropDownList1.SelectedItem.Value);
                        cmd.Parameters.AddWithValue("@city", TextBox6.Text.Trim());
                        cmd.Parameters.AddWithValue("@pincode", TextBox7.Text.Trim());
                        cmd.Parameters.AddWithValue("@full_address", TextBox5.Text.Trim());
                        cmd.Parameters.AddWithValue("@user_id", TextBox8.Text.Trim());
                        cmd.Parameters.AddWithValue("@password", TextBox9.Text.Trim());
                        cmd.Parameters.AddWithValue("@account_status", "pending");

                        // Executing the command
                        cmd.ExecuteNonQuery();
                    }
                }

                // Display success message
                Response.Write("<script>alert('Sign Up Successfully. Go to User Login to Login');</script>");
                Response.Redirect("userlogin.aspx");
            }
            catch (Exception ex)
            {
                // Display error message
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }
    }
}
