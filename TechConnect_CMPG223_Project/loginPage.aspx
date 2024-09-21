<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loginPage.aspx.cs" Inherits="TechConnect_CMPG223_Project.loginPage" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to Tech-Connect</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #e9ecef;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .auto-style1 {
            background: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            width: 431px;
            text-align: center;
        }
        h1 {
            margin-bottom: 20px;
            color: #007bff;
        }
        label {
            display: block;
            text-align: left;
            margin-bottom: 5px;
            font-weight: bold;
            color: #333;
        }
        input[type="text"], input[type="password"] {
            width: 90%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ced4da;
            border-radius: 5px;
            transition: border-color 0.3s;
        }
        input[type="text"]:focus, input[type="password"]:focus {
            border-color: #007bff;
            outline: none;
        }
        button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 12px;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #0056b3;
        }
        .footer {
            margin-top: 20px;
            font-size: 12px;
            color: #666;
        }
        .footer a {
            color: #007bff;
            text-decoration: none;
        }
        .footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<form id="form2" runat="server">
    <div class="auto-style1" style="background-image: url('Moire - Baikal _ Sample.jpg');">
        <h1>
            <asp:Image ID="Image1" runat="server" Height="55px" ImageUrl="~/Download South Africa, Flag, Fingerprint_ Royalty-Free Stock Illustration Image.jpeg" Width="45px" />
        </h1>
        <h1>Welcome to Tech-Connect</h1>
        <label for="txtEmail">Email / ID Number</label>
        <asp:TextBox ID="txtEmail" runat="server" placeholder="Enter your email or ID number" required></asp:TextBox>
        
        <label for="txtPassword">Password</label>
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Enter your password" required OnTextChanged="txtPassword_TextChanged"></asp:TextBox><br />
        
        <div>
            <label for="robotCheck">
                <input type="checkbox" id="robotCheck" required> I'm not a robot
            </label>
        </div>
        <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Log in" />
        
        <p>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/forgotPassword.aspx">Forgot your password?</asp:HyperLink>
        </p>
        <p>
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/signupPage.aspx">Create an account</asp:HyperLink>
        </p>
        <div class="footer">
            <p>By continuing, you agree to Tech-Connect Terms of Service and acknowledge you've read our Privacy Policy.</p>
        </div>
    </div>
</form>

</body>
</html>
