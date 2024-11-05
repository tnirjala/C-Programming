using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace geekhub_Project
{
    public partial class profileofuser : System.Web.UI.Page
    {
        // Connection string
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if the page is being loaded for the first time
            if (!Page.IsPostBack)
            {
                getuserdetails();
            }
        }

        // Update button click event handler
        protected void ButtonUpdate_Click(object sender, EventArgs e)
        {
            userupdate();
        }

        // Delete button click event handler
        protected void ButtonDelete_Click(object sender, EventArgs e)
        {
            deleteuser();
        }

        // User-defined function to get user details
        void getuserdetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);

                // Open the connection
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM usersignup WHERE user_id ='"+ Session["username"].ToString() + "';", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                // Assign other user details to corresponding textboxes
                TextBox1.Text = dt.Rows[0]["full_name"].ToString();
                TextBox2.Text = dt.Rows[0]["dob"].ToString();
                TextBox3.Text = dt.Rows[0]["contact_no"].ToString();
                TextBox4.Text = dt.Rows[0]["email"].ToString();
                DropDownList1.SelectedValue = dt.Rows[0]["provinces"].ToString().Trim();
                TextBox6.Text = dt.Rows[0]["city"].ToString();
                TextBox7.Text = dt.Rows[0]["pincode"].ToString();
                TextBox5.Text = dt.Rows[0]["full_address"].ToString();
                TextBox8.Text = dt.Rows[0]["user_id"].ToString();
                TextBox9.Text = dt.Rows[0]["password"].ToString();

                
                Label1.Text = dt.Rows[0]["account_status"].ToString().Trim();

                if (dt.Rows[0]["account_status"].ToString().Trim() == "active")
                {
                    Label1.Attributes.Add("badge rounded-pill text-bg-info", "badge rounded-pill text-bg-info");
                }
                else if (dt.Rows[0]["account_status"].ToString().Trim() == "pending")
                {
                    Label1.Attributes.Add("badge rounded-pill text-bg-info", "badge rounded-pill text-bg-info");
                }
                else
                {
                    Label1.Attributes.Add("badge rounded-pill text-bg-info", "badge rounded-pill text-bg-info");
                }

                 
            }
            catch (Exception ex)
            {
                // Log the error or display a message
            }
        }

        //update user information
        void userupdate()
        {
            string password = "";
            //setting the password if entered new pass then it takes new password otherwise takes old password
            if (TextBox10.Text.Trim() == "")
            {
                password = TextBox9.Text.Trim();
            }
            else
            {
                password = TextBox9.Text.Trim();
            }
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("update usersignup set full_name=@full_name, dob=@dob, contact_no=@contact_no, email=@email, provinces=@provinces, city=@city, pincode=@pincode, full_address=@full_address, password=@password, account_status=@account_status WHERE user_id='" + Session["username"].ToString().Trim() + "'", con);
                cmd.Parameters.AddWithValue("@full_name", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@dob", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@contact_no", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@email", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@provinces", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@city", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@pincode", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@full_address", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@password", password);
                cmd.Parameters.AddWithValue("@account_status", "pending");

                //return the number of row affected 
                int result = cmd.ExecuteNonQuery();
                con.Close();
                if (result > 0)
                {
                    Response.Write("<script>alert('Detail Updated');</script>");
                    //for new data
                    getuserdetails();

                }
                else
                {
                    Response.Write("<script>alert('Invalid');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('"+ex.Message+"');</script>");
            }
        }

        void deleteuser()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE FROM usersignup WHERE user_id = @user_id;", con);
                    cmd.Parameters.AddWithValue("@user_id", Session["username"].ToString());

                    cmd.ExecuteNonQuery();
                    con.Close();

                    // Show alert message and redirect to index page
                    Response.Write("<script>alert('User Deleted'); window.location='index.aspx';</script>");

                    // Clear the session
                    Session.Clear();
                    Session.Abandon();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}
