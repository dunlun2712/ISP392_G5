<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Admin Dashboard</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                display: flex;
                min-height: 100vh;
                font-family: 'Arial', sans-serif;
                background-color: #f4f6f9;
            }
            .sidebar {
                min-width: 250px;
                max-width: 250px;
                background-color: #343a40;
                padding-top: 20px;
                color: white;
            }
            .sidebar a {
                text-decoration: none;
                color: #adb5bd;
                padding: 10px;
                display: block;
            }
            .sidebar a:hover {
                background-color: #007bff;
                color: white;
            }
            .content {
                flex: 1;
                padding: 20px;
            }
            .header {
                background-color: #343a40;
                color: white;
                padding: 10px 20px;
                text-align: center;
                font-size: 1.5em;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <div class="sidebar">
            <h4 class="text-center">Admin Menu</h4>
            <a href="${pageContext.request.contextPath}/admin?type=viewstudent">View Student</a>
            <a href="${pageContext.request.contextPath}/admin?type=viewmanager">View Manager</a>
            <a href="${pageContext.request.contextPath}/viewDorm">View Dorm</a>
            <a href="${pageContext.request.contextPath}/changePassword">Change Password</a>
            <a href="${pageContext.request.contextPath}/logout">Logout</a>
        </div>
        <div class="content">

            <div class="container mt-5">
                <!-- Form search -->
                <form method="get" action="${pageContext.request.contextPath}/admin">

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
                            <tr>
                                <td>${account.acc}</td>
                                <td>${account.pass}</td>
                                <td>${account.role}</td>
                                <td>
                                    <select class="form-select" name="status_${account.role}">
                                        <option value="2" ${account.status == '2' ? 'selected' : ''}>Student Manager</option>
                                        <option value="3" ${account.status == '3' ? 'selected' : ''}>Dorm Manager</option>
                                        <option value="4" ${account.status == '4' ? 'selected' : ''}>Not Consider</option>
                                    </select>
                                </td>
                                
                                <td>${account.email}</td>
                                 
                                <td><select class="form-select" name="status_${account.email}">
                                        <option value="working" ${account.status == 'working' ? 'selected' : ''}>Working</option>
                                        <option value="notworking" ${account.status == 'notworking' ? 'selected' : ''}>Not Working</option>
                                    </select>
                                </td>
                            </tr>
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
