<%@ Page Title="" Language="C#" MasterPageFile="~/Header_Footer.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="geekhub_Project.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body, html {
            height: 100%;
            margin: 0;
        }
        .background-image {
            background-image: url('imgs/Welcome.png');
            background-size: cover;
            background-position: center;
            height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }
        h1 {
         color: white;
         margin-bottom: 15px;
         text-shadow: 2px 2px 4px rgba(0,0,0,0.5);
         font-size: 4em; 
         font-family: 'Arial Black', 'Gadget', sans-serif; 
        }           
        .search-container {
            display: flex;
            max-width: 600px;
            width: 100%;
        }
        .search-input {
            flex-grow: 1;
            padding: 12px 15px;
            font-size: 18px;
            border: none;
            border-radius: 30px 0 0 30px;
            outline: none;
        }
        .search-button {
            background-color: #27ae60;
            color: white;
            border: none;
            padding: 12px 20px;
            font-size: 20px;
            cursor: pointer;
            border-radius: 0 30px 30px 0;
        }
        .search-button:hover {
            background-color: #2ecc71;
        }
        /Features/
        .feature-heading {
        color: #2c3e50;
        font-size: 2.5em;
        font-weight: bold;
        margin-bottom: 30px;
        text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.3);
        }

         .feature-card {
        transition: transform 0.3s, box-shadow 0.3s;
         }

    .feature-card:hover {
        transform: scale(1.05);
        box-shadow: 0 10px 20px rgba(0,0,0,0.2);
    }

    .feature-icon {
        color: green;
        font-size: 2rem;
    }

    .feature-text {
        color: black;
    }
    .card {
      background-color: #9FCD9F;
      border: none;
      box-shadow: 0 4px 8px rgba(0,0,0,0.1);
      height: 100%;
      }
    /*About US */
        .about-us {
            font-size: 2.5rem;
            font-weight: bold;
        }
        .learn-more-btn {
            background-color: #4CAF50;
            border: none;
            padding: 10px 20px;
            border-radius: 25px;
        }
        .content-image {
            max-width: 100%;
            height: auto;
        }
/*About US content*/
    .main-container {
    background-color:#091718;
    color: white;
    padding: 40px 0;
}

.content-image {
    max-width: 110%;
    border-radius: 5px;
}

.feature-heading {
    font-size: 4rem;
    margin-bottom: 20px;
}

h3, h4 {
    margin-bottom: 18px;
    font-size: 50px;
}

p {
    font-size: 1.3rem;
    line-height: 1.5;
    margin-bottom: 20px;
}

.learn-more-btn {
    padding: 8px 16px;
    font-size: 0.9rem;
}

@media (max-width: 767px) {
    .row.align-items-center {
        flex-direction: column-reverse;
    }
    .col-md-6 {
        margin-bottom: 20px;
    }
}
/Access our/
.access-card {
    transition: transform 0.3s, box-shadow 0.3s;
}
.access-card:hover {
    transform: scale(1.05);
    box-shadow: 0 10px 20px rgba(0,0,0,0.2);
}
.access-card .fas {
    color: green;
}
.access-card .btn {
    border-radius: 30px;
    transition: background-color 0.3s, width 0.3s;
    background-color: green;
}
.access-card .btn:hover {
    background-color: #4CAF50;
    width: 100%;
}

/* FAQ Section Styles */
.accordion-button {
    background-color:  #9FBD9F;
    color: black;
    border-radius: 30px;
    border: none;
    box-shadow: 0 4px 8px rgba(0,0,0,0.2);
    padding: 15px;
    font-size: 1.1rem;
}

.accordion-button:focus {
    box-shadow: 0 0 0 0.2rem rgba(0,123,255,0.25);
}

.accordion-button:not(.collapsed) {
    background-color: #27ae60;
    color: white;
    border-radius: 25px;
}

.accordion-body {
    background-color:  #4CAF50;
    border-radius: 0 0 25px 25px;
    padding: 15px;
    font-size: 1rem;
}

.accordion-item {
    border: none;
    margin-bottom: 10px;
}

