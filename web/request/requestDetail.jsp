<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hiroto | Template</title>

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/elegant-icons.css">
    <link rel="stylesheet" href="css/nice-select.css">
    <link rel="stylesheet" href="css/jquery-ui.min.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/slicknav.min.css">
    <link rel="stylesheet" href="css/style.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            background-color: #f9f9f9;
            color: #333;
        }

        .profile__button {
            display: inline-block;
            padding: 12px 20px;
            cursor: pointer;
            border-radius: 4px;
        }

        .profile__button i {
            margin-right: 5px;
        }

        .profile__button a {
            text-decoration: none;
            color: #333;
        }

        .profile__button--white {
            background-color: #fff;
            border: 1px solid #ccc;
        }

        .profile__button--white:hover {
            background-color: #eee;
        }

        table {
            width: 100%;
            margin-top: 20px;
            margin-bottom: 20px;
            border-spacing: 0;
            border-radius: 10px;
            overflow: hidden;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        th,
        td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f0a500;
            color: #fff;
            font-weight: bold;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }

        .form-label {
            font-weight: bold;
            color: #333;
        }

        .form-control {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
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
            background-color: #f29e02;
        }
          .menu__class {
                display: flex;
                justify-content: space-around;
                list-style: none;
                padding: 0;
                margin: 0;
            }

            .menu__class li {
                position: relative;
            }

            .menu__class li a {
                display: block;
                padding: 10px 15px;
                color: #333;
                text-decoration: none;
            }
            .header__nav {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .header__menu {
                flex: 1;
            }
    </style>
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Offcanvas Menu Begin -->
    <div class="offcanvas-menu-overlay"></div>
    <div class="offcanvas-menu-wrapper">
        <div class="offcanvas__logo">
            <a href="./index.jsp"><img src="img/logo.png" alt=""></a>
        </div>
        <div id="mobile-menu-wrap"></div>
        <div class="offcanvas__btn__widget">
            <a href="#">Book Now <span class="arrow_right"></span></a>
        </div>
        <div class="offcanvas__widget">
            <ul>
                <li><span class="icon_pin_alt"></span> 96 Ernser Vista Suite 437, NY, US</li>
                <li><span class="icon_phone"></span> (123) 456-78-910</li>
            </ul>
        </div>
        <div class="offcanvas__profile">
            <!-- Profile content here if needed -->
        </div>
        <div class="profile__button profile__button--white">
            <i class="fa fa-user"></i>
            <span><a href="profile/Profile.jsp">View Profile</a></span>
        </div>
    </div>
    <!-- Offcanvas Menu End -->

     <!-- Header Section Begin -->
        <header class="header">
            <div class="header__top">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-7">
                            <ul class="header__top__widget">
                                <li><span class="icon_pin_alt"></span> Khu Công nghệ cao Hòa Lạc, Km29 Đại lộ Thăng Long, huyện Thạch Thất, Hà Nội</li>
                            </ul>
                        </div>
                        <div class="col-lg-5">
                            <div class="header__top__right">
                                <c:if test="${sessionScope.data.id == null}">
                                    <div class="header__top__auth">
                                        <ul>
                                            <li><a href="Login.jsp">Login</a></li>
                                            <li><a href="SignUp.jsp">Register</a></li>
                                        </ul>
                                    </div>
                                </c:if>
                                <c:if test="${sessionScope.data != null}">
                                    <div class="profile__button profile__button--black">
                                        <i class="fa fa-user"></i>
                                        <span><a href="profile/Profile.jsp">Profile</a>/ <a href="${pageContext.request.contextPath}/logout">Logout</a></span>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="header__nav__option">
                <div class="container">
                    <div class="row">

                        <div class="col-lg-10">
                            <div class="header__nav">
                                <nav class="header__menu">
                                    <ul class="menu__class">
                                        <li class="active"><a href="${pageContext.request.contextPath}/homeservlet">Home</a></li>
                                        <li><a href="${pageContext.request.contextPath}/homeroom">Dorms</a></li>
                                        <li ><a href="${pageContext.request.contextPath}/booking">Booking</a></li>
                                         <li ><a href="${pageContext.request.contextPath}/history-booking">History Booking</a></li>
                                          <li ><a href="${pageContext.request.contextPath}/bookinghistory">Service</a></li>
                                         <li ><a href="${pageContext.request.contextPath}/viewinvoice">Invoice</a></li>

                                        <li><a>Electric and Water</a>
                                            <ul class="dropdown">
                                                <li><a href="${pageContext.request.contextPath}/electricView">Electric</a></li>
                                                <li><a href="${pageContext.request.contextPath}/waterView">Water</a></li>

                                            </ul>
                                        </li>
                                        <li><a href="${pageContext.request.contextPath}/blog">News</a></li>
                                        <li class="active"><a href="${pageContext.request.contextPath}/request">Request</a></li>
                                        <li ><a href="${pageContext.request.contextPath}/registerTicket">Parking ticket</a></li>
                                    </ul>
                                </nav>
                                <div class="header__nav__widget">
                                    <a href="${pageContext.request.contextPath}/booking">Book Now <span class="arrow_right"></span></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="canvas__open">
                        <span class="fa fa-bars"></span>
                    </div>
                </div>
            </div>
        </header>
        <!-- Header Section End -->


    <!-- Hero Section Begin -->
    <section class="hero spad set-bg">
        <div class="container">
           
                            <div class="row g-3">
                                <div class="container mt-5">
                                    <h1 style="color: black; font-size: 5rem">My Request</h1>
                                    <form action="${pageContext.request.contextPath}/request" method="post">
                                        <table>
                                            <tr>
                                                <td><label for="studentName" class="form-label">Title</label></td>
                                                <td><input type="text" class="form-control" id="studentName" name="studentName" value="${Req.request_type} - ${sessionScope.book.room_id}" readonly></td>
                                            </tr>
                                            <tr>
                                                <td><label for="studentName" class="form-label">Student Name</label></td>
                                                <td><input type="text" class="form-control" id="studentName" name="studentName" value="${sessionScope.data.name}" readonly></td>
                                            </tr>
                                            <tr>
                                                <td><label for="studentId" class="form-label">Student ID</label></td>
                                                <td><input type="text" class="form-control" id="studentId" name="studentId" value="${sessionScope.data.id}" readonly></td>
                                            </tr>
                                            <tr>
                                                <td><label for="roomId" class="form-label">Room ID</label></td>
                                                <td><input type="text" class="form-control" id="roomId" name="roomId" value="${sessionScope.book.room_id}" readonly></td>
                                            </tr>
                                            <tr>
                                                <td><label for="roomId" class="form-label">Type</label></td>
                                                <td><input type="text" class="form-control" id="roomId" name="roomId" value="${Req.request_type}" readonly></td>
                                            </tr>
                                            <tr>
                                                <td><label for="roomId" class="form-label">Content</label></td>
                                                <td><input type="text" class="form-control" id="roomId" name="roomId" value="${Req.request}" readonly></td>
                                            </tr>
                                            <tr>
                                                <td><label for="roomId" class="form-label">Create Date</label></td>
                                                <td><input type="text" class="form-control" id="roomId" name="roomId" value="${Req.request_date}" readonly></td>
                                            </tr>
                                            <tr>
                                                <td><label for="roomId" class="form-label">Reply</label></td>
                                                <td><input type="text" class="form-control" id="roomId" name="roomId" value="${Req.response}" readonly></td>
                                            </tr>
                                            <tr>
                                                <td><label for="roomId" class="form-label">Status</label></td>
                                                <c:choose>
                                                    <c:when test="${empty Req.request_status}">
                                                        <td><span style="color: red;">not replied yet</span></td>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <td><input type="text" class="form-control" id="roomId" name="roomId" value="${Req.request_status}" readonly></td>
                                                    </c:otherwise>
                                                </c:choose>
                                            </tr>
                                        </table>
                                        <br>
                                        <button type="submit" class="btn-back" name="other" value="back">Back to add Request</button>
                                        <button type="submit" class="btn-back" name="mess" value="list">Back to list Request</button>
                                    </form>
                                </div>
                            </div>
                        </div>
          
    </section>
    <!-- Hero Section End -->

    <!-- Footer Section Begin -->
    <footer class="footer set-bg" data-setbg="img/footer-bg.jpg">
        <!-- Footer content if any -->
    </footer>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>
</body>

</html>
