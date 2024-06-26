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
            /* Custom CSS for table */
            table {
                width: 500px;
                margin-top: 20px;
                margin-bottom: 20px;
                border-spacing: 0; /* Remove space between table cells */
                border: none; /* Remove table border */
                border-radius: 10px; /* Border radius for table */
                overflow: hidden; /* Ensure content inside table does not overflow rounded corners */
            }

            th, td {
                padding: 8px;
                text-align: left;
                border-bottom: 1px solid #ddd; /* Bottom border for each cell */
                border-top: none; /* Remove top border */
                border-left: none; /* Remove left border */
                border-right: none; /* Remove right border */
            }

            th {
                background-color: #f0a500; /* Header background color */
                color: white; /* Header text color */
                font-weight: bold;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2; /* Even rows background color */
            }

            tr:hover {
                background-color: #ddd; /* Hover row background color */
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
                <img src="img/profile.png" alt="">
                <span>Profile</span>
            </div>
            <div class="offcanvas__auth">
                <ul>
                    <li><a href="#">Login</a></li>
                    <li><a href="#">Register</a></li>
                </ul>
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
                                <li><span class="icon_pin_alt"></span> 96 Ernser Vista Suite 437, NY, US</li>
                                <li><span class="icon_phone"></span> (123) 456-78-910</li>
                            </ul>
                        </div>
                        <div class="col-lg-5">
                            <div class="header__top__right">
                                <div class="header__top__auth">
                                    <ul>
                                        <li><a href="#">Login</a></li>
                                        <li><a href="#">Register</a></li>
                                    </ul>
                                </div>
                                <div class="profile__button profile__button--black">
                                    <i class="fa fa-user"></i>
                                    <span><a href="profile/Profile.jsp">Profile</a></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="header__nav__option">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-2">
                            <div class="header__logo">
                                <a href="./index.jsp"><img src="img/logo.png" alt=""></a>
                            </div>
                        </div>
                        <div class="col-lg-10">
                            <div class="header__nav">
                                <nav class="header__menu">
                                    <ul class="menu__class">
                                        <li class="active"><a href="./index.jsp">Home</a></li>
                                        <li><a href="./rooms.html">Rooms</a></li>
                                        <li><a href="./about.html">About Us</a></li>
                                        <li><a href="#">Pages</a>
                                            <ul class="dropdown">
                                                <li><a href="./about.html">About Us</a></li>
                                                <li><a href="./room-details.html">Room Details</a></li>
                                                <li><a href="./blog-details.html">Blog Details</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="./blog.html">News</a></li>
                                        <li><a href="./request">Request</a></li>
                                    </ul>
                                </nav>
                                <div class="header__nav__widget">
                                    <a href="#">Book Now <span class="arrow_right"></span></a>
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
        <section class="hero spad set-bg" data-setbg="img/hero.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="col-xxl-8 mb-5 mb-xxl-0">
                            <div class="bg-secondary-soft px-4 py-5 rounded">
                                <div class="row g-3">
                                    <div class="container mt-5">
                                        <h1 style="color: white; font-size: 5rem">My Request</h1>
                                        <form action="${pageContext.request.contextPath}/request" method="post">
                                            <table border="1">
                                                <tr style="background-color: #ffffff;">
                                                    <td style="width: 150px"><label for="studentName" class="form-label" style="color: black">Title</label></td>
                                                    <td><input type="text" class="form-control" id="studentName" name="studentName" value="${Req.request_type} - ${sessionScope.book.room_id}" readonly></td>
                                                </tr>
                                                <tr style="background-color: #ffffff;">
                                                    <td style="width: 150px"><label for="studentName" class="form-label" style="color: black">Student Name</label></td>
                                                    <td><input type="text" class="form-control" id="studentName" name="studentName" value="${sessionScope.data.name}" readonly></td>
                                                </tr>
                                                <tr style="background-color: #ffffff;">
                                                    <td><label for="studentId" class="form-label" style="color: black">Student ID</label></td>
                                                    <td><input type="text" class="form-control" id="studentId" name="studentId" value="${sessionScope.data.id}" readonly></td>
                                                </tr>
                                                <tr style="background-color: #ffffff;">
                                                    <td><label for="roomId" class="form-label" style="color: black">Room ID</label></td>
                                                    <td><input type="text" class="form-control" id="roomId" name="roomId" value="${sessionScope.book.room_id}" readonly></td>
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
                                                    <td><label for="roomId" class="form-label" style="color: black">Reply</label></td>
                                                    <td><input type="text" class="form-control" id="roomId" name="roomId" value="${Req.response}" readonly></td>
                                                </tr>
                                                <tr style="background-color: #ffffff;">
                                                    <td><label for="roomId" class="form-label" style="color: black">Status</label></td>

                                                    <c:if test="${Req.request_status == null}">
                                                        <td><a style="color: red">not reply yet</a></td>
                                                    </c:if>
                                                    <c:if test="${Req.request_status != null}">
                                                        <td><input type="text" class="form-control" id="roomId" name="roomId" value="${Req.request_status}" readonly> </td>
                                                        </c:if>
                                                </tr>

                                            </table>
                                            <br>
                                            <button type="submit" class="btn-back" name="other" value="back">Back to add Request</button>
                                            <button type="submit" class="btn-back" name="mess" value="list">Back to list Request</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Hero Section End -->

        <!-- Footer Section Begin -->
        <footer class="footer set-bg" data-setbg="img/footer-bg.jpg">
            <div class="container">
                <div class="footer__content">
                    <div class="row">
                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="footer__about">
                                <div class="footer__logo">
                                    <a href="#"><img src="img/logo.png" alt=""></a>
                                </div>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                    tempor incididunt ut labore dolore magna aliqua.</p>
                                <div class="footer__social">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-youtube-play"></i></a>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="footer__widget">
                                <h5>Quick Links</h5>
                                <ul>
                                    <li><a href="#">About</a></li>
                                    <li><a href="#">Blogs</a></li>
                                    <li><a href="#">Contact</a></li>
                                    <li><a href="#">FAQ</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="footer__widget">
                                <h5>Support</h5>
                                <ul>
                                    <li><a href="#">Privacy Policy</a></li>
                                    <li><a href="#">Terms & Conditions</a></li>
                                    <li><a href="#">Sitemap</a></li>
                                    <li><a href="#">Help</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="footer__widget">
                                <h5>Newsletter</h5>
                                <p>For business professionals caught between high OEM price and mediocre print and graphic output.</p>
                                <form action="#">
                                    <input type="text" placeholder="Email">
                                    <button type="submit"><i class="fa fa-send-o"></i></button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="footer__copyright">
                    <div class="row">
                        <div class="col-lg-6 col-md-6">
                            <div class="footer__copyright__text">
                                <p>&copy; 2024 All rights reserved</p>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <div class="footer__copyright__links">
                                <a href="#">Terms & Conditions</a>
                                <a href="#">Privacy Policy</a>
                                <a href="#">Sitemap</a>
                            </div>
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
