using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace geekhub_Project
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GoToCourses_Click(object sender, EventArgs e)
        {
            Response.Redirect("Courses.aspx");
        }
        protected void GoToLabs_Click(object sender, EventArgs e)
        {
            Response.Redirect("usersubmitLab.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("feedbackmanagement.aspx");
        }
    }
}