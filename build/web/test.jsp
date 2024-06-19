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
            table {
                width: 100%;
                border-collapse: collapse;
            }
            table, th, td {
                border: 1px solid black;
            }
            th, td {
                padding: 8px;
                text-align: left;
            }
            th {
                background-color: #f0a500; /* Light orange background for headers */
            }
            .not-reply-yet {
                color: red;
            }
            .action-link {
                font-weight: bold;
                text-decoration: none;
                color: #000; /* Black color */
            }
            .action-link:hover,
            .action-link:active,
            .action-link:visited {
                color: #000; /* Ensure the color remains black when hovered, clicked, or visited */
            }
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
            .form-label {
                color: white;
                font-size: 2.2rem;
            }
            .form-control {
                font-size: 2rem;
                max-width: 500px; /* Adjust the width of text inputs */
            }
            .form-select {
                font-size: 2rem;
                max-width: 500px; /* Adjust the width of select inputs */
            }
            .btn-primary {
                font-size: 2rem;
            }
            .form-container {
                max-width: 700px; /* Adjust the width of the form container */
                padding: 20px;
                background-color: #343a40;
                border-radius: 8px;
            }
            .centered-container {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
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
                                        <h1 style="color: white; font-size: 5rem">List Request</h1>
                                        <form action="${pageContext.request.contextPath}/response" method="post">
                                            <table border="1">
                                                <tr>
                                                    <th>Student ID</th>
                                                    <th>Room ID</th>
                                                    <th>Create Date</th>
                                                    <th>Request</th>
                                                    <th>Response</th>
                                                    <th>Status</th>
                                                    <th>Request type</th>
                                                    <th>Function</th>
                                                </tr>
                                                <c:forEach var="request" items="${req}">
                                                    <tr style="background-color: #ffffff;">
                                                        <td>${request.users_id}</td>
                                                        <td>${request.room_id}</td>
                                                        <td>${request.request_date}</td>
                                                        <td>${request.request}</td>
                                                        <td>${request.Response}</td>
                                                        <c:if test="${request.request_status == null}">
                                                            <td><a style="color: red">not reply yet</a></td>
                                                        </c:if>
                                                        <c:if test="${request.request_status != null}">
                                                            <td>${request.request_status}</td>
                                                        </c:if>

                                                        <td>
                                                            <!-- Detail -->
                                                            <a href="javascript:void(0);" onclick="submitForm('${request.request_id}', 'detail')" class="btn btn-danger btn-lg" style="font-weight: bold;
                                                               background-color: #E9AD28">Detail</a>

                                                            <!-- Delete -->
                                                            <a href="javascript:void(0);" onclick="submitForm('${request.request_id}', 'delete')" class="btn btn-danger btn-lg" style="font-weight: bold;
                                                               background-color: #E9AD28">Delete</a>
                                                        </td>
                                                    </tr>

                                                    <script>
                                                        function submitForm(req_id, action) {
                                                            var form = document.createElement("form");
                                                            form.setAttribute("method", "post");
                                                            form.setAttribute("action", "${pageContext.request.contextPath}/request");

                                                            // Create hidden input for req_id
                                                            var req_idInput = document.createElement("input");
                                                            req_idInput.setAttribute("type", "hidden");
                                                            req_idInput.setAttribute("name", "req_id");
                                                            req_idInput.setAttribute("value", req_id);
                                                            form.appendChild(req_idInput);

                                                            // Create hidden input for action
                                                            var actionInput = document.createElement("input");
                                                            actionInput.setAttribute("type", "hidden");
                                                            actionInput.setAttribute("name", "other");
                                                            actionInput.setAttribute("value", action);
                                                            form.appendChild(actionInput);

                                                            // Append form to document body and submit
                                                            document.body.appendChild(form);
                                                            form.submit();
                                                        }
                                                    </script>
                                                </c:forEach>
                                            </table>
                                            <br>
                                            <button type="submit" class="btn btn-danger btn-lg" style="font-weight: bold;
                                                    background-color: #E9AD28" name="other" value="back">Back to add Request</button>
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
