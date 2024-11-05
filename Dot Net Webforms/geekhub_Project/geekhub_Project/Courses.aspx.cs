using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace geekhub_Project
{
    public partial class Courses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if session is null or empty
            if (Session["Username"] == null || string.IsNullOrEmpty(Session["Username"].ToString()))
            {
                // Register the JavaScript alert and redirect to login page
                ClientScript.RegisterStartupScript(this.GetType(), "alert",
                    "alert('You need to login to access this page.'); window.location = 'userlogin.aspx';", 
                    true);
            }
            else
            {
                // Load courses only if session is valid
                if (!IsPostBack)
                {
                    LoadCourses();
                }
            }
        }

        private void LoadCourses()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT CourseID, CourseName FROM Courses";
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                CourseListBox.DataSource = reader;
                CourseListBox.DataTextField = "CourseName";
                CourseListBox.DataValueField = "CourseID";
                CourseListBox.DataBind();
            }
        }

        protected void CourseListBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            int courseID = Convert.ToInt32(CourseListBox.SelectedValue);
            string connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT CourseName, CourseDescription, TutorialName, Level, Content FROM " +
                    "Courses WHERE CourseID = @CourseID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@CourseID", courseID);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    CourseNameLabel.Text = reader["CourseName"].ToString();
                    CourseDescriptionLabel.Text = reader["CourseDescription"].ToString();
                    TutorialNameLabel.Text = reader["TutorialName"].ToString();
                    LevelLabel.Text = reader["Level"].ToString();
                    ContentLabel.Text = reader["Content"].ToString();
                    courseDetails.Visible = true;
                }
            }
        }
    }
}
