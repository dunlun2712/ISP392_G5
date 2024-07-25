<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Hiroto Template">
        <meta name="keywords" content="Hiroto, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Hiroto | Template</title>

        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <style>
            .header__search {
                margin-left: auto; /* Đẩy phần tìm kiếm sang phải */
                display: flex;
                align-items: center;
            }

            .header__search form {
                position: relative;
            }

            .header__search input[type="text"] {
                padding: 10px 20px;
                border: none;
                background: #f2f2f2;
                border-radius: 20px;
                outline: none;
                width: 250px;
                transition: width 0.4s ease-in-out;
            }

            .header__search input[type="text"]:focus {
                width: 300px;
            }

            .header__search button {
                border: none;
                background: none;
                cursor: pointer;
                position: absolute;
                right: 10px;
            }

            /* Custom CSS for table */
            table {
                width: 75%;
                border-collapse: separate;
                border-spacing: 0;
                border-radius: 12px;
                overflow: hidden;
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

            .form-label {
                font-weight: bold;
                color: black;
            }

            .form-control {
                width: 100%;
                padding: 3px;
                box-sizing: border-box;
            }

            .btn-back {
                font-weight: bold;
                background-color: #E9AD28;
                color: white;
                border: none;
                padding: 12px 20px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                margin-top: 20px;
                cursor: pointer;
                border-radius: 4px;
            }

            .btn-back:hover {
                background-color: #f29e02; /* Darker background color on hover */
            }


        </style>

    </head>
    <body>
        <!-- Page Preloder -->
        <div id="preloder">
            <div class="loader"></div>
        </div>


            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="col-xxl-8 mb-5 mb-xxl-0">
                            <div class="bg-secondary-soft px-4 py-5 rounded">
                                <div class="row g-3">
                                    <div class="container mt-5">
                                        <h1 style="color: black; font-size: 5rem">My Request</h1>
                                        <form action="${pageContext.request.contextPath}/response" method="post" id="exampleForm">
                                            <table border="1">
                                                <tr style="background-color: #ffffff;">
                                                    <td style="width: 150px"><label for="studentName" class="form-label" style="color: black">Request ID</label></td>
                                                    <td><input type="text" class="form-control" id="studentName" name="req_id" value="${reqid}" readonly></td>
                                                </tr>
                                                <tr style="background-color: #ffffff;">
                                                    <td style="width: 150px"><label for="studentName" class="form-label" style="color: black">Title</label></td>
                                                    <td><input type="text" class="form-control" id="studentName" name="studentName" value="${Req.request_type} - ${Req.users_id}" readonly></td>
                                                </tr>

                                                <tr style="background-color: #ffffff;">
                                                    <td><label for="studentId" class="form-label" style="color: black">Student ID</label></td>
                                                    <td><input type="text" class="form-control" id="studentId" name="studentId" value="${Req.users_id}" readonly></td>
                                                </tr>
                                                <tr style="background-color: #ffffff;">
                                                    <td><label for="roomId" class="form-label" style="color: black">Room ID</label></td>
                                                    <td><input type="text" class="form-control" id="studentId" name="studentId" value="${Req.room_id}" readonly></td>
                                                </tr>
                                                <tr style="background-color: #ffffff;">
                                                    <td><label for="roomId" class="form-label" style="color: black">Type</label></td>
                                                    <td><input type="text" class="form-control" id="roomId" name="roomId" value="${Req.request_type}" readonly></td>
                                                </tr>
                                                <tr style="background-color: #ffffff;">
                                                    <td><label for="roomId" class="form-label" style="color: black">Content</label></td>
                                                    <td><input type="text" class="form-control" id="roomId" name="roomId" value="${Req.request}" readonly></td>
                                                </tr>
                                                <tr style="background-color: #ffffff;">
                                                    <td><label for="roomId" class="form-label" style="color: black">Create Date</label></td>
                                                    <td><input type="text" class="form-control" id="roomId" name="roomId" value="${Req.request_date}" readonly></td>
                                                </tr>
                                                <tr style="background-color: #ffffff;">
                                                    <td>
                                                        <label for="roomId" class="form-label" style="color: black;">Reply</label>
                                                    </td>
                                                    <td>
                                                        <div class="mb-3">
                                                            <label for="description" class="form-label">Description</label>
                                                            <textarea class="form-control" style="max-width: 1000px;font-size: 1.3rem;" id="description"  name="resp" rows="4" > ${Req.response}</textarea>
                                                        </div>
                                                    </td>
                                                </tr>

                                                <tr style="background-color: #ffffff;">
                                                    <td><label for="roomId" class="form-label" style="color: black">Status</label></td>
                                                    <td style="padding-bottom: 150px">
                                                        <select  class="form-select" name="res_status" style="width: 200px">
                                                            <option value="pending" ${Req.request_status == 'pending' ? 'selected' : ''}>Pending</option>
                                                            <option value="processing" ${Req.request_status ==  'processing' ? 'selected' : ''}>Processing</option>
                                                            <option value="confirm" ${Req.request_status ==  'confirm' ? 'selected' : ''}>Confirm</option>
                                                            <option value="reject" ${Req.request_status ==  'reject' ? 'selected' : ''}>Reject</option>
                                                        </select>
                                                    </td>
                                                </tr>

                                            </table>
                                            <br>
                                            <input type="hidden" name="list" value="0"> 
                                            <button type="submit" class="btn-back" name="response" value="back">List Response</button>
                                            <button type="submit" class="btn-back" name="response" value="save">Save</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        <!-- Hero Section End -->

        <!-- Js Plugins -->
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/main.js"></script>
        <script>
            document.querySelectorAll('input').forEach(function (element) {
                element.addEventListener('keypress', function (event) {
                    if (event.key === 'Enter') {
                        event.preventDefault();
                    }
                });
            });

        </script>
        <script>
            document.getElementById("searchInput").addEventListener("keypress", function (event) {
                if (event.key === 'Enter') {
                    event.preventDefault();
                    var query = this.value.trim();
                    if (query !== '') {
                        // Redirect to search_results.jsp with query parameter
                        window.location.href = "search_results.jsp?query=" + encodeURIComponent(query);
                    }
                }
            });


        </script>
    </body>

</html>
