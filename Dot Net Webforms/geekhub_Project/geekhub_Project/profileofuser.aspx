<%@ Page Title="" Language="C#" MasterPageFile="~/Header_Footer.Master" AutoEventWireup="true" CodeBehind="profileofuser.aspx.cs" Inherits="geekhub_Project.profileofuser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .spacing {
            margin-top: 20px; /* Adjust the value to control the space */
        }
       .full-width-button {
    color: white; /* White text color */
    border: none; /* Remove border */
    width: 100%; /* Use full width */
    margin: 0 5px; /* Add margin for spacing between buttons */
    display: inline-block; /* Ensure button spans full width */
    padding: 10px; /* Add padding for better look */
    border-radius: 4px; /* Rounded corners */
    box-sizing: border-box; /* Include padding and border in element's total width and height */
}

.full-width-button-add {
    background-color: #007bff; /* Blue background color for Add */
}

.full-width-button-update {
    background-color: #28a745; /* Green background color for Update */
}

.full-width-button-delete {
    background-color: #dc3545; /* Red background color for Delete */
}

.button-container {
    display: flex; /* Use flexbox */
    justify-content: center; /* Center buttons horizontally */
    gap: 10px; /* Space between buttons */
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
        .circular-img {
            width: 80px; /* Adjust the width if necessary */
            height: 80px; /* Adjust the height if necessary */
            border-radius: 50%; /* Makes the image circular */
            object-fit: cover; /* Ensures the image covers the container */
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container=fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <!-- Logo Section -->
                        <div class="row">
                            <div class="col text-center">
                                <img src="imgs/userlogo.png" width="80px" class="circular-img"/>
                                <%--<img src="imgs/WhatsApp%20Image%202024-07-08%20at%2016.26.52_e8ed382b.jpg" width="80px" class="circular-img" />--%>
                            </div>
                        </div>

                        <!-- Title Section -->
                        <div class="row">
                            <div class="col text-center">
                                <center>
                                    <h4>Your Profile</h4>
                                    <span>Account Status - </span>
                                    <asp:Label class="badge rounded-pill text-bg-info" ID="Label1" runat="server" Text="status"></asp:Label>
                                </center>
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
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="TextBox2">Date of Birth</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Date of Birth" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <!-- Contact Number and Email ID -->
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="TextBox3">Contact Number</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Contact Number" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="TextBox4">Email ID</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Email ID" TextMode="Email"></asp:TextBox>
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
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="TextBox6">City</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="City"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="TextBox7">Pincode</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Pincode" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <!-- Full Address -->
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <label for="TextBox5">Full Address</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Full Address" TextMode="MultiLine" Rows="1"></asp:TextBox>
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
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="TextBox8">User ID</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" placeholder="User ID" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="TextBox9">Old Password</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" placeholder="Old Password" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="TextBox9">New Password</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" placeholder="New Password" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <!-- Buttons -->
                        <!-- Buttons -->
<div class="row">
    <div class="col button-container">
        <asp:Button CssClass="full-width-button full-width-button-update" ID="ButtonUpdate" runat="server" Text="Update" OnClick="ButtonUpdate_Click" />
        <asp:Button CssClass="full-width-button full-width-button-delete" ID="ButtonDelete" runat="server" Text="Delete" OnClick="ButtonDelete_Click" />
    </div>
</div>

                    </div>
                    <a href="index.aspx" class="back-to-home"><< Back to Home</a>
                </div>
            </div>

<%--            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <!-- Profile Image Section -->
                        <div class="row">
                            <div class="col text-center">
                                <img src="imgs/WhatsApp%20Image%202024-07-08%20at%2016.26.52_e8ed382b.jpg" width="80px" class="circular-img" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>--%>
        </div>
</asp:Content>
