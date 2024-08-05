<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student_RegistrationForm.aspx.cs" Inherits="TechConnect_CMPG223_Project.Student_RegistrationForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 516px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="auto-style1">
        <div>
        </div>
        <asp:Label ID="Label1" runat="server" Text="Registration Page"></asp:Label>
        <p>
            <asp:Label ID="SName_lbl" runat="server" Text="Name :"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="Name_txtbx" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
            <asp:Label ID="SSurname_lbl" runat="server" Text="Surname: "></asp:Label>
&nbsp;
            <asp:TextBox ID="surname_txtbx" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Sbirth_lbl" runat="server" Text="Date Of Birth :"></asp:Label>
&nbsp;&nbsp;
            <asp:TextBox ID="DOB_Txtbx" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="SEmail_lbl" runat="server" Text="Email:"></asp:Label>
&nbsp;
            <asp:TextBox ID="Email_txtbx" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Snumber_lbl" runat="server" Text="Phone Number:"></asp:Label>
&nbsp;
            <asp:TextBox ID="pNumber_txtbx" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Saddress_lbl" runat="server" Text="Address:"></asp:Label>
&nbsp;
            <asp:TextBox ID="Address_Txtbx" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label3" runat="server" Text="ID Number:"></asp:Label>
&nbsp;
            <asp:TextBox ID="ID_Txtbx" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="username_lbl" runat="server" Text="Username:"></asp:Label>
&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="Username_Txbx" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="password_lbl" runat="server" Text="Password:"></asp:Label>
&nbsp;<asp:TextBox ID="Password_txtbx" runat="server"></asp:TextBox>
        </p>
        <p>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:Button ID="Sregister_bttn" runat="server" OnClick="Button1_Click" Text="REGISTER" />
        </p>
    </form>
</body>
</html>
