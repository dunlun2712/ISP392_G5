<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Ticket Registrations List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            color: #333;
            margin: 0;
            padding: 20px;
        }

        h2 {
            text-align: center;
            color: #4CAF50;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        thead {
            background-color: #4CAF50;
        }

        tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tbody tr:nth-child(odd) {
            background-color: #fff;
        }
    </style>
</head>
<body>

    <h2>Ticket Registrations List</h2>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Student ID</th>
                <th>Vehicle Number</th>
                <th>Issue Date</th>
                <th>Expiry Date</th>
                <th>Price</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="ticket" items="${ticket}">
                <tr>
                    <td>${ticket.ticketId}</td>
                    <td>${ticket.usersId}</td>
                    <td>${ticket.vehicleNumber}</td>
                    <td>${ticket.issueDate}</td>
                    <td>${ticket.expiryDate}</td>
                    <td>${ticket.price}</td>
                    <td>${ticket.status}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

</body>
</html>
