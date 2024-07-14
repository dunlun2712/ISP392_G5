<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
    <head>
        <title>Water List</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #e8f5e9;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column;
                height: 100vh;
                color: #2e7d32;
            }
            h1 {
                color: #338a3e;
            }
            table {
                width: 80%;
                border-collapse: collapse;
                margin: 20px 0;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                background-color: #ffffff;
                border-radius: 8px;
                overflow: hidden;
            }
            th, td {
                padding: 10px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }
            th {
                background-color: #a5d6a7;
            }
            tr:nth-child(even) {
                background-color: #f1f8e9;
            }
            tr:hover {
                background-color: #c8e6c9;
                cursor: pointer;
            }
            a {
                text-decoration: none;
                color: #388e3c;
                font-weight: bold;
                transition: color 0.3s;
            }
            a:hover {
                color: #1b5e20;
            }
            .actions a {
                margin-right: 10px;
            }
            .add-button {
                margin: 20px 0;
                padding: 10px 20px;
                background-color: #66bb6a;
                color: #fff;
                text-decoration: none;
                border-radius: 5px;
                transition: background-color 0.3s, transform 0.3s;
            }
            .add-button:hover {
                background-color: #338a3e;
                transform: scale(1.05);
            }
        </style>
    </head>
    <body>
        <h1>Water List</h1>
        
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Room ID</th>
                <th>Usage Type</th>
                <th>Creation Date</th>
                <th>Expiration Date</th>
                <th>Semester</th>
                <th>Meter Number</th>
                <th>Old Number</th>
                <th>New Number</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="water" items="${data}">
                <tr>
                    <td>${water.water_id}</td>
                    <td>${water.room_id}</td>
                    <td>${water.usage_type}</td>
                    <td>${water.creation_date}</td>
                    <td>${water.expiration_date}</td>
                    <td>${water.semester}</td>
                    <td>${water.meter_number}</td>
                    <td>${water.consumption}</td>
                    <td>${water.old_number}</td>
                    <td>${water.new_number}</td>
                    <td class="actions">
                        <a href="editElectric?id=${water.water_id}">Edit</a>
<!--                        <a href="deleteElectric?id=${water.water_id}">Delete</a>-->
                    </td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
