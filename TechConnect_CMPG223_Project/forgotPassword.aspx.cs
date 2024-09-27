using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace TechConnect_CMPG223_Project
{
    public partial class forgotPassword : Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["BursaryDBConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Any necessary code for page load
        }

        protected void ResetPassword(object sender, EventArgs e)
        {
            string contact = Request.Form["contact"];
            string verificationCode = Request.Form["verificationCode"];
            string newPassword = Request.Form["newPassword"];

            // Validate the verification code (this should be replaced with actual logic
            if (IsValidVerificationCode(contact, verificationCode))
            {
                UpdatePassword(contact, newPassword);
                Response.Redirect("loginPage.aspx"); // Redirect to the login page after successful password reset
            }
            else
            {
                Response.Write("<script>alert('Invalid verification code. Please try again.');</script>");
            }
        }

        private bool IsValidVerificationCode(string contact, string verificationCode)
        {

            // Send a code via email/SMS and checking it against a stored value.
            // For now, I'll just return true.
            return verificationCode == "1234";
        }

        private void UpdatePassword(string contact, string newPassword)
        {
            //hashing the new password before storing it in the database for security reasons.
            string hashedPassword = HashPassword(newPassword);

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "UPDATE Student SET Password = @NewPassword WHERE Email = @Contact OR CellNumber = @Contact";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@NewPassword", hashedPassword);
                    cmd.Parameters.AddWithValue("@Contact", contact);

                    con.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();
                    if (rowsAffected == 0)
                    {
                        // Handle case where no rows were affected (e.g., invalid email or cell number)
                        Response.Write("<script>alert('Contact information not found.');</script>");
                    }
                }
            }
        }

        private string HashPassword(string password)
        {
            // Implement a password hashing function here (e.g., using BCrypt or PBKDF2)
            //For demonstration, we'll return the password as-is; you should replace this with actual hashing logic.
            return password; // Replace with hashed password
        }
    }
}

