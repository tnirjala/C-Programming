<%@ Page Title="Courses" Language="C#" MasterPageFile="~/Header_Footer.Master" AutoEventWireup="true" CodeBehind="Courses.aspx.cs" Inherits="geekhub_Project.Courses" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/Courses.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <h2 class="text-center mb-4">Courses</h2>
        <div class="row">
            <div class="col-md-4">
                <div class="card">
                    <h3>Select a Course</h3>
                    <asp:ListBox ID="CourseListBox" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="CourseListBox_SelectedIndexChanged"></asp:ListBox>
                </div>
            </div>
            <div class="col-md-8">
                <div id="courseDetails" runat="server" visible="false">
                    <div class="card">
                        <h3>Course Details</h3>
                        <p><strong>Course Name:</strong> <asp:Label ID="CourseNameLabel" runat="server"></asp:Label></p>
                        <p><strong>Description:</strong> <asp:Label ID="CourseDescriptionLabel" runat="server"></asp:Label></p>
                        <p><strong>Tutorial:</strong> <asp:Label ID="TutorialNameLabel" runat="server"></asp:Label></p>
                        <p><strong>Level:</strong> <asp:Label ID="LevelLabel" runat="server"></asp:Label></p>
                        <p><strong>Content:</strong> <asp:Label ID="ContentLabel" runat="server"></asp:Label></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
