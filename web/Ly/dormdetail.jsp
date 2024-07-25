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
                background-color: #ff8000;
                padding: 10px 20px;
                border-radius: 5px;
                width: fit-content;
                margin: 20px auto;
                color: #fff;
            }

            .back-to-list:hover {
                background-color: #e67300;
            }

            /* Add and hide form styles */
            #addForm {
                display: none;
                margin-top: 20px;
                background-color: #e6e6e6;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            #addForm input,
            #addForm select {
                width: 100%;
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            #addForm .btn {
                width: auto;
                background-color: #007bff;
                color: #fff;
                border: none;
                cursor: pointer;
                padding: 10px 20px;
                border-radius: 5px;
            }

            #addForm .btn:hover {
                background-color: #0056b3;
            }

            /* CSS to show the form when the button is clicked */
            #showFormButton:checked ~ #addForm {
                display: block;
            }

            .hidden-checkbox {
                display: none;
            }

            .show-form-label {
                display: inline-block;
                padding: 10px 20px;
                background-color: #ff8000;
                color: #fff;
                border: none;
                cursor: pointer;
                text-align: center;
                margin: 20px auto;
                border-radius: 5px;
            }

            .show-form-label:hover {
                background-color: #e67300;
            }

        </style>
    </head>

    <body>
        <div class="container">
            <h1>Dorm detail</h1>
            <form action="managementroom" method="get"> 
                <input type="hidden" name="pid" value="${pid}">
                <div class="input-group">
                    <select name="term" class="form-control">
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
                        <th>Update</th>

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
                            <td><a href="updateroom?pid=${d.room_id}">Update</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <!-- Hidden checkbox to toggle form visibility -->
            <input type="checkbox" id="showFormButton" class="hidden-checkbox">
            <label for="showFormButton" class="show-form-label">Add New Room</label>

            <div id="addForm">
                <h2>Add New Room</h2>
                <form action="addroom" method="get">
                    <input type="text" name="room_id" placeholder="Room ID" required>
                    <input type="hidden" name="dorm_id" placeholder="Dorm ID"  value="${pid}"  required>
                    <input type="text" name="floor" placeholder="Floor" required>


                    <select  name="room_type">
                        <option  placeholder="Room Type">Room Type</option>
                        <option value="4 bed" >4 bed</option>
                        <option value="6 bed" >6 bed</option>

                    </select>
                    <input type="text" name="price" placeholder="Price" required>
                    <select name="room_status">
                        <option value="Available">Available</option>
                        <option value="Under Maintenance">Under Maintenance</option>
                        <option value="Occupied">Occupied</option>
                    </select>
                    <button class="btn" type="submit">Add</button>
                </form>
            </div>
            <a href="managementdorm" class="back-to-list">Back to list</a>
        </div>
    </body>

</html>
