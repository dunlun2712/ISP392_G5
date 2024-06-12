<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <a href="${pageContext.request.contextPath}/admin?type=changepass">View Manager</a>
            <a href="${pageContext.request.contextPath}/viewDorm">View Dorm</a>
            <a href="${pageContext.request.contextPath}/changePassword">Change Password</a>
            <a href="${pageContext.request.contextPath}/logout">Logout</a>
        </div>
        <div class="content">

            <c:if test="${not empty param.type and param.type == 'viewstudent'}">
                <div class="container mt-5">
                    <!-- Form search -->
                    <form method="get" action="${pageContext.request.contextPath}/admin">
                        <input type="hidden" name="type" value="viewstudent">
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" placeholder="Search student" name="search" value="${searchQuery}">
                            <select class="form-select" name="column">
                                <option value="name">Name</option>
                                <option value="role">Role</option>
                                <option value="email">Email</option>
                                <option value="status">status</option>
                            </select>
                            <button class="btn btn-outline-secondary" type="submit">Search</button>
                        </div>
                    </form>
                </div>
            </form>

            <!-- Table of students -->
            <c:if test="${not empty data}">
                <table class="table table-bordered">
                    <!-- Table header -->
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Role</th>
                            <th>Email</th>
                            <th>Status</th>
                            
                        </tr>
                    </thead>
                    <!-- Table body -->
                    <tbody>
                        <c:forEach var="student" items="${data}">
                            <tr>
                                <td>${student.name}</td>
                                <td>${student.email}</td>
                                <td>${student.dob}</td>
                                <td>${student.cccd}</td>
                                <td>${student.major}</td>
                                <td>${student.course}</td>
                                <td>${student.address}</td>
                                <td>${student.gender}</td>
                                <td>${student.ethnicity}</td>
                                <td>${student.nation}</td>
                                <td>${student.phone_num}</td>
                                <td>${student.relative_name}</td>
                                <td>${student.relative_contact}</td>
                                <td>${student.create_date}</td>
                                <td>${student.update_date}</td>
                                <td>
                                        <select class="form-select" name="status_${student.id}">
                                            <option value="working" ${student.status == 'working' ? 'selected' : ''}>Working</option>
                                            <option value="waiting" ${student.status == 'waiting' ? 'selected' : ''}>Waiting</option>
                                            <option value="retired" ${student.status == 'retired' ? 'selected' : ''}>Retired</option>
                                        </select>
                                    </td>
                            </tr>
                        </c:forEach>

                    </tbody>
                </table>
            </c:if>
            <!-- If no students found -->
            <c:if test="${empty data}">
                <p>No students found.</p>
            </c:if>
        </div>
    </c:if>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>