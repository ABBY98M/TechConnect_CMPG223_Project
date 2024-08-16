using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace WebApplication1
{
    public partial class adminLogin : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                // Your page load logic here
        }

        // Other methods and event handlers
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminDashboard.aspx");
        }
    }
}
