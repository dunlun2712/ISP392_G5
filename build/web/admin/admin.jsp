<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Student Requests</title>
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">

        <style>
            table {
                width: 100%;
                border-collapse: separate;
                border-spacing: 0;
                border-radius: 12px;

                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            table, th, td {
                border: 1px solid black;
            }
            th, td {
                padding: 8px;
                text-align: left;
            }
            th {
                background-color: #f0a500;
            }
            th:first-child {
                border-top-left-radius: 12px;
            }
            th:last-child {
                border-top-right-radius: 12px;
            }
            tr:last-child td:first-child {
                border-bottom-left-radius: 12px;
            }
            tr:last-child td:last-child {
                border-bottom-right-radius: 12px;
            }
            .not-reply-yet {
                color: red;
            }
            .action-link {
                font-weight: bold;
                text-decoration: none;
                color: #000;
            }
            .action-link:hover,
            .action-link:active,
            .action-link:visited {
                color: #000;
            }
            .header__search {
                padding: 20px 0;
                background-color: #f9f9f9;
                border-bottom: 1px solid #ddd;
            }

            .header__search form {
                margin: 0 auto;
                max-width: 1050px;
            }

            .header__search .input__item {
                margin-bottom: 10px;
            }

            .header__search input[type="text"],
            .header__search select {
                width: 100%;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 5px;
                box-sizing: border-box;
                font-size: 14px;
            }

            .header__search .btn-primary {
                background-color: #E9AD28;
                color: #fff;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            .header__search .btn-primary:hover {
                background-color: #c88e1a;
            }

            @media (max-width: 768px) {
                .header__search form .col-lg-2,
                .header__search form .col-lg-3 {
                    width: 100%;
                    margin-bottom: 10px;
                }
            }
            .sidebar {
                height: 100%;
                width: 250px;
                position: fixed;
                top: 0;
                left: 0;
                background-color: #111;
                padding-top: 20px;
            }
            .sidebar a {
                padding: 10px 15px;
                text-decoration: none;
                font-size: 18px;
                color: white;
                display: block;
            }
            .sidebar a:hover {
                background-color: #575757;
            }
            .main-content {
                margin-left: 260px; /* Adjust this value to match the sidebar width */
                padding: 20px;
            }

        </style>
    </head>
    <body>
        <div class="sidebar">
            <h4 class="text-center" style="color: white; background-color: #E9AD28; height: 50px;font-size: 40px">Admin Menu</h4>
            <a href="${pageContext.request.contextPath}/admin?type=viewstudent">View Student</a>
            <a href="${pageContext.request.contextPath}/admin?type=viewmanager">View Manager</a>
            <a href="${pageContext.request.contextPath}/managementdorm">View Dorm</a>
            <a href="${pageContext.request.contextPath}/response">Request List</a>
            <a href="${pageContext.request.contextPath}/listItems">Item List</a>
            <a href="${pageContext.request.contextPath}/listnew">News</a>
            <a href="${pageContext.request.contextPath}/viewTicket">Parking ticket</a>
            <a href="${pageContext.request.contextPath}/dienServlet">Electric usage</a>
            <a href="${pageContext.request.contextPath}/nuocSv">Water usage</a>
            <a href="${pageContext.request.contextPath}/invoice">Create Invoice</a>
            <a href="${pageContext.request.contextPath}/adminbillhistory">History booking</a>
            <a href="${pageContext.request.contextPath}/sendServlet">Send Email</a>
            <a href="${pageContext.request.contextPath}/passacc">Reset Password</a>
            <a href="${pageContext.request.contextPath}/logout">Logout</a>
        </div>
        <div class="main-content">
            <c:if test="${empty param.type}">
                <div class="container">
                    <div class="content">
                        <h2>Welcome to the Admin Page</h2>
                        <p>Select a function from the menu above.</p>
                    </div>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <!-- Home About Section Begin -->
                    <section class="home-about">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="home__about__text">
                                        <div class="section-title">
                                            
                                            <h2>Welcome to the University's dormitory....</h2>
                                        </div>
                                        <p class="first-para">Dormitories are common living spaces designed for students and lecturers 
                                            located on school grounds. It provides convenient and low-cost housing with basic amenities such as bedrooms, bathrooms and common rooms. </p>
                                        <p class="last-para">Dormitories often have strict rules to ensure order, cleanliness, and security for residents. Living in a dormitory 
                                            provides opportunities to socialize, make friends and develop general living skills.</p>

                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="home__about__pic">
                                        <img src="img/home-about/home-about.png" alt="">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- Home About Section End -->
                </div>
            </c:if>
            <c:if test="${not empty param.type and param.type == 'viewstudent'}">
                <div class="container mt-5">
                    <!-- Form search --><div class="buttons">
                        <button class="import-btn" style="background-color: grey" onclick="location.href = 'admin/importStudent.jsp'"><a style="color: whitesmoke">Import Data</a></button>
                        ${check1}
                    </div>
                    <form method="get" action="${pageContext.request.contextPath}/admin">
                        <input type="hidden" name="type" value="viewstudent">

                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="searchInput" class="form-label">Search student by keyword</label>
                                <input type="text" class="form-control" id="searchInput" placeholder="Enter keyword" name="search" value="${searchQuery}">
                            </div>
                            <div class="col-md-3">
                                <label for="columnSelect" class="form-label">Search by column</label>
                                <select class="form-select" id="columnSelect" name="column">
                                    <option value="all">All</option>
                                    <option value="name">Name</option>
                                    <option value="id">ID</option>
                                    <option value="email">Email</option>
                                    <option value="dob">Date of Birth</option>
                                    <option value="cccd">CCCD</option>
                                    <option value="major">Major</option>
                                    <option value="course">Course</option>
                                    <option value="address">Address</option>
                                    <option value="gender">Gender</option>
                                    <option value="ethnicity">Ethnicity</option>
                                    <option value="nation">Nationality</option>
                                    <option value="phone_num">Phone Number</option>
                                    <option value="relative_name">Relative Name</option>
                                    <option value="relative_contact">Relative Contact</option>
                                    <option value="create_date">Create Date</option>
                                    <option value="update_date">Update Date</option>
                                    <option value="status">Status</option>
                                </select>
                            </div>
                       
                        </div>
                        <button class="btn btn-outline-secondary" type="submit">Search</button>
                    </form>
                </div>
                <c:if test="${not empty searchQuery}">
                    <!-- Table of students -->
                    <c:if test="${not empty data}">
                        <form method="post" action="${pageContext.request.contextPath}/admin">
                            <table class="table table-bordered">
                                <!-- Table header -->
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>Date of Birth</th>
                                        <th>CCCD</th>
                                        <th>Major</th>
                                        <th>Course</th>
                                        <th>Address</th>
                                        <th>Gender</th>
                                        <th>Ethnicity</th>
                                        <th>Nationality</th>
                                        <th>Phone Number</th>
                                        <th>Relative Name</th>
                                        <th>Relative Contact</th>
                                        <th>Create Date</th>
                                        <th>Update Date</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <!-- Table body -->
                                <tbody>
                                    <c:forEach var="student" items="${data}">
                                        <tr>
                                            <td>${student.id}</td>
                                            <td>${student.name}</td>
                                            <td>${student.email}</td>
                                            <td>${student.dob}</td>
                                            <td>${student.cccd}</td>
                                            <td>${student.major}</td>
                                            <td>${student.course}</td>
                                            <td>${student.address}</td>
                                            <td>${student.gender}</td>
                                            <td>${student.ethnicity}</td>
                                            <td>${student.nation}</td>
                                            <td>${student.phone_num}</td>
                                            <td>${student.relative_name}</td>
                                            <td>${student.relative_contact}</td>
                                            <td>${student.create_date}</td>
                                            <td>${student.update_date}</td>
                                            <td>
                                                <select class="form-select" name="status_${student.id}">
                                                    <option value="booking" ${student.status == 'booking' ? 'selected' : ''}>Booking</option>
                                                    <option value="not_book" ${student.status == 'not_book' ? 'selected' : ''}>Not Book</option>
                                                    <option value="staying" ${student.status == 'staying' ? 'selected' : ''}>Staying</option>
                                                </select>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <button type="submit" class="btn btn-primary" name="save" value="update_student">Save</button>
                        </form>
                    </c:if>
                    <!-- If no students found -->
                    <c:if test="${empty data}">
                        <p>No students found.</p>
                    </c:if>
                </c:if>
            </c:if>
        </div>
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/main.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>

</html>
