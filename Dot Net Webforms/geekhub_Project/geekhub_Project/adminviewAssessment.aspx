<%@ Page Title="" Language="C#" MasterPageFile="~/Header_Footer.Master" AutoEventWireup="true" CodeBehind="adminviewAssessment.aspx.cs" Inherits="geekhub_Project.adminviewAssessment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <!-- Text Fields Card -->
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h2 class="text-center mb-4"><strong>Manage User Answers</strong></h2>

                        <!-- Lab Name -->
                        <div class="form-group row">
                            <div class="col-md-4">
                                <asp:Label runat="server" Text="Lab Name" CssClass="form-label"></asp:Label>
                            </div>
                            <div class="col-md-8">
                                <asp:TextBox ID="LabName" runat="server" CssClass="form-control textbox" placeholder="Lab Name"></asp:TextBox><br />
                            </div>
                        </div>

                        <!-- User Answer -->
                        <div class="form-group row">
                            <div class="col-md-4">
                                <asp:Label runat="server" Text="User Answer" CssClass="form-label"></asp:Label>
                            </div>
                            <div class="col-md-8">
                                <asp:TextBox ID="UserAnswer" runat="server" CssClass="form-control textbox" placeholder="Answers" TextMode="MultiLine" Rows="5"></asp:TextBox><br />
                            </div>
                        </div>

                        <!-- Buttons -->
                        <div class="form-group text-center">
                            <asp:Button ID="Updatebtn" runat="server" Text="Update" OnClick="Updatebtn_Click" CssClass="btn btn-success" />
                            <asp:Button ID="Deletebtn" runat="server" Text="Delete" OnClick="Deletebtn_Click" CssClass="btn btn-danger" />
                        </div>
                          <a href="Admin_Dashboard.aspx" class="back-to-home">
      << Back to Home</a>
                    </div>
                </div>
            </div>

            <!-- GridView Card -->
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <div class="table-responsive">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="AnswerID" DataSourceID="SqlDataSource1" OnRowCommand="GridView1_RowCommand" CssClass="table table-striped table-bordered">
                                <Columns>
                                    <asp:BoundField DataField="AnswerID" HeaderText="AnswerID" InsertVisible="False" ReadOnly="True" SortExpression="AnswerID" />
                                    <asp:BoundField DataField="LabID" HeaderText="LabID" SortExpression="LabID" />
                                    <asp:BoundField DataField="UserAnswer" HeaderText="UserAnswer" SortExpression="UserAnswer" />
                                    <asp:ButtonField CommandName="Select" ButtonType="Button" Text="Select" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- SqlDataSource -->
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        ConnectionString="<%$ ConnectionStrings:con %>"
        SelectCommand="SELECT * FROM LabAnswer"
        UpdateCommand="UPDATE LabAnswer SET UserAnswer=@UserAnswer WHERE AnswerID = @AnswerID"
        DeleteCommand="DELETE FROM LabAnswer WHERE AnswerID = @AnswerID">
        <UpdateParameters>
            <asp:Parameter Name="UserAnswer" Type="String" />
            <asp:Parameter Name="AnswerID" Type="Int32" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="AnswerID" Type="Int32" />
        </DeleteParameters>
    </asp:SqlDataSource>
</asp:Content>
