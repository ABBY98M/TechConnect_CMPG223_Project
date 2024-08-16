<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminDashboard.aspx.cs" Inherits="TechConnect_CMPG223_Project.adminDashboard" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
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
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }
        button:hover {
            background-color: #0056b3;
        }
        .record-list {
            margin-top: 20px;
            max-height: 200px;
            overflow-y: auto;
        }
    	.auto-style1 {
			margin-top: 20px;
			max-height: 200px;
			overflow-y: auto;
			width: 698px;
		}
    </style>
</head>
<body>

<div class="container">
    <h1>Admin Dashboard</h1>
    
    <div class="form-group">
        <label for="recordList">Student Records and Bursary Applications</label>
        <select id="recordList" class="auto-style1" size="10">
            <!-- Records will be populated here -->
        </select>
    </div>

    <div class="form-group">
        <button type="button" onclick="sortRecords('asc')">Sort Ascending</button>
        <button type="button" onclick="sortRecords('desc')">Sort Descending</button>
    </div>

    <div class="form-group">
        <label for="reviewDate">Review Date</label>
        <input type="date" id="reviewDate" value="" />
    </div>

    <div class="form-group">
        <label for="adminComment">Admin Comment</label>
        <textarea id="adminComment" rows="3" placeholder="Enter your comment"></textarea>
    </div>

    <div class="form-group">
        <button type="button" onclick="addComment()">Add Comment</button>
        <button type="button" onclick="updateComment()">Update Comment</button>
        <button type="button" onclick="deleteComment()">Delete Comment</button>
    </div>

    <div class="form-group">
        <button type="button" onclick="approveApplication()" id="btnApprove">Approve</button>
        <button type="button" onclick="rejectApplication()" id="btnReject">Reject</button>
    </div>
</div>

<script>
	// Simulated data for student records and applications
	let records = [
		{ id: 1, name: "John Doe", bursary: "Bursary Program A", dateApplied: "2024-08-01", reviewDate: "2024-08-10", comment: "" },
		{ id: 2, name: "Jane Smith", bursary: "Bursary Program B", dateApplied: "2024-08-05", reviewDate: "2024-08-12", comment: "" },
		{ id: 3, name: "Emily Johnson", bursary: "Bursary Program A", dateApplied: "2024-08-03", reviewDate: "2024-08-11", comment: "" },
	];

	// Function to populate the record list
	function populateRecordList() {
		const recordList = document.getElementById('recordList');
		recordList.innerHTML = ''; // Clear existing entries
		records.forEach(record => {
			const option = document.createElement('option');
			option.value = record.id;
			option.textContent = `${record.name} - ${record.bursary} (Applied: ${record.dateApplied})`;
			recordList.appendChild(option);
		});
	}

	// Function to sort records
	function sortRecords(order) {
		records.sort((a, b) => {
			if (order === 'asc') {
				return new Date(a.dateApplied) - new Date(b.dateApplied);
			} else {
				return new Date(b.dateApplied) - new Date(a.dateApplied);
			}
		});
		populateRecordList();
	}

	// Function to add a comment
	function addComment() {
		const selectedRecordId = document.getElementById('recordList').value;
		const comment = document.getElementById('adminComment').value;
		const record = records.find(r => r.id == selectedRecordId);
		if (record) {
			record.comment = comment;
			alert('Comment added successfully!');
		}
	}

	// Function to update a comment
	function updateComment() {
		const selectedRecordId = document.getElementById('recordList').value;
		const comment = document.getElementById('adminComment').value;
		const record = records.find(r => r.id == selectedRecordId);
		if (record) {
			record.comment = comment;
			alert('Comment updated successfully!');
		}
	}

	// Function to delete a comment
	function deleteComment() {
		const selectedRecordId = document.getElementById('recordList').value;
		const record = records.find(r => r.id == selectedRecordId);
		if (record) {
			record.comment = '';
			document.getElementById('adminComment').value = '';
			alert('Comment deleted successfully!');
		}
	}

	// Function to approve an application
	function approveApplication() {
		const selectedRecordId = document.getElementById('recordList').value;
		const record = records.find(r => r.id == selectedRecordId);
		if (record) {
			alert(`Application for ${record.name} has been approved.`);
		}
	}

	// Function to reject an application
	function rejectApplication() {
		const selectedRecordId = document.getElementById('recordList').value;
		const record = records.find(r => r.id == selectedRecordId);
		if (record) {
			alert(`Application for ${record.name} has been rejected.`);
		}
	}

	// Set today's date as the default value for the review date input
	document.getElementById('reviewDate').value = new Date().toISOString().split('T')[0];

	// Populate the record list on page load
	window.onload = function () {
		populateRecordList();
	};
</script>

</body>
</html>