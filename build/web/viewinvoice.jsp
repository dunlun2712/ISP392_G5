<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Invoice List</title>
    <style>
        .invoice {
            border: 1px solid #ddd;
            padding: 10px;
            margin: 10px;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
        .invoice h3 {
            margin-top: 0;
        }
        .invoice p {
            margin: 5px 0;
        }
    </style>
</head>
<body>
    <h2>Invoice List</h2>
    <c:forEach var="invoice" items="${invoiceList}">
        <div class="invoice">
            <h3>Invoice ID: ${invoice.invoice_id}</h3>
            <p><strong>Room ID:</strong> ${invoice.room_id}</p>
            <p><strong>User ID:</strong> ${invoice.users_id}</p>
            <p><strong>Created Date:</strong> ${invoice.createdDate}</p>
            <p><strong>Description:</strong> ${invoice.description}</p>
            <p><strong>Payment Type:</strong> ${invoice.paymentType}</p>
            <p><strong>Status:</strong> ${invoice.status}</p>
            <p><strong>Total Payment:</strong> ${invoice.totalPayment}</p>
        </div>
    </c:forEach>
</body>
</html>
