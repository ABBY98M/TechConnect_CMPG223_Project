using System;
using System.Data.SqlClient; // For SQL database connection
using System.Configuration; // To access the connection string

namespace TechConnect_CMPG223_Project
{
    public partial class ManageProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProfileData();
            }
        }

        // Method to load the user's profile data into the form fields
        private void LoadProfileData()
        {
            string loggedInEmail = Session["Email"]?.ToString(); // Assumes user's email is stored in session
            if (string.IsNullOrEmpty(loggedInEmail))
            {
                Response.Redirect("loginPage.aspx");
                return;
            }

            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["BursaryDBConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "SELECT IDnumber, Email, FirstName, Surname, CellNumber FROM Student WHERE Email = @Email";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Email", loggedInEmail);

                        con.Open();
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                // Populate form fields with profile data
                                txtIdNumber.Text = reader["IDnumber"].ToString();
                                txtEmail.Text = reader["Email"].ToString();
                                txtFirstName.Text = reader["FirstName"].ToString();
                                txtSurname.Text = reader["Surname"].ToString();
                                txtCellNumber.Text = reader["CellNumber"].ToString();
                            }
                        }
                        con.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error loading profile: " + ex.Message + "');</script>");
            }
        }

        // Event handler for updating profile
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string idNumber = txtIdNumber.Text.Trim();
            string email = txtEmail.Text.Trim();
            string firstName = txtFirstName.Text.Trim();
            string surname = txtSurname.Text.Trim();
            string cellNumber = txtCellNumber.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (string.IsNullOrEmpty(idNumber) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(firstName) ||
                string.IsNullOrEmpty(surname) || string.IsNullOrEmpty(cellNumber))
            {
                Response.Write("<script>alert('Please fill out all fields.');</script>");
                return;
            }

            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["BursaryDBConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = @"UPDATE Student SET IDnumber = @IDnumber, FirstName = @FirstName, Surname = @Surname, 
                                     CellNumber = @CellNumber WHERE Email = @Email";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@IDnumber", idNumber);
                        cmd.Parameters.AddWithValue("@FirstName", firstName);
                        cmd.Parameters.AddWithValue("@Surname", surname);
                        cmd.Parameters.AddWithValue("@CellNumber", cellNumber);
                        cmd.Parameters.AddWithValue("@Email", email);

                        con.Open();
                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            Response.Write("<script>alert('Profile updated successfully.');</script>");
                        }
                        else
                        {
                            Response.Write("<script>alert('No changes made to the profile.');</script>");
                        }

                        con.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error updating profile: " + ex.Message + "');</script>");
            }
        }

        // Event handler for deleting profile
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();

            if (string.IsNullOrEmpty(email))
            {
                Response.Write("<script>alert('E-mail is required to delete profile.');</script>");
                return;
            }

            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["BursaryDBConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "DELETE FROM Student WHERE Email = @Email";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Email", email);

                        con.Open();
                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            Response.Write("<script>alert('Profile deleted successfully. Redirecting to home page...');</script>");
                           // Session.Clear(); // Clear session
                           // Response.Redirect("loginPage.aspx");
                        }
                        else
                        {
                            Response.Write("<script>alert('Profile deletion failed.');</script>");
                        }

                        con.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error deleting profile: " + ex.Message + "');</script>");
            }
        }
    }
}
