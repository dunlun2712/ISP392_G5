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
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            }

            .container {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
                gap: 20px;
                padding: 20px;
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

            .hero {
                position: relative;
                height: 300px;
                background-color: #333;
                color: white;
                text-align: center;
                padding: 50px 20px;
                border-radius: 8px;
            }

            .header__search {

                gap: 10px;
                align-items: center;
                margin-bottom: 20px;
            }

            .header__search .input__item {
                flex: 1;
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
            .search-table {
                width: 100%;
                border-collapse: collapse;
                margin: 20px 0;
                font-size: 16px;
                text-align: left;
            }

            .search-table td {
                padding: 4px;
                border: 1px solid #ddd;
            }

            .search-select {
                width: 100%;
                padding: 4px;
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

            function filterTable() {
                const txtS = document.getElementById('txtS').value.toLowerCase();
                const bookingDate = document.getElementById('bookingDate').value;
                const expiryDate = document.getElementById('expiryDate').value;
                const roomNumber = document.getElementById('roomNumber').value.toLowerCase();

                const table = document.getElementById('historyTable');
                const tr = table.getElementsByTagName('tr');

                for (let i = 1; i < tr.length; i++) {
                    let td = tr[i].getElementsByTagName('td');
                    let match = true;

                    if (txtS && !td[0].innerText.toLowerCase().includes(txtS) && !td[1].innerText.toLowerCase().includes(txtS)) {
                        match = false;
                    }
                    if (bookingDate && !td[7].innerText.includes(bookingDate)) {
                        match = false;
                    }
                    if (expiryDate && !td[8].innerText.includes(expiryDate)) {
                        match = false;
                    }
                    if (roomNumber && !td[6].innerText.toLowerCase().includes(roomNumber)) {
                        match = false;
                    }

                    tr[i].style.display = match ? '' : 'none';
                }
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
            <h1>View Student</h1>
            <form class="form-search" onsubmit="event.preventDefault(); filterTable();">
                <input id="txtS" type="text" class="form-control" placeholder="Search by ID or Name">
                <input id="bookingDate" type="date" class="form-control" placeholder="Booking Date">
                <input id="expiryDate" type="date" class="form-control" placeholder="Expiry Date">
                <input id="roomNumber" type="text" class="form-control" placeholder="Room Number">
                <button type="submit" class="btn btn-primary">Search</button>
            </form>



          <table id="historyTable">
        <thead>
            <tr>
                <th>Student ID</th>
                <th>Name</th>
                <th>CCCD</th>
                <th>DOB</th>
                <th>Phone number</th>
                <th>Gender</th>
                <th>Room ID</th>
                <th>Booking date</th>
                <th>Expiry Date</th>
                <th>Price</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${listcomment}" var="d">
                <tr>
                    <td>${d.users_id}</td>
                    <td>${d.users_name}</td>
                    <td>${d.cccd}</td>
                    <td>${d.dob}</td>
                    <td>${d.phone_number}</td>
                    <td>${d.gender}</td>
                    <td>${d.room_id}</td>
                    <td>${d.checkin_date}</td>
                    <td>${d.checkout_date}</td>
                    <td>${d.total_price}</td>
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
