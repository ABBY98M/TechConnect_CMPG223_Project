<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="defaultPage.aspx.cs" Inherits="TechConnect_CMPG223_Project.defaultPage" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tech-Connect Bursary Platform</title>
    <link rel="stylesheet" href="styles.css">
    <style type="text/css">
        body {
            background-image: url(2023_4 dentsu SA Bursary Scheme for Young South Africans » Youth Opportunities Hub.jpg); /* Replace with your image path */
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
            color: white; /* Change text color for better visibility */
            font-family: Arial, sans-serif; /* Optional: set a font for better appearance */
        }
        header, footer {
            background-color: rgba(0, 0, 0, 0.7); /* Semi-transparent background for readability */
            padding: 10px; /* Add some padding */
        }
        .auto-style1 {
            width: 37px;
            height: 98px;
        }
        .cta-button {
            background-color: #007BFF; /* Button color */
            color: white; /* Button text color */
            padding: 10px 20px; /* Button padding */
            text-decoration: none; /* Remove underline */
            border-radius: 5px; /* Rounded corners */
            border: none; /* Remove border */
            cursor: pointer; /* Pointer cursor on hover */
        }
        section {
            padding: 20px; /* Add padding to sections */
        }
        .auto-style2 {
            height: 98px;
        }
    </style>
    <script type="text/javascript">
        function redirectToApply() {
            window.location.href = 'nextPage.aspx'; // Change 'nextPage.aspx' to your desired page
        }
    </script>
</head>
<body>
    <form id="form1" runat="server" style="color: #FFFFFF; background-image: url('2023_4 dentsu SA Bursary Scheme for Young South Africans » Youth Opportunities Hub.jpg');">
        <header style="font-size: small">
            <h1 style="font-size: medium">
                <table style="width:100%;">
                    <tr>
                        <td class="auto-style1">
                            <asp:Image ID="Image1" runat="server" Height="82px" ImageUrl="~/Download South Africa, Flag, Fingerprint_ Royalty-Free Stock Illustration Image.jpeg" Width="35px" />
                        </td>
                        <td class="auto-style2">
                            <table style="width:100%;">
                                <tr>
                                    <td>Connect</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>Apply</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>Succeed</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>Fundhub at Your Fingertips!</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </td>
                        <td class="auto-style2"></td>
                        <td class="auto-style2"></td>
                    </tr>
                    <tr>
                        <td colspan="2">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </h1>
        </header>

        <section id="home" class="hero">
            <h2>Unlock Your Educational Future</h2>
            <p>At Tech-Connect, we are dedicated to making higher education accessible for all South African students.</p>
            <p>Our comprehensive bursary platform connects you with a wide range of financial support options tailored to your needs,</p>
            <p>ensuring that you can focus on your studies without the burden of financial stress.</p>
            <p>&nbsp;</p>
            <p>Discover bursary opportunities that help you achieve your educational dreams.</p>
            <button type="button" class="cta-button" onclick="redirectToApply()">Apply now</button>
        </section>

        <section id="about">
            <h2>About Tech-Connect</h2>
            <p>Tech-Connect is dedicated to providing bursary opportunities platform for students pursuing their Higher Education in all</p>
            <p>South African public/private institutions.</p>
            <p>We partner with various institutions to offer transparent and accessible bursary options.</p>
        </section>

        <section id="services">
            <h2>Our Services</h2>
            <ul>
                <li>Bursary Application Assistance</li>
                <li>Financial Planning for Education</li>
                <li>Access to Educational Resources</li>
            </ul>
        </section>

        <section id="contact">
            <h2>Contact Us</h2>
            <p>If you have any questions or need assistance, feel free to reach out!</p>
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
            <label for="message">Message:</label>
            <textarea id="message" name="message" required></textarea>
            <button type="submit" style="float: inherit">Send Message</button>
            <br />
        </section>

        <footer>
            <p>&copy; 2024 Tech-Connect. All rights reserved.</p>
        </footer>
    </form>
</body>
</html>