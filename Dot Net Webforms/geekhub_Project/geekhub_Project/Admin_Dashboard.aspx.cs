using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace geekhub_Project
{
    public partial class Admin_Dashboard : System.Web.UI.Page
    {
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
                    // Your code to load data or initialize the page
                }
            }
        }


    }
}