<%@ Page Title="" Language="C#" MasterPageFile="~/Header_Footer.Master" AutoEventWireup="true" CodeBehind="adminusermanagement.aspx.cs" Inherits="geekhub_Project.adminusermanagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
            $(document).ready(function () {
                // using jquery $ is the selecter which is selecting the entire table
                //basically this is just adding a heading row saying that the first row of the gridview that
                //is name, address, pincode
              $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
           });
    </script>
    <style>
        .spacing {
            margin-top: 20px; /* Adjust the value to control the space */
        }
        .full-width-button {
            background-color: red; /* Green background color for Login */
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
    <div class="container-fluid">
        <div class="row">
            <!-- User Details Card -->
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Users Details</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="imgs/userlogo.png" width="80px"/>
                                </center>
                            </div>
                        </div>
                        <!-- User Information Form -->
                        <div class="row">
                            <div class="col-md-3">
                                <label>User ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="User ID"></asp:TextBox>
                                        <asp:LinkButton class="btn btn-primary" ID="LinkButton4" runat="server" OnClick="LinkButton4_Click">Go</asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Full Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Full Name" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <label>Account Status</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control mr-1" ID="TextBox3" runat="server" placeholder="Account Status" ReadOnly="True"></asp:TextBox>
                                        <asp:LinkButton class="btn btn-success mr-1" ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" ><i class="fas fa-check-circle"></i></asp:LinkButton>
                                        <asp:LinkButton class="btn btn-warning mr-1" ID="LinkButton2" runat="server" OnClick="LinkButton2_Click"><i class="fas fa-pause-circle"></i></asp:LinkButton>
                                       <!-- <asp:LinkButton class="btn btn-danger mr-1" ID="LinkButton3" runat="server" OnClick="LinkButton3_Click"><i class="fas fa-times-circle"></i></asp:LinkButton>
                                   --> </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>DOB</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="DOB" ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Contact No</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Contact No" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Email</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Email" ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Province</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Province" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>City</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" placeholder="City" ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Pin Code</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" placeholder="Pin Code" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <!-- Full Address -->
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <label for="TextBox5">Full Address</label>
                                    <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" placeholder="Full Address" TextMode="MultiLine" Rows="1" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <!-- Delete User Button -->
                        <div class="row">
                            <div class="col">
                                <div class="form-group spacing">
                                    <asp:Button CssClass="full-width-button" ID="Button1" runat="server" Text="Delete User" OnClick="Button1_Click" />
                                </div>
                            </div>
                        </div>
                        <!-- Back to Home Link -->
                        <a href="Admin_Dashboard.aspx" class="back-to-home"><< Back to Home</a>
                    </div>
                </div>
            </div>
            <!-- Users List Card -->
            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Users List</h3>
                                </center>
                            </div>
                        </div>
                        <!-- Horizontal Line -->
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        <!-- Users List Table -->
                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" ProviderName="<%$ ConnectionStrings:con.ProviderName %>" SelectCommand="SELECT * FROM [usersignup]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="user_id" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="user_id" HeaderText="ID" ReadOnly="True" SortExpression="user_id" />
                                        <asp:BoundField DataField="full_name" HeaderText="Name" SortExpression="full_name" />
                                        <asp:BoundField DataField="account_status" HeaderText="Status" SortExpression="account_status" />
                                        <asp:BoundField DataField="contact_no" HeaderText="Contact" SortExpression="contact_no" />
                                        <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                                        <asp:BoundField DataField="provinces" HeaderText="Provinces" SortExpression="provinces" />
                                        <asp:BoundField DataField="pincode" HeaderText="Pincode" SortExpression="pincode" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
