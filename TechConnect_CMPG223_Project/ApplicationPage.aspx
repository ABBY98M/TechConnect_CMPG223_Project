<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ApplicationPage.aspx.cs" Inherits="TechConnect_CMPG223_Project.ApplicationPage" %>

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
        .radio-group {
            display: flex;
            justify-content: space-between;
        }
        .terms-group {
            display: flex;
            align-items: center;
            margin-top: 10px;
        }
    </style>
</head>
<body>

<div class="container" style="background-image: url('Moire - Baikal _ Sample.jpg')">
    <h1>Tech-Connect Bursary Application</h1>
    
    <form id="ApplicationPage" runat="server">
        <h2>1. Personal Details</h2>
        
        <div class="form-group">
            <label for="fullNames">Full Names</label>
            <asp:Label ID="fullNames" runat="server" Text="Logged-in Full Names"></asp:Label>
        </div>
        
        <div class="form-group">
            <label for="surname">Surname</label>
            <asp:Label ID="surname" runat="server" Text="Logged-in Surname"></asp:Label>
        </div>

        <div class="form-group">
            <label for="idnumber">ID Number</label>
            <asp:Label ID="idnumber" runat="server" Text="Logged-in ID"></asp:Label>
        </div>
        
        <div class="form-group">
            <label for="email">Email</label>
            <asp:Label ID="txtEmail" runat="server" Text="Logged-in Email"></asp:Label>
        </div>
        
        <div class="form-group">
            <label for="phone">Phone Number</label>
            <asp:Label ID="txtPhone" runat="server" Text="Logged-in Phone"></asp:Label>
        </div>
        
        <div class="form-group">
            <label for="gender">Gender</label>
            <div class="radio-group">
                <asp:RadioButton ID="rbMale" runat="server" GroupName="gender" Text="Male" Value="Male" required OnCheckedChanged="rbMale_CheckedChanged" />
                <asp:RadioButton ID="rbFemale" runat="server" GroupName="gender" Text="Female" Value="Female" required />
            </div>
        </div>

        <div class="form-group">
            <label for="nationality">Nationality</label>
            <asp:DropDownList ID="ddlNationality" runat="server" required>
                <asp:ListItem Text="Select your nationality" Value="" />
                <asp:ListItem Text="South African" Value="South African" />
                <asp:ListItem Text="Other" Value="Other" />
            </asp:DropDownList>
        </div>

        <div class="form-group">
            <label for="homeLanguage">Home Language</label>
            <asp:DropDownList ID="ddlHomeLanguage" runat="server" required>
                <asp:ListItem Text="Select your home language" Value="" />
                <asp:ListItem Text="English" Value="English" />
                <asp:ListItem Text="Afrikaans" Value="Afrikaans" />
                <asp:ListItem Text="Zulu" Value="Zulu" />
            </asp:DropDownList>
        </div>

        <div class="form-group">
            <label for="residentialAddress">Residential Address</label>
            <asp:TextBox ID="txtResidentialAddress" runat="server" TextMode="MultiLine" Rows="3" placeholder="Enter your residential address" required></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="postalAddress">Postal Address</label>
            <asp:TextBox ID="txtPostalAddress" runat="server" TextMode="MultiLine" Rows="3" placeholder="Enter your postal address" required></asp:TextBox>
        </div>

        <h2>2. Academic Information</h2>

        <div class="form-group">
            <label for="highestQualification">Highest Qualification</label>
            <asp:DropDownList ID="ddlHighestQualification" runat="server" required>
                <asp:ListItem Text="Select your highest qualification" Value="" />
                <asp:ListItem Text="High School" Value="High School" />
                <asp:ListItem Text="Undergraduate" Value="Undergraduate" />
            </asp:DropDownList>
        </div>

        <div class="form-group">
            <label for="currentInstitution">Current Institution</label>
            <asp:TextBox ID="txtCurrentInstitution" runat="server" placeholder="Enter your current institution" required></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="yearOfStudy">Year of Study</label>
            <asp:TextBox ID="txtYearOfStudy" runat="server" placeholder="Enter your year of study" required></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="fieldOfStudy">Field of Study</label>
            <asp:TextBox ID="txtFieldOfStudy" runat="server" placeholder="Enter your field of study" required></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="apsScore">APS Score</label>
            <asp:TextBox ID="txtAPSScore" runat="server" placeholder="Enter your APS score" required></asp:TextBox>
        </div>

        <h2>3. Financial Information</h2>

        <div class="form-group">
            <label for="householdIncome">Household Income</label>
            <asp:DropDownList ID="ddlHouseholdIncome" runat="server" required>
                <asp:ListItem Text="Select your household income range" Value="" />
                <asp:ListItem Text="Below R150,000" Value="Below R150,000" />
                <asp:ListItem Text="R150,000 - R300,000" Value="R150,000 - R300,000" />
                <asp:ListItem Text="Above R300,000" Value="Above R300,000" />
            </asp:DropDownList>
        </div>

        <div class="form-group">
            <label for="dependents">Number of Dependents</label>
            <asp:TextBox ID="txtDependents" runat="server" placeholder="Enter number of dependents" required></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Receiving other bursary/scholarship?</label>
            <div class="radio-group">
                <asp:RadioButton ID="rbReceivingBursaryYes" runat="server" GroupName="receivingBursary" Text="Yes" Value="yes" required />
                <asp:RadioButton ID="rbReceivingBursaryNo" runat="server" GroupName="receivingBursary" Text="No" Value="no" required />
            </div>
        </div>

        <div class="form-group" id="bursaryDetails" style="display: none;">
            <label for="otherBursary">Which bursary?</label>
            <asp:TextBox ID="txtOtherBursary" runat="server" placeholder="Enter the bursary/scholarship name"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="motivationLetter">Motivation Letter</label>
            <asp:TextBox ID="txtMotivationLetter" runat="server" TextMode="MultiLine" Rows="4" placeholder="Enter your motivation letter" required></asp:TextBox>
        </div>

        <h2>4. Documents Upload</h2>

        <div class="form-group">
            <label for="idDocument">Upload ID Document</label>
            <asp:FileUpload ID="fuIDDocument" runat="server" required />
        </div>

        <div class="form-group">
            <label for="proofResidence">Upload Proof of Residence</label>
            <asp:FileUpload ID="fuProofResidence" runat="server" required />
        </div>

        <div class="form-group">
            <label for="certifiedResults">Upload Certified Academic Results</label>
            <asp:FileUpload ID="fuCertifiedResults" runat="server" required />
        </div>

        <h2>5. Terms and Conditions</h2>

        <div class="terms-group">
            <label>
                <asp:CheckBox ID="cbTerms" runat="server" required />
                I agree to the <a href="termsAndConditions.html" target="_blank">terms and conditions</a>.
            </label>
        </div>

        <div class="form-group">
            <asp:Button ID="btnSubmit" runat="server" Text="Submit Application" OnClick="btnSubmit_Click" />
        </div>
    </form>
</div>

</body>
</html>
