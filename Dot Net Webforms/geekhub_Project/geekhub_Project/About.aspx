<%@ Page Title="About GeekHub" Language="C#" MasterPageFile="~/Header_Footer.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="geekhub_Project.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/About.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="about-container">
        <div class="about-content">
            <h2>About GeekHub</h2>
            <p>GeekHub is a platform dedicated to helping programmers of all skill levels enhance their knowledge and skills. Whether you are a beginner or an experienced developer, you'll find valuable resources here.</p>
            <p>Our mission is to create a collaborative environment where learning and teaching are seamless, and where programmers can connect and grow together.</p>

            <h3>Our Features</h3>
            <ul>
                <li>Diverse learning resources covering various programming languages and frameworks</li>
                <li>Interactive discussions and community support</li>
                <li>Hands-on assessments to test and improve your skills</li>
                <li>Virtual labs for practical experience</li>
            </ul>
        </div>

        <div class="about-image">
            <img src="imgs/coding.jpg" />
        </div>
    </div>
</asp:Content>
