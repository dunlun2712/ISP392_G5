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
                padding: 20px;
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column;
                min-height: 100vh;
                color: #2e7d32;
            }
            h1 {
                color: #338a3e;
                margin-bottom: 20px;
            }
            table {
                width: 100%;
                max-width: 1200px;
                border-collapse: collapse;
                margin: 20px 0;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                background-color: #ffffff;
                border-radius: 8px;
                overflow: hidden;
            }
            th, td {
                padding: 15px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }
            th {
                background-color: #a5d6a7;
                color: #1b5e20;
                font-size: 16px;
            }
            td {
                font-size: 14px;
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
        <h1>Water List</h1>
        <div class="search-bar">
            <form action="${pageContext.request.contextPath}/searchwaterbyid" method="post" >
                <input type="text" name="search" placeholder="Search for items..." required="" value="${search}">
                <button type="submit" class="button">Search</button>
            </form>
        </div>
        <table>
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
                    <td>${water.old_reading}</td>
                    <td>${water.new_reading}</td>
                    <td class="actions">
                        <a href="${pageContext.request.contextPath}/editWater?water_id=${water.water_id}">Edit</a>
                    </td>
                </tr>
            </c:forEach>
        </table> 
        <div>
            <a href="${pageContext.request.contextPath}/accresponse?list=1">Back</a>
        </div>
    </body>
</html>
