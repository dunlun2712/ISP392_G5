<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Hiroto Template">
        <meta name="keywords" content="Hiroto, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">


        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <title>Functions Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
                display: flex;
                min-height: 100vh;
            }
            .header {
                background-color: #333;
                color: white;
                padding: 10px 20px;
                display: flex;
                justify-content: flex-end;
                align-items: center;
                width: 100%;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            }
            .logout-button {
                background-color: #ff4b5c;
                border: none;
                color: white;
                padding: 10px 20px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 14px;
                cursor: pointer;
                border-radius: 5px;
                transition: background-color 0.3s;
            }
            .logout-button:hover {
                background-color: #ff1f3a;
            }
            .sidebar {
                width: 250px;
                background-color: #333;
                color: white;
                padding: 20px;
                box-shadow: 2px 0 4px rgba(0,0,0,0.1);
                display: flex;
                flex-direction: column;
            }
            .sidebar h3 {
                margin-top: 0;
                font-size: 1.5em;
                margin-bottom: 20px;
            }
            .sidebar a {
                color: white;
                text-decoration: none;
                display: block;
                padding: 10px;
                border-bottom: 1px solid #444;
                margin-bottom: 10px;
                transition: background-color 0.3s;
            }
            .sidebar a:hover {
                background-color: #444;
            }
            .sidebar .logout-button {
                margin-top: auto;
                background-color: #ff4b5c;
                border: none;
                padding: 10px;
                font-size: 14px;
                width: 100%;
                text-align: center;
            }
            .content {
                flex: 1;
                padding: 20px;
                overflow: auto;
            }
            .container {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
                gap: 20px;
            }
            .box {
                background-color: white;
                border: 1px solid #ddd;
                border-radius: 5px;
                padding: 20px;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
                text-align: center;
                transition: transform 0.3s, background-color 0.3s;
                text-decoration: none;
                color: inherit;
                cursor: pointer;
                border: none;
            }
            .box:hover {
                transform: translateY(-5px);
                box-shadow: 0 4px 8px rgba(0,0,0,0.2);
                background-color: #f0f0f0;
            }
            .box:nth-child(1) {
                background-color: #ffcccc;
            }
            .box:nth-child(2) {
                background-color: #ccffcc;
            }
            .box:nth-child(3) {
                background-color: #ccccff;
            }
            .box:nth-child(4) {
                background-color: #ffe6cc;
            }
            .box h2 {
                font-size: 1.5em;
                margin-bottom: 10px;
            }
            .box p {
                font-size: 1em;
                color: #666;
            }
            @media (max-width: 768px) {
                .sidebar {
                    width: 100%;
                    box-shadow: none;
                }
                .content {
                    padding: 10px;
                }
            }
            @media (max-width: 480px) {
                .container {
                    grid-template-columns: 1fr;
                }
            }
            .content {
                flex: 1;
                padding: 20px;
                overflow: auto;
                background-color: #fff; /* Thay đổi màu nền để nội dung nổi bật hơn */
                border-radius: 8px; /* Bo tròn các góc */
                box-shadow: 0 2px 4px rgba(0,0,0,0.1); /* Thêm bóng cho nội dung */
            }

            .container {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); /* Thay đổi kích thước của các cột */
                gap: 20px;
                padding: 20px; /* Thêm padding cho phần nội dung */
            }

            .hero {
                position: relative;
                height: 300px; /* Đặt chiều cao cho phần hero */
                background-color: #333; /* Thay đổi màu nền để nổi bật */
                color: white;
                text-align: center;
                padding: 50px 20px;
                border-radius: 8px; /* Bo tròn các góc */
            }

            .hero__text h5 {
                font-size: 1.5em;
                margin-bottom: 10px;
            }

            .home-about {
                padding: 40px 0; /* Thêm padding trên và dưới cho phần về chúng tôi */
            }

            .section-title h5 {
                font-size: 1.2em;
                margin-bottom: 10px;
                color: #333; /* Thay đổi màu chữ tiêu đề */
            }

            .section-title h2 {
                font-size: 2em;
                color: #555; /* Thay đổi màu chữ tiêu đề */
            }

            .home__about__text {
                padding: 20px;
                background-color: #f9f9f9; /* Thay đổi màu nền cho phần về chúng tôi */
                border-radius: 8px; /* Bo tròn các góc */
            }

            .home__about__pic img {
                width: 100%;
                border-radius: 8px; /* Bo tròn các góc của hình ảnh */
            }
        </style>
        <script>
            function logout() {
                document.getElementById('logoutForm').submit();
            }
        </script>
    </head>
    <body>

        <form id="logoutForm" action="${pageContext.request.contextPath}/logout" method="get" style="display: none;">
            <input type="hidden" name="logout" value="true">
        </form>

        <div class="sidebar">
            <h3 style="color: white">Menu</h3>
            <a href="${pageContext.request.contextPath}/dormmanager?function=dorm">Dorm Management</a>
            <a href="${pageContext.request.contextPath}/dormmanager?function=item">Items Management</a>
            <a href="${pageContext.request.contextPath}/dormmanager?function=request">Request List</a>
            <a href="${pageContext.request.contextPath}/dormmanager?function=elec">Electric Management</a>
            <a href="${pageContext.request.contextPath}/dormmanager?function=water">Water Management</a>
            <a href="${pageContext.request.contextPath}/dormmanager?function=pass">Change Password</a>
            <button class="logout-button" onclick="logout()">Logout</button>
        </div>

        <div class="content">
            <div class="container">
                <div class="row">

                    <div class="col-12">
                        <div class="my-5">
                            <h3>Change Password</h3>
                            <hr>
                        </div>
                        <form id="changePassForm" action="${pageContext.request.contextPath}/accpass" method="post">
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
    </body>
</html>
