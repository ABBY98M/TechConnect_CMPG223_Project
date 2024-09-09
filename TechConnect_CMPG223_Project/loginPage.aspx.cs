using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace TechConnect_CMPG223_Project
{
    public partial class loginPage_aspx : Page
    {
        // Connection string to the database
        private string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|//Student.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            // Any necessary code for page load
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string email = Request.Form["email"];
            string password = Request.Form["password"];

            if (ValidateUser(email, password))
            {
                // Redirect to the student dashboard if validation is successful
                Response.Redirect("studentDashboard.aspx");
            }
            else
            {
                // Display an error message if validation fails
                Response.Write("<script>alert('Invalid email or password. Please try again.');</script>");
            }
        }

        private bool ValidateUser(string email, string password)
        {
            bool isValid = false;

            //connection to the database
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                //query to check for user credentials
                string query = "SELECT COUNT(*) FROM Users WHERE Email = @Email AND Password = @Password";

                //SqlCommand object to execute the query
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Password", password);

                    // Open the connection
                    con.Open();

                    int count = (int)cmd.ExecuteScalar();
                    isValid = count > 0;
                }
            }
            return isValid;
        }
    }
}