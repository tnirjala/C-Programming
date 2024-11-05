using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace geekhub_Project
{
    public partial class Header_Footer : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"].Equals(""))
                {
                    LinkButton1.Visible = true;//user login link btn
                    LinkButton2.Visible = true;//sign up link btn


                    LinkButton3.Visible = false;//logout link btn
                    LinkButton7.Visible = false;//hello user link btn

                    LinkButton4.Visible = true;//admin login link btn
                    //LinkButton11.Visible = false;//user management link btn
                    //LinkButton5.Visible = true;//feedbackmanagement link btn
                }
                else if (Session["role"].Equals("user"))
                {
                    LinkButton1.Visible = false;//user login link btn
                    LinkButton2.Visible = false;//sign up link btn


                    LinkButton3.Visible = true;//logout link btn
                    LinkButton7.Visible = true;//hello user link btn
                    LinkButton7.Text = "Hello " + Session["username"].ToString()+"!";

                    LinkButton4.Visible = false;//admin login link btn
                   // LinkButton11.Visible = false;//user management link btn
                   // LinkButton5.Visible= false;//feedbackmanagement link btn
                }
                else if (Session["role"].Equals("admin"))
                {
                    LinkButton1.Visible = false;//user login link btn
                    LinkButton2.Visible = false;//sign up link btn


                    LinkButton3.Visible = true;//logout link btn
                    LinkButton7.Visible = true;//hello user link btn
                    LinkButton7.Text = "Welcome Admin!";

                    LinkButton4.Visible = false;//admin login link btn
                   // LinkButton11.Visible = true;//user management link btn
                   // LinkButton5.Visible = true;//feedbackmanagement link btn
                }
            }
            catch (Exception)
            {

            }
        }
        //user management btn
        protected void LinkButton11_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminusermanagement.aspx");
        }        //user management btn
        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            Response.Redirect("feedbackmanagement.aspx");
        }
        //user login bnt
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("userlogin.aspx");
        }
        //user signup btn
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("usersignup.aspx");
        }
        //admin login bnt
        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminlogin.aspx");
        }    
        //logout btn
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["fullname"] = "";
            Session["role"] = "";
            Session["status"] = "";

            LinkButton1.Visible = true;//user login link btn
            LinkButton2.Visible = true;//sign up link btn


            LinkButton3.Visible = false;//logout link btn
            LinkButton7.Visible = false;//hello user link btn

            LinkButton4.Visible = true;//admin login link btn
           // LinkButton11.Visible = false;//user management link btn
           // LinkButton5.Visible = false;//feedbackmanagement link btn

            Response.Redirect("index.aspx");
        }

        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            Response.Redirect("profileofuser.aspx");
        }
        protected void Home_Click(object sender, EventArgs e)
        {
            if (Session["role"] != null && Session["role"].Equals("admin"))
            {
                Response.Redirect("Admin_Dashboard.aspx");
            }
            else
            {
                Response.Redirect("index.aspx");
            }
        }

    }
}