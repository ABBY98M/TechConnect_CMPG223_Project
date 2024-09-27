<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminRegister.aspx.cs" Inherits="TechConnect_CMPG223_Project.AdminRegister" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Register - TechConnect</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4; /* Background color */
            margin: 0;
            padding: 20px;
        }
        .container {
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            max-width: 600px;
            margin: auto;
        }
        h1 {
            text-align: center;
            color: #007bff;
            font-style: italic;
        }
        form {
            margin-top: 20px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        input[type="text"], input[type="email"], input[type="tel"], input[type="date"], input[type="number"], textarea, select {
            width: 90%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
            width: 80%;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="container" style="background-color: white; background-image: url('Moire - Baikal _ Sample.jpg');">
    <h1>Admin Register</h1>
    
    <form id="AdminRegisterForm" runat="server">
        <div class="form-group">
            <label for="idNumber">SA ID Number</label>
            <asp:TextBox ID="txtIDnumber" runat="server" />
        </div>
        <div class="form-group">
            <label for="email">E-mail Address</label>
            <asp:TextBox ID="txTEmail" runat="server" />
        </div>
        <div class="form-group">
            <label for="firstName">First Name</label>
            <asp:TextBox ID="txtFirstname" runat="server" />
        </div>
        <div class="form-group">
            <label for="role">Role</label>
            <asp:TextBox ID="txtRole" runat="server" />
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <asp:TextBox ID="txtpassword" runat="server" TextMode="Password" />
            <p>A password should be 16 characters or more.</p>
        </div>

        <asp:Button ID="btnregister" runat="server" OnClick="btnRegister_Click" Text="Register" Height="30px" Width="169px" />

        <div class="login-link">
            <p>Already registered? 
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/AdminLogin.aspx">Login</asp:HyperLink>
            </p>
        </div>
    </form>
</div>

</body>
</html>
