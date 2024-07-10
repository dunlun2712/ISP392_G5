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
        <a href="createInvoice.jsp" class="btn btn-primary">Tạo hóa đơn mới</a>
    </div>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>Sinh viên</th>
            <th>Phòng/Giường</th>
            <th>Ngày tạo</th>
            <th>Mô tả</th>
            <th>Dạng thanh toán</th>
            <th>Ngày thanh toán</th>
            <th>Trạng thái</th>
            <th>Mã Thanh Toán</th>
            <th>Ngày chỉnh sửa</th>
            <th>Tổng Phí Thanh Toán</th>
            <th>Đã thanh toán</th>
            <th>Còn lại phải trả</th>
            <th>Details</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="invoice" items="${invoices}">
            <tr>
                <td>${invoice.studentId}</td>
                <td>${invoice.roomBed}</td>
                <td>${invoice.createdDate}</td>
                <td>${invoice.description}</td>
                <td>${invoice.paymentType}</td>
                <td>${invoice.paymentDate}</td>
                <td>${invoice.status}</td>
                <td>${invoice.paymentCode}</td>
                <td>${invoice.modifiedDate}</td>
                <td>${invoice.totalPayment}</td>
                <td>${invoice.paid}</td>
                <td>${invoice.remaining}</td>
                <td><a href="details.jsp?id=${invoice.studentId}">Details</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