.accordion-item:last-of-type {
    margin-bottom: 0;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div class="background-image">
            <h1>Welcome to Geekhub</h1>
            <div class="search-container">
                <asp:TextBox ID="txtSearch" runat="server" CssClass="search-input" placeholder="Search our tutorials"></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" CssClass="search-button" Text="Search"  />
            </div>
        </div>
    <%--    Our Features--%>
<div class="container my-5">
    <div class="row">
        <div class="col-12 text-center mb-4">
            <h2 class="feature-heading">Our Features</h2>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 col-sm-6 mb-4">
            <div class="card feature-card h-100">
                <div class="card-body">
                    <i class="fas fa-book-open feature-icon mb-3"></i>
                    <p class="feature-text">Make learning easy with eLearning and simplified coding through the best tutorials.</p>
                </div>
            </div>
        </div>
        <div class="col-md-4 col-sm-6 mb-4">
            <div class="card feature-card h-100">
                <div class="card-body">
                    <i class="fas fa-laptop-code feature-icon mb-3"></i>
                    <p class="feature-text">Master coding effortlessly.</p>
                </div>
            </div>
        </div>
        <div class="col-md-4 col-sm-6 mb-4">
            <div class="card feature-card h-100">
                <div class="card-body">
                    <i class="fas fa-flask feature-icon mb-3"></i>
                    <p class="feature-text">Access tutorials, discussions, and virtual labs.</p>
                </div>
            </div>
        </div>
        <div class="col-md-4 col-sm-6 mb-4">
            <div class="card feature-card h-100">
                <div class="card-body">
                    <i class="fas fa-database feature-icon mb-3"></i>
                    <p class="feature-text">Explore our wide range of databases across various subjects.</p>
                </div>
            </div>
        </div>
        <div class="col-md-4 col-sm-6 mb-4">
            <div class="card feature-card h-100">
                <div class="card-body">
                    <i class="fas fa-user-friends feature-icon mb-3"></i>
                    <p class="feature-text">A user-friendly interface with easy and fully functional navigation.</p>
                </div>
            </div>
        </div>
        <div class="col-md-4 col-sm-6 mb-4">
            <div class="card feature-card h-100">
                <div class="card-body">
                    <i class="fas fa-expand-arrows-alt feature-icon mb-3"></i>
                    <p class="feature-text">Benefit from a dynamic and scalable system that helps you land a job as a programmer.</p>
                </div>
            </div>
        </div>
    </div>
</div>
       <%-- about us--%>
     <div class="main-container">
    <div class="container">
        <h2 class="feature-heading text-center text-white mb-4">About Us</h2>
        <div class="row align-items-center">
            <div class="col-md-6">
                <h3>Unlock your potential</h3>
                <h4>with GeekHub</h4>
                <p>
                    Your premier eLearning platform founded in 2024. Embrace our motto, "Coding the World," as you explore top-notch tutorials and innovative virtual labs. Stay ahead in the tech world and empower your learning journey with hands-on experience. Join GeekHub today and transform your tech skills for the future!
                </p>
                <a href="About.aspx" class="btn btn-success learn-more-btn">LEARN MORE</a>
            </div>
            <div class="col-md-6 text-center">
              <img src="imgs/AboutUs.gif" alt="About Us" class="content-image img-fluid"  />
            </div>
        </div>
    </div>
</div>
       <%-- div for content, virtual lab and feedback--%>

        <div class="container my-5">
    <div class="row">
         <div class="col-12 text-center mb-4">
     <h2 class="feature-heading">Access Our</h2>
 </div>
        <div class="col-md-4 mb-4">
            <div class="card access-card h-100">
                <div class="card-body d-flex flex-column">
                    <i class="fas fa-book fa-3x mb-3"></i>
                    <h5 class="card-title">Courses</h5>
                    <p class="card-text flex-grow-1">Explore our wide range of programming courses designed to enhance your skills and boost your career.</p>
<asp:Button ID="Button1" runat="server" CssClass="btn btn-success mt-auto" Text="Enroll Now" OnClick="GoToCourses_Click" />
                    <%--<button class="btn btn-success mt-auto">Enroll Now</button>--%>
                </div>
            </div>
        </div>
        <div class="col-md-4 mb-4">
            <div class="card access-card h-100">
                <div class="card-body d-flex flex-column">
                    <i class="fas fa-flask fa-3x mb-3"></i>
                    <h5 class="card-title">Virtual Lab</h5>
                    <p class="card-text flex-grow-1">Experience hands-on learning with our state-of-the-art virtual labs, designed to simulate real-world coding environments.</p>
                    <asp:Button ID="Button2" runat="server" CssClass="btn btn-success mt-auto" Text="Enroll Now" OnClick="GoToLabs_Click" />

                </div>
            </div>
        </div>
        <div class="col-md-4 mb-4">
            <div class="card access-card h-100">
                <div class="card-body d-flex flex-column">
                    <i class="fas fa-comments fa-3x mb-3"></i>
                    <h5 class="card-title">Feedback</h5>
                    <p class="card-text flex-grow-1">We value your opinion. Share your thoughts and help us improve our platform to serve you better.</p>
<asp:Button class="btn btn-success mt-auto" ID="Button3" runat="server" Text="Give Feedback" OnClick="Button3_Click" />
                    
                </div>
            </div>
        </div>
    </div>
</div>
        <!-- FAQs section -->
<div class="container my-5">
    <h2 class="text-center mb-4 feature-heading">Frequently Asked Questions</h2>
    <div class="accordion" id="faqAccordion">
        <div class="accordion-item">
            <h2 class="accordion-header" id="headingOne">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                    What is GeekHub?
                </button>
            </h2>
            <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#faqAccordion">
                <div class="accordion-body">
                    GeekHub is an eLearning platform founded in 2024 offering tutorials and virtual labs for tech enthusiasts.
                </div>
            </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header" id="headingTwo">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                    How do I access the tutorials?
                </button>
            </h2>
            <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#faqAccordion">
                <div class="accordion-body">
                    Simply sign up, log in, and browse our extensive library of coding tutorials through your dashboard.
                </div>
            </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header" id="headingThree">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                    What is a virtual lab?
                </button>
            </h2>
            <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#faqAccordion">
                <div class="accordion-body">
                    Our virtual lab provides interactive, hands-on coding experiences simulating real-world programming environments.
                </div>
            </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header" id="headingFour">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                    How can I get support if I need help?
                </button>
            </h2>
            <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#faqAccordion">
                <div class="accordion-body">
                    Contact our support team via email or use the help section on our website for assistance.
                </div>
            </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header" id="headingFive">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                    Are there any prerequisites for using GeekHub?
                </button>
            </h2>
            <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive" data-bs-parent="#faqAccordion">
                <div class="accordion-body">
                    No prerequisites are needed; our tutorials cater to all skill levels from beginners to advanced learners.
                </div>
            </div>
        </div>
    </div>
</div>



</asp:Content>
 