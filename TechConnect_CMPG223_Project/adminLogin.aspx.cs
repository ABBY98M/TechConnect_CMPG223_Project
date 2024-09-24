using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient; // Needed for SQL database connection
using System.Configuration;

namespace TechConnect_CMPG223_Project
{
    public partial class adminLogin : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //Recieve user input
            String username = txtbUsename.Text.Trim();
            String password = txtbPaasword.Text.Trim();
        
            Response.Redirect("adminDashboard.aspx");
        }
    }
}