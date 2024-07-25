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
            <section class="rooms spad">
                <div class="container">
                    <h1>List Dorm</h1>


                    <table>
                        <thead>
                            <tr>
                                <th>DomName</th>
                                <th>DomID</th>
                                <th>Detail</th>
                                <!--<th>Update</th>-->
                               

                            </tr>
                        </thead>
                        <c:forEach items="${ListD}" var="d">
                            <tbody>
                                <tr>
                                    <td>${d.dorm_name}</td>
                                    <td>${d.dorm_id}</td>
                                    <td><a href="managementroom?pid=${d.dorm_id}">Detail</a></td>
                                    <!--<td><a href="updatedorm?pid=${d.dorm_id}" data-toggle="modal" data-target="#editDormModal">Update</a></td>-->

                                   
                                </tr>
                            </tbody>
                        </c:forEach>
                    </table>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addDormModal">
                        Add Dorm
                    </button>
                </div>
            </section>
            <!-- Rooms Section End -->


            <!--        <div class="modal fade" id="editDormModal" tabindex="-1" aria-labelledby="editDormModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="editDormModalLabel">Edit Dorm</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <form action="updatedorm" method="post">
                                        <div class="form-group">
                                            <label for="dormName">Dorm Name</label>
                                            <input value="${details.dorm_name}" type="text" class="form-control" id="dormName" name="dormName" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="dormId">Dorm ID</label>
                                            <input value="${details.dorm_id}" type="text" class="form-control" id="dormId" name="dormId" readonly required>
                                        </div>
                                         Thêm các trường cần thiết khác tại đây 
                                        <button type="submit" class="btn btn-primary">Change</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>-->
            <div class="modal fade" id="addDormModal" tabindex="-1" aria-labelledby="addDormModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="addDormModalLabel">Add Dorm</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="adddorm" method="get">
                                <div class="form-group">
                                    <label for="dormName">Dorm Name</label>
                                    <input type="text" class="form-control" id="dormName" name="dormName" required>
                                </div>
                                <div class="form-group">
                                    <label for="dormId">Dorm ID</label>
                                    <input type="text" class="form-control" id="dormId" name="dormId" required>
                                </div>
                                <!-- Thêm các trường cần thiết khác tại đây -->
                                <button type="submit" class="btn btn-primary">Add Dorm</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
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
