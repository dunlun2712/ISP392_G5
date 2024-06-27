<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Thông báo</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            width: 80%;
            margin: 0 auto;
        }
        .title {
            background-color: #0056b3;
            color: white;
            padding: 10px;
            margin-bottom: 10px;
        }
        .notification {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }
        .notification-item {
            width: 45%;
            margin-bottom: 20px;
            padding: 10px;
            border: 1px solid #ccc;
        }
        .notification-item h3 {
            margin: 0 0 5px 0;
        }
        .notification-item a {
            text-decoration: none;
            color: #0056b3;
        }
        .notification-item a:hover {
            text-decoration: underline;
        }
        .notification-item p {
            margin: 0;
            font-size: 12px;
            color: #666;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="title">
            <h1>Thông báo</h1>
        </div>
        <div class="notification">
            <c:forEach var="news" items="${newsList}">
                <div class="notification-item">
                    <h3>
                        <form action="newdetail" method="post" style="display: inline;">
                            <input type="hidden" name="id" value="${news.new_id}">
                            <button type="submit" style="border: none; background: none; color: #0056b3; cursor: pointer; padding: 0;">
                                ${news.title}
                            </button>
                        </form>
                    </h3>
                    <p>By Student Management - ${news.publish_date}</p>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>
