using System;
using System.Data.SqlClient;
using System.Configuration;

namespace TechConnect_CMPG223_Project
{
    public partial class ReviewedApplications : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateReviewedApplications();
            }
        }

        // Method to fetch and populate the ListBox with reviewed application details
        private void PopulateReviewedApplications()
        {
            // Connection string
            string connectionString = ConfigurationManager.ConnectionStrings["BursaryDBConnectionString"].ConnectionString;

            // SQL query to get the details from the ApplicationReview table
            string query = @"
                SELECT ar.ReviewID, ar.ApplicationID, ar.AdminID, ar.ReviewDate, ar.Status, ar.Comments
                FROM ApplicationReview ar
                JOIN Applications a ON ar.ApplicationID = a.ApplicationID
                JOIN Admin ad ON ar.AdminID = ad.AdminID";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();

                SqlDataReader reader = cmd.ExecuteReader();

                // Clear the ListBox before adding new items
                LBxReviewd.Items.Clear();

                // Loop through the results and add them to the ListBox
                while (reader.Read())
                {
                    string reviewID = reader["ReviewID"].ToString();
                    string applicationID = reader["ApplicationID"].ToString();
                    string adminID = reader["AdminID"].ToString();
                    string reviewDate = Convert.ToDateTime(reader["ReviewDate"]).ToString("yyyy-MM-dd");
                    string status = reader["Status"].ToString();
                    string comments = reader["Comments"].ToString();

                    // Add the details to the ListBox
                    LBxReviewd.Items.Add($"Review ID: {reviewID} | Application ID: {applicationID} | Admin ID: {adminID} | Date: {reviewDate} | Status: {status} | Comments: {comments}");
                }

                reader.Close();
            }
        }

        // Event handler for the "Back" button click
        protected void BttnBck_Click(object sender, EventArgs e)
        {
            // Redirect to a previous page or another appropriate page
            Response.Redirect("defaultPage.aspx");
        }
    }
}
