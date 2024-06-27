<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Hiroto Template">
        <meta name="keywords" content="Hiroto, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>News List</title>

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
            .form-container {
                background-color: #fff;
                padding: 30px;
                border-radius: 8px;
                margin-bottom: 30px;
            }

            .form-container h3 {
                color: #333;
                margin-bottom: 20px;
            }

            .form-container table {
                width: 100%;
                border-collapse: separate;
                border-spacing: 0 10px; /* Add spacing between rows */
            }

            .form-container table th,
            .form-container table td {
                padding: 15px 20px; /* Increase padding for more space */
                text-align: left; /* Align text to the left */
            }

            .form-container table th {
                background-color: #f2f2f2;
                font-weight: bold;
            }

            .form-container table td {
                background-color: #fff;
                vertical-align: top;
                border-bottom: 1px solid #f2f2f2; /* Add a border to the bottom of each cell */
            }

            .form-container table td a {
                color: #007bff;
                text-decoration: none;
            }

            .scrollable-content {
                max-height: 100px;
                overflow-y: auto;
            }

            .search-container {
                display: flex;
                justify-content: flex-end;
                margin-bottom: 20px;
            }

            .search-container input[type="text"],
            .search-container input[type="date"],
            .search-container select {
                padding: 10px;
                margin-right: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            .search-container input[type="submit"] {
                padding: 10px 20px;
                border: none;
                background-color: #007bff;
                color: #fff;
                border-radius: 4px;
                cursor: pointer;
            }

            .search-container input[type="submit"]:hover {
                background-color: #0056b3;
            }

            .title-column {
                width: 15%; /* Reduced width */
            }

            .content-column {
                width: 48%; /* Increased width */
            }

            .link-column {
                width: 7%; /* Reduced width */
            }
        </style>
        <style>
            .scrollable-content {
                max-height: 100px; /* Set the max height */
                overflow-y: auto; /* Enable vertical scrolling */
                display: block; /* Ensure the content is a block element */
            }
        </style>
    </head>
    <body>
        <!-- Page Preloader -->
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

            <div class="offcanvas__language">
                <img src="img/lan.png" alt="">
                <span>English</span>
                <i class="fa fa-angle-down"></i>
                <ul>
                    <li>English</li>
                    <li>Bangla</li>
                </ul>
            </div>
            <div class="offcanvas__auth">
                <ul>
                    <li><a href="#">Login</a></li>
                    <li><a href="#">Register</a></li>
                </ul>
            </div>
        </div>
        <!-- Offcanvas Menu End -->

        <!-- Header Section Begin -->
        <header class="header">
            <div class="header__top">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-7">
                            <!-- Additional Content -->
                        </div>
                        <div class="col-lg-5">
                            <div class="header__top__right">
                                <div class="header__top__auth">
                                    <ul>
                                        <li><a href="#">Login</a></li>
                                        <li><a href="#">Register</a></li>
                                    </ul>
                                </div>
                                <div class="header__top__language">
                                    <img src="img/lan.png" alt="">
                                    <span>English</span>
                                    <i class="fa fa-angle-down"></i>
                                    <ul>
                                        <li>English</li>
                                        <li>Bangla</li>
                                    </ul>
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
                                <a href="home"><img src="img/logo.png" alt=""></a>
                            </div>
                        </div>
                        <div class="col-lg-10">
                            <div class="header__nav">
                                <nav class="header__menu">
                                    <ul class="menu__class">
                                        <li class="active"><a href="home">Home</a></li>
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
                                        <li><a href="./contact.html">Contact</a></li>
                                    </ul>
                                </nav>
                                <div class="header__nav__widget">
                                    <a href="#">Book Now <span class="arrow_right"></span></a>
                                </div>
                            </div>
                        </div>
                        <div class="canvas__open">
                            <span class="fa fa-bars"></span>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- Header Section End -->

        <!-- Hero Section Begin -->
        <br>
        <br>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="hero__text">
                        <h5>WELCOME DORMITORY</h5>
                        <h2 style="color: black">Wishing you wonderful years at university.</h2>
                    </div>
                    <div class="form-container">
                        <h3>News List</h3>
                        <div class="search-container">
                            <form action="listnew" method="get">
                                <input type="text" name="title" value="${param.title}" placeholder="Search by title">
                                <select name="category">
                                    <option value="">Choose Category</option>
                                    <option value="Dorm">Dorm</option>
                                    <option value="Room">Room</option>
                                    <option value="Other">Other</option>
                                </select>
                                <input type="date" name="date"  value="${param.date}">
                                <!--id="dateInput"-->
                                <input type="submit" name="search" value="Search">
                            </form>
                        </div>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th class="title-column">Title</th>
                                    <th>Content</th>
                                    <th>Publish Date</th>
                                    <th>Category</th>
                                    <th>Link</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="news" items="${newsList}">
                                    <tr>
                                        <td>${news.new_id}</td>
                                        <td class="title-column">${news.title}</td>
                                        <td class="scrollable-content">${news.content}</td>
                                        <td>${news.publish_date}</td>
                                        <td>${news.category}</td>
                                        <td><a href="${news.link}" target="_blank">${news.link}</a></td>
                                        <td>
                                            <form action="listnew" method="post">
                                                <input type="hidden" name="action" value="delete">
                                                <input type="hidden" name="new_id" value="${news.new_id}">
                                                <input type="submit" value="Delete" onclick="return confirm('Are you sure you want to delete this news?');">
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>


        <!-- Footer Section Begin -->
        <footer class="footer set-bg" data-setbg="img/footer-bg.jpg">
            <div class="container">
                <div class="footer__content">

                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="footer__about">
                            <div class="footer__logo">
                                <a href="#"><img src="img/logo.png" alt=""></a>
                            </div>
                            <h4>0941384237</h4>
                            <ul>
                                <li>Khu Cong Nghe Cao Hoa Lac, km 29, Dai lo Thang Long, Ha Noi</li>
                                <li>Info.colorlib@gmail.com</li>
                            </ul>
                            <div class="footer__social">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-tripadvisor"></i></a>
                                <a href="#"><i class="fa fa-instagram"></i></a>
                                <a href="#"><i class="fa fa-youtube-play"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="footer__widget">
                            <h6>Our Services</h6>
                            <ul>
                                <li>Free Wi-Fi</li>
                                <li>Easy Booking</li>
                                <li>Free Parking</li>
                                <li>Swimming Pool</li>
                                <li>Restaurant & Bar</li>
                                <li>Hair Salon</li>
                            </ul>
                            <ul>
                                <li>24/7 Reception</li>
                                <li>Car Rental</li>
                                <li>Gym & Yoga</li>
                                <li>Spa & Massage</li>
                                <li>Laundry Service</li>
                                <li>Tour Guide</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3  col-sm-6">
                        <div class="footer__widget">
                            <h6>Travel News</h6>
                            <ul>
                                <li>Weekend in the forest</li>
                                <li>Hiking in the mountains</li>
                                <li>Sea and the beach</li>
                                <li>Romantic trip</li>
                                <li>Family Holidays</li>
                                <li>Travel News</li>
                            </ul>
                            <ul>
                                <li>Weekend in the forest</li>
                                <li>Hiking in the mountains</li>
                                <li>Sea and the beach</li>
                                <li>Romantic trip</li>
                                <li>Family Holidays</li>
                                <li>Travel News</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="footer__widget">
                            <h6>Subscribe</h6>
                            <p>Subscribe to our newsletter to get the latest updates and offers.</p>
                            <form action="#">
                                <input type="email" placeholder="Email">
                                <button type="submit"><i class="fa fa-send-o"></i></button>
                            </form>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="footer__copyright__text">
                                <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                    Copyright &copy;
                                    <script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Footer Section End -->

        <!-- Search model Begin -->
        <div class="search-model">
            <div class="h-100 d-flex align-items-center justify-content-center">
                <div class="search-close-switch"><i class="icon_close"></i></div>
                <form class="search-model-form">
                    <input type="text" id="search-input" placeholder="Search here.....">
                </form>
            </div>
        </div>
        <!-- Search model end -->

        <!-- Js Plugins -->
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/main.js"></script>
    </body>
    <script>
                                         // Hàm ?? ??nh d?ng l?i ngày tháng khi nh?p vào input
                                         document.getElementById('dateInput').addEventListener('input', function (e) {
                                             var inputDate = e.target.value;
                                             if (inputDate.length === 4 || inputDate.length === 7) {
                                                 e.target.value += '-';
                                             }
                                         });
    </script>
</html>
