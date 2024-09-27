using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class AdminLogin : Page
{
	private object txtbUsername;
	private object txtbPassword;

	protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {

        // Receive user input
        string username = txtbUsername.ToString().Trim();
		
		string password = txtbPassword.ToString().Trim();

        // Validate admin credentials
        if (ValidateAdminCredentials(username, password))
        {
            Response.Redirect("adminDashboard.aspx");
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