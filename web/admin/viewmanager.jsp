<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            display: flex;
            min-height: 100vh;
            font-family: 'Arial', sans-serif;
            background-color: #f4f6f9;
            margin: 0;
        }
        .sidebar {
            min-width: 250px;
            max-width: 250px;
            background-color: #343a40;
            padding-top: 20px;
            color: white;
            position: fixed;
            height: 100%;
        }
        .sidebar a {
            text-decoration: none;
            color: #adb5bd;
            padding: 15px 20px;
            display: block;
        }
        .sidebar a:hover {
            background-color: #007bff;
            color: white;
        }
        .content {
            margin-left: 250px;
            padding: 20px;
            flex: 1;
        }
        .header {
            background-color: #343a40;
            color: white;
            padding: 10px 20px;
            text-align: center;
            font-size: 1.5em;
            font-weight: bold;
        }
        .search-bar {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        .table th {
            background-color: #007bff;
            color: white;
        }
        .table tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .table tr:hover {
            background-color: #e9ecef;
        }
        .btn-primary {
            background-color: #007bff;
            border: none;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <h4 class="text-center">Admin Menu</h4>
        <a href="${pageContext.request.contextPath}/admin?type=viewstudent">View Student</a>
        <a href="${pageContext.request.contextPath}/admin?type=viewmanager">View Manager</a>
        <a href="${pageContext.request.contextPath}/viewDorm">View Dorm</a>
        <a href="${pageContext.request.contextPath}/viewTicket">View Bike Tickets</a>
        <a href="${pageContext.request.contextPath}/changePassword">Change Password</a>
        <a href="${pageContext.request.contextPath}/logout">Logout</a>
    </div>
    <div class="content">
        <div class="header">Admin</div>
        <div class="container mt-5">
            <!-- Form search -->
            <form method="get" action="${pageContext.request.contextPath}/admin" class="search-bar">
                <input type="hidden" name="type" value="viewmanager">
                <input type="text" name="search" class="form-control" placeholder="Search manager...">
                <button type="submit" class="btn btn-primary">Search</button>
            </form>
        </div>

        <form method="post" action="${pageContext.request.contextPath}/admin">
            <table class="table table-bordered">
                <!-- Table header -->
                <thead>
                    <tr>
                        <th>Account</th>
                        <th>Password</th>
                        <th>Role</th>
                        <th>Email</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <!-- Table body -->
                <tbody>
                    <c:forEach var="account" items="${data}">
                        <c:if test="${account.role != 1}">
                            <tr>
                                <td>${account.acc}</td>
                                <td>${account.pass}</td>
                                <td>
                                    <select class="form-select" name="role_${account.email}">
                                        <option value="2" ${account.role == '2' ? 'selected' : ''}>Student Manager</option>
                                        <option value="3" ${account.role == '3' ? 'selected' : ''}>Dorm Manager</option>
                                        <option value="4" ${account.role == '4' ? 'selected' : ''}>Not Consider</option>
                                    </select>
                                </td>
                                <td>${account.email}</td>
                                <td>
                                    <select class="form-select" name="status_${account.email}">
                                        <option value="working" ${account.status == 'working' ? 'selected' : ''}>Working</option>
                                        <option value="notworking" ${account.status == 'notworking' ? 'selected' : ''}>Not Working</option>
                                    </select>
                                </td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </tbody>
            </table>
            <button type="submit" class="btn btn-primary">Save</button>
        </form>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
