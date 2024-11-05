<%@ Page Title="" Language="C#" MasterPageFile="~/Header_Footer.Master" AutoEventWireup="true" CodeBehind="manageLectures.aspx.cs" Inherits="geekhub_Project.manageLectures" %>

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
            margin-top: 0px;
            margin-bottom: 40px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 4px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h2 class="text-center mb-4"><strong>Manage Lectures / Tutorials</strong></h2>
        <div class="row">
            <!-- Form Section -->
            <div class="col-md-5">
                <div class="card p-3">
                    <!-- Course Name -->
                    <div class="form-group row">
                        <label class="col-md-4 col-form-label">Course Name</label>
                        <div class="col-md-8">
                            <asp:TextBox ID="CourseName" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True" ControlToValidate="CourseName"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <!-- Course Description -->
                    <div class="form-group row">
                        <label class="col-md-4 col-form-label">Course Description</label>
                        <div class="col-md-8">
                            <asp:TextBox ID="CourseDescription" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True" ControlToValidate="CourseDescription"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <!-- Tutorial Title -->
                    <div class="form-group row">
                        <label class="col-md-4 col-form-label">Tutorial Title</label>
                        <div class="col-md-8">
                            <asp:TextBox ID="TutorialTitle" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True" ControlToValidate="TutorialTitle"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <!-- Level -->
                    <div class="form-group row">
                        <label class="col-md-4 col-form-label">Level</label>
                        <div class="col-md-8">
                            <asp:DropDownList ID="Level" runat="server" CssClass="form-control">
                                <asp:ListItem>Select</asp:ListItem>
                                <asp:ListItem>Beginner</asp:ListItem>
                                <asp:ListItem>Intermediate</asp:ListItem>
                                <asp:ListItem>Advanced</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator InitialValue="Select" runat="server" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True" ControlToValidate="Level"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <!-- Content -->
                    <div class="form-group row">
                        <label class="col-md-4 col-form-label">Content</label>
                        <div class="col-md-8">
                            <asp:TextBox ID="Content" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True" ControlToValidate="Content"></asp:RequiredFieldValidator>
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

            <!-- Table Section -->
            <div class="col-md-7">
                <div class="card p-3">
                    <div class="table-responsive">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CourseID" DataSourceID="SqlDataSource1" OnRowCommand="GridView1_RowCommand" CssClass="table table-striped table-bordered">
                            <Columns>
                                <asp:BoundField DataField="CourseID" HeaderText="CourseID" InsertVisible="False" ReadOnly="True" SortExpression="CourseID" />
                                <asp:BoundField DataField="CourseName" HeaderText="CourseName" SortExpression="CourseName" />
                                <asp:BoundField DataField="CourseDescription" HeaderText="CourseDescription" SortExpression="CourseDescription" />
                                <asp:BoundField DataField="TutorialName" HeaderText="TutorialName" SortExpression="TutorialName" />
                                <asp:BoundField DataField="Level" HeaderText="Level" SortExpression="Level" />
                                <asp:BoundField DataField="Content" HeaderText="Content" SortExpression="Content" />
                                <asp:ButtonField CommandName="Select" ButtonType="Button" Text="Select" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>

        <!-- SqlDataSource -->
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:con %>"
            SelectCommand="SELECT * FROM Courses"
            InsertCommand="INSERT INTO Courses (CourseName, CourseDescription, TutorialName, Level, Content) VALUES (@CourseName, @CourseDescription, @TutorialName, @Level, @Content)"
            UpdateCommand="UPDATE Courses SET CourseName = @CourseName, CourseDescription = @CourseDescription, TutorialName = @TutorialName, Level = @Level, Content = @Content WHERE CourseID = @CourseID"
            DeleteCommand="DELETE FROM Courses WHERE CourseID = @CourseID">
            <InsertParameters>
                <asp:Parameter Name="CourseName" Type="String" />
                <asp:Parameter Name="CourseDescription" Type="String" />
                <asp:Parameter Name="TutorialName" Type="String" />
                <asp:Parameter Name="Level" Type="String" />
                <asp:Parameter Name="Content" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="CourseName" Type="String" />
                <asp:Parameter Name="CourseDescription" Type="String" />
                <asp:Parameter Name="TutorialName" Type="String" />
                <asp:Parameter Name="Level" Type="String" />
                <asp:Parameter Name="Content" Type="String" />
                <asp:Parameter Name="CourseID" Type="Int32" />
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="CourseID" Type="Int32" />
            </DeleteParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
