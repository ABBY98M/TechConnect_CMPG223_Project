
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminAccount.aspx.cs" Inherits="TechConnect_CMPG223_Project.AdminAccount" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tech-Connect Application</title>
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
        .profile-pic-container {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        .profile-pic {
            width: 102px; /* Adjust size as needed */
            height: 100px; /* Adjust size as needed */
            border-radius: 50%; /* Makes it circular */
            object-fit: cover; /* Ensures the image covers the circle */
            border: 2px solid #007bff; /* Optional: adds a border around the circle */
            margin-right: 10px;
        }
        .status-label {
            color: #007bff; /* Color for status label */
            text-align: center; /* Center the status text */
            margin-top: 20px; /* Add some space above */
        }
    </style>
</head>
<body>

<div class="container" style="background-image: url('Moire - Baikal _ Sample.jpg')">
    
    <form id="registerForm" runat="server">
        <h1>Welcome</h1>
        
        <!-- User Profile Picture (Placed under Welcome) -->
        <div class="profile-pic-container">
            <img src="UserProfile.jpg" alt="User Profile Picture" class="profile-pic" />
        </div>

        <h2>&nbsp;</h2>

        <div class="form-group">
            <asp:Button ID="Applications" runat="server" Text=" APPLICATIONS" OnClick="MyApplication_Click" Width="368px" />
        </div>

        <div class="form-group">
            <asp:Button ID="mngeprofile" runat="server" Text="MANAGE PROFILE" OnClick="ManageProfile_Click" Width="367px" />
        </div>
        
        <div class="form-group">
            <asp:Button ID="rviewBttn" runat="server" Text="REVIEWED APPLICATIONS" OnClick="ApplicationStatus_Click" Width="368px" />
        </div>
        <asp:Button ID="lgout" runat="server" Text="LOGOUT" OnClick="Logout_Click" Width="362px" />
    </form>
</div>

</body>
</html>


</body>
</html>
