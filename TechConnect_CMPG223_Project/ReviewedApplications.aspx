<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReviewedApplications.aspx.cs" Inherits="TechConnect_CMPG223_Project.ReviewedApplications" %>

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
        input[type="text"], input[type="email"], input[type="tel"], input[type="number"], textarea, select {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box; /* Include padding and border in element's total width */
        }
        button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
            width: 100%; /* Full width for buttons */
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="container" style="background-image: url('Moire - Baikal _ Sample.jpg');">
    <h1>&nbsp;Applications</h1>
    
    <form id="AdminPage" runat="server">
        <h2> Reviewed Applications and Results</h2>
        <asp:ListBox ID="LBxReviewd" runat="server" Height="133px" Width="736px"></asp:ListBox>
        
        <div>
            &nbsp;</div>
        
        <div>
            &nbsp;</div>
        
        <div>
    <asp:Button ID="BttnBck" runat="server" Text="Back" Width="128px" OnClick="BttnBck_Click" style="margin-top: 15px;" />
</div>


    </form>
</div>

</body>
</html>

