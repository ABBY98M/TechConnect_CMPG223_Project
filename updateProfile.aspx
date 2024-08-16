<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="updateProfile.aspx.cs" Inherits="WebApplication1.updateProfile" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Profile</title>
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
            max-width: 800px;
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
        input[type="text"], textarea {
            width: 100%;
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
        }
        button:hover {
            background-color: #0056b3;
        }
        .subject-group {
            margin-bottom: 10px;
        }
        .subject-container {
            margin-top: 20px;
        }
    </style>
</head>
<body>

<div class="container" style="background-image: url('Moire - Baikal _ Sample.jpg')">
    <h1>Update Profile</h1>
    
    <form id="updateProfileForm">
        
        <div class="form-group">
            <label for="email">Email</label>
            <input type="text" id="email" placeholder="Enter your email" required>
        </div>
        
        <div class="form-group">
            <label for="phone">Phone</label>
            <input type="text" id="phone" placeholder="Enter your phone number" required>
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
            <input type="file" id="academicReport">
        </div>

        <br />
		<br />

        <div class="form-group">
            <label for="apsScore">Overall APS Score</label>
            <input type="text" id="apsScore" placeholder="Enter your overall APS score" required>
        </div>

        <button type="submit">Update Profile</button>
    </form>
</div>

<script>
	let subjectCount = 0;

	document.getElementById('addSubjectButton').addEventListener('click', function () {
		subjectCount++;

		const subjectContainer = document.getElementById('subjectContainer');

		const subjectGroup = document.createElement('div');
		subjectGroup.className = 'subject-group';
		subjectGroup.innerHTML = `
            <label for="subject${subjectCount}">Subject ${subjectCount}</label>
            <input type="text" id="subject${subjectCount}" placeholder="Enter subject name" required>
            <label for="score${subjectCount}">Score</label>
            <input type="text" id="score${subjectCount}" placeholder="Enter score" required>
        `;

		subjectContainer.appendChild(subjectGroup);
	});

	document.getElementById('updateProfileForm').addEventListener('submit', function (event) {
		event.preventDefault();
		// Handle form submission logic here
		alert('Profile updated successfully!');
	});
</script>

</body>
</html>