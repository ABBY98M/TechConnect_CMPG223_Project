<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="TechConnect_CMPG223_Project.AdminLogin" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <titleAdmin Login - Bursary Platform</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .container {
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            max-width: 400px;
            margin: auto;
        }
        h1 {
            text-align: center;
            color: #007bff;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        input[type="text"], input[type="password"] {
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
            width: 100%;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="container" style="background-image: url('Moire - Baikal _ Sample.jpg')">
    <h1>Admin Login</h1>
    
    <form id="adminLoginForm" runat="server">
        <div class="form-group"> <label for="username">Username</label>
			<asp:TextBox ID="txtbUsername" runat="server" placeholder="Enter your email or ID number" required></asp:TextBox>

       <div class="form-group"> <label for="password">Password</label>
			<asp:TextBox ID="txtbPassword" runat="server" TextMode="Password" placeholder="Enter your password" required OnTextChanged="txtbPassword_TextChanged"></asp:TextBox><br />
        
		</div> 
        <div class="form-group"> <button type="submit">Log in</button> </div>
        
        </form>
</div>

</body>
</html>