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

                        if (lstBoxUserInfo != null)
                        {
                            lstUserInfo.Items.Add(userInfo);
                        }
                        else
                        {
                            Response.Write("Error: lstUserInfo is null");
                        }
                    }

                    reader.Close();
                }
                catch (Exception ex)
                {
                    // Handle any errors
                    Response.Write("Error: " + ex.Message);
                }
                finally
                {
                    con.Close();
                }
            }
        }
    }
}