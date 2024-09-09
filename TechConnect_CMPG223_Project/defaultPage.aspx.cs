using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail; // Add this for sending emails

namespace TechConnect_CMPG223_Project
{
    public partial class defaultPage : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Any necessary logic on page load can go here
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("signupPage.aspx"); // Ensure the correct file name
        }

        protected void btnSendMessage_Click(object sender, EventArgs e)
        {
            // Retrieve input values from the Contact Us form
            string name = Request.Form["name"];
            string email = Request.Form["email"];
            string message = Request.Form["message"];

            // Here you can implement the logic to send the email or save the message
            try
            {
                // Example: Sending an email (make sure to configure SMTP settings)
                MailMessage mail = new MailMessage();
                SmtpClient smtpClient = new SmtpClient("smtp.your-email-provider.com"); // Replace with your SMTP server

                mail.From = new MailAddress(email);
                mail.To.Add("support@techconnect.com"); // Replace with your support email
                mail.Subject = "Contact Us Message from " + name;
                mail.Body = message;

                smtpClient.Port = 587; // Use the correct port for your SMTP server
                smtpClient.Credentials = new System.Net.NetworkCredential("your-email@example.com", "your-email-password"); // Replace with your email credentials
                smtpClient.EnableSsl = true;

                smtpClient.Send(mail);

                // Optionally, you can provide feedback to the user
                Response.Write("<script>alert('Your message has been sent successfully!');</script>");
            }
            catch (Exception ex)
            {
                // Handle any errors that may have occurred
                Response.Write("<script>alert('Error sending message: " + ex.Message + "');</script>");
            }
        }
    }
}