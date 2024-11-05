<%@ Page Title="" Language="C#" MasterPageFile="~/Header_Footer.Master" AutoEventWireup="true" CodeBehind="usersignup.aspx.cs" Inherits="geekhub_Project.usersignup" %>

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
        .full-width-button-signup {
            background-color: #17a2b8; /* Info background color for Sign Up */
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
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-8 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <!-- Logo Section -->
                        <div class="row">
                            <div class="col text-center">
                                <img src="imgs/userlogo.png" width="80px" />
                            </div>
                        </div>

                        <!-- Title Section -->
                        <div class="row">
                            <div class="col text-center">
                                <h4>User Registration</h4>
                            </div>
                        </div>

                        <!-- Separator -->
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <!-- Registration Form -->
                        <div class="row">
                            <!-- Full Name and Date of Birth -->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="TextBox1">Full Name</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Full Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="TextBox1" ErrorMessage="Full Name is required" CssClass="text-danger" Display="Dynamic" runat="server" />
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="TextBox2">Date of Birth</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Date of Birth" TextMode="Date"></asp:TextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="TextBox2" ErrorMessage="Date of Birth is required" CssClass="text-danger" Display="Dynamic" runat="server" />
                                </div>
                            </div>
                        </div>

                        <!-- Contact Number and Email ID -->
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="TextBox3">Contact Number</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Contact Number" TextMode="Number"></asp:TextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="TextBox3" ErrorMessage="Contact Number is required" CssClass="text-danger" Display="Dynamic" runat="server" />
                                    <asp:RegularExpressionValidator ControlToValidate="TextBox3" ErrorMessage="Enter a valid Contact Number" CssClass="text-danger" Display="Dynamic" runat="server" ValidationExpression="^\d{10}$" />
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="TextBox4">Email ID</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Email ID" type="email" TextMode="Email"></asp:TextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="TextBox4" ErrorMessage="Email ID is required"
                                        CssClass="text-danger" Display="Dynamic" runat="server" />
                                    <asp:RegularExpressionValidator ControlToValidate="TextBox4" ErrorMessage="Enter a valid Email ID" 
                                        CssClass="text-danger" Display="Dynamic" runat="server" ValidationExpression="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$" />
                                </div>
                            </div>
                        </div>

                        <!-- Address Information -->
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Provinces</label>
                                    <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server">
                                        <asp:ListItem Text="Select" Value="select" />
                                        <asp:ListItem Text="Province 1" Value="Province 1" />
                                        <asp:ListItem Text="Province 2" Value="Province 2" />
                                        <asp:ListItem Text="Bagmati" Value="Bagmati" />
                                        <asp:ListItem Text="Gandaki" Value="Gandaki" />
                                        <asp:ListItem Text="Lumbini" Value="Lumbini" />
                                        <asp:ListItem Text="Karnali" Value="Karnali" />
                                        <asp:ListItem Text="Sudurpachim" Value="Sudurpachim" />
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ControlToValidate="DropDownList1" InitialValue="select" ErrorMessage="Provinces is required" CssClass="text-danger" Display="Dynamic" runat="server" />
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="TextBox6">City</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="City"></asp:TextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="TextBox6" ErrorMessage="City is required" CssClass="text-danger" Display="Dynamic" runat="server" />
                                </div>
                            </div>
                            <div class="col-md-4">
                          <div class="form-group">
                                 <label for="TextBox7">Pincode</label>
                                 <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Pincode"></asp:TextBox>
                                 <asp:RegularExpressionValidator ID="revPincode" runat="server" ControlToValidate="TextBox7" ErrorMessage="Enter a valid Pincode" ValidationExpression="^\d{4,6}$" ForeColor="Red"></asp:RegularExpressionValidator>
                        </div>

                            </div>
                        </div>

                        <!-- Full Address -->
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <label for="TextBox5">Full Address</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Full Address" TextMode="MultiLine" Rows="1"></asp:TextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="TextBox5" ErrorMessage="Full Address is required" CssClass="text-danger" Display="Dynamic" runat="server" />
                                </div>
                            </div>
                        </div>

                        <!-- Login Credential Section -->
                        <div class="row">
                            <div class="col text-center">
                                <span class="badge rounded-pill text-bg-success">Login Credential</span>
                            </div>
                        </div>

                        <!-- User ID and Password -->
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="TextBox8">User ID</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" placeholder="User ID"></asp:TextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="TextBox8" ErrorMessage="User ID is required" CssClass="text-danger" Display="Dynamic" runat="server" />
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="TextBox9">Password</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="TextBox9" ErrorMessage="Password is required" CssClass="text-danger" Display="Dynamic" runat="server" />
                                </div>
                            </div>
                        </div>

                        <!-- Sign Up Button -->
                        <div class="row">
                            <div class="col">
                                <div class="form-group spacing">
                                    <asp:Button CssClass="full-width-button" ID="Button1" runat="server" Text="Sign Up" OnClick="Button1_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <a href="index.aspx" class="back-to-home"><< Back to Home</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
