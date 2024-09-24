using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace TechConnect_CMPG223_Project
{
    public partial class adminDashboard : Page
    {
        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|//Student.mdf;Integrated Security=True");
        private List<string> userInfoList = new List<string>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUserInformation();
            }
        }

        private void LoadUserInformation()
        {
            string query = "SELECT FullNames, Surname, IDNumber, Email, Phone, Institution, EducationLevel FROM Students";

            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                try
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        string userInfo = $"{reader["FullNames"]} {reader["Surname"]} - {reader["Email"]} - {reader["Institution"]}";
                        userInfoList.Add(userInfo);
                    }

                    reader.Close();
                    DisplayUserInfo(userInfoList);
                }
                catch (Exception ex)
                {
                    Response.Write("Error: " + ex.Message);
                }
                finally
                {
                    con.Close();
                }
            }
        }

        private void DisplayUserInfo(List<string> infoList)
        {
            lstbxRecords.Items.Clear();
            foreach (string info in infoList)
            {
                lstbxRecords.Items.Add(info);
            }
        }

        protected void btnSortAscending_Click(object sender, EventArgs e)
        {
            //Sorting the data in ascending order
            List<string> sortedList = userInfoList.OrderBy(x => x).ToList();
            DisplayUserInfo(sortedList);
        }

        protected void btnSortDescending_Click(object sender, EventArgs e)
        {
            //Sorting the data in descending order
            List<string> sortedList = userInfoList.OrderByDescending(x => x).ToList();
            DisplayUserInfo(sortedList);
        }

        protected void btnAddComment_Click(object sender, EventArgs e)
        {
            string comment = txtAdminComment.Text.Trim();
            if (!string.IsNullOrEmpty(comment))
            {
                // Save the comment to the database or perform any other desired action
                Response.Write("<script>alert('Comment added successfully.');</script>");
                txtAdminComment.Text = string.Empty; // Clear the textarea
            }
            else
            {
                Response.Write("<script>alert('Please enter a comment.');</script>");
            }
        }
    }
}