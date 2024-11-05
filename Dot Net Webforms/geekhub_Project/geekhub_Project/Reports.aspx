<%@ Page Title="Reports" Language="C#" MasterPageFile="~/Header_Footer.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="geekhub_Project.Reports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link href="css/Reports.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="card">
            <h2>Users by Provinces</h2>
            <canvas id="usersByProvincesChart" width="400" height="200"></canvas>
        </div>

        <div class="card">
            <h2>Number of Comments per Discussion</h2>
            <canvas id="commentsPerDiscussionChart" width="400" height="200"></canvas>
        </div>

        <div class="card">
            <h2>Recent Feedback</h2>
            <div class="gridview-container">
                <asp:GridView ID="FeedbackGridView" runat="server" AutoGenerateColumns="True"></asp:GridView>
            </div>
        </div>

        <div class="card">
            <h2>Recent Comments</h2>
            <div class="gridview-container">
                <asp:GridView ID="CommentsGridView" runat="server" AutoGenerateColumns="True"></asp:GridView>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        // Users by Provinces Chart
        var usersByProvincesData = <%= usersByProvincesJson %>;
        var commentsPerDiscussionData = <%= commentsPerDiscussionJson %>;

        var ctx1 = document.getElementById('usersByProvincesChart').getContext('2d');
        new Chart(ctx1, {
            type: 'bar',
            data: {
                labels: usersByProvincesData.map(item => item.provinces),
                datasets: [{
                    label: 'Number of Users',
                    data: usersByProvincesData.map(item => item.UserCount),
                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });

        var ctx2 = document.getElementById('commentsPerDiscussionChart').getContext('2d');
        new Chart(ctx2, {
            type: 'pie',
            data: {
                labels: commentsPerDiscussionData.map(item => item.Title),
                datasets: [{
                    label: 'Number of Comments',
                    data: commentsPerDiscussionData.map(item => item.CommentCount),
                    backgroundColor: 'rgba(153, 102, 255, 0.2)',
                    borderColor: 'rgba(153, 102, 255, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true
            }
        });
    </script>
</asp:Content>
