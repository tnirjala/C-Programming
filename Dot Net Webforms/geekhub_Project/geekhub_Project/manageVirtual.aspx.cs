using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace geekhub_Project
{
    public partial class manageVirtual : System.Web.UI.Page
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

        protected void Insertbtn_Click(object sender, EventArgs e)
        {
            SqlDataSource1.InsertParameters["LabName"].DefaultValue = LabName.Text;
            SqlDataSource1.InsertParameters["LabObjective"].DefaultValue = LabObjective.Text;
            SqlDataSource1.InsertParameters["LabQuestion"].DefaultValue = LabQuestion.Text;

            SqlDataSource1.Insert();
            GridView1.DataBind(); // It refreshes the grid.
            ShowMessage("Successfully added new lab.");
        }

        protected void Updatebtn_Click(object sender, EventArgs e)
        {
            if (GridView1.SelectedDataKey != null)
            {
                SqlDataSource1.UpdateParameters["LabName"].DefaultValue = LabName.Text;
                SqlDataSource1.UpdateParameters["LabObjective"].DefaultValue = LabObjective.Text;
                SqlDataSource1.UpdateParameters["LabQuestion"].DefaultValue = LabQuestion.Text;
                SqlDataSource1.UpdateParameters["LabID"].DefaultValue = GridView1.SelectedDataKey.Value.ToString();

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
                SqlDataSource1.DeleteParameters["LabID"].DefaultValue = GridView1.SelectedDataKey.Value.ToString();

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
                LabObjective.Text = row.Cells[2].Text;
                LabQuestion.Text = row.Cells[3].Text;
            }
        }
        private void ShowMessage(string message)
        {
            string script = $"alert('{message}');";
            ClientScript.RegisterStartupScript(this.GetType(), "Alert", script, true);
        }
    }
}