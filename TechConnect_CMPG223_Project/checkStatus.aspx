<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="checkStatus.aspx.cs" Inherits="TechConnect_CMPG223_Project.checkStatus" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Check Status</title>
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
        .status-result {
            margin-top: 20px;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #e9ecef;
        }
        .bursary-list {
            width: 100%;
            height: 200px; /* Adjust height as needed */
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: #fff;
            overflow-y: auto; /* Allows scrolling if the list is long */
        }
    </style>
</head>
<body>

<div class="container" style="background-image: url('Moire - Baikal _ Sample.jpg')">
    <h1>Check Status</h1>
    
    <div id="statusResult" class="status-result">
        <h2>Your Bursary Applications</h2>
        <select id="resultList" class="bursary-list" size="10"></select>
    </div>
</div>
</body>
</html>