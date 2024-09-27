using System;
using System.Data.SqlClient;
using System.Configuration;

namespace TechConnect_CMPG223_Project
{
    public partial class AdminRegister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string idNumber = txtIDnumber.Text;
            string email = txTEmail.Text;

            // Connection string from Web.config
            string connectionString = ConfigurationManager.ConnectionStrings["BursaryDBConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                // Query to check if admin is already registered
                string checkAdminQuery = "SELECT COUNT(*) FROM Admin WHERE IDnumber = @IDnumber OR Email = @Email";
                SqlCommand cmd = new SqlCommand(checkAdminQuery, conn);
                cmd.Parameters.AddWithValue("@IDnumber", idNumber);
                cmd.Parameters.AddWithValue("@Email", email);

                int adminExists = (int)cmd.ExecuteScalar();

                if (adminExists > 0)
                {
                    // Redirect to AdminLogin page if already registered
                    Response.Redirect("AdminLogin.aspx");
                }
                else
                {
                    // Proceed with registration logic here
                    string insertQuery = "INSERT INTO Admin (IDnumber, Email, Name, Role, Password) " +
                                         "VALUES (@IDnumber, @Email, @Name, @Role, @Password)";

                    SqlCommand insertCmd = new SqlCommand(insertQuery, conn);
                    insertCmd.Parameters.AddWithValue("@IDnumber", idNumber);
                    insertCmd.Parameters.AddWithValue("@Email", email);
                    insertCmd.Parameters.AddWithValue("@Name", txtFirstname.Text);
                    insertCmd.Parameters.AddWithValue("@Role", txtRole.Text);
                    insertCmd.Parameters.AddWithValue("@Password", txtpassword.Text); // Consider hashing the password

                    insertCmd.ExecuteNonQuery();

                    // Redirect to AdminLogin after successful registration
                    Response.Redirect("AdminLogin.aspx");
                }
            }
        }
    }
}
