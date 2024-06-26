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
            <a href="#home">Home</a>
            <a href="#process-requests">Xử lý Request</a>
            <a href="#update-phone">Cập nhật số điện thoại</a>
            <a href="#update-room-items">Cập nhật đồ dùng trong phòng</a>
            <a href="#manage-students">Quản lý sinh viên</a>
        </div>
        <div class="main-content">
        <div class="container mt-5" >
            <h1 style="color: black; font-size: 5rem">List request of student</h1>
            <br>
            <header class="header">
                <!-- Các phần khác của header -->

                <!-- Thêm phần tìm kiếm vào đây -->
                <div class="header__search" style="border-radius: 70px">
                    <form id="searchForm">
                        <div class="row">
                            <div class="col-lg-2 col-md-3 col-sm-6">
                                <div class="input__item">
                                    <input type="text" name="student_id" id="student_id" placeholder="Mã Sinh viên">
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-3 col-sm-6">
                                <div class="input__item" >
                                    <input type="text" name="room_id" id="room_id" placeholder="Mã Phòng">
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-3 col-sm-6" >
                                <div class="input__item" >
                                    <select name="request_status" id="requestStatus">
                                        <option value="">Chọn trạng thái</option>
                                        <option value="pending">Pending</option>
                                        <option value="processing">Processing</option>
                                        <option value="confirm">Confirm</option>
                                        <option value="reject">Reject</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-3 col-sm-6">
                                <div class="input__item">
                                    <select name="request_type" id="requestType" >
                                        <option value="">Chọn loại request</option>
                                        <option value="maintenance">Maintenance</option>
                                        <option value="room_change">Room Change</option>
                                        <option value="complaint">Complaint</option>
                                        <option value="other">Other</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-3 col-sm-6">
                                <button type="button" class="btn btn-primary" onclick="searchRequests()">Tìm Kiếm</button>
                            </div>
                            <form action="${pageContext.request.contextPath}/response" method="get">
                                <div class="col-lg-2 col-md-3 col-sm-6">
                                    <button type="submit" name="list" value="1" class="btn btn-primary" >Lấy danh sách</button>
                                </div>
                            </form>
                        </div>
                    </form>
                </div>
            </header>
            <br>
            <form action="${pageContext.request.contextPath}/response" method="post">
                <table id="example" class="table table-striped table-bordered">
                    <thead>
                        <tr style="background-color: #ffffff">

                            <th>Request ID</th>
                            <th>Student ID</th>
                            <th>Room ID</th>
                            <th>Create Date</th>
                            <th>Request</th>
                            <th>Response</th>
                            <th>Status</th>
                            <th>Request Type</th>
                            <th>Function</th>
                        </tr>
                        <c:forEach var="req" items="${req_data}">
                            <tr style="background-color: #ffffff">

                                <td>${req.request_id}</td>
                                <td>${req.users_id}</td>
                                <td>${req.room_id}</td>
                                <td>${req.request_date}</td>
                                <td>${req.request}</td>
                                <c:if test="${req.response == null}">
                                    <td><a style="color: red">not reply yet</a></td>
                                </c:if>
                                <c:if test="${req.response != null}">
                                    <td>${req.response}</td>
                                </c:if>
                                <td>${req.request_status}</td>
                                <td>${req.request_type}</td>
                                <td>
                                    <!-- Detail -->
                                    <a href="javascript:void(0);" onclick="submitForm('${req.request_id}', 'detail')" class="btn btn-danger btn-lg" style="font-weight: bold; background-color: #E9AD28">Detail</a>

                                    <!-- Delete -->
    <!--                                                            <a href="javascript:void(0);" onclick="submitForm('${req.request_id}', 'reply')" class="btn btn-danger btn-lg" style="font-weight: bold; background-color: #E9AD28">Delete</a>-->
                                </td>

                            </tr>

                        <script>
                            function submitForm(req_id, action) {
                                var form = document.createElement("form");
                                form.setAttribute("method", "post");
                                form.setAttribute("action", "${pageContext.request.contextPath}/response");

                                // Create hidden input for req_id
                                var req_idInput = document.createElement("input");
                                req_idInput.setAttribute("type", "hidden");
                                req_idInput.setAttribute("name", "req_id");
                                req_idInput.setAttribute("value", req_id);
                                form.appendChild(req_idInput);

                                // Create hidden input for action
                                var actionInput = document.createElement("input");
                                actionInput.setAttribute("type", "hidden");
                                actionInput.setAttribute("name", "other");
                                actionInput.setAttribute("value", action);
                                form.appendChild(actionInput);

                                // Append form to document body and submit
                                document.body.appendChild(form);
                                form.submit();
                            }
                        </script>
                    </c:forEach>
                    </thead>
                </table>
                <br>
                <button type="submit" class="btn btn-danger btn-lg" style="font-weight: bold; background-color: #E9AD28" name="other" value="back">Back</button>
                <!--                                            <button type="submit" class="btn btn-danger btn-lg" style="font-weight: bold; background-color: #E9AD28" name="other" value="save">Save</button>-->
            </form>
        </div>
        </div>
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/main.js"></script>
        <script>
                            function submitForm(req_id, action) {
                                var form = document.createElement("form");
                                form.setAttribute("method", "post");
                                form.setAttribute("action", "${pageContext.request.contextPath}/response");

                                // Create hidden input for req_id
                                var req_idInput = document.createElement("input");
                                req_idInput.setAttribute("type", "hidden");
                                req_idInput.setAttribute("name", "req_id");
                                req_idInput.setAttribute("value", req_id);
                                form.appendChild(req_idInput);

                                // Create hidden input for action
                                var actionInput = document.createElement("input");
                                actionInput.setAttribute("type", "hidden");
                                actionInput.setAttribute("name", "other");
                                actionInput.setAttribute("value", action);
                                form.appendChild(actionInput);

                                // Append form to document body and submit
                                document.body.appendChild(form);
                                form.submit();
                            }
        </script>
        <script>
            function searchRequests() {
                // Lấy giá trị từ form tìm kiếm
                var studentId = document.getElementById('student_id').value.trim().toLowerCase();
                var roomId = document.getElementById('room_id').value.trim().toLowerCase();
                var requestStatus = document.getElementById('requestStatus').value.trim().toLowerCase();
                var requestType = document.getElementById('requestType').value.trim().toLowerCase();

                // Kiểm tra xem các trường tìm kiếm có trống không
                if (studentId === '' && roomId === '' && requestStatus === '' && requestType === '') {
                    // Nếu không có giá trị tìm kiếm nào được nhập, ẩn bảng danh sách
                    var table = document.querySelector('table');
                    table.style.display = 'none';
                    return; // Dừng hàm searchRequests ở đây nếu không có tiêu chí tìm kiếm
                }

                // Nếu có ít nhất một tiêu chí tìm kiếm, hiển thị bảng danh sách và tiếp tục xử lý tìm kiếm
                var table = document.querySelector('table');
                table.style.display = ''; // Hiển thị bảng

                // Lặp qua từng hàng của bảng để ẩn hoặc hiển thị dựa trên tiêu chí tìm kiếm
                var tableRows = table.querySelectorAll('tr');
                for (var i = 1; i < tableRows.length; i++) { // Bắt đầu từ 1 để bỏ qua hàng tiêu đề
                    var row = tableRows[i];
                    var rowData = row.getElementsByTagName('td');
                    var display = true;

                    // Kiểm tra từng cột dữ liệu
                    if (studentId && rowData[1]) {
                        if (rowData[1].textContent.trim().toLowerCase().indexOf(studentId) === -1) {
                            display = false;
                        }
                    }
                    if (roomId && rowData[2]) {
                        if (rowData[2].textContent.trim().toLowerCase().indexOf(roomId) === -1) {
                            display = false;
                        }
                    }
                    if (requestStatus && rowData[6]) {
                        if (rowData[6].textContent.trim().toLowerCase() !== requestStatus) {
                            display = false;
                        }
                    }
                    if (requestType && rowData[7]) {
                        if (rowData[7].textContent.trim().toLowerCase() !== requestType) {
                            display = false;
                        }
                    }

                    // Ẩn hoặc hiển thị hàng tùy thuộc vào kết quả của tiêu chí tìm kiếm
                    if (display) {
                        row.style.display = '';
                    } else {
                        row.style.display = 'none';
                    }
                }
            }
        </script>



    </body>

</html>
