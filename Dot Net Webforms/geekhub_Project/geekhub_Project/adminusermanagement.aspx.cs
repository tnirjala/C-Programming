using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace geekhub_Project
{
    public partial class adminusermanagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if the session exists and if the role is "admin"
            if (Session["role"] == null || !Session["role"].ToString().Equals("admin", StringComparison.OrdinalIgnoreCase))
            {
                // Register a script to show an alert and redirect
                string script = "alert('You need to login as admin to access this page.'); window.location.href='adminlogin.aspx';";
                ScriptManager.RegisterStartupScript(this, GetType(), "redirect", script, true);
            }
            else
            {
                // Continue with loading the page if the user is an admin
                if (!IsPostBack)
                {
                    GridView1.DataBind();//whenever the page is loaded this grid view will bind to the newly refresh data in the sql the sql data source so that the data source will keep on refreshing
                }
            }
        }
        //Go btn functions
        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            getUserID();
        }
        //status active function
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            updatestatus("active");
        }
        //satus pending function
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            updatestatus("pending");
        }
        //delete btn
        protected void LinkButton3_Click(object sender, EventArgs e)
        {

        }

        // user defined function
        void getUserID()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("SELECT * FROM usersignup WHERE user_id = @UserID", con);
                    cmd.Parameters.AddWithValue("@UserID", TextBox1.Text.Trim());

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                TextBox2.Text = dr["full_name"].ToString();
                                TextBox3.Text = dr["account_status"].ToString();
                                TextBox4.Text = dr["dob"].ToString();
                                TextBox5.Text = dr["contact_no"].ToString();
                                TextBox6.Text = dr["email"].ToString();
                                TextBox7.Text = dr["provinces"].ToString();
                                TextBox8.Text = dr["city"].ToString();
                                TextBox9.Text = dr["pincode"].ToString();
                                TextBox10.Text = dr["full_address"].ToString();
                            }
                        }
                        else
                        {
                            Response.Write("<script>alert('Invalid User');</script>");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


        void updatestatus(string status)
        {
            if(checkIfuserexist())
            {
                try
                {
                    using (SqlConnection con = new SqlConnection(strcon))
                    {
                        if (con.State == ConnectionState.Closed)
                        {
                            con.Open();
                        }

                        SqlCommand cmd = new SqlCommand("UPDATE usersignup SET account_status = @Status WHERE user_id = @UserID", con);
                        cmd.Parameters.AddWithValue("@Status", status);
                        cmd.Parameters.AddWithValue("@UserID", TextBox1.Text.Trim());

                        cmd.ExecuteNonQuery();
                        con.Close();
                        Response.Write("<script>alert('Status Updated');</script>");
                        GridView1.DataBind();
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid User');</script>");
            }

        }



        bool checkIfuserexist() {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("SELECT * FROM usersignup WHERE user_id = '" + TextBox1.Text.Trim() + "';", con);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    if (dt.Rows.Count >= 1)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }

                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }


        //delete function
        void deleteuser()
        {
            if (checkIfuserexist())
            {
                try
                {
                    using (SqlConnection con = new SqlConnection(strcon))
                    {
                        if (con.State == ConnectionState.Closed)
                        {
                            con.Open();
                        }

                        SqlCommand cmd = new SqlCommand("DELETE FROM usersignup WHERE user_id = @UserID", con);
                        cmd.Parameters.AddWithValue("@UserID", TextBox1.Text.Trim());

                        cmd.ExecuteNonQuery();
                        con.Close();
                        Response.Write("<script>alert('User Deleted');</script>");
                        clearForm();
                        GridView1.DataBind();

                    }
                }

                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
               
            }
            else
            {
                Response.Write("<script>alert('Invalid User');</script>");
            }
            void clearForm()
            {
                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox3.Text = "";
                TextBox4.Text = "";
                TextBox5.Text = "";
                TextBox6.Text = "";
                TextBox7.Text = "";
                TextBox8.Text = "";
                TextBox9.Text = "";
                TextBox10.Text = "";
            }
        }

            protected void Button1_Click(object sender, EventArgs e)
            {
                deleteuser();
            }
        }
    }