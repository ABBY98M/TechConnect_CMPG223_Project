<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminManageProfile.aspx.cs" Inherits="TechConnect_CMPG223_Project.AdminManageProfile" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up - TechConnect</title>
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
        .newStyle1 {
            border-color: #006666;
        }
    </style>
</head>
<body>

<div class="container" style="background-color: white; background-image: url('Moire - Baikal _ Sample.jpg');">
    <h1><em class="newStyle1">Manage Your Profile</em></h1>
    
    <form id="signupForm" runat="server">
        <div class="form-group">
            <label for="idNumber">SA ID Number</label>
            <asp:TextBox ID="txtIdNmb" runat="server" />
        </div>
        <div class="form-group">
            <label for="email">E-mail Address</label>
            <asp:TextBox ID="txtEmailaddr" runat="server" />
        </div>
        <div class="form-group">
            <label for="firstName">Name</label>
            <asp:TextBox ID="txtName" runat="server" />
        </div>
        <div class="form-group">
            <label for="cellNumber">Role:<br />
&nbsp;<asp:DropDownList ID="drpdwnrole" runat="server">
    <asp:ListItem Value="Admin">Admin</asp:ListItem>
    <asp:ListItem Value="SuperAdmin">SuperAdmin</asp:ListItem>
    <asp:ListItem Value="Reviewer">Reviewer</asp:ListItem>
    <asp:ListItem Value="Moderator">Moderator</asp:ListItem>
    </asp:DropDownList>


            </label>&nbsp;</div>
        <div class="form-group">
            <label for="password">
            Password</label>

            <asp:TextBox ID="txtPsswd" runat="server" TextMode="Password" />
        </div>

            <div class="btn-group">
                <asp:Button ID="btnUpdateadmin" runat="server" Text="Update" OnClick="btnUpdate_Click" Width="141px" />
                <asp:Button ID="btnDeleteAdmin" runat="server" Text="Delete" OnClick="btnDelete_Click" Width="144px" />
            </div>
        </form>
    </div>
</body>
</html>

