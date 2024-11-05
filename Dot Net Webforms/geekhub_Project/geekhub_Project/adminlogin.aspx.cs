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
    public partial class adminlogin : System.Web.UI.Page
    {
        //strcon store all the connectionstring data 
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
         
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                // Open the connection
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from adminloginDB where username='" + TextBox1.Text.Trim() 
                    + "' AND password='" + TextBox2.Text.Trim() + "'", con);

                //need to fire the comd meand to execute
                //cmd.Executereader will execute above query
                //dr is actually connected with the DB which will execute above query
                SqlDataReader dr = cmd.ExecuteReader();

                //check that we are getting the data or not depending on the record
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Response.Write("<script>alert('" + dr.GetValue(0).ToString() + "');</script>");
                        // column is expected to store the username of the admin
                        Session["username"] = dr.GetValue(0).ToString();
                        //column is expected to store the full name of the admin
                        Session["fullname"] = dr.GetValue(2).ToString();
                        //a fixed value indicating that the role of the logged-in user is an admin
                        Session["role"] = "admin";
                       // Session["status"] = dr.GetValue(10).ToString();
                    }
                    Response.Redirect("Admin_Dashboard.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid User');</script>");
                }


            }
            catch(Exception ex) 
            {
                Response.Write("<script>alert('"+ex.Message+"');</script>");
            }
        }



    }
}