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
                Response.Write("<script>alert('Please fill out both fields.');</script>");
                return;
            }

            try
            {
                // Get the connection string from Web.config
                string connectionString = ConfigurationManager.ConnectionStrings["BursaryDBConnectionString"].ConnectionString;

                // Modify the query to retrieve StudentID as well
                string query = "SELECT StudentID FROM Student WHERE Email = @Email AND Password = @Password";

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        // Add parameters to the SQL query to prevent SQL injection
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Password", password);

                        con.Open();

                        // Retrieve the StudentID here
                        object result = cmd.ExecuteScalar();

                        // Check if a user was found
                        if (result != null)
                        {
                            int studentID = Convert.ToInt32(result);

                            // Save email and StudentID in session
                            Session["Email"] = email;
                            Session["StudentID"] = studentID;  // Set the StudentID in the session

                            // Redirect to Student Account page
                            Response.Redirect("StudentAccount.aspx");
                        }
                        else
                        {
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


        protected void txtPassword_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
