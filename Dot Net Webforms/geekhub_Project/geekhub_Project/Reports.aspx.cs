using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace geekhub_Project
{
    public partial class Reports : System.Web.UI.Page
    {
        public string usersByProvincesJson;
        public string commentsPerDiscussionJson;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadReports();
                LoadRecentFeedback();
                LoadRecentComments();
            }
        }

        private void LoadReports()
        {
            usersByProvincesJson = GetUsersByProvincesJson();
            commentsPerDiscussionJson = GetCommentsPerDiscussionJson();
        }

        private string GetUsersByProvincesJson()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            string query = "SELECT provinces AS provinces, COUNT(*) AS UserCount FROM usersignup GROUP BY provinces";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                return DataTableToJson(dt);
            }
        }


        private string GetCommentsPerDiscussionJson()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            string query = @"SELECT d.Title, COUNT(c.CommentID) AS CommentCount
                             FROM Discussions d
                             LEFT JOIN Comments c ON d.DiscussionID = c.DiscussionID
                             GROUP BY d.Title";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                return DataTableToJson(dt);
            }
        }

        private string DataTableToJson(DataTable dt)
        {
            System.Web.Script.Serialization.JavaScriptSerializer jsSerializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            System.Collections.Generic.List<System.Collections.Generic.Dictionary<string, object>> rows = new System.Collections.Generic.List<System.Collections.Generic.Dictionary<string, object>>();
            System.Collections.Generic.Dictionary<string, object> row;
            foreach (DataRow dr in dt.Rows)
            {
                row = new System.Collections.Generic.Dictionary<string, object>();
                foreach (DataColumn col in dt.Columns)
                {
                    row.Add(col.ColumnName, dr[col]);
                }
                rows.Add(row);
            }
            return jsSerializer.Serialize(rows);
        }

        private void LoadRecentFeedback()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            string query = "SELECT Name, Email, Message, SubmittedAt FROM ContactMessages ORDER BY SubmittedAt DESC";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable feedbackTable = new DataTable();
                da.Fill(feedbackTable);
                FeedbackGridView.DataSource = feedbackTable;
                FeedbackGridView.DataBind();
            }
        }

        private void LoadRecentComments()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            string query = "SELECT CommentText, CommentedDate FROM Comments ORDER BY CommentedDate DESC";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable commentsTable = new DataTable();
                da.Fill(commentsTable);
                CommentsGridView.DataSource = commentsTable;
                CommentsGridView.DataBind();
            }
        }
    }
}
