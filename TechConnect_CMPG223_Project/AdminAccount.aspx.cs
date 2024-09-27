using System;
using System.Web.UI;

namespace TechConnect_CMPG223_Project
{
    public partial class AdminAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Any logic needed when the page loads, such as checking if the admin is logged in.
        }

        // Handles "APPLICATIONS" button click
        protected void MyApplication_Click(object sender, EventArgs e)
        {
            // Redirect to the page where applications are viewed or managed.
            Response.Redirect("AdminPage.aspx"); // Replace with your actual applications page
        }

        // Handles "MANAGE PROFILE" button click
        protected void ManageProfile_Click(object sender, EventArgs e)
        {
            // Redirect to the admin profile management page
            Response.Redirect("AdminManageProfile.aspx"); // Replace with the profile management page
        }

        // Handles "REVIEWED APPLICATIONS" button click
        protected void ApplicationStatus_Click(object sender, EventArgs e)
        {
            // Redirect to the page that displays reviewed applications
            Response.Redirect("ReviewedApplications.aspx"); // Replace with the correct page for reviewed applications
        }

        // Handles "LOGOUT" button click
        protected void Logout_Click(object sender, EventArgs e)
        {
            // Clear the session and redirect to the login page
            Session.Clear(); // Clears the session data
            Response.Redirect("defaultPage.aspx"); // Replace with your admin login page
        }
    }
}
