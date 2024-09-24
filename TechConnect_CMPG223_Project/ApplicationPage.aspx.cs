using System;
using System.Data.SqlClient;
using System.Configuration;
using System.IO; // For file handling
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq;

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
            // Ensure dropdowns are selected
            if (ddlNationality.SelectedValue == "" || ddlHomeLanguage.SelectedValue == "" || ddlHighestQualification.SelectedValue == "")
            {
                Response.Write("<script>alert('Please select a valid nationality, home language, and highest qualification.');</script>");
                return;
            }

            // Ensure Current Institution is not empty
            if (string.IsNullOrWhiteSpace(txtCurrentInstitution.Text))
            {
                Response.Write("<script>alert('Please enter your current institution.');</script>");
                return;
            }

            // Ensure Year of Study is not empty
            if (string.IsNullOrWhiteSpace(txtYearOfStudy.Text))
            {
                Response.Write("<script>alert('Please enter your year of study.');</script>");
                return;
            }

            // Ensure Field of Study is not empty
            if (string.IsNullOrWhiteSpace(txtFieldOfStudy.Text))
            {
                Response.Write("<script>alert('Please enter your field of study.');</script>");
                return;
            }

            // Ensure APS Score is not empty
            if (string.IsNullOrWhiteSpace(txtAPSScore.Text))
            {
                Response.Write("<script>alert('Please enter your APS score.');</script>");
                return;
            }

            // Ensure file uploads are valid
            if (!fuIDDocument.HasFile || !fuProofResidence.HasFile || !fuCertifiedResults.HasFile)
            {
                Response.Write("<script>alert('Please upload all required documents.');</script>");
                return;
            }

            // Capture form values
            string gender = rbMale.Checked ? "Male" : "Female";
            string nationality = ddlNationality.SelectedValue;
            string homeLanguage = ddlHomeLanguage.SelectedValue;
            string residentialAddress = txtResidentialAddress.Text;
            string postalAddress = txtPostalAddress.Text;
            string highestQualification = ddlHighestQualification.SelectedValue;
            string currentInstitution = txtCurrentInstitution.Text;
            string yearOfStudy = txtYearOfStudy.Text;
            string fieldOfStudy = txtFieldOfStudy.Text;
            string apsScore = txtAPSScore.Text;
            string householdIncome = ddlHouseholdIncome.SelectedValue; // New field for household income
            string dependents = txtDependents.Text; // New field for number of dependents
            string receivingBursary = rbReceivingBursaryYes.Checked ? "Yes" : "No"; // New field for receiving bursary

            // File upload handling
            string idDocumentPath = SaveFile(fuIDDocument);
            string proofResidencePath = SaveFile(fuProofResidence);
            string certifiedResultsPath = SaveFile(fuCertifiedResults);

            // Retrieve StudentID (from session or another method)
            int studentId = Convert.ToInt32(Session["StudentID"]);

            // SQL query to insert the form data, including file paths
            string connectionString = ConfigurationManager.ConnectionStrings["BursaryDBConnectionString"].ConnectionString;
            string insertQuery = @"INSERT INTO Applications 
    (StudentID, Gender, Nationality, HomeLanguage, ResidentialAddress, PostalAddress, HighestQualification, CurrentInstitution, YearOfStudy, FieldOfStudy, APSScore, HouseholdIncome, Dependents, ReceivingBursary, IDDocumentPath, ProofResidencePath, CertifiedResultsPath) 
    VALUES 
    (@StudentID, @Gender, @Nationality, @HomeLanguage, @ResidentialAddress, @PostalAddress, @HighestQualification, @CurrentInstitution, @YearOfStudy, @FieldOfStudy, @APSScore, @HouseholdIncome, @Dependents, @ReceivingBursary, @IDDocumentPath, @ProofResidencePath, @CertifiedResultsPath)";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(insertQuery, con))
                {
                    // Add parameters
                    cmd.Parameters.AddWithValue("@StudentID", studentId);
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
                    cmd.Parameters.AddWithValue("@IDDocumentPath", idDocumentPath);
                    cmd.Parameters.AddWithValue("@ProofResidencePath", proofResidencePath);
                    cmd.Parameters.AddWithValue("@CertifiedResultsPath", certifiedResultsPath);

                    try
                    {
                        con.Open();
                        cmd.ExecuteNonQuery();
                        Response.Write("<script>alert('Application submitted successfully!');</script>");
                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                    }
                }
            }
        }

        // Method to save the uploaded file and return the file path
        private string SaveFile(FileUpload fileUpload)
        {
            string fileName = Path.GetFileName(fileUpload.FileName);
            string filePath = Server.MapPath("~/UploadedDocuments/") + fileName; // Ensure this directory exists

            // Save the file to the server
            fileUpload.SaveAs(filePath);

            return "~/UploadedDocuments/" + fileName; // Return relative path to the database
        }
    }
}




