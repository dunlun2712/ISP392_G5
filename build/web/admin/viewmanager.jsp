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
    <c:if test="${not empty param.type and param.type == 'viewstudent'}">
        <div class="container mt-5">
            <!-- Form search -->
            <form method="get" action="${pageContext.request.contextPath}/admin">
                <input type="hidden" name="type" value="viewstudent">
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="searchInput" class="form-label">Search student by keyword</label>
                        <input type="text" class="form-control" id="searchInput" placeholder="Enter keyword" name="search" value="${searchQuery}">
                    </div>
                    <div class="col-md-3">
                        <label for="columnSelect" class="form-label">Search by column</label>
                        <select class="form-select" id="columnSelect" name="column">
                            <option value="all">All</option>
                            <option value="name">Name</option>
                            <option value="id">ID</option>
                            <option value="email">Email</option>
                            <option value="dob">Date of Birth</option>
                            <option value="cccd">CCCD</option>
                            <option value="major">Major</option>
                            <option value="course">Course</option>
                            <option value="address">Address</option>
                            <option value="gender">Gender</option>
                            <option value="ethnicity">Ethnicity</option>
                            <option value="nation">Nationality</option>
                            <option value="phone_num">Phone Number</option>
                            <option value="relative_name">Relative Name</option>
                            <option value="relative_contact">Relative Contact</option>
                            <option value="create_date">Create Date</option>
                            <option value="update_date">Update Date</option>
                            <option value="status">Status</option>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <label for="dormSelect" class="form-label">Select Dorm</label>
                        <select class="form-select" id="dormSelect" name="dorm">
                            <option value="">All Dorms</option>
                            <!-- Assuming dorms is a list of dorms passed from the servlet -->
                            <c:forEach var="dorm" items="${dorms}">
                                <option value="${dorm.id}">${dorm.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <button class="btn btn-outline-secondary" type="submit">Search</button>
            </form>
        </div>
        <c:if test="${not empty searchQuery}">
            <!-- Table of students -->
            <c:if test="${not empty data}">
                <form method="post" action="${pageContext.request.contextPath}/admin">
                    <table class="table table-bordered">
                        <!-- Table header -->
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Date of Birth</th>
                            <th>CCCD</th>
                            <th>Major</th>
                            <th>Course</th>
                            <th>Address</th>
                            <th>Gender</th>
                            <th>Ethnicity</th>
                            <th>Nationality</th>
                            <th>Phone Number</th>
                            <th>Relative Name</th>
                            <th>Relative Contact</th>
                            <th>Create Date</th>
                            <th>Update Date</th>
                            <th>Status</th>
                        </tr>
                        </thead>
                        <!-- Table body -->
                        <tbody>
                        <c:forEach var="student" items="${data}">
                            <tr>
                                <td>${student.id}</td>
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
                                        <option value="booking" ${student.status == 'booking' ? 'selected' : ''}>Booking</option>
                                        <option value="not_book" ${student.status == 'not_book' ? 'selected' : ''}>Not Book</option>
                                        <option value="staying" ${student.status == 'staying' ? 'selected' : ''}>Staying</option>
                                    </select>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <button type="submit" class="btn btn-primary">Save</button>
                </form>
            </c:if>
            <!-- If no students found -->
            <c:if test="${empty data}">
                <p>No students found.</p>
            </c:if>
        </c:if>
    </c:if>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
    