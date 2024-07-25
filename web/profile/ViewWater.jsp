<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>EW Usages</title>
         <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }
            .header {
                background-color: #ffc107;
                color: #fff;
                padding: 10px 0;
                text-align: center;
                font-size: 24px;
            }
            .container {
                width: 80%;
                margin: 20px auto;
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .buttons {
                display: flex;
                justify-content: start;
                gap: 10px;
                margin-bottom: 20px;
            }
            .buttons button {
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s, transform 0.3s;
                font-size: 16px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }
            .buttons .import-btn {
                background-color: #28a745;
                color: #fff;
            }
            .buttons .import-btn:hover {
                background-color: #218838;
                transform: scale(1.05);
            }
            .buttons .calculate-btn {
                background-color: #ffc107;
                color: #000;
            }
            .buttons .calculate-btn:hover {
                background-color: #e0a800;
                transform: scale(1.05);
            }
            .filter {
                display: flex;
                flex-wrap: wrap;
                gap: 10px;
                margin-bottom: 20px;
            }
            .filter input, .filter select, .filter button {
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                transition: background-color 0.3s, transform 0.3s;
            }
            .filter button {
                background-color: #007bff;
                color: #fff;
                border: none;
            }
            .filter button:hover {
                background-color:  #E9AD28;
                transform: scale(1.05);
            }
            table {
                width: 100%;
                border-collapse: collapse;
            }
            th, td {
                padding: 10px;
                text-align: left;
                border-bottom: 1px solid #ddd;
                animation: fadeIn 0.5s ease-in-out;
            }
            th {
                background-color: #E9AD28;
                color: white;
            }
            tr:nth-child(even) {
                background-color: #f2f2f2;
            }
            @keyframes fadeIn {
                from {
                    opacity: 0;
                    transform: translateY(20px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }
        </style>
    </head>
    <body>
        <div class="header"><a href="${pageContext.request.contextPath}/homeservlet">Home</a></div>
        <div class="header">Water Usages</div>
        <div class="container">
          
            <table>
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Room</th>
                        <th>Usage Type</th>
                        <th>Creation Date</th>
                        <th>Expiration Date</th>
                        <th>Semester</th>
                        <th>Meter Number</th>
                        <th>Consumption</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="data" items="${data}">
                        <tr>
                            <td>${data.getWater_id()}</td>
                            <td>${data.getRoom_id()}</td>
                            <td>${data.getUsage_type()}</td>
                            <td>${data.getCreation_date()}</td>
                            <td>${data.getExpiration_date()}</td>
                            <td>${data.getSemester()}</td>
                            <td>${data.getMeter_number()}</td>
                            <td>${data.getConsumption()}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
</html>