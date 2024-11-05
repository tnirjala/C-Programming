<%@ Page Title="" Language="C#" MasterPageFile="~/Header_Footer.Master" AutoEventWireup="true" CodeBehind="usersubmitLab.aspx.cs" Inherits="geekhub_Project.usersubmitLab" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/VirtualLab.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <h2 class="text-center mb-4">Virtual Labs</h2>
        <div class="row">
            <div class="col-md-4">
                <div class="card">
                    <h3>Select a Lab</h3>
                    <asp:ListBox ID="LabListBox" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="LabListBox_SelectedIndexChanged"></asp:ListBox>
                </div>
            </div>
            <div class="col-md-8">
                <div id="labDetails" runat="server" visible="false">
                    <div class="card">
                        <h3>Lab Details</h3>
                        <p><strong>Objective:</strong> <asp:Label ID="ObjectiveLabel" runat="server"></asp:Label></p>
                        <p><strong>Question:</strong> <asp:Label ID="QuestionLabel" runat="server"></asp:Label></p>

                        <div class="form-group">
                            <label for="AnswerTextBox">Your Answer:</label>
                            <asp:TextBox ID="AnswerTextBox" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5"></asp:TextBox>
                        </div>

                        <asp:Button ID="SubmitButton" runat="server" Text="Submit Answer" CssClass="btn btn-primary mt-3" OnClick="SubmitButton_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
