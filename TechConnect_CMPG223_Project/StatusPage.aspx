<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StatusPage.aspx.cs" Inherits="TechConnect_CMPG223_Project.StudentStatus" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Application Status - TechConnect</title>
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
        .form-group {
            margin-bottom: 20px; /* Increased margin for spacing */
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
    <h1>Application Status</h1>
    <form id="signupForm" runat="server">
        <div class="form-group">
            <asp:Label ID="LblStatus" runat="server" Text="Your status will appear here."></asp:Label>
        </div>
        <div class="form-group">
            <label for="ddlupdates">Feedback:</label>
            <asp:ListBox ID="LstbxFeedback" runat="server"></asp:ListBox>
        </div>
        <div class="form-group">
            <asp:Button ID="BttnLogout" runat="server" Text="Logout" OnClick="Button2_Click" Width="93px" />
        </div>
    </form>
</div>

</body>
</html>
