<%-- 
    Document   : dormdetail.jsp
    Created on : May 21, 2024, 11:20:12 AM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Available Beds</title>
        <link rel="stylesheet" href="styles.css">
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f9f9f9;
                margin: 0;
                padding: 0;
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
        <div class="container">
            <h1>Dorm detail</h1>
            <form action="dormdetail" method="get" > 
                   <input type="hidden" name="pid" value="${pid}">
                <div class="input-group">
                    <select name="term" class="form-control" >
                         <option value="">No Filter</option>
                        <option value="available">Available</option>
                        <option value="Under Maintenance">Under Maintenance</option>
                        <option value="occupied">Occupied</option>
                    </select>
                    <button class="btn" type="submit">Search</button>
                </div>
            </form>


      
            <table>
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Floor</th>
                        <th>TotalBed</th>
                        <th>Price</th>
                        <th>Status</th>

                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${details}" var="d">
                        <tr>
                            <td>${d.room_id}</td>
                            <td>${d.floor}</td>
                            <td>${d.room_type}</td>
                            <td>${d.price}</td>
                            <td>${d.room_status}</td>

                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <a href="${pageContext.request.contextPath}/homeroom" class="back-to-list">Back to list</a>
        </div>

    </body>

</html>