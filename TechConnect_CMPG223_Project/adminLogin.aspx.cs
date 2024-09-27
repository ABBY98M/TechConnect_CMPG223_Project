using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminLogin : Page
{
    public partial class AdminLogin : System.Web.UI.Page
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
            string email = txtemail.Text.Trim();
            string password = txtpassword.Text.Trim();

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

                // Modify the query to retrieve AdminID as well
                string query = "SELECT AdminID FROM Admin WHERE Email = @Email AND Password = @Password";

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        // Add parameters to the SQL query to prevent SQL injection
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Password", password);

                        con.Open();

                        // Retrieve the AdminID here
                        object result = cmd.ExecuteScalar();

                        // Check if a user was found
                        if (result != null)
                        {
                            int AdminID = Convert.ToInt32(result);

                            // Save email and AdminID in session
                            Session["Email"] = email;
                            Session["AdminID"] = AdminID;  // Set the AdminID in the session

                            // Redirect to Admin Page
                            Response.Redirect("AdminAccount.aspx");
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
            // You can implement logic here if needed
        }
        else
        {
            // Display an error message
            string script = "alert('Invalid username or password. Please try again.');";
            ClientScript.RegisterStartupScript(this.GetType(), "LoginError", script, true);
        
        }
    }

    private bool ValidateAdminCredentials(string username, string password)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["DatabaseConnection"].ConnectionString;

        // SQL query to fetch admin credentials
        string query = "SELECT COUNT(1) FROM Admins WHERE Username = @Username AND Password = @Password";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@Username", username);
                command.Parameters.AddWithValue("@Password", password);
                try
                {
                    connection.Open();
                    int count = Convert.ToInt32(command.ExecuteScalar());
                    return count == 1; // Returns true if the admin exists
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error: " + ex.Message);
                    return false;
                }
            }
        }
    }
}