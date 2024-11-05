using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace geekhub_Project
{
    public partial class usersubmitLab : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if session is null or empty
            if (Session["Username"] == null || string.IsNullOrEmpty(Session["Username"].ToString()))
            {
                // Register the JavaScript alert to display before redirect
                ClientScript.RegisterStartupScript(this.GetType(), "alert",
                    "alert('You need to login to access this page.'); window.location = 'userlogin.aspx';", true);
            }
            else
            {
                // Load lab names only if session is valid
                if (!IsPostBack)
                {
                    LoadLabNames();
                }
            }
        }

        private void LoadLabNames()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT LabID, LabName FROM Labs";
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                LabListBox.DataSource = reader;
                LabListBox.DataTextField = "LabName";
                LabListBox.DataValueField = "LabID";
                LabListBox.DataBind();
            }
        }

        protected void LabListBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            int labID = Convert.ToInt32(LabListBox.SelectedValue);
            string connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT LabObjective, LabQuestion FROM Labs WHERE LabID = @LabID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@LabID", labID);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    ObjectiveLabel.Text = reader["LabObjective"].ToString();
                    QuestionLabel.Text = reader["LabQuestion"].ToString();
                    labDetails.Visible = true;
                }
            }
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            int labID = Convert.ToInt32(LabListBox.SelectedValue);
            string userAnswer = AnswerTextBox.Text;

            string connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO LabAnswer (LabID, UserAnswer) VALUES (@LabID, @UserAnswer)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@LabID", labID);
                cmd.Parameters.AddWithValue("@UserAnswer", userAnswer);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            // Clear the answer textbox and show a success message
            AnswerTextBox.Text = "";
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Your answer has been submitted successfully!');", true);
        }
    }
}
