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
            background-image: url('2023_4 dentsu SA Bursary Scheme for Young South Africans » Youth Opportunities Hub.jpg'); /* Replace with your image path */
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
        }
        section {
            padding: 20px; /* Add padding to sections */
        }
        .auto-style2 {
            height: 98px;
        }
        /* Additional style for buttons */
        .admin-button, .student-button {
            background-color: #006666; /* Color for buttons */
            color: white; /* Text color */
            padding: 10px 15px; /* Button padding */
            text-decoration: none; /* No underline */
            border-radius: 5px; /* Rounded corners */
            font-weight: 700; /* Bold text */
            margin-right: 10px; /* Space between buttons */
        }
        .student-button {
            float: left; /* Align to the left */
        }
        .admin-button {
            float: right; /* Align to the right */
        }
        .auto-style3 {
            height: 23px;
        }
        .auto-style4 {
            font-size: x-large;
        }
        .profile-pic {
            height: 186px;
            width: 261px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" style="color: #FFFFFF; background-image: url('2023_4 dentsu SA Bursary Scheme for Young South Africans » Youth Opportunities Hub.jpg');">
        <header style="font-size: small">
            <h1 style="font-size: medium">
                <table style="width:100%;">
                    <tr>
                        <td class="auto-style1">
                            <asp:Image ID="Image1" runat="server" Height="140px" ImageUrl="~/Logo.png" Width="229px" style="margin-top: 0px" />
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
                        <td colspan="2" class="auto-style3"></td>
                        <td class="auto-style3"></td>
                        <td class="auto-style3"></td>
                    </tr>
                </table>
            </h1>
            <a class="student-button" href="LoginPage.aspx">Student Login</a> <!-- Student Login button -->
            <a class="admin-button" href="AdminRegister.aspx">Admin Login</a> <!-- Admin Register button -->
        </header>

        <section id="home" class="hero">
            <h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; About Tech-Connect</h2>
            <p>TechConnect, based in the heart of Sandton, is dedicated to empowering the next generation of technology leaders. Our bursary program connects aspiring students with opportunities, enabling them to grow, innovate, and succeed in the tech industry. We believe in bridging gaps and building futures through education and collaboration.</p>
            <h1>Tech-Connect<strong>&nbsp; Bursary Programme</strong></h1>
            <h1><strong>(Application are opend for 2025 intake from 12 June - 28 november)</strong></h1>
            <p>The TechConnect Bursary Program provides comprehensive support to talented individuals who plan to pursue full-time undergraduate studies in technology-related fields. Our focus is on empowering students to excel in careers that drive innovation and digital transformation. Priority is given to degree programs aligned with the future of technology, including fields such as Software Engineering, Information Technology, Data Science, Cybersecurity, Artificial Intelligence, and related disciplines. At TechConnect, we are committed to building the next generation of tech leaders.</p>
             <p>
                 Get Started &gt;&nbsp;
<button type="button" style="border-style: none; border-color: inherit; border-width: medium; background-color: #006666; height: 34px; color: white; cursor: pointer; font-weight: 700; width: 177px;" onclick="location.href='signupPage.aspx'" id="Applybttn">Apply now</button>
              <p> &nbsp;</p>
                 <strong>These bursary opportunities are limited to South African citizens (by birth only), who are / will be pursuing degree studies at a public South African University or University of Technology.</strong><h2><b><span data-contrast="none">All applicants will undergo screening based on the following criteria:</span></b><span data-ccp-props="{&quot;201341983&quot;:0,&quot;335559739&quot;:0,&quot;335559740&quot;:360}">&nbsp;</span></h2>
            <ol>
                <li aria-setsize="-1" data-aria-level="1" data-aria-posinset="1" data-font="Symbol" data-leveltext="" data-list-defn-props="{&quot;335552541&quot;:1,&quot;335559684&quot;:-2,&quot;335559685&quot;:360,&quot;335559991&quot;:360,&quot;469769226&quot;:&quot;Symbol&quot;,&quot;469769242&quot;:[8226],&quot;469777803&quot;:&quot;left&quot;,&quot;469777804&quot;:&quot;&quot;,&quot;469777815&quot;:&quot;multilevel&quot;}" data-listid="24"><span data-contrast="auto">Must be South African citizenship</span><span data-ccp-props="{&quot;201341983&quot;:0,&quot;335559739&quot;:0,&quot;335559740&quot;:360}"> (by birth only).</span></li>
                <li aria-setsize="-1" data-aria-level="1" data-aria-posinset="2" data-font="Symbol" data-leveltext="" data-list-defn-props="{&quot;335552541&quot;:1,&quot;335559684&quot;:-2,&quot;335559685&quot;:360,&quot;335559991&quot;:360,&quot;469769226&quot;:&quot;Symbol&quot;,&quot;469769242&quot;:[8226],&quot;469777803&quot;:&quot;left&quot;,&quot;469777804&quot;:&quot;&quot;,&quot;469777815&quot;:&quot;multilevel&quot;}" data-listid="24"><span data-contrast="auto">Household income verifications</span><span data-ccp-props="{&quot;201341983&quot;:0,&quot;335559739&quot;:0,&quot;335559740&quot;:360}">.</span></li>
                <li aria-setsize="-1" data-aria-level="1" data-aria-posinset="3" data-font="Symbol" data-leveltext="" data-list-defn-props="{&quot;335552541&quot;:1,&quot;335559684&quot;:-2,&quot;335559685&quot;:360,&quot;335559991&quot;:360,&quot;469769226&quot;:&quot;Symbol&quot;,&quot;469769242&quot;:[8226],&quot;469777803&quot;:&quot;left&quot;,&quot;469777804&quot;:&quot;&quot;,&quot;469777815&quot;:&quot;multilevel&quot;}" data-listid="24"><span data-contrast="auto">Acceptance / provisional acceptance for studies at a South African Public University / University of Technology for the following year</span><span data-ccp-props="{&quot;201341983&quot;:0,&quot;335559739&quot;:0,&quot;335559740&quot;:360}">.</span></li>
                <li aria-setsize="-1" data-aria-level="1" data-aria-posinset="3" data-font="Symbol" data-leveltext="" data-list-defn-props="{&quot;335552541&quot;:1,&quot;335559684&quot;:-2,&quot;335559685&quot;:360,&quot;335559991&quot;:360,&quot;469769226&quot;:&quot;Symbol&quot;,&quot;469769242&quot;:[8226],&quot;469777803&quot;:&quot;left&quot;,&quot;469777804&quot;:&quot;&quot;,&quot;469777815&quot;:&quot;multilevel&quot;}" data-listid="24"><span data-contrast="auto">Academic performance of the applicants.</span></li>
                <li aria-setsize="-1" data-aria-level="1" data-aria-posinset="4" data-font="Symbol" data-leveltext="" data-list-defn-props="{&quot;335552541&quot;:1,&quot;335559684&quot;:-2,&quot;335559685&quot;:360,&quot;335559991&quot;:360,&quot;469769226&quot;:&quot;Symbol&quot;,&quot;469769242&quot;:[8226],&quot;469777803&quot;:&quot;left&quot;,&quot;469777804&quot;:&quot;&quot;,&quot;469777815&quot;:&quot;multilevel&quot;}" data-listid="24">Combined household income must be less than R600,000.00 per annum. The final selection will prioritise financially needy and academically competitive candidates.</li>
                <li aria-setsize="-1" data-aria-level="1" data-aria-posinset="4" data-font="Symbol" data-leveltext="" data-list-defn-props="{&quot;335552541&quot;:1,&quot;335559684&quot;:-2,&quot;335559685&quot;:360,&quot;335559991&quot;:360,&quot;469769226&quot;:&quot;Symbol&quot;,&quot;469769242&quot;:[8226],&quot;469777803&quot;:&quot;left&quot;,&quot;469777804&quot;:&quot;&quot;,&quot;469777815&quot;:&quot;multilevel&quot;}" data-listid="24">Student must be doing their first undergraduate degree.</li>
                <li aria-setsize="-1" data-aria-level="1" data-aria-posinset="4" data-font="Symbol" data-leveltext="" data-list-defn-props="{&quot;335552541&quot;:1,&quot;335559684&quot;:-2,&quot;335559685&quot;:360,&quot;335559991&quot;:360,&quot;469769226&quot;:&quot;Symbol&quot;,&quot;469769242&quot;:[8226],&quot;469777803&quot;:&quot;left&quot;,&quot;469777804&quot;:&quot;&quot;,&quot;469777815&quot;:&quot;multilevel&quot;}" data-listid="24">University students applying for 2nd / 3rd / 4th year of studies must have an average of 60% for all modules.</li>
                <li aria-setsize="-1" data-aria-level="1" data-aria-posinset="4" data-font="Symbol" data-leveltext="" data-list-defn-props="{&quot;335552541&quot;:1,&quot;335559684&quot;:-2,&quot;335559685&quot;:360,&quot;335559991&quot;:360,&quot;469769226&quot;:&quot;Symbol&quot;,&quot;469769242&quot;:[8226],&quot;469777803&quot;:&quot;left&quot;,&quot;469777804&quot;:&quot;&quot;,&quot;469777815&quot;:&quot;multilevel&quot;}" data-listid="24">University students applying for 2nd / 3rd / 4th year of studies must have an average of 60% for all modules.</li>
                <li aria-setsize="-1" data-aria-level="1" data-aria-posinset="4" data-font="Symbol" data-leveltext="" data-list-defn-props="{&quot;335552541&quot;:1,&quot;335559684&quot;:-2,&quot;335559685&quot;:360,&quot;335559991&quot;:360,&quot;469769226&quot;:&quot;Symbol&quot;,&quot;469769242&quot;:[8226],&quot;469777803&quot;:&quot;left&quot;,&quot;469777804&quot;:&quot;&quot;,&quot;469777815&quot;:&quot;multilevel&quot;}" data-listid="24">University students applying for 2nd / 3rd / 4th year of studies must have an average of 60% for all modules.</li>
            </ol>
            
               <p>
                   <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="auto-style4">TechConnect Bursary Opportunities</span></strong></p>
            <p>
                The TechConnect Bursary is a performance-based program designed to support talented individuals pursuing full-time undergraduate degrees in technology-related fields. This comprehensive bursary comes with a work-back obligation, ensuring recipients gain valuable industry experience while contributing to the growth of TechConnect.</p>
            <p>
                Our bursary seeks to attract exceptional young talent passionate about innovation and technology. The bursary supports full-time studies leading to degrees such as Software Engineering, Information Technology, Data Science, and other technology-focused disciplines at recognized South African universities.</p>
            <p>
                Eligibility is exclusively open to South African citizens.</p>
            <p>
                <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="auto-style4">The TechConnect Bursary Programme comprises</span></strong></p>
            <p>
                Applications may be submitted for undergraduate degrees (no diplomas) in one of the following fields of study:</p>
            <p>
                Undergraduate Studies (B.Eng. / B.Sc.) – Please note that this bursary program does not accept technical Maths/math literacy.</p>
            <ul>
                <li>Software Engineering</li>
                <li>Information Technology</li>
                <li>Data Science (with specializations in Computer Science, Mathematics, Operations Research, and Statistics)</li>
                <li>Cybersecurity</li>
                <li>Artificial Intelligence</li>
                <li>Network Engineering</li>
                <li>Web Development</li>
                <li>Mobile Application Development</li>
                <li>Game Development</li>
                <li>Robotics</li>
                <li>Cloud Computing</li>
                <li>Database Management</li>
            </ul>
            <p>
                This comprehensive bursary aims to foster the next generation of technology leaders, equipping students with the skills necessary to excel in the ever-evolving tech landscape.</p>
             <p></p> style="font-weight: 700; font-size: x-large">
                  <h1>Stand a chance to win exciting prizes!</h1>
                           <div> &nbsp;<img src="ShirtLogo.png" alt="User Profile Picture" class="profile-pic" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="LaptopLogo.png" alt="User Profile Picture" class="profile-pic" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="Baglogo.png" alt="User Profile Picture" class="profile-pic" />
</div>
                                 
        </section>

        <section id="contact">
            <h2>Contact Us</h2>
            <p>If you have any questions or need assistance, feel free to reach out!
            </p>
            &nbsp;<br />
           
        </section>

        <footer>
            <p>&copy; 2024 Tech-Connect. All rights reserved.</p>
        </footer>
    </form>

</body>
</html>
