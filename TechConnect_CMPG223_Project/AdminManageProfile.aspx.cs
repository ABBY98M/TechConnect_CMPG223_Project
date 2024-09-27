using System;
using System.Configuration;
using System.Data.SqlClient;

namespace TechConnect_CMPG223_Project
{
    public partial class AdminManageProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadRoles(); // Load the dropdown with available roles
                LoadProfile(); // Load the user's profile
            }
        }

        // Populate the dropdown with admin roles
        // Populate the dropdown with admin roles
        private void LoadRoles()
        {
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["BursaryDBConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "SELECT DISTINCT Role FROM Admin";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        con.Open();
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            drpdwnrole.Items.Clear(); // Clear existing items

                            // Adding database roles
                            while (reader.Read())
                            {
                                string role = reader["Role"].ToString();
                                if (!string.IsNullOrEmpty(role))
                                {
                                    drpdwnrole.Items.Add(role);
                                }
                            }
                        }
                        con.Close();
                    }
                }

                // Ensure these four roles are always available
                if (drpdwnrole.Items.FindByValue("Admin") == null)
                    drpdwnrole.Items.Add("Admin");

                if (drpdwnrole.Items.FindByValue("SuperAdmin") == null)
                    drpdwnrole.Items.Add("SuperAdmin");

                if (drpdwnrole.Items.FindByValue("Reviewer") == null)
                    drpdwnrole.Items.Add("Reviewer");

                if (drpdwnrole.Items.FindByValue("Moderator") == null)
                    drpdwnrole.Items.Add("Moderator");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error loading roles: " + ex.Message + "');</script>");
            }
        }


        private void LoadProfile()
        {
            string loggedInEmail = Session["Email"]?.ToString(); // Assumes user's email is stored in session
            if (string.IsNullOrEmpty(loggedInEmail))
            {
                Response.Redirect("AdminLogin.aspx");
                return;
            }

            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["BursaryDBConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "SELECT Email, Password, Name, Role, IDNumber FROM Admin WHERE Email = @Email";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Email", loggedInEmail);

                        con.Open();
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                // Populate form fields with profile data
                                txtIdNmb.Text = reader["IDNumber"].ToString();
                                txtEmailaddr.Text = reader["Email"].ToString();
                                txtName.Text = reader["Name"].ToString();
                                txtPsswd.Text = reader["Password"].ToString();

                                // Set the selected role in the dropdown
                                string userRole = reader["Role"].ToString();
                                if (drpdwnrole.Items.FindByValue(userRole) != null)
                                {
                                    drpdwnrole.SelectedValue = userRole;
                                }
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

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string idNumber = txtIdNmb.Text.Trim();
            string email = txtEmailaddr.Text.Trim();
            string name = txtName.Text.Trim();
            string role = drpdwnrole.SelectedValue.Trim(); // Use the selected value from the dropdown
            string password = txtPsswd.Text.Trim();

            if (string.IsNullOrEmpty(idNumber) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(name) ||
                string.IsNullOrEmpty(role) || string.IsNullOrEmpty(password))
            {
                Response.Write("<script>alert('Please fill out all fields.');</script>");
                return;
            }

            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["BursaryDBConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = @"UPDATE Admin SET IDNumber = @IDNumber, Name = @Name, Password = @Password,
                                     Role = @Role WHERE Email = @Email";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@IDNumber", idNumber);
                        cmd.Parameters.AddWithValue("@Name", name);
                        cmd.Parameters.AddWithValue("@Role", role);
                        cmd.Parameters.AddWithValue("@Password", password);
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

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            string email = txtEmailaddr.Text.Trim();

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
                    string query = "DELETE FROM Admin WHERE Email = @Email";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Email", email);

                        con.Open();
                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            Response.Write("<script>alert('Profile deleted successfully. Redirecting to home page...');</script>");
                            // Session.Clear(); // Clear session if needed
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

        protected void drpdwnrole_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
