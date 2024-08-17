using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace TechConnect_CMPG223_Project
{
    public partial class registrationPage : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|//Student.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Retrieve the email from the database and set it to the textbox
                string email = GetEmailFromDatabase();
                if (!string.IsNullOrEmpty(email))
                {
                    txtEmail.Text = email; // Auto-fill the email textbox
                }
            }
        }

        protected void btnRegistor_Click(object sender, EventArgs e)
        {
            // Call the method to insert student data into the database
            InsertStudentData();

            // Redirect to the login page after insertion
            Response.Redirect("loginPage.aspx");
        }

        private string GetEmailFromDatabase()
        {
            string email = string.Empty;

            // Assuming you have a way to identify the user (e.g., user ID)
            int userId = 1; // Replace with actual logic to get the current user's ID

            string query = "SELECT Email FROM Students WHERE UserID = @UserID"; // Adjust the query as necessary

            using (SqlCommand command = new SqlCommand(query, con))
            {
                command.Parameters.AddWithValue("@UserID", userId);

                con.Open();
                try
                {
                    SqlDataReader reader = command.ExecuteReader();
                    if (reader.Read())
                    {
                        email = reader["Email"].ToString(); // Retrieve the email from the database
                    }
                }
                catch (Exception ex)
                {
                    // Handle any errors that may have occurred
                    throw new Exception("Error retrieving email: " + ex.Message);
                }
                finally
                {
                    con.Close();
                }
            }

            return email;
        }

        private void InsertStudentData()
        {
            // Retrieve input values from the form
            string fullNames = Request.Form["fullNames"];
            string surname = Request.Form["surname"];
            string idNumber = Request.Form["idnumber"];
            string email = Request.Form["email"];
            string phone = Request.Form["phone"];
            string address = Request.Form["address"];
            string institution = Request.Form["institution"];
            string educationLevel = Request.Form["educationLevel"];
            string academicReport = Request.Form["academicReport"]; // Handle file upload appropriately
            string apsScore = Request.Form["apsScore"];
            string gpa = Request.Form["gpa"];

            // Prepare the SQL INSERT statement
            string insertQuery = "INSERT INTO Students (FullNames, Surname, IDNumber, Email, Phone, Address, Institution, EducationLevel, AcademicReport, APSScore, GPA) " +
                                 "VALUES (@FullNames, @Surname, @IDNumber, @Email, @Phone, @Address, @Institution, @EducationLevel, @AcademicReport, @APSScore, @GPA)";

            using (SqlCommand command = new SqlCommand(insertQuery, con))
            {
                // Set the parameter values
                command.Parameters.AddWithValue("@FullNames", fullNames);
                command.Parameters.AddWithValue("@Surname", surname);
                command.Parameters.AddWithValue("@IDNumber", idNumber);
                command.Parameters.AddWithValue("@Email", email);
                command.Parameters.AddWithValue("@Phone", phone);
                command.Parameters.AddWithValue("@Address", address);
                command.Parameters.AddWithValue("@Institution", institution);
                command.Parameters.AddWithValue("@EducationLevel", educationLevel);
                command.Parameters.AddWithValue("@AcademicReport", academicReport); // Handle file upload appropriately
                command.Parameters.AddWithValue("@APSScore", apsScore);
                command.Parameters.AddWithValue("@GPA", gpa);

                // Open the database connection
                con.Open();

                try
                {
                    // Execute the SQL command
                    command.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    // Handle any errors that may have occurred
                    throw new Exception("Error inserting data: " + ex.Message);
                }
                finally
                {
                    // Close the database connection
                    con.Close();
                }
            }
        }
    }
}