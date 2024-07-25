
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Hiroto Template">
        <meta name="keywords" content="Hiroto, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Hiroto | Template</title>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Barlow+Condensed:wght@400;500;600;700;800;900&display=swap"
              rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&display=swap" rel="stylesheet">

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
            .profile__button {
                display: inline-block;
                padding: 12px 0 12px;
                position: relative;
                cursor: pointer;
            }

            .profile__button i {
                display: inline-block;
                font-size: 15px;
                color: #1d1c1c;
                font-weight: 500;
            }

            .profile__button--black a {
                text-decoration: none;
                color: black;
            }
            .profile__button--white a {
                text-decoration: none;
                color: white;
            }

            .profile__button a:hover {
                color: inherit;
            }

            .profile__button--black {
                color: black;
            }

            .profile__button--white {
                color: white;
            }
            .header__nav {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .header__menu {
                flex: 1;
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
            table {
                width: 100%;
                border-collapse: collapse;
                margin: 20px 0;
            }

            th, td {
                padding: 12px;
                border: 1px solid #ddd;
                text-align: left;
            }

            th {
                background-color: #f4f4f4;
            }

            tbody tr:nth-child(even) {
                background-color: #f9f9f9;
            }

            tfoot {
                background-color: #f4f4f4;
                font-weight: bold;
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
                    <li><span class="icon_pin_alt"></span> Khu Công nghệ cao Hòa Lạc, Km29 Đại lộ Thăng Long, huyện Thạch Thất, Hà Nội</li>

                </ul>
            </div>
            <div class="offcanvas__profile">



            </div>
            <div class="header__top__right">

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
                                        <li ><a href="${pageContext.request.contextPath}/homeservlet">Home</a></li>
                                        <li><a href="${pageContext.request.contextPath}/homeroom">Dorms</a></li>
                                        <li ><a href="${pageContext.request.contextPath}/booking">Booking</a></li>
                                         <li ><a href="${pageContext.request.contextPath}/history-booking">History Booking</a></li>
                                          <li class="active"><a href="${pageContext.request.contextPath}/bookinghistory">Service</a></li>
                                         <li ><a href="${pageContext.request.contextPath}/viewinvoice">Invoice</a></li>

                                        <li><a>Electric and Water</a>
                                            <ul class="dropdown">
                                                <li><a href="${pageContext.request.contextPath}/electricView">Electric</a></li>
                                                <li><a href="${pageContext.request.contextPath}/waterView">Water</a></li>

                                            </ul>
                                        </li>
                                        <li><a href="${pageContext.request.contextPath}/blog">News</a></li>
                                        <li ><a href="${pageContext.request.contextPath}/request">Request</a></li>
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

        <!-- Breadcrumb Begin -->
        <div class="breadcrumb-option set-bg" data-setbg="img/hero.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <div class="breadcrumb__text" style="color: black;
                             font-size: 24px;
                             font-weight: bold;
                             line-height: 1.5;">
                            <h1 style="color: black;
                                font-size: 75px;
                                font-weight: bold;"></h1>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb End -->



        <!-- Rooms Section Begin -->
        <section class="rooms spad">
            <div class="container">
                <h1>Resident History</h1>


                <table>
                    <thead>
                        <tr>
                            <th>Mã SV</th>
                            <th>Dorm</th>
                            <th>Room</th>
                            <th>Checkin</th>
                            <th>Checkout</th>
                            <th>Room Type</th>
                            <th>Price in month</th>
                            <th>Note</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listcomment}" var="d">
                            <tr>
                                <td>${d.usersId}</td>
                                <td>${d.dorm_name}</td>
                                <td>${d.roomId}</td>
                                <td>${d.checkinDate}</td>
                                <td>${d.checkoutDate}</td>
                                <td>${d.room_type}</td>
                                <td>${d.price}</td>
                                <td>${d.note}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <div class="container">
                <h1>Infomation Vehicle</h1>
                <table>
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>CCCD</th>
                            <th>Vehicle Number</th>
                            <th>Issue Date</th>
                            <th>Expiry Date</th>
                            <th>Price</th>
                            <th>Status</th>

                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${xe}" var="xe"> 
                            <tr>
                                <td>${xe.ticketId}</td>
                                <td>${xe.cccd}</td>
                                <td>${xe.vehicleNumber}</td>
                                <td>${xe.issueDate}</td>
                                <td>${xe.expiryDate}</td>
                                <td>${xe.price}</td>
                                <td>Not expired</td>
                               

                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </section>
        <!-- Rooms Section End -->




        <!-- Footer Section Begin -->
        <footer class="footer set-bg" data-setbg="img/footer-bg.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">

                    </div>
                </div>
            </div>

            <div class="container">
                <div class="footer__content">
                    <div class="row">
                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="footer__about">
                                <div class="footer__logo">
                                    <a href="#"><img src="img/logo.png" alt=""></a>
                                </div>
                                <h4>(123) 456-78-91096</h4>
                                <ul>
                                    <li>https://fpt.edu.vn</li>
                                    <li>FPT Education
                                        Hoa Lac High Tech Park, Hanoi, Vietnam
                                        Email: fpteducation@fe.edu.vn</li>
                                </ul>

                            </div>
                        </div>
                        <div class="col-lg-3 offset-lg-1 col-md-5 offset-md-1 col-sm-6">
                            <div class="footer__widget">

                            </div>
                        </div>
                        <div class="col-lg-5 col-md-8 col-sm-12">
                            <div class="footer__newslatter">


                            </div>
                        </div>
                    </div>
                </div>
                <div class="footer__copyright">
                    <div class="row">
                        <div class="col-lg-7 col-md-7">
                            <div class="footer__copyright__text">
                                <p>© Copyright 2019 Hotell Hiroto - Theme by Colorlib.</p>
                            </div>
                        </div>
                        <div class="col-lg-5 col-md-5">
                            <ul class="footer__copyright__links">
                                <li><a href="#">Terms Of Use</a></li>
                                <li><a href="#">Privacy Policy</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
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

