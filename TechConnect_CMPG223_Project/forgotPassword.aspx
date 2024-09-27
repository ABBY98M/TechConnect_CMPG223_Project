<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgotPassword.aspx.cs" Inherits="TechConnect_CMPG223_Project.forgotPassword" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
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
            font-style: italic;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        input[type="text"], input[type="email"], input[type="tel"], input[type="password"] {
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
            width: 50%;
        }
        button:hover {
            background-color: #0056b3;
        }
        .hidden {
            display: none;
        }
    </style>
</head>
<body>

<div class="container" style="background-image: url('Moire - Baikal _ Sample.jpg')">
    <h1>Forgot Password</h1>
    
    <form id="forgotPasswordForm">
        <div class="form-group">
            <label for="contact">Email or Phone Number</label>
            <input type="text" id="contact" placeholder="Enter your email or phone number" required>
        </div>
        
        <button type="button" id="sendCodeButton">Send Verification Code</button>
        
        <div id="verificationSection" class="hidden">
            <div class="form-group">
                <label for="verificationCode">Verification Code</label>
                <input type="text" id="verificationCode" placeholder="Enter verification code" required>
            </div>
            <div class="form-group">
                <label for="newPassword">New Password</label>
                <input type="password" id="newPassword" placeholder="Enter new password" required>
            </div>
            <div class="form-group">
                <label for="confirmPassword">Confirm New Password</label>
                <input type="password" id="confirmPassword" placeholder="Confirm new password" required>
            </div>
            <button type="submit">Reset Password</button>
        </div>
    </form>
</div>

<script>
    document.getElementById('sendCodeButton').addEventListener('click', function() {
        const contact = document.getElementById('contact').value;
        
        // Simulate sending a verification code (replace with actual logic)
        alert(`Verification code sent to ${contact}.`);
        
        // Show the verification section
        document.getElementById('verificationSection').classList.remove('hidden');
    });

    document.getElementById('forgotPasswordForm').addEventListener('submit', function(event) {
        event.preventDefault();
        
        const verificationCode = document.getElementById('verificationCode').value;
        const newPassword = document.getElementById('newPassword').value;
        const confirmPassword = document.getElementById('confirmPassword').value;

        // Simulate password reset logic (replace with actual logic)
        if (newPassword === confirmPassword) {
            alert('Your password has been reset successfully!');
            // Redirect to login page or another page
            window.location.href = 'loginPage.aspx'; // Change to your actual login page
        } else {
            alert('Passwords do not match. Please try again.');
        }
    });
</script>

</body>
</html>