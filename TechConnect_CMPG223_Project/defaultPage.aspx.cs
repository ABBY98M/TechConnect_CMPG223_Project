using Org.BouncyCastle.Asn1.X509;
using System;
using System.Configuration;
using System.Data.SqlClient; // Add this for SQL operations
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace TechConnect_CMPG223_Project
{
    public partial class defaultPage : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // No code for this page 
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("signupPage.aspx"); // Sign up page for student will show for the student to register
        }

        
    


protected void Button1_Click1(object sender, EventArgs e)
        {
            
        }
    }
}
