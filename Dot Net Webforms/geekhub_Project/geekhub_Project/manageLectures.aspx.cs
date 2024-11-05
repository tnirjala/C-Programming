using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace geekhub_Project
{
    public partial class manageLectures : System.Web.UI.Page
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
            SqlDataSource1.InsertParameters["CourseName"].DefaultValue = CourseName.Text;
            SqlDataSource1.InsertParameters["CourseDescription"].DefaultValue = CourseDescription.Text;
            SqlDataSource1.InsertParameters["TutorialName"].DefaultValue = TutorialTitle.Text;
            SqlDataSource1.InsertParameters["Level"].DefaultValue = Level.SelectedValue;
            SqlDataSource1.InsertParameters["Content"].DefaultValue = Content.Text;

            SqlDataSource1.Insert();
            GridView1.DataBind(); // It refreshes the grid.
            ShowMessage("Successfully added new course.");
        }

        protected void Updatebtn_Click(object sender, EventArgs e)
        {
            // Check if a row is selected
            if (GridView1.SelectedDataKey != null)
            {
                // Populate update parameters
                SqlDataSource1.UpdateParameters["CourseName"].DefaultValue = CourseName.Text;
                SqlDataSource1.UpdateParameters["CourseDescription"].DefaultValue = CourseDescription.Text;
                SqlDataSource1.UpdateParameters["TutorialName"].DefaultValue = TutorialTitle.Text;
                SqlDataSource1.UpdateParameters["Level"].DefaultValue = Level.SelectedValue;
                SqlDataSource1.UpdateParameters["Content"].DefaultValue = Content.Text;
                SqlDataSource1.UpdateParameters["CourseID"].DefaultValue = GridView1.SelectedDataKey.Value.ToString();

                // Perform the update operation
                SqlDataSource1.Update();
                ShowMessage("Successfully updated the course.");
                GridView1.DataBind();
            }
        }

        protected void Deletebtn_Click(object sender, EventArgs e)
        {
            SqlDataSource1.DeleteParameters["CourseID"].DefaultValue = GridView1.SelectedDataKey.Value.ToString();

            SqlDataSource1.Delete();
            GridView1.DataBind();
            ShowMessage("Successfully deleted the course.");
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                // This is row index
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                // Get the row
                GridViewRow row = GridView1.Rows[rowIndex];

                // Set the selected row
                GridView1.SelectedIndex = rowIndex;

                // Populate controls with selected row data
                CourseName.Text = row.Cells[1].Text;
                CourseDescription.Text = row.Cells[2].Text;
                TutorialTitle.Text = row.Cells[3].Text;
                Level.SelectedValue = row.Cells[4].Text;
                Content.Text = row.Cells[5].Text;
            }
        }

        private void ShowMessage(string message)
        {
            string script = $"alert('{message}');";
            ClientScript.RegisterStartupScript(this.GetType(), "Alert", script, true);
        }
    }
}
