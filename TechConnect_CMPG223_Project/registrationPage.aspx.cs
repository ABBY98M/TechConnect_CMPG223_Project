﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace TechConnect_CMPG223_Project
{
    
    public partial class registrationPage : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|//Student.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistor_Click(object sender, EventArgs e)
        {
            //string ins = "Insert into [Student](First_Name,Last_Name,,Phone_Number,Address,ID_Number,Username,Password) values('" + Name_txtbx.Text + "', '" + surname_txtbx.Text + "','" + DOB_Txtbx.Text + "','" + Email_txtbx.Text + "','" + pNumber_txtbx.Text + "','" + Address_Txtbx.Text + "','" + ID_Txtbx.Text + "','" + Username_Txbx.Text + "','" + Password_txtbx.Text + "')";
            //SqlCommand com = new SqlCommand(ins, con);
            //con.Open();
            //com.ExecuteNonQuery();
            //con.Close();

            Response.Redirect("loginPage.aspx");
        }
    }
}