using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace geekhub_Project
{
    public partial class adminviewAssessment : System.Web.UI.Page
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
                    GridView1.DataBind(); // Ensure GridView1 is recognized
                }
            }
        }

        protected void Updatebtn_Click(object sender, EventArgs e)
        {
            if (GridView1.SelectedDataKey != null)
            {
                SqlDataSource1.UpdateParameters["UserAnswer"].DefaultValue = UserAnswer.Text;
                SqlDataSource1.UpdateParameters["AnswerID"].DefaultValue = GridView1.SelectedDataKey.Value.ToString();

                SqlDataSource1.Update();
                ShowMessage("Successfully updated the lab.");
                GridView1.DataBind();
            }
            else
            {
                ShowMessage("Please select a lab to update.");
            }
        }

        protected void Deletebtn_Click(object sender, EventArgs e)
        {
            if (GridView1.SelectedDataKey != null)
            {
                SqlDataSource1.DeleteParameters["AnswerID"].DefaultValue = GridView1.SelectedDataKey.Value.ToString();

                SqlDataSource1.Delete();
                GridView1.DataBind();
                ShowMessage("Successfully deleted the lab.");
            }
            else
            {
                ShowMessage("Please select a lab to delete.");
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[rowIndex];
                GridView1.SelectedIndex = rowIndex;
                LabName.Text = row.Cells[1].Text;
                UserAnswer.Text = Server.HtmlDecode(row.Cells[2].Text);
            }
        }

        private void ShowMessage(string message)
        {
            string script = $"alert('{message}');";
            ClientScript.RegisterStartupScript(this.GetType(), "Alert", script, true);
        }
    }
}
