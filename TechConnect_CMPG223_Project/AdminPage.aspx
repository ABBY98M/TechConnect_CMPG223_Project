<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="TechConnect_CMPG223_Project.AdminPage" %>

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
    <h1><em>Tech-Connect Bursary Application Admission</em></h1>
    
    <form id="AdminPage" runat="server">
        <h2> Application Review</h2>
        
        <label for="ddlApplication2"></label>
        <asp:DropDownList ID="ddlApplication2" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlApplication2_SelectedIndexChanged">
            <asp:ListItem Text="Select an Application" Value="" />
        </asp:DropDownList>
        <asp:ListBox ID="LBxReviw" runat="server" Height="133px" Width="736px"></asp:ListBox>
        
        <div>
            <label for="ddlupdates">Update Status</label>
            <asp:DropDownList ID="ddlupdates" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlApplication2_SelectedIndexChanged" Width="145px">
                <asp:ListItem Text="Update status" Value="" />
            </asp:DropDownList>
        </div>
        
        <div>
            <label for="txtFeedback">Feedback:</label>
            <asp:TextBox ID="txtFeedback" runat="server" TextMode="MultiLine" Rows="5" Width="736px" OnTextChanged="txtFeedback_TextChanged"></asp:TextBox>
        </div>

        <!-- Adding Calendar for Date Selection -->
        <div>
            <label for="calendarReviewDate">Choose a Review Date:</label>
            <asp:Calendar ID="calendarReviewDate" runat="server"></asp:Calendar>
        </div>
       
        <div>
            <asp:Button ID="Button1" runat="server" Text="Update Status" Width="128px" OnClick="BttnUpdate_Click" style="margin-top: 15px;" />
            <br />
            <div>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="BttnDone" runat="server" Text="Submit Review" Width="111px" OnClick="BttnDone_Click" />
            </div>
        </div>

    </form>
</div>

    <p>
&nbsp;&nbsp;
    </p>

</body>
</html>
