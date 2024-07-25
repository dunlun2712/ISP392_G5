<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
    <head>
        <title>Electricity List</title>
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
            .search-bar {
                width: 100%;
                max-width: 1200px;
                display: flex;
                justify-content: center;
                margin-bottom: 20px;
            }
            .search-bar input[type="text"] {
                padding: 10px;
                font-size: 14px;
                border: 1px solid #ddd;
                border-radius: 4px;
                width: 200px;
            }
            .search-bar button {
                padding: 10px 20px;
                background-color: #66bb6a;
                color: #fff;
                border: none;
                border-radius: 4px;
                margin-left: 10px;
                cursor: pointer;
                transition: background-color 0.3s, transform 0.3s;
            }
            .search-bar button:hover {
                background-color: #338a3e;
                transform: scale(1.05);
            }
        </style>
    </head>
    <body>
        <h1>Electricity List</h1>
        <div class="search-bar">
            <form action="${pageContext.request.contextPath}/searchelecbyid" method="post" >
                <input type="text" name="search" placeholder="Search for items..." required="" value="${search}">
                <button type="submit" class="button">Search</button>
            </form>
        </div>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Room ID</th>
                <th>Usage Type</th>
                <th>Creation Date</th>
                <th>Expiration Date</th>
                <th>Semester</th>
                <th>Meter Number</th>
                <th>Consumption</th>
                <th>Old Number</th>
                <th>New Number</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="electric" items="${data}">
                <tr>
                    <td>${electric.electricity_id}</td>
                    <td>${electric.room_id}</td>
                    <td>${electric.usage_type}</td>
                    <td>${electric.creation_date}</td>
                    <td>${electric.expiration_date}</td>
                    <td>${electric.semester}</td>
                    <td>${electric.meter_number}</td>
                    <td>${electric.consumption}</td>
                    <td>${electric.old_number}</td>
                    <td>${electric.new_number}</td>
                    <td class="actions">
                        <a href="${pageContext.request.contextPath}/editElectric?electricity_id=${electric.electricity_id}">Edit</a>
<!--                        <a href="deleteElectric?id=${electric.electricity_id}">Delete</a>-->
                    </td>
                </tr>
            </c:forEach>

        </table> <div>
            <a href="${pageContext.request.contextPath}/accresponse?list=1">Back</a>
        </div>
    </body>
</html>
