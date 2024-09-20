using System;
using System.Data.SqlClient; // Needed for SQL database connection
using System.Web.UI;
using System.Configuration; // To access the connection string

namespace TechConnect_CMPG223_Project
{
    public partial class loginPage : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Logic to handle when the page first loads can go here.
            if (!IsPostBack)
            {
                // Any initial setup code can go here
            }
        }

        // Event handler for the Login button click
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // Get the entered data from the form fields
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            // Basic validation: Check if both fields are filled
            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
            {
                // Display an error if any field is empty
                Response.Write("<script>alert('Please fill out both fields.');</script>");
                return;
            }

            // Query to check if the user exists
            try
            {
                // Get the connection string from Web.config
                string connectionString = ConfigurationManager.ConnectionStrings["BursaryDBConnectionString"].ConnectionString;

                // Define the SQL query to check for user credentials
                string query = "SELECT COUNT(*) FROM Student WHERE Email = @Email AND Password = @Password";

                // Use SQL connection and command to execute the query
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        // Add parameters to the SQL query to prevent SQL injection
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Password", password);

                        // Open the connection
                        con.Open();

                        // Execute the query to check for user
                        int userCount = Convert.ToInt32(cmd.ExecuteScalar());

                        // Check if a user was found
                        if (userCount > 0)
                        {
                            // User exists, redirect to the application page
                            Response.Redirect("ApplicationPage.aspx");
                        }
                        else
                        {
                            // Display an error message if login failed
                            Response.Write("<script>alert('Invalid email or password.');</script>");
                        }
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
