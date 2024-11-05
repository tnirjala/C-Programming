<%@ Page Title="" Language="C#" MasterPageFile="~/Header_Footer.Master" AutoEventWireup="true" CodeBehind="manageVirtual.aspx.cs" Inherits="geekhub_Project.manageVirtual" %>
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
        .card {
            margin-top: 20px;
            margin-bottom: 40px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 4px;
        }

        .card-body {
            padding: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <!-- Form Fields on the left -->
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h2 class="text-center mb-4"><strong>Manage Virtual Lab</strong></h2>

                        <!-- Lab Name -->
                        <div class="form-group row">
                            <div class="col-md-4">
                                <asp:Label runat="server" Text="Lab Name" CssClass="form-label"></asp:Label>
                            </div>
                            <div class="col-md-8">
                                <asp:TextBox ID="LabName" runat="server" CssClass="form-control textbox"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True" ControlToValidate="LabName"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <!-- Lab Objective -->
                        <div class="form-group row">
                            <div class="col-md-4">
                                <asp:Label runat="server" Text="Lab Objective" CssClass="form-label"></asp:Label>
                            </div>
                            <div class="col-md-8">
                                <asp:TextBox ID="LabObjective" runat="server" CssClass="form-control textbox"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True" ControlToValidate="LabObjective"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <!-- Lab Question -->
                        <div class="form-group row">
                            <div class="col-md-4">
                                <asp:Label runat="server" Text="Lab Question" CssClass="form-label"></asp:Label>
                            </div>
                            <div class="col-md-8">
                                <asp:TextBox ID="LabQuestion" runat="server" CssClass="form-control textbox"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True" ControlToValidate="LabQuestion"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <!-- Buttons -->
                        <div class="form-group text-center">
                            <asp:Button ID="Insertbtn" runat="server" Text="Insert" OnClick="Insertbtn_Click" CssClass="btn btn-primary" />
                            <asp:Button ID="Updatebtn" runat="server" Text="Update" OnClick="Updatebtn_Click" CssClass="btn btn-secondary" />
                            <asp:Button ID="Deletebtn" runat="server" Text="Delete" OnClick="Deletebtn_Click" CssClass="btn btn-danger" />
                        </div>
                                           
                    <a href="Admin_Dashboard.aspx" class="back-to-home">
                        << Back to Home</a>
  
                    </div>
                </div>
            </div>

            <!-- Grid View on the right -->
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="LabID" DataSourceID="SqlDataSource1" OnRowCommand="GridView1_RowCommand" CssClass="table table-striped table-bordered">
                            <Columns>
                                <asp:BoundField DataField="LabID" HeaderText="LabID" InsertVisible="False" ReadOnly="True" SortExpression="LabID" />
                                <asp:BoundField DataField="LabName" HeaderText="LabName" SortExpression="LabName" />
                                <asp:BoundField DataField="LabObjective" HeaderText="LabObjective" SortExpression="LabObjective" />
                                <asp:BoundField DataField="LabQuestion" HeaderText="LabQuestion" SortExpression="LabQuestion" />
                                <asp:ButtonField CommandName="Select" ButtonType="Button" Text="Select" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        ConnectionString="<%$ ConnectionStrings:con %>"
        SelectCommand="SELECT * FROM Labs"
        InsertCommand="INSERT INTO Labs (LabName, LabObjective, LabQuestion) VALUES (@LabName, @LabObjective, @LabQuestion)"
        UpdateCommand="UPDATE Labs SET LabName = @LabName, LabObjective = @LabObjective, LabQuestion = @LabQuestion WHERE LabID = @LabID"
        DeleteCommand="DELETE FROM Labs WHERE LabID = @LabID">
        <InsertParameters>
            <asp:Parameter Name="LabName" Type="String" />
            <asp:Parameter Name="LabObjective" Type="String" />
            <asp:Parameter Name="LabQuestion" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="LabName" Type="String" />
            <asp:Parameter Name="LabObjective" Type="String" />
            <asp:Parameter Name="LabQuestion" Type="String" />
            <asp:Parameter Name="LabID" Type="Int32" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="LabID" Type="Int32" />
        </DeleteParameters>
    </asp:SqlDataSource>
</asp:Content>
