﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registrationPage.aspx.cs" Inherits="TechConnect_CMPG223_Project.registrationPage" %>

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
    </style>
</head>
<body>

<div class="container" style="background-image: url('Moire - Baikal _ Sample.jpg')">
    <h1>Tech-Connect Application</h1>
    
    <form id="registerForm" runat="server">
        <h2>Personal Details</h2>
        
        <div class="form-group">
            <label for="fullNames">Full Names</label>
            <input type="text" id="fullNames" placeholder="Enter your full names" required>
        </div>
        
        <div class="form-group">
            <label for="surname">Surname</label>
            <input type="text" id="surname" placeholder="Enter your surname" required>
        </div>

        <div class="form-group">
            <label for="idnumber">ID number</label>
            <input type="text" id="idnumber" placeholder="Enter your ID number" required>
        </div>
        
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" id="email" placeholder="Enter your email" required>
        </div>
        
        <div class="form-group">
            <label for="phone">Phone Number</label>
            <input type="tel" id="phone" placeholder="Enter your phone number" required>
        </div>
        
        <div class="form-group">
            <label for="address">Address</label>
            <textarea id="address" rows="3" placeholder="Enter your address" required></textarea>
        </div>
        
        <div class="form-group">
            <label for="institution">High School/Institution Name</label>
            <input type="text" id="institution" placeholder="Enter your high school or institution name" required>
        </div>
        
        <div class="form-group">
            <label>
                <input type="radio" name="educationLevel" value="highSchool" checked> High School
            </label>
            <label>
                <input type="radio" name="educationLevel" value="academic"> Academic Report
            </label>
        </div>
        
        <div id="subjectsContainer" style="display: none;">
            <div class="subject-group">
                <label for="subject1">Subject 1</label>
                <input type="text" id="subject1" placeholder="Enter subject name" required>
                <label for="mark1">Mark</label>
                <input type="number" id="mark1" placeholder="Enter subject mark" min="0" max="100" required>
            </div>
        </div>
        
        <button type="button" id="addSubjectButton" style="display: none;">Add Subject</button>
        
        <div id="academicReportContainer" style="display: none;">
            <label for="academicReport">Upload Academic Report</label>
            <input type="file" id="academicReport"
        </div>
        
        <label>
            <br />
            <asp:Button ID="btnRegistor" runat="server" OnClick="btnRegistor_Click" Text="Register" />
        </label>
        
    </form>
</div>

<script>
	const subjectsContainer = document.getElementById('subjectsContainer');
	const academicReportContainer = document.getElementById('academicReportContainer');
	const addSubjectButton = document.getElementById('addSubjectButton');
	let subjectCount = 1;

	document.querySelectorAll('input[name="educationLevel"]').forEach(radio => {
		radio.addEventListener('change', function () {
			if (this.value === 'highSchool') {
				subjectsContainer.style.display = 'block';
				academicReportContainer.style.display = 'none';
				addSubjectButton.style.display = 'block';
			} else {
				subjectsContainer.style.display = 'none';
				academicReportContainer.style.display = 'block';
				addSubjectButton.style.display = 'none';
			}
		});
	});

	addSubjectButton.addEventListener('click', function () {
		subjectCount++;

		const subjectGroup = document.createElement('div');
		subjectGroup.className = 'subject-group';
		subjectGroup.innerHTML = `
            <label for="subject${subjectCount}">Subject ${subjectCount}</label>
            <input type="text" id="subject${subjectCount}" placeholder="Enter subject name" required>
            <label for="mark${subjectCount}">Mark</label>
            <input type="number" id="mark${subjectCount}" placeholder="Enter subject mark" min="0" max="100" required>
        `;

		subjectsContainer.appendChild(subjectGroup);
	});

	document.getElementById('registerForm').addEventListener('submit', function (event) {
		event.preventDefault();
		// Handle form submission logic here
		alert('Registration successful!');
		// Redirect to the login page
		window.location.href = 'loginPage.aspx';
	});
</script>

</body>
</html>