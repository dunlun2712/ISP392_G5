<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Invoice Payment</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .container {
            margin-top: 20px;
        }
        .table thead th {
            text-align: center;
        }
        .table tbody td {
            text-align: center;
        }
        .btn-create {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Invoice Payment</h2>
    <div class="btn-create">
        <a href="/addinvoice" class="btn btn-primary">Create New Invoice</a>
    </div>
    <form method="post" action="invoice" class="form-inline mb-3">
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
                <td>${invoice.status}</td>
                <td>${invoice.totalPayment}</td>
                <td><a href="details.jsp?id=${invoice.users_id}">Details</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
