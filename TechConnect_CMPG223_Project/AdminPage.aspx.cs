using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace TechConnect_CMPG223_Project
{
    public partial class AdminPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if the user is logged in
            if (Session["AdminID"] == null)
            {
                Response.Redirect("AdminLogin.aspx"); // Redirect to login if not logged in
                return; // Exit the method if not logged in
            }

            if (!IsPostBack)
            {
                PopulateApplicationsDropdown();
                PopulateStatusDropdown();
            }
        }

        // Populate the dropdown with ApplicationIDs
        private void PopulateApplicationsDropdown()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["BursaryDBConnectionString"].ConnectionString;
            string query = "SELECT ApplicationID FROM Applications";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                ddlApplication2.Items.Clear(); // Clear previous items

                ddlApplication2.Items.Add(new ListItem("Select an Application", "")); // Default item

                while (reader.Read())
                {
                    string applicationID = reader["ApplicationID"].ToString();
                    ddlApplication2.Items.Add(new ListItem(applicationID, applicationID));
                }

                reader.Close();
            }
        }

        // Populate the status dropdown
        private void PopulateStatusDropdown()
        {
            ddlupdates.Items.Clear(); // Clear previous items
            ddlupdates.Items.Add(new ListItem("Update status", "")); // Default item
            ddlupdates.Items.Add(new ListItem("Pending", "Pending"));
            ddlupdates.Items.Add(new ListItem("Approved", "Approved"));
            ddlupdates.Items.Add(new ListItem("Not Approved", "Not Approved"));
        }

        // Event handler when dropdown selection changes
        protected void ddlApplication2_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(ddlApplication2.SelectedValue))
            {
                PopulateListBox(ddlApplication2.SelectedValue); // Fetch and populate ListBox based on selected ApplicationID
            }
        }

        // Populate the ListBox with the selected application's details
        private void PopulateListBox(string applicationID)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["BursaryDBConnectionString"].ConnectionString;
            string query = @"
                SELECT a.*, s.IDnumber, s.Email, s.FirstName, s.Surname, s.CellNumber 
                FROM Applications a
                JOIN Student s ON a.StudentID = s.StudentID
                WHERE a.ApplicationID = @ApplicationID";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@ApplicationID", applicationID);
                conn.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                LBxReviw.Items.Clear(); // Clear previous items

                if (reader.Read())
                {
                    // Add application details
                    LBxReviw.Items.Add("ApplicationID: " + reader["ApplicationID"].ToString());
                    LBxReviw.Items.Add("StudentID: " + reader["StudentID"].ToString());
                    LBxReviw.Items.Add("Gender: " + reader["Gender"].ToString());
                    LBxReviw.Items.Add("Nationality: " + reader["Nationality"].ToString());
                    LBxReviw.Items.Add("Home Language: " + reader["HomeLanguage"].ToString());
                    LBxReviw.Items.Add("Residential Address: " + reader["ResidentialAddress"].ToString());
                    LBxReviw.Items.Add("Postal Address: " + reader["PostalAddress"].ToString());
                    LBxReviw.Items.Add("Highest Qualification: " + reader["HighestQualification"].ToString());
                    LBxReviw.Items.Add("Current Institution: " + reader["CurrentInstitution"].ToString());
                    LBxReviw.Items.Add("Year of Study: " + reader["YearOfStudy"].ToString());
                    LBxReviw.Items.Add("Field of Study: " + reader["FieldOfStudy"].ToString());
                    LBxReviw.Items.Add("APS Score: " + reader["APSScore"].ToString());
                    LBxReviw.Items.Add("Household Income: " + reader["HouseholdIncome"].ToString());
                    LBxReviw.Items.Add("Dependents: " + reader["Dependents"].ToString());
                    LBxReviw.Items.Add("Receiving Other Bursary: " + reader["ReceivingBursary"].ToString());
                    LBxReviw.Items.Add("Application Status: " + reader["Status"].ToString());

                    // Add student details
                    LBxReviw.Items.Add("ID Number: " + reader["IDnumber"].ToString());
                    LBxReviw.Items.Add("Email: " + reader["Email"].ToString());
                    LBxReviw.Items.Add("First Name: " + reader["FirstName"].ToString());
                    LBxReviw.Items.Add("Surname: " + reader["Surname"].ToString());
                    LBxReviw.Items.Add("Cell Number: " + reader["CellNumber"].ToString());
                }

                reader.Close();
            }
        }

        // Event handler for Update Status button click
        protected void BttnUpdate_Click(object sender, EventArgs e)
        {
            // Get selected application ID, status, and feedback
            string selectedApplicationId = ddlApplication2.SelectedValue; // Get selected application ID
            string selectedStatus = ddlupdates.SelectedValue; // Get selected status
            string feedback = txtFeedback.Text; // Get feedback from TextBox

            // Check if the selected application ID and status are valid
            if (!string.IsNullOrEmpty(selectedApplicationId) && selectedStatus != "Update status")
            {
                // Connection string to the database
                string connectionString = ConfigurationManager.ConnectionStrings["BursaryDBConnectionString"].ConnectionString;

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    // SQL query to update the application status and feedback
                    string query = "UPDATE Applications SET Status = @Status, Feedback = @Feedback WHERE ApplicationID = @ApplicationID";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        // Add parameters to the SQL command
                        cmd.Parameters.AddWithValue("@Status", selectedStatus);
                        cmd.Parameters.AddWithValue("@Feedback", feedback);
                        cmd.Parameters.AddWithValue("@ApplicationID", selectedApplicationId);

                        try
                        {
                            // Open the connection and execute the update command
                            con.Open();
                            int rowsAffected = cmd.ExecuteNonQuery();

                            // Check if the update was successful
                            if (rowsAffected > 0)
                            {
                                Response.Write("<script>alert('Status and Feedback Updated successfully.');</script>");
                            }
                            else
                            {
                                Response.Write("<script>alert('Failed to Update Status and Feedback. No rows affected.');</script>");
                            }
                        }
                        catch (Exception ex)
                        {
                            // Handle any errors that may have occurred
                            Response.Write("<script>alert('An error occurred: " + ex.Message + "');</script>");
                        }
                    }
                }
            }
            else
            {
                // Inform the user if the application ID or status is invalid
                Response.Write("<script>alert('Please select a valid application and status.');</script>");
            }
        }

        protected void txtFeedback_TextChanged(object sender, EventArgs e)
        {
            // This method will be called when the text in the txtFeedback TextBox changes
            string feedback = txtFeedback.Text;
            // You can process the feedback as needed.
            // Example: Response.Write("Feedback: " + feedback);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            // This event handler is currently empty. Implement functionality if needed.
        }

        protected void BttnDone_Click(object sender, EventArgs e)
        {
            // Retrieve the necessary data from the form
            int applicationID = int.Parse(ddlApplication2.SelectedValue); // Assuming ApplicationID is selected from the dropdown
            string status = ddlupdates.SelectedValue; // Assuming status is selected from a dropdown
            string comments = txtFeedback.Text; // The feedback entered by the admin
            DateTime reviewDate = calendarReviewDate.SelectedDate; // The review date selected from the calendar

            // Get the logged-in AdminID from the session
            int adminID = int.Parse(Session["AdminID"].ToString()); // Assuming AdminID is stored in session

            // Ensure that required fields are filled
            if (applicationID == 0 || string.IsNullOrEmpty(status) || string.IsNullOrEmpty(comments) || reviewDate == DateTime.MinValue)
            {
                // Display an error message if necessary fields are missing
                Response.Write("<script>alert('Please ensure all fields are filled.');</script>");
                return;
            }

            // Insert the data into the ApplicationReview table
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["BursaryDBConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = @"INSERT INTO ApplicationReview (ApplicationID, AdminID, ReviewDate, Status, Comments) 
                                     VALUES (@ApplicationID, @AdminID, @ReviewDate, @Status, @Comments)";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        // Add the parameters to the query
                        cmd.Parameters.AddWithValue("@ApplicationID", applicationID);
                        cmd.Parameters.AddWithValue("@AdminID", adminID);
                        cmd.Parameters.AddWithValue("@ReviewDate", reviewDate);
                        cmd.Parameters.AddWithValue("@Status", status);
                        cmd.Parameters.AddWithValue("@Comments", comments);

                        // Open the connection and execute the query
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();

                        // Show success message
                        Response.Write("<script>alert('Review submitted successfully.');</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle any errors that occur during the database operation
                Response.Write("<script>alert('Error submitting review: " + ex.Message + "');</script>");
            }
        }
    }
}
