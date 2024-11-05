<%@ Page Title="" Language="C#" MasterPageFile="~/Header_Footer.Master" AutoEventWireup="true" CodeBehind="feedbackmanagement.aspx.cs" Inherits="geekhub_Project.feedbackmanagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .spacing {
            margin-top: 20px; /* Adjust the value to control the space */
        }
        .full-width-button {
            background-color: #28a745; /* Green background color for Login */
            color: white; /* White text color */
            border: none; /* Remove border */
            width: calc(100% - 0px); /* Full width minus some padding */
            margin: 0 auto; /* Center button horizontally */
            display: block; /* Ensure button spans full width */
            padding: 10px; /* Add padding for better look */
            border-radius: 4px; /* Rounded corners */
        }
        .form-group {
            margin-bottom: 15px; /* Space between form controls */
        }
        .form-group label {
            display: block; /* Ensure label takes up full width */
            margin-bottom: 5px; /* Space between label and textbox */
        }
        .container {
            margin-top: 20px; /* Add margin to the top of the container */
        }
        .card {
            background-color: rgba(0, 0, 0, 0.8); /* Black background with some transparency */
            margin-top: 0px; /* Add margin to the top of the card */
            margin-bottom: 40px; /* Add margin to the bottom of the card */
            /* Add shadow to create a 3D effect */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Horizontal offset, vertical offset, blur radius, color */
            border-radius: 4px; /* Optional: adds rounded corners for a smoother look */
        }
        .back-to-home {
            display: block; /* Ensure it behaves like a block element */
            margin-top: 0px; /* Space between link and footer */
            text-align: center; /* Center align the link text */
            font-size: 16px; /* Adjust font size if needed */
            color: #007bff; /* Color for the link */
            text-decoration: none; /* Remove underline from the link */
        }
        .circular-img {
            width: 80px; /* Adjust the width if necessary */
            height: 80px; /* Adjust the height if necessary */
            border-radius: 50%; /* Makes the image circular */
            object-fit: cover; /* Ensures the image covers the container */
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <p style="color: #000000;">Please help us to serve you better by taking a couple of minutes..</p>
                                </center>
                            </div>
                        </div>
                         <div class="row">
                            <div class="col">
                                    <p style="color: green;">Any specific feedback. Please write to us</p>
                            </div>
                        </div>

                        <!-- Full Address -->
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Additional comments" TextMode="MultiLine" Rows="4"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                          <!-- Contact Number and Email ID -->
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Your Name" ></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Email" type="email" TextMode="Email"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-group spacing">
                            <asp:Button CssClass="full-width-button" ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
                        </div>
                    </div>
                    <a href="index.aspx" class="back-to-home">
                        << Back to Home</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
