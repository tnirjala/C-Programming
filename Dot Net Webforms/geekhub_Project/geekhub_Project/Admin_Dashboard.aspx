<%@ Page Title="" Language="C#" MasterPageFile="~/Header_Footer.Master" AutoEventWireup="true" CodeBehind="Admin_Dashboard.aspx.cs" Inherits="geekhub_Project.Admin_Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/admin.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<%--     <form id="form1" runat="server">--%>
     <div>
         <div class="container mt-5">
     <div class="row">
         <div class="col-md-4 mb-4">
            <a href="manageLectures.aspx" class="text-decoration-none">
             <div class="card card-custom">
                 <div class="card-body">
                     <div class="card-icon">
                         <i class="fas fa-chalkboard-teacher"></i>
                     </div>
                     <h5 class="card-title">Manage Lectures/Tutorials</h5>
                 </div>
             </div>
           </a>
         </div>

         <div class="col-md-4 mb-4">
          <a href="manageVirtual.aspx" class="text-decoration-none">
             <div class="card card-custom">
                 <div class="card-body">
                     <div class="card-icon">
                         <i class="fas fa-laptop"></i>
                     </div>
                     <h5 class="card-title">Manage Virtual Lab</h5>
                 </div>
             </div>
            </a>
         </div>

         <div class="col-md-4 mb-4">
            <a href="adminviewAssessment.aspx" class="text-decoration-none">
             <div class="card card-custom">
                 <div class="card-body">
                     <div class="card-icon">
                         <i class="fas fa-file-alt"></i>
                     </div>
                     <h5 class="card-title">View & Check Assessment</h5>
                 </div>
             </div>
             </a>
         </div>

         <div class="col-md-4 mb-4">
                         <a href="adminusermanagement.aspx" class="text-decoration-none">
             <div class="card card-custom">
                 <div class="card-body">
                     <div class="card-icon">
                         <i class="fas fa-users"></i>
                     </div>
                     <h5 class="card-title">Manage User</h5>
                 </div>
             </div>
                          </a>
         </div>

         <div class="col-md-4 mb-4">
             <a href="viewfeedbackadmin.aspx" class="text-decoration-none">
             <div class="card card-custom">
                 <div class="card-body">
                     <div class="card-icon">
                         <i class="fas fa-comment-dots"></i>
                     </div>
                     <h5 class="card-title">View Feedback</h5>
                 </div>
             </div>
                 </a>
         </div>

         <div class="col-md-4 mb-4">
             <a href="Reports.aspx" class="text-decoration-none">
             <div class="card card-custom">
                 <div class="card-body">
                     <div class="card-icon">
                         <i class="fas fa-chart-line"></i>
                     </div>
                     <h5 class="card-title">Report Generation</h5>
                 </div>
             </div>
                 </a>
         </div>

     </div>
 </div>
     </div>
<%-- </form>--%>
</asp:Content>
