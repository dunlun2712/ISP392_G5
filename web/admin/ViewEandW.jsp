<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Admin Dashboard</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                display: flex;
                min-height: 100vh;
                font-family: 'Arial', sans-serif;
                background-color: #f4f6f9;
            }
            .sidebar {
                min-width: 250px;
                max-width: 250px;
                background-color: #343a40;
                padding-top: 20px;
                color: white;
            }
            .sidebar a {
                text-decoration: none;
                color: #adb5bd;
                padding: 10px;
                display: block;
            }
            .sidebar a:hover {
                background-color: #007bff;
                color: white;
            }
            .content {
                flex: 1;
                padding: 20px;
            }
            .header {
                background-color: #343a40;
                color: white;
                padding: 10px 20px;
                text-align: center;
                font-size: 1.5em;
                font-weight: bold;
            }



            .container {
                width: 80%;
                margin: 0 auto;
                padding: 20px;
                background-color: #fff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            h1 {
                text-align: center;
                color: #0056b3;
            }

            .input-group {
                display: flex;
                justify-content: center;
                margin-bottom: 20px;
            }

            .input-group select {
                padding: 5px;
                margin-right: 10px;
            }

            .input-group .btn {
                padding: 5px 10px;
                background-color: #ff8000;
                color: #fff;
                border: none;
                cursor: pointer;
            }

            .input-group .btn:hover {
                background-color: #e67300;
            }

            .report-date {
                text-align: center;
                color: red;
                font-size: 0.9em;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }

            th,
            td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: center;
            }

            th {
                background-color: #f2f2f2;
            }

            .total-row {
                font-weight: bold;
            }

            a {
                color: #0056b3;
                text-decoration: none;
            }

            a:hover {
                text-decoration: underline;
            }

            .back-to-list {
                display: block;
                text-align: center;
                margin-top: 20px;
                color: red;
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <div class="sidebar">
            <h4 class="text-center">Admin Menu</h4>
            <a href="${pageContext.request.contextPath}/admin?type=viewstudent">View Student</a>
            <a href="${pageContext.request.contextPath}/admin?type=viewmanager">View Manager</a>
            <a href="${pageContext.request.contextPath}/adminbillhistory">View Bill Students</a>
            <a href="${pageContext.request.contextPath}/eandw">View Bill Water and Electric</a>
            <a href="${pageContext.request.contextPath}/viewDorm">View Dorm</a>
            <a href="${pageContext.request.contextPath}/changePassword">Change Password</a>
            <a href="${pageContext.request.contextPath}/logout">Logout</a>
        </div>
        <div class="container">
            <h1>View EandW Bill</h1>
            <form action="eandw" method ="post" class="narrow-w form-search d-flex align-items-stretch mb-3" data-aos="fade-up"
                  data-aos-delay="200">
                <input value="${txtS}" name="txt" type="text" class="form-control px-4" placeholder="A104 ,....">
                <button type="submit" class="btn btn-primary">Search</button>
            </form>

            <p>Bill Nước</p>

            <table>
                <thead>
                    <tr>
                        <th>STT</th>
                        <th>Phòng</th>
                        <th>Số nước</th>
                        <th>Ngày bắt đầu tính</th>
                        <th>Ngày ra</th>
                        <th>Tháng</th>
                        <th>Số cũ </th>
                        <th>Số mới</th>
                        <th>Giá tiền</th>




                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listW}" var="w">
                        <tr>
                            <td>${w.water_id}</td>
                            <td>${w.room_id}</td>
                            <td>${w.usage_type}</td>
                            <td>${w.creation_date}</td>
                            <td>${w.expiration_date}</td>
                            <td>${w.semester}</td>
                            <td>${w.new_reading}</td>
                            <td>${w.old_reading}</td>
                            <td>${w.getPrice()} VND</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <br><!-- comment --> 
            <p>Bill Điện</p>
            <table>
                <thead>
                    <tr>
                        <th>STT</th>
                        <th>Phòng</th>
                        <th>Số điện</th>
                        <th>Ngày bắt đầu tính</th>
                        <th>Ngày ra</th>
                        <th>Tháng</th>
                        <th>Số cũ </th>
                        <th>Số mới</th>
                        <th>Giá tiền</th>



                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listE}" var="d">
                        <tr>
                            <td>${d.electricity_id}</td>
                            <td>${d.room_id}</td>
                            <td>${d.usage_type}</td>
                            <td>${d.creation_date}</td>
                            <td>${d.expiration_date}</td>
                            <td>${d.semester}</td>
                            <td>${d.old_number}</td>
                            <td>${d.new_number}</td>
                            <td>${d.getPrice()} VND</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <a href="home" class="back-to-list">Back to list</a>
        </div>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
