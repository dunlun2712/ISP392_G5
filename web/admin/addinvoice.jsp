<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Create Invoice</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            table {
                width: 100%;
                border-collapse: separate;
                border-spacing: 0;
                border-radius: 12px;

                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            table, th, td {
                border: 1px solid black;
            }
            th, td {
                padding: 8px;
                text-align: left;
            }
            th {
                background-color: #f0a500;
            }
            th:first-child {
                border-top-left-radius: 12px;
            }
            th:last-child {
                border-top-right-radius: 12px;
            }
            tr:last-child td:first-child {
                border-bottom-left-radius: 12px;
            }
            tr:last-child td:last-child {
                border-bottom-right-radius: 12px;
            }
            .not-reply-yet {
                color: red;
            }
            .action-link {
                font-weight: bold;
                text-decoration: none;
                color: #000;
            }
            .action-link:hover,
            .action-link:active,
            .action-link:visited {
                color: #000;
            }
            .header__search {
                padding: 20px 0;
                background-color: #f9f9f9;
                border-bottom: 1px solid #ddd;
            }

            .header__search form {
                margin: 0 auto;
                max-width: 1050px;
            }

            .header__search .input__item {
                margin-bottom: 10px;
            }

            .header__search input[type="text"],
            .header__search select {
                width: 100%;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 5px;
                box-sizing: border-box;
                font-size: 14px;
            }

            .header__search .btn-primary {
                background-color: #E9AD28;
                color: #fff;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            .header__search .btn-primary:hover {
                background-color: #c88e1a;
            }

            @media (max-width: 768px) {
                .header__search form .col-lg-2,
                .header__search form .col-lg-3 {
                    width: 100%;
                    margin-bottom: 10px;
                }
            }
            .sidebar {
                height: 100%;
                width: 250px;
                position: fixed;
                top: 0;
                left: 0;
                background-color: #111;
                padding-top: 20px;
            }
            .sidebar a {
                padding: 10px 15px;
                text-decoration: none;
                font-size: 18px;
                color: white;
                display: block;
            }
            .sidebar a:hover {
                background-color: #575757;
            }
            .main-content {
                margin-left: 260px; /* Adjust this value to match the sidebar width */
                padding: 20px;
            }

        </style>
    </head>
    <body>
        <div class="container">
            <h2>Create New Invoice</h2>
            <form action="addinvoice" method="post">
                <div class="form-group">
                    <label for="invoice_id">Invoice ID:</label>
                    <input type="text" class="form-control" id="invoice_id" name="invoice_id" value="${id}" required>

                </div>
                <div class="form-group">
                    <label for="users_id">User ID:</label>
                    <input type="text" class="form-control" id="users_id" name="users_id" required>
                    <c:if test="${not empty userIdError}">
                        <small class="text-danger">${userIdError}</small>
                    </c:if>
                </div>
                <div class="form-group">
                    <label for="room_id">Room ID:</label>
                    <input type="text" class="form-control" id="room_id" name="room_id" required>
                    <c:if test="${not empty roomIdError}">
                        <small class="text-danger">${roomIdError}</small>
                    </c:if>
                </div>
                <div class="form-group">
                    <label for="createdDate">Created Date:</label>
                    <input type="date" class="form-control" id="createdDate" name="createdDate" value="${date}" required>
                </div>
                <div class="form-group">
                    <label for="description">Description:</label>
                    <input type="text" class="form-control" id="description" name="description" required>
                </div>
                <div class="form-group">
                    <label for="paymentType">Payment Type:</label>
                    
                    <select id="paymentType" name="paymentType">
                                                    <option value="electric" >Electric</option>
                                                    <option value="Water" >Water</option>
                                                    <option value="Other Serveice" >Other Serveice</option>
                                                </select>
                </div>
               
                <div class="form-group">
                    <label for="totalPayment">Total Payment:</label>
                    <input type="number" class="form-control" id="totalPayment" name="totalPayment" step="0.01" required>
                </div>
                    <button type="submit" class="btn btn-primary"><a href="${pageContext.request.contextPath}/invoice" style="color: white">Back to list</a></button>
                <button type="submit" class="btn btn-primary">Create Invoice</button>
            </form>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
