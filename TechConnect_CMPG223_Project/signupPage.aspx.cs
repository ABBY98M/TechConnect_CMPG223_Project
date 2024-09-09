using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;


namespace TechConnect_CMPG223_Project
{
    public partial class signupPage : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Any necessary logic on page load can go here
        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {
            // Retrieve the email and confirm password from the form
            string email = Request.Form["email"];
            string confirmPassword = Request.Form["confirmPassword"];

            // Check if the passwords match
            if (confirmPassword != null && confirmPassword.Length > 0) // Ensure confirmPassword is not null or empty
            {
                // Proceed to insert student data into the database
                InsertStudentData(email, confirmPassword);

                // Proceed to the next page if passwords match
                Response.Redirect("registrationPage.aspx");
            }
            else
            {
                // Display an error message if passwords do not match
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please enter a valid password.');", true);
            }
        }

        private void InsertStudentData(string email, string confirmPassword)
        {
            // Connection string
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|//Student.mdf;Integrated Security=True";

            // SQL INSERT statement
            string insertQuery = "INSERT INTO Student (Email, Password) VALUES (@Email, @Password)";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Open the database connection
                connection.Open();

                // Create a SQL command
                SqlCommand command = new SqlCommand(insertQuery, connection);

                // Set the parameter values
                command.Parameters.AddWithValue("@Email", email);
                command.Parameters.AddWithValue("@Password", confirmPassword); // Store the password (ensure to hash it in production)

                // Execute the SQL command
                command.ExecuteNonQuery();

                // Close the database connection
                connection.Close();
            }
        }
    }
}