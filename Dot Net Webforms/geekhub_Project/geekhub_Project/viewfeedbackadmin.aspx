<%@ Page Title="" Language="C#" MasterPageFile="~/Header_Footer.Master" AutoEventWireup="true" CodeBehind="viewfeedbackadmin.aspx.cs" Inherits="geekhub_Project.viewfeedbackadmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <script type="text/javascript">
            $(document).ready(function () {
                // using jquery $ is the selecter which is selecting the entire table
                //basically this is just adding a heading row saying that the first row of the gridview that
                //is name, address, pincode
              $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
           });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
    <div class="row">

        <!-- Users List Card -->
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col">
                            <center>
                                <h3>Users Feedbacks</h3>
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
<asp:SqlDataSource 
    ID="SqlDataSource1" 
    runat="server" 
    ConnectionString="<%$ ConnectionStrings:con %>" 
    ProviderName="<%$ ConnectionStrings:con.ProviderName %>" 
    SelectCommand="SELECT * FROM [feedbacktable]">
</asp:SqlDataSource>                        <div class="col">
                            <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="full_name" DataSourceID="SqlDataSource1">
                                <Columns>
                                    <asp:BoundField DataField="full_name" HeaderText="full_name" ReadOnly="True" SortExpression="full_name" />
                                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                                    <asp:BoundField DataField="feedback" HeaderText="feedback" SortExpression="feedback" />
                                </Columns>
                            </asp:GridView>
                                <!-- Back to Home Link -->
    <a href="Admin_Dashboard.aspx" class="back-to-home"><< Back to Home</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>





</div>
</asp:Content>