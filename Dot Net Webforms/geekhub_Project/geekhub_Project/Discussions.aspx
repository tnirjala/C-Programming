<%@ Page Title="" Language="C#" MasterPageFile="~/Header_Footer.Master" AutoEventWireup="true" CodeBehind="Discussions.aspx.cs" Inherits="geekhub_Project.Discussions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/Discussions.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <h2 class="text-center mb-4">Recent Discussions</h2>

        <asp:PlaceHolder ID="NoDiscussionsPlaceholder" runat="server" Visible="false">
            <div class="alert alert-info">
                No recent discussions yet, you can create a new discussion if you want.
            </div>
        </asp:PlaceHolder>

        <asp:Repeater ID="RecentDiscussionsRepeater" runat="server">
            <ItemTemplate>
                <div class="card mb-3">
                    <div class="card-body">
                        <h3 class="card-title"><%# Eval("Title") %></h3>
                        <p class="card-text"><%# Eval("Description") %></p>

                        <!-- Comments section -->
                        <asp:PlaceHolder ID="NoCommentsPlaceholder" runat="server" Visible="false">
                            <div class="alert alert-info mt-2">
                                No comments yet.
                            </div>
                        </asp:PlaceHolder>

                        <asp:Repeater ID="CommentsRepeater" runat="server">
                            <ItemTemplate>
                                <div class="list-group-item">
                                    <%# Eval("CommentText") %>
                                    <small class="text-muted">on <%# Eval("CommentedDate", "{0:MMM dd, yyyy}") %></small>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                        <asp:TextBox ID="CommentTextBox" runat="server" CssClass="form-control mt-2"></asp:TextBox>
                        <asp:Button ID="AddCommentButton" runat="server" Text="Add Comment" CssClass="btn btn-primary mt-2" CommandArgument='<%# Eval("DiscussionID") %>' OnClick="AddCommentButton_Click" CausesValidation="false" />
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>

        <h2 class="text-center mb-4">Create New Discussion</h2>
        <div class="card mb-5">
            <div class="card-body">
                <div class="form-group">
                    <label for="TitleTextBox">Title:</label>
                    <asp:TextBox ID="TitleTextBox" runat="server" CssClass="form-control" MaxLength="255"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="TitleRequiredValidator" runat="server" ControlToValidate="TitleTextBox" ErrorMessage="Title is required." CssClass="text-danger" Display="Dynamic" />
                </div>
                <div class="form-group">
                    <label for="DescriptionTextBox">Description:</label>
                    <asp:TextBox ID="DescriptionTextBox" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="DescriptionRequiredValidator" runat="server" ControlToValidate="DescriptionTextBox" ErrorMessage="Description is required." CssClass="text-danger" Display="Dynamic" />
                </div>
                <asp:Button ID="SubmitDiscussionButton" runat="server" Text="Create Discussion" CssClass="btn btn-success mt-3" OnClick="SubmitDiscussionButton_Click" />
            </div>
        </div>
    </div>
</asp:Content>
