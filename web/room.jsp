<%-- 
    Document   : room.jsp
    Created on : 13 Jun 2024, 10:58:25
    Author     : DELL
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Room List</title>
        <style>
            :root {
                --primary-color: #3498db;
                --secondary-color: #2980b9;
                --background-color: #f0f0f0;
                --text-color: #333;
                --white-color: #fff;
                --font-family: Arial, sans-serif;
            }
            body {
                font-family: var(--font-family);
                margin: 0;
                padding: 0;
                background-color: var(--background-color);
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                min-height: 100vh;
                animation: fadeIn 1s ease-in;
            }
            @keyframes fadeIn {
                from {
                    opacity: 0;
                }
                to {
                    opacity: 1;
                }
            }
            .content {
                background: var(--white-color);
                padding: 30px;
                border-radius: 10px;
                width: 90%;
                max-width: 1200px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                margin-top: 20px;
                animation: slideIn 0.5s ease-out;
            }
            @keyframes slideIn {
                from {
                    transform: translateY(20px);
                }
                to {
                    transform: translateY(0);
                }
            }
            h1 {
                color: var(--text-color);
                margin-bottom: 20px;
                text-align: center;
                font-size: 2.5em;
                position: relative;
            }
            h1::after {
                content: '';
                width: 100%;
                height: 4px;
                background: var(--primary-color);
                position: absolute;
                bottom: -10px;
                left: 0;
                transform: scaleX(0);
                transform-origin: bottom right;
                transition: transform 0.5s ease-out;
            }
            h1:hover::after {
                transform: scaleX(1);
                transform-origin: bottom left;
            }
            .button {
                display: inline-block;
                padding: 10px 20px;
                background-color: var(--primary-color);
                color: var(--white-color);
                text-decoration: none;
                border-radius: 5px;
                transition: background-color 0.3s ease, transform 0.3s ease;
                text-align: center;
                cursor: pointer;
                position: relative;
                overflow: hidden;
            }
            .button::before {
                content: '';
                position: absolute;
                top: 50%;
                left: 50%;
                width: 300%;
                height: 300%;
                background-color: rgba(255, 255, 255, 0.2);
                transition: width 0.4s ease, height 0.4s ease, top 0.4s ease, left 0.4s ease;
                border-radius: 50%;
                z-index: 0;
                transform: translate(-50%, -50%);
            }
            .button:hover::before {
                width: 0;
                height: 0;
                top: 50%;
                left: 50%;
            }
            .button:hover {
                background-color: var(--secondary-color);
                transform: scale(1.05);
            }
            .no-underline a {
                text-decoration: none;
                color: black;
                font-size: 75px;
            }
            .no-underline a:hover, .no-underline a:focus, .no-underline a:active {
                text-decoration: none;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
                background-color: var(--white-color);
                color: var(--text-color);
                animation: fadeIn 1.5s ease-in;
                position: relative;
                z-index: 1;
            }
            th, td {
                padding: 15px;
                text-align: left;
                border-bottom: 1px solid #ddd;
                transition: background-color 0.3s ease, color 0.3s ease;
            }
            th {
                background-color: var(--primary-color);
                color: var(--white-color);
            }
            tr:nth-child(even) {
                background-color: #f9f9f9;
            }
            tr:hover td {
                background-color: #f1f1f1;
                color: var(--primary-color);
            }
            a {
                text-decoration: none;
                color: var(--primary-color);
                transition: color 0.3s ease;
            }
            a:hover {
                text-decoration: underline;
                color: var(--secondary-color);
            }
            .status-under-maintenance {
                color: #e74c3c;
                font-weight: bold;
            }
            .search-bar {
                display: flex;
                align-items: center;
                margin-bottom: 20px;
                width: 100%;
            }
            .search-bar input[type="text"] {
                padding: 10px;
                width: calc(100% - 120px);
                border: 1px solid #ccc;
                border-radius: 5px 0 0 5px;
                outline: none;
                transition: border-color 0.3s ease;
            }
            .search-bar input[type="text"]:focus {
                border-color: var(--primary-color);
            }
            .search-bar button {
                padding: 10px 20px;
                background-color: var(--primary-color);
                color: var(--white-color);
                border: none;
                border-radius: 0 5px 5px 0;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }
            .search-bar button:hover {
                background-color: var(--secondary-color);
            }
        </style>
    </head>
    <body>
        <div class="content">

            <h1><a href="listItems" class="no-underline">Room List</a></h1>  
            <form method="post" action="searchRoom" class="search-bar">
                <input type="text" name="search" placeholder="Search for rooms..." value="${search}" aria-label="Search for rooms"/>
                <button type="submit" class="button">Search</button> 
            </form>
            <table>
                <tr>
                    <th>Room Id</th>
                    <th>Dorm Id</th>
                    <th>Floor</th>
                    <th>Room Type</th>
                    <th>Price</th>  
                    <th>Room Status</th>  
                </tr>
                <c:forEach var="c" items="${roomList}">
                    <tr>
                        <td>${c.getRoom_id()}</td>
                        <td>${c.getDorm_id()}</td>
                        <td>${c.getFloor()}</td>
                        <td>${c.getRoom_type()}</td>
                        <td>${c.getPrice()}</td>
                        <td>
                            <c:choose>
                                <c:when test="${c.getRoom_status() == 'Under Maintenance'}">
                                    <span class="status-under-maintenance">Maintenance</span>
                                </c:when>
                                <c:otherwise>
                                    <a href="inItem?roomId=${c.getRoom_id()}">View Items</a>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </body>
</html>
