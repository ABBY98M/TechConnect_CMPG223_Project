using System;
using System.Data.SqlClient;
using System.Configuration;
using System.IO; // For file handling
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TechConnect_CMPG223_Project
{
    public partial class ApplicationPage : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Fetch and display the logged-in user's details
                DisplayUserData();
            }
        }

        private void DisplayUserData()
        {
            string userEmail = Session["Email"] as string;
            if (string.IsNullOrEmpty(userEmail))
            {
                Response.Redirect("loginPage.aspx");
                return;
            }

            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["BursaryDBConnectionString"].ConnectionString;
                string query = @"SELECT FirstName, Surname, IDnumber, Email, CellNumber FROM Student WHERE Email = @Email";

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Email", userEmail);
                        con.Open();

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                fullNames.Text = reader["FirstName"].ToString();
                                surname.Text = reader["Surname"].ToString();
                                idnumber.Text = reader["IDnumber"].ToString();
                                txtEmail.Text = reader["Email"].ToString();
                                txtPhone.Text = reader["CellNumber"].ToString();
                            }
                            else
                            {
                                Response.Redirect("loginPage.aspx");
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Log error (consider using logging frameworks)
                Response.Write($"<script>alert('Error: {ex.Message}');</script>");
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int studentID = Convert.ToInt32(Session["StudentID"]);
            string gender = rbMale.Checked ? "Male" : rbFemale.Checked ? "Female" : null; // Retrieve gender
            string nationality = ddlNationality.SelectedValue;
            string homeLanguage = ddlHomeLanguage.SelectedValue;
            string residentialAddress = txtResidentialAddress.Text;
            string postalAddress = txtPostalAddress.Text;
            string highestQualification = ddlHighestQualification.SelectedValue;
            string currentInstitution = txtCurrentInstitution.Text;
            int yearOfStudy = Convert.ToInt32(txtYearOfStudy.Text);
            string fieldOfStudy = txtFieldOfStudy.Text;
            int apsScore = Convert.ToInt32(txtAPSScore.Text);
            string householdIncome = ddlHouseholdIncome.SelectedValue;
            int dependents = Convert.ToInt32(txtDependents.Text);
            string receivingBursary = rbReceivingBursaryYes.Checked ? "Yes" : "No";
            string motivationLetter = txtMotivationLetter.Text;

            // Handle file uploads
            string idDocumentPath = SaveFile(fuIDDocument);
            string proofResidencePath = SaveFile(fuProofResidence);
            string certifiedResultsPath = SaveFile(fuCertifiedResults);

            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["BursaryDBConnectionString"].ConnectionString;
                string query = @"INSERT INTO Applications 
                         (StudentID, Gender, Nationality, HomeLanguage, ResidentialAddress, PostalAddress, HighestQualification, CurrentInstitution, YearOfStudy, FieldOfStudy, APSScore, HouseholdIncome, Dependents, ReceivingBursary, MotivationLetter, IDDocumentPath, ProofResidencePath, CertifiedResultsPath)
                         VALUES 
                         (@StudentID, @Gender, @Nationality, @HomeLanguage, @ResidentialAddress, @PostalAddress, @HighestQualification, @CurrentInstitution, @YearOfStudy, @FieldOfStudy, @APSScore, @HouseholdIncome, @Dependents, @ReceivingBursary, @MotivationLetter, @IDDocumentPath, @ProofResidencePath, @CertifiedResultsPath)";

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@StudentID", studentID);
                        cmd.Parameters.AddWithValue("@Gender", gender);
                        cmd.Parameters.AddWithValue("@Nationality", nationality);
                        cmd.Parameters.AddWithValue("@HomeLanguage", homeLanguage);
                        cmd.Parameters.AddWithValue("@ResidentialAddress", residentialAddress);
                        cmd.Parameters.AddWithValue("@PostalAddress", postalAddress);
                        cmd.Parameters.AddWithValue("@HighestQualification", highestQualification);
                        cmd.Parameters.AddWithValue("@CurrentInstitution", currentInstitution);
                        cmd.Parameters.AddWithValue("@YearOfStudy", yearOfStudy);
                        cmd.Parameters.AddWithValue("@FieldOfStudy", fieldOfStudy);
                        cmd.Parameters.AddWithValue("@APSScore", apsScore);
                        cmd.Parameters.AddWithValue("@HouseholdIncome", householdIncome);
                        cmd.Parameters.AddWithValue("@Dependents", dependents);
                        cmd.Parameters.AddWithValue("@ReceivingBursary", receivingBursary);
                        cmd.Parameters.AddWithValue("@MotivationLetter", motivationLetter);
                        cmd.Parameters.AddWithValue("@IDDocumentPath", idDocumentPath);
                        cmd.Parameters.AddWithValue("@ProofResidencePath", proofResidencePath);
                        cmd.Parameters.AddWithValue("@CertifiedResultsPath", certifiedResultsPath);

                        con.Open();
                        cmd.ExecuteNonQuery();
                        Response.Write("<script>alert('Application submitted successfully!');</script>");
                        Response.Redirect("StudentAccount.aspx");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Error: {ex.Message}');</script>");
            }
        }

        private string SaveFile(FileUpload fileUpload)
        {
            if (fileUpload.HasFile)
            {
                try
                {
                    string fileName = Path.GetFileName(fileUpload.FileName);
                    string filePath = Server.MapPath("~/Uploads/") + fileName; // Adjust path as needed
                    fileUpload.SaveAs(filePath);
                    return filePath; // Store the file path in the database
                }
                catch (Exception ex)
                {
                    Response.Write($"<script>alert('File upload error: {ex.Message}');</script>");
                    return null; // Return null if the file upload fails
                }
            }
            return null; // Return null if no file was uploaded
        }

        // Event handler for rbMale
        protected void rbMale_CheckedChanged(object sender, EventArgs e)
        {
            // Logic can be added here if needed
        }
    }
}