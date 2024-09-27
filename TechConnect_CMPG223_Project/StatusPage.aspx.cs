using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace TechConnect_CMPG223_Project
{
    public partial class StudentStatus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if the user is logged in
                if (Session["Email"] != null)
                {
                    string userEmail = Session["Email"].ToString();
                    PopulateApplicationStatus(userEmail);
                }
                else
                {
                    // Redirect to login page if not logged in
                    Response.Redirect("LoginPage.aspx");
                }
            }
        }

        // Method to populate application status and feedback
        private void PopulateApplicationStatus(string email)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["BursaryDBConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                // Query to get the application status and feedback
                string query = @"
                    SELECT a.Status, a.Feedback 
                    FROM Applications a
                    JOIN Student s ON a.StudentID = s.StudentID
                    WHERE s.Email = @Email";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Email", email);
                conn.Open();

                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    // Display application status
                    LblStatus.Text = "Your Application Status: " + reader["Status"].ToString();

                    // Get feedback and add it to the listbox
                    string feedback = reader["Feedback"]?.ToString();
                    if (!string.IsNullOrEmpty(feedback))
                    {
                        LstbxFeedback.Items.Add(feedback);
                    }
                }
                else
                {
                    // Handle case where no application is found
                    LblStatus.Text = "No application found for your account.";
                }

                reader.Close();
            }
        }

        // Logout button click event
        protected void Button2_Click(object sender, EventArgs e)
        {
            // Clear session and redirect to login page
            Session.Clear();
            Response.Redirect("defaultPage.aspx");
        }
    }
}
