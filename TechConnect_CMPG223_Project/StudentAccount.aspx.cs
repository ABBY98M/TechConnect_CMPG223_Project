using System;
using System.Web.UI;

namespace TechConnect_CMPG223_Project
{
    public partial class StudentAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Load any initial data here if needed
            }
        }

        protected void MyApplication_Click(object sender, EventArgs e)
        {
            // Redirect to ApplicationPage
            Response.Redirect("ApplicationPage.aspx");
        }

        protected void ManageProfile_Click(object sender, EventArgs e)
        {
            // Redirect to UpdatePage
            Response.Redirect("updateProfile.aspx");
        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            // Clear session and redirect to home page
            Session.Clear(); // Clear session data
            Response.Redirect("defaultPage.aspx"); // Redirect to home page
        }
    }
}
