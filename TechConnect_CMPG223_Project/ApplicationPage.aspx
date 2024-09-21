<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ApplicationPage.aspx.cs" Inherits="TechConnect_CMPG223_Project.registrationPage" %>

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
    
    <form id="registerForm" runat="server">
        <h2>1. Personal Details</h2>
        
        <div class="form-group">
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
                <label><input type="radio" name="gender" value="Male" required checked="true"> Male</label>
                <label><input type="radio" name="gender" value="Female" required> Female<div class="form-group">
        </div>

        <div class="form-group">
            <label for="nationality">Nationality</label>
            <select id="nationality" required name="D1">
                <option value="" disabled selected>Select your nationality</option>
                <option value="South African">South African</option>
                <option value="Other">Other</option>
            </select>
        </div>

        <div class="form-group">
            <label for="homeLanguage">Home Language</label>
            <select id="homeLanguage" required name="D2">
                <option value="" disabled selected>Select your home language</option>
                <option value="English">English</option>
                <option value="Afrikaans">Afrikaans</option>
                <option value="Zulu">Zulu</option>
                <!-- Add more languages as necessary -->
            </select>
        </div>

        <div class="form-group">
            <label for="residentialAddress">Residential Address</label>
            <textarea id="residentialAddress" rows="3" placeholder="Enter your residential address" required cols="20" name="S1"></textarea>
        </div>

        <div class="form-group">
            <label for="postalAddress">Postal Address</label>
            <textarea id="postalAddress" rows="3" placeholder="Enter your postal address" required cols="20" name="S2"></textarea>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        <h2>2. Academic Information</h2>

        <div class="form-group">
            <label for="highestQualification">Highest Qualification</label>
            <select id="highestQualification" required name="D3">
                <option value="" disabled selected>Select your highest qualification</option>
                <option value="High School">High School</option>
                <option value="Undergraduate">Undergraduate</option>
                <!-- Add more qualification options -->
            </select>
        </div>

        <div class="form-group">
            <label for="currentInstitution">Current Institution</label>
            <input type="text" id="currentInstitution" placeholder="Enter your current institution" required>
        </div>

        <div class="form-group">
            <label for="yearOfStudy">Year of Study</label>
            <input type="number" id="yearOfStudy" placeholder="Enter your year of study" required>
        </div>

        <div class="form-group">
            <label for="fieldOfStudy">Field of Study</label>
            <input type="text" id="fieldOfStudy" placeholder="Enter your field of study" required>
        </div>

        <div class="form-group">
            <label for="apsScore">APS Score</label>
            <input type="number" id="apsScore" placeholder="Enter your APS score" required>
        </div>

        <h2>3. Financial Information</h2>

        <div class="form-group">
            <label for="householdIncome">Household Income</label>
            <select id="householdIncome" required name="D4">
                <option value="" disabled selected>Select your household income range</option>
                <option value="Below R150,000">Below R150,000</option>
                <option value="R150,000 - R300,000">R150,000 - R300,000</option>
                <option value="Above R300,000">Above R300,000</option>
            </select>
        </div>

        <div class="form-group">
            <label for="dependents">Number of Dependents</label>
            <input type="number" id="dependents" min="0" placeholder="Enter number of dependents" required>
        </div>

        <div class="form-group">
            <label>Receiving other bursary/scholarship?</label>
            <div class="radio-group">
                <label><input type="radio" name="receivingBursary" value="yes" required checked="true"> Yes</label>
                <label><input type="radio" name="receivingBursary" value="no" required> No</label>
            </div>
        </div>

        <div class="form-group" id="bursaryDetails" style="display: none;">
            <label for="otherBursary">Which bursary?</label>
            <input type="text" id="otherBursary" placeholder="Enter the bursary/scholarship name">
        </div>

        <div class="form-group">
            <label for="motivationLetter">Motivation Letter</label>
            <textarea id="motivationLetter" rows="4" placeholder="Enter your motivation letter" required cols="20" name="S3"></textarea>
        </div>

        <h2>4. Documents Upload</h2>

        <div class="form-group">
            <label for="idDocument">Upload ID Document</label>
            <input type="file" id="idDocument" required>
        </div>

        <div class="form-group">
            <label for="proofResidence">Upload Proof of Residence</label>
            <input type="file" id="proofResidence" required>
        </div>

                <div class="form-group">
            <label for="certifiedResults">Upload Certified Academic Results</label>
            <input type="file" id="certifiedResults" required>
        </div>

        <h2>5. Terms and Conditions</h2>
<div class="terms-group">
    <label>
        <input type="checkbox" name="terms" required> 
        I agree to the <a href="termsAndConditions.html" target="_blank">Terms and Conditions</a>
    </label>
</div>

<div class="form-group">
    <button type="submit">Submit Application</button>
</div>
        </div>

                </label>
            </div>
        </div>

        </div>
        
    </form>
</div>

</body>
</html>