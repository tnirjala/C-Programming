using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq;

namespace geekhub_Project
{
    public partial class Discussions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadRecentDiscussions();
            }
        }

        private void LoadRecentDiscussions()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM Discussions ORDER BY CreatedDate DESC";
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                DataTable dt = new DataTable();
                dt.Load(reader);

                if (dt.Rows.Count == 0)
                {
                    NoDiscussionsPlaceholder.Visible = true;
                }
                else
                {
                    NoDiscussionsPlaceholder.Visible = false;
                    RecentDiscussionsRepeater.DataSource = dt;
                    RecentDiscussionsRepeater.DataBind();
                }
            }
        }



        protected void AddCommentButton_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int discussionID = Convert.ToInt32(btn.CommandArgument);
            TextBox commentTextBox = (TextBox)btn.Parent.FindControl("CommentTextBox");

            string commentText = commentTextBox.Text.Trim();
            if (!string.IsNullOrEmpty(commentText))
            {
                string connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO Comments (DiscussionID, CommentText) VALUES (@DiscussionID, @CommentText)";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@DiscussionID", discussionID);
                    cmd.Parameters.AddWithValue("@CommentText", commentText);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                // Clear the comment box and reload discussions to show the new comment
                commentTextBox.Text = string.Empty;
                LoadRecentDiscussions();
            }
        }

        protected void SubmitDiscussionButton_Click(object sender, EventArgs e)
        {
            string title = TitleTextBox.Text.Trim();
            string description = DescriptionTextBox.Text.Trim();

            if (Page.IsValid)
            {
                string connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO Discussions (Title, Description) VALUES (@Title, @Description)";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Title", title);
                    cmd.Parameters.AddWithValue("@Description", description);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                // Clear the input fields and reload discussions to show the new discussion
                TitleTextBox.Text = string.Empty;
                DescriptionTextBox.Text = string.Empty;
                LoadRecentDiscussions();
            }
        }
    }
}
