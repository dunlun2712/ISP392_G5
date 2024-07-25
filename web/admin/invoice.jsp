<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Invoice Payment</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
                <h2>Invoice Payment</h2>
                <div class="btn-create">
                    <a href="${pageContext.request.contextPath}/addinvoice" class="btn btn-primary">Create New Invoice</a>
                </div>
                <form method="post" action="${pageContext.request.contextPath}/invoice" class="form-inline mb-3">
                    <div class="form-group mr-2">
                        <label for="user_id" class="mr-2">User ID:</label>
                        <input type="text" class="form-control" id="user_id" name="user_id">
                    </div>
                    <div class="form-group mr-2">
                        <label for="room_id" class="mr-2">Room ID:</label>
                        <input type="text" class="form-control" id="room_id" name="room_id">
                    </div>
                    <div class="form-group mr-2">
                        <label for="from_date" class="mr-2">Create Date:</label>
                        <input type="date" class="form-control" id="from_date" name="from_date">
                    </div>
                    <button type="submit" class="btn btn-primary">Search</button>
                </form>
                <form action="${pageContext.request.contextPath}/updateInvoiceStatus" method="post">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Student ID</th>
                                <th>Room/Bed</th>
                                <th>Created Date</th>
                                <th>Description</th>
                                <th>Payment Type</th>
                                <th>Payment Date</th>
                                <th>Status</th>
                                <th>Total Payment</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="invoice" items="${invoices}">
                                <tr>
                                    <td>${invoice.invoice_id}</td>
                                    <td>${invoice.users_id}</td>
                                    <td>${invoice.room_id}</td>
                                    <td>${invoice.createdDate}</td>
                                    <td>${invoice.description}</td>
                                    <td>${invoice.paymentType}</td>
                                    <td>${invoice.paymentDate}</td>


                                    <td>
                                        <select class="form-select" name="status_${invoice.invoice_id}">

                                            <option value="unpaid" ${invoice.status == 'unpaid' ? 'selected' : ''}>Unpaid</option>
                                            <option value="paid" ${invoice.status == 'paid' ? 'selected' : ''}>Paid</option>
                                        </select>
                                    </td>
                                    <td>${invoice.totalPayment}</td>

                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <input type="submit" value="save">
                </form>
            </div>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    </body>
</html>
