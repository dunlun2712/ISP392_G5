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

                align-items: center;
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
            .search-table {
 
    border-collapse: collapse;
    margin: 20px 0;
    font-size: 16px;
    text-align: left;
}

.search-table td {
    padding: 8px;
    border: 1px solid #ddd;
}

.search-select {

    padding: 8px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 4px;
    background-color: #f8f8f8;
}

.search-select:focus {
    border-color: #4CAF50;
    background-color: #e6f9e6;
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


            <div class="header">Update waters numbers</div>
            <br>
            <div style="color: red">${mess}</div>

            <div class="buttons">
                <button class="import-btn" onclick="location.href = 'admin/readEx.jsp'">Import Data</button>
            </div>
            <br>
          
            <form class="filter" action="searchWater">
                <table class="search-table">
                 
                    <tr>
                        <td > <select name="room_id">
                    <option value="">Select Room ID</option>
                    <c:forEach var="room" items="${rooms}">
                        <option value="${room}">${room}</option>
                    </c:forEach>
                </select></td>
                       <td><select name="semester">
                    <option value="">Select Month</option>
                    <c:forEach var="sem" items="${semesters}">
                        <option value="${sem}">${sem}</option>
                    </c:forEach>
                </select></td>
                       <td >
                <select name="meter_number">
                    <option value="">Select Meter Number</option>
                    <c:forEach var="meter" items="${meters}">
                        <option value="${meter}">${meter}</option>
                    </c:forEach>
                </select></td>
                    </tr>
                    
                </table>
               

                
              
                <button type="submit" name="action" value="dorm" class="button">Search</button>
            </form>
            <br>
            <table>
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Room</th>
                      
                        <th>Creation Date</th>
                        <th>Water Meter Reading Date</th>
                        <th>Month</th>
                        <th>Meter Number</th>
                        <th>Old number</th>
                        <th>New number</th>
                        <th>Consumption</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="data" items="${data1}">
                        <tr>
                            <td>${data.getWater_id()}</td>
                            <td>${data.getRoom_id()}</td>
                           
                            <td>${data.getCreation_date()}</td>
                            <td>${data.getExpiration_date()}</td>
                            <td>${data.getSemester()}</td>
                            <td>${data.getMeter_number()}</td>
                            <td>${data.getNew_reading()}</td>
                            <td>${data.getOld_reading()}</td>
                            <td>${data.getConsumption()}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
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
