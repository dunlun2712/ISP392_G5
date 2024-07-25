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
            <div class="container">
                <div class="row">

                    <div class="col-12">
                        <div class="my-5">
                            <h3>Change Password</h3>
                            <hr>
                        </div>
                        <form id="changePassForm" action="${pageContext.request.contextPath}/passacc" method="post">
                            <input type="hidden" name="pass" value="${sessionScope.acc.pass}">
                            <div class="row mb-5 gx-5">
                                <div class="col-xxl-6">
                                    <div class="bg-secondary-soft px-4 py-5 rounded">
                                        <div class="row g-3">
                                            <div class="col-md-6">
                                                <label for="oldPassword" class="form-label">Old password *</label>
                                                <input type="password" class="form-control" id="oldPassword" name="oldPassword" value="${oldPassword}" required>
                                            </div>
                                            <c:if test="${message == 'Old password is correct' or message =='New passwords do not match' or message == 'Password is not accepted'}">
                                                <div class="col-md-7">
                                                    <label for="newPassword" class="form-label">New password *</label>
                                                    <input type="password" class="form-control" id="newPassword" name="newPassword" pattern="(?=.*[A-Z])(?=.*\W).{8,}" title="Mật khẩu phải chứa ít nhất 8 ký tự, bao gồm ít nhất 1 chữ hoa và 1 ký tự đặc biệt." required>
                                                    <div class="invalid-feedback">Mật khẩu phải chứa ít nhất 8 ký tự, bao gồm ít nhất 1 chữ hoa và 1 ký tự đặc biệt.</div>
                                                </div>
                                                <div class="col-md-7">
                                                    <label for="confirmPassword" class="form-label">Confirm Password *</label>
                                                    <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" pattern="(?=.*[A-Z])(?=.*\W).{8,}" title="Mật khẩu phải chứa ít nhất 8 ký tự, bao gồm ít nhất 1 chữ hoa và 1 ký tự đặc biệt." required>
                                                    <div class="invalid-feedback">Mật khẩu phải chứa ít nhất 8 ký tự, bao gồm ít nhất 1 chữ hoa và 1 ký tự đặc biệt.</div>
                                                </div>
                                            </c:if>

                                            <c:choose>
                                                <c:when test="${message == 'Password updated successfully'}">
                                                    <div class="col-12">
                                                        <div class="alert alert-success" role="alert">
                                                            Password updated successfully!
                                                        </div>
                                                    </div>
                                                </c:when>
                                                <c:when test="${message == 'Old password is incorrect' or message == 'New passwords do not match'  or message=='Password is not accepted'}">
                                                    <div class="col-12">
                                                        <div class="alert alert-danger" role="alert">
                                                            ${message}
                                                        </div>
                                                    </div>
                                                </c:when>
                                            </c:choose>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="gap-3 d-md-flex justify-content-md-end text-center">
                                <button type="submit" class="btn btn-danger btn-lg" style="font-weight: bold" name="update" value="pass_update">Confirm</button>
                            </div>
                        </form>
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
