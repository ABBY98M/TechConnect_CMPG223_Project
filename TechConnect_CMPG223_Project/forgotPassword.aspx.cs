using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace TechConnect_CMPG223_Project
{
    public partial class forgotPassword : Page
    {
        private string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|//Student.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            // Any necessary code for page load
        }

        protected void ResetPassword(object sender, EventArgs e)
        {
            string contact = Request.Form["contact"];
            string verificationCode = Request.Form["verificationCode"];
            string newPassword = Request.Form["newPassword"];

            // Validate the verification code (replace with actual logic)
            if (verificationCode == "1234") // Assuming the code is always "1234" for demonstration purposes
            {
                UpdatePassword(contact, newPassword);
                Response.Redirect("loginPage.aspx"); // Redirect to the login page after successful password reset
            }
            else
            {
                Response.Write("<script>alert('Invalid verification code. Please try again.');</script>");
            }
        }

        private void UpdatePassword(string contact, string newPassword)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "UPDATE Users SET Password = @NewPassword WHERE Email = @Contact OR PhoneNumber = @Contact";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@NewPassword", newPassword);
                    cmd.Parameters.AddWithValue("@Contact", contact);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }
    }
}