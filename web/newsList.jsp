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
                overflow: hidden;
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
            .form-container {
                background-color: #fff;
                padding: 30px;
                border-radius: 8px;
                margin-bottom: 30px;
            }


            .search-container {
                display: flex;
                justify-content: flex-end;
                margin-bottom: 20px;
            }

            .search-container input[type="text"],
            .search-container input[type="date"],
            .search-container select {
                padding: 10px;
                margin-right: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            .search-container input[type="submit"] {
                padding: 10px 20px;
                border: none;
                background-color: #007bff;
                color: #fff;
                border-radius: 4px;
                cursor: pointer;
            }

            .search-container input[type="submit"]:hover {
                background-color: #0056b3;
            }

            .title-column {
                width: 15%;
            }

            .content-column {
                width: 48%;
            }

            .link-column {
                width: 7%;
            }
        </style>
        <style>
            .scrollable-content {
                max-height: 100px;
                overflow-y: auto;
                display: block;
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

            <!-- Page Preloader -->
            <div id="preloder">
                <div class="loader"></div>
            </div>

            <br>
            <br>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">

                        <div class="form-container">
                            <h3>News List</h3>
                            <div class="search-container">
                                <form action="listnew" method="get">
                                    <input type="text" name="title" value="${param.title}" placeholder="Search by title">
                                    <select name="category">
                                        <option value="">Choose Category</option>
                                        <option value="Dorm">Dorm</option>
                                        <option value="Room">Room</option>
                                        <option value="Other">Other</option>
                                    </select>
                                    <input type="date" name="date" value="${param.date}">
                                    <input type="submit" name="search" style="background-color: #E9AD28" value="Search">
                                    <a href="${pageContext.request.contextPath}/addnew" > <input type="button" value="Add New" style="background-color: #E9AD28" ></a>
                                </form> 
                            </div>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th class="title-column">Title</th>
                                        <th>Content</th>
                                        <th>Publish Date</th>
                                        <th>Category</th>
                                        <th>Link</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="news" items="${newsList}">
                                        <tr>
                                            <td>${news.new_id}</td>
                                            <td class="title-column">${news.title}</td>
                                            <td class="content-column">
                                                <div class="scrollable-content" id="content${news.new_id}" style="display: none;">
                                                    ${news.content}
                                                </div>
                                                <button onclick="toggleContent(${news.new_id})">Show</button>
                                            </td>
                                            <td>${news.publish_date}</td>
                                            <td>${news.category}</td>
                                            <td class="link-column"><a href="${news.link}">Read more</a></td>
                                            <td><form action="listnew" method="post">
                                                    <input type="hidden" name="action" value="delete">
                                                    <input type="hidden" name="new_id" value="${news.new_id}">
                                                    <input type="submit" value="Delete" onclick="return confirm('Are you sure you want to delete this news?');">
                                                </form></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Hero Section End -->

            <!-- Js Plugins -->

        </div>
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/main.js"></script>
        <script>
                                                    function toggleContent(id) {
                                                        var content = document.getElementById('content' + id);
                                                        var button = content.nextElementSibling;
                                                        if (content.style.display === 'none') {
                                                            content.style.display = 'block';
                                                            button.textContent = 'Hide';
                                                        } else {
                                                            content.style.display = 'none';
                                                            button.textContent = 'Show';
                                                        }
                                                    }
        </script>
    </body>

</html>
