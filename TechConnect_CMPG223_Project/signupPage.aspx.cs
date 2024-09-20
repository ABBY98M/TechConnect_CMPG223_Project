using System;
using System.Data.SqlClient; // Needed for SQL database connection
using System.Web.UI;
using System.Configuration; // To access the connection string

namespace TechConnect_CMPG223_Project
{
    public partial class signupPage : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Logic to handle when the page first loads can go here.
            if (!IsPostBack)
            {
                // Any initial setup code can go here
            }
        }

        // Event handler for the Register button click
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            // Get the entered data from the form fields
            string idNumber = txtIdNumber.Text.Trim();
            string email = txtEmail.Text.Trim();
            string firstName = txtFirstName.Text.Trim();
            string surname = txtSurname.Text.Trim();
            string cellNumber = txtCellNumber.Text.Trim();
            string password = txtPassword.Text.Trim();

            // Basic validation: Check if all fields are filled
            if (string.IsNullOrEmpty(idNumber) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(firstName) ||
                string.IsNullOrEmpty(surname) || string.IsNullOrEmpty(cellNumber) || string.IsNullOrEmpty(password))
            {
                // Display an error if any field is empty
                Response.Write("<script>alert('Please fill out all fields.');</script>");
                return;
            }

            // Password requirements: Must be at least 16 characters
            if (password.Length < 16)
            {
                // Display an error if the password is too short
                Response.Write("<script>alert('Password must be at least 16 characters long.');</script>");
                return;
            }

            // Insert the data into the database if validation is successful
            try
            {
                // Get the connection string from Web.config
                string connectionString = ConfigurationManager.ConnectionStrings["BursaryDBConnectionString"].ConnectionString;

                // Define the SQL query to insert the user data
                string query = @"INSERT INTO Student (IDnumber, Email, FirstName, Surname, CellNumber, Password)
                                 VALUES (@IDnumber, @Email, @FirstName, @Surname, @CellNumber, @Password)";

                // Use SQL connection and command to execute the query
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        // Add parameters to the SQL query to prevent SQL injection
                        cmd.Parameters.AddWithValue("@IDnumber", idNumber);
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@FirstName", firstName);
                        cmd.Parameters.AddWithValue("@Surname", surname);
                        cmd.Parameters.AddWithValue("@CellNumber", cellNumber);
                        cmd.Parameters.AddWithValue("@Password", password);

                        // Open the connection
                        con.Open();

                        // Execute the query to insert data
                        int rowsAffected = cmd.ExecuteNonQuery();

                        // Check if insertion was successful
                        if (rowsAffected > 0)
                        {
                            // Navigate to the registration page if successful
                            Response.Redirect("loginPage.aspx");
                        }
                        else
                        {
                            // Display an error message if insertion failed
                            Response.Write("<script>alert('An error occurred during signup. Please try again.');</script>");
                        }

                        // Close the connection
                        con.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle any errors that occur during the process
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }
    }
}
