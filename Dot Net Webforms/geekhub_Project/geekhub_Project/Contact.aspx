<%@ Page Title="" Language="C#" MasterPageFile="~/Header_Footer.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="geekhub_Project.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/Contact.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="contact-container">
        <h2>Contact Us</h2>
        <p>If you have any questions or need support, feel free to reach out to us.</p>
        <p>Email: <a href="mailto:support@geekhub.com">support@geekhub.com</a></p>
        <p>Phone: +123-456-7890</p>
        <p>Address: 123 Geek Street, Code City, DevLand</p>
        <h3>Contact Form</h3>

        <asp:TextBox ID="txtName" runat="server" Placeholder="Your Name"></asp:TextBox><br />
        <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName"
            ErrorMessage="Name is required" ForeColor="Red" Display="Dynamic" /><br />

        <asp:TextBox ID="txtEmail" runat="server" Placeholder="Your Email"></asp:TextBox><br />
        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
            ErrorMessage="Email is required" ForeColor="Red" Display="Dynamic" /><br />
        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
            ErrorMessage="Invalid email format" ForeColor="Red" Display="Dynamic"
            ValidationExpression="^\w+([.-]?\w+)*@\w+([.-]?\w+)*(\.\w{2,3})+$" /><br />

        <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="5" Placeholder="Your Message"></asp:TextBox><br />
        <asp:RequiredFieldValidator ID="rfvMessage" runat="server" ControlToValidate="txtMessage"
            ErrorMessage="Message is required" ForeColor="Red" Display="Dynamic" /><br />

        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" /><br />
        <asp:Label ID="lblMessage" runat="server" ForeColor="Green"></asp:Label>
    </div>
</asp:Content>
