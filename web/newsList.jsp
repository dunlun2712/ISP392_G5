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
                border-spacing: 0 10px;
            }

            .form-container table th,
            .form-container table td {
                padding: 15px 20px;
                text-align: left;
            }

            .form-container table th {
                background-color: #f2f2f2;
                font-weight: bold;
            }

            .form-container table td {
                background-color: #fff;
                vertical-align: top;
                border-bottom: 1px solid #f2f2f2;
            }

            .form-container table td a {
                color: #007bff;
                text-decoration: none;
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
                width: 15%;
            }

            .content-column {
                width: 48%;
            }

            .link-column {
                width: 7%;
            }
        </style>
        <style>
            .scrollable-content {
                max-height: 100px;
                overflow-y: auto;
                display: block;
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
                                <input type="date" name="date" value="${param.date}">
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
                                        <td class="content-column">
                                            <div class="scrollable-content" id="content${news.new_id}" style="display: none;">
                                                ${news.content}
                                            </div>
                                            <button onclick="toggleContent(${news.new_id})">Show</button>
                                        </td>
                                        <td>${news.publish_date}</td>
                                        <td>${news.category}</td>
                                        <td class="link-column"><a href="${news.link}">Read more</a></td>
                                        <td><form action="listnew" method="post">
                                                <input type="hidden" name="action" value="delete">
                                                <input type="hidden" name="new_id" value="${news.new_id}">
                                                <input type="submit" value="Delete" onclick="return confirm('Are you sure you want to delete this news?');">
                                            </form></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
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
                                                        function toggleContent(id) {
                                                            var content = document.getElementById('content' + id);
                                                            var button = content.nextElementSibling;
                                                            if (content.style.display === 'none') {
                                                                content.style.display = 'block';
                                                                button.textContent = 'Hide';
                                                            } else {
                                                                content.style.display = 'none';
                                                                button.textContent = 'Show';
                                                            }
                                                        }
        </script>
    </body>
</html>
