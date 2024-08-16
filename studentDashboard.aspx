<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="studentDashboard.aspx.cs" Inherits="WebApplication1.studentDashboard" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard</title>
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
        h2 {
            color: #333;
            margin-top: 20px;
        }
        .section {
            margin-bottom: 20px;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
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
        .bursary-section {
            margin-bottom: 20px;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #f8f9fa;
        }
        .bursary-list {
            margin-top: 10px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: #e9ecef;
            max-height: 150px;
            overflow-y: auto;
        }
    	.auto-style1 {
			margin-top: 10px;
			padding: 10px;
			border: 1px solid #ccc;
			border-radius: 4px;
			background-color: #e9ecef;
			max-height: 150px;
			overflow-y: auto;
			width: 691px;
		}
    </style>
</head>
<body>

    <form id="form1" runat="server" style="background-image: url('Moire - Baikal _ Sample.jpg')">

        <div class="container" style="background-image: url('Moire - Baikal _ Sample.jpg')">
            <h1>Student Dashboard</h1>

            <div class="bursary-section">
                <h2>Available Bursaries</h2>
                <select id="bursaryList" class="auto-style1" size="5">
                    <!-- Bursary options will be added here -->
                </select>
                <div>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <button type="button" onclick="sortBursaries('asc')">Sort Ascending</button>
                    <button type="button" onclick="sortBursaries('desc')">Sort Descending</button>
                	<br />
                </div>
                <button onclick="applyForSelectedBursary()">Apply for Selected</button>
            </div>

            <div class="section">
                <h2>Edit Profile</h2>
                <asp:Button ID="btneditProfile" runat="server" OnClick="btneditProfile_Click" Text="Edit profile" />
            </div>

            <div class="section" id="updateProfileSection" style="display: none;">
                <!-- Update profile form -->
            </div>

            <div class="section">
                <h2>Request Help</h2>
                <button onclick="alert('Help request functionality not implemented yet!')">Request Help</button>
            </div>

            <div class="section upload-section">
                <h2>Upload Documents</h2>
                <input type="file" id="documentUpload" multiple>
                <button onclick="alert('Document upload functionality not implemented yet!')">Upload</button>
            </div>

            <div class="section">
                <h2>Check Status</h2>
                <asp:Button ID="btncheckStatus" runat="server" OnClick="btncheckStatus_Click" Text="Check status" />
            </div>
        </div>

        <script>
			// Simulated bursary data (this would normally come from a server)
			const bursaryData = [
				{
					id: 1, name: "Bursary Program A", options: [
						{ id: 1, name: "Option 1", details: "Details for Option 1" },
						{ id: 2, name: "Option 2", details: "Details for Option 2" },
						{ id: 3, name: "Option 3", details: "Details for Option 3" }
					]
				},
				{
					id: 2, name: "Bursary Program B", options: [
						{ id: 4, name: "Option 1", details: "Details for Option 1" },
						{ id: 5, name: "Option 2", details: "Details for Option 2" },
						{ id: 6, name: "Option 3", details: "Details for Option 3" }
					]
				}
			];

			// Function to populate the bursary list
			function populateBursaryList() {
				let bursaryListHTML = '';
				bursaryData.forEach(bursary => {
					bursaryListHTML += `<option value="${bursary.id}">${bursary.name}</option>`;
				});
				document.getElementById('bursaryList').innerHTML = bursaryListHTML;
			}

			// Call the function to populate the list on page load
			populateBursaryList();

			// Function to apply for the selected bursary
			function applyForSelectedBursary() {
				const selectedBursaryId = document.getElementById('bursaryList').value;
				alert(`Applying for bursary with ID: ${selectedBursaryId}`);
			}

			// Function to sort bursaries
			function sortBursaries(order) {
				const sortedBursaries = [...bursaryData].sort((a, b) => {
					if (order === 'asc') {
						return a.name.localeCompare(b.name);
					} else {
						return b.name.localeCompare(a.name);
					}
				});

				// Update the bursary list with sorted data
				let bursaryListHTML = '';
				sortedBursaries.forEach(bursary => {
					bursaryListHTML += `<option value="${bursary.id}">${bursary.name}</option>`;
				});
				document.getElementById('bursaryList').innerHTML = bursaryListHTML;
			}
		</script>

    </form>

</body>
</html>