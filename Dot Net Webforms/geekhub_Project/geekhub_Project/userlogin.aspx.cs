using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace geekhub_Project
{

    public partial class userlogin : System.Web.UI.Page
    {
        //strcon store all the connectionstring data 
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }


        //user login
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
                SqlCommand cmd = new SqlCommand("select * from usersignup where " +
                    "user_id='"+TextBox1.Text.Trim()+"' AND password='"+TextBox2.Text.Trim()+"'", con);

                //need to fire the comd meand to execute
                //cmd.Executereader will execute above query
                //dr is actually connected with the DB which will execute above query
                SqlDataReader dr = cmd.ExecuteReader();

                //check that we are getting the data or not depending on the record
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Response.Write("<script>alert('"+dr.GetValue(8).ToString()+"');</script>");
                        Session["username"] = dr.GetValue(8).ToString();
                        Session["fullname"] = dr.GetValue(0).ToString();
                        Session["role"] = "user";
                        Session["status"] = dr.GetValue(10).ToString();
                    }
                    Response.Redirect("index.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid User');</script>");
                }


            }
            catch (Exception ex)
            { 
            
            }
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {

        }
    }
}