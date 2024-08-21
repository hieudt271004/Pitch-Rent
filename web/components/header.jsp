<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <style>
            body {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Montserrat', sans-serif;
            }
            .navbar1 {
                background: coral;
                position: fixed;
                top: 0;
                width: 100%;
                z-index: 18;
                opacity: 0.97;
            }
            .logo1 img {
                height: 45px;
                margin-left: 15px;
            }
            .main-nav1 a {
                color: #fff;
                text-decoration: none;
                margin-right: 1.5rem;
                font-size: 20px;
            }
            .main-nav1 a:hover {
                color: #f00;
            }
            .auth-btn1 button {
                padding: 0.75rem 2rem;
                border-radius: 20px;
                margin: 0 15px;
                cursor: pointer;
            }
            .register1 {
                background: black;
                color: white;
                border: 2px solid white;
            }
            .login1 {
                background: linear-gradient(210deg, #993434, #ff000e);
                color: white;
                border: none;
            }
            .dropdown1 {
                position: relative;
                display: inline-block;
            }
            .dropdown-content1 {
                display: none;
                position: absolute;
                background-color: #020817;
                min-width: 180px;
                z-index: 1;
                border-radius: 10px;
                right:20px;
            }
            .dropdown-title1 {
                display: flex;
                padding: 10px;
                color: white;
            }
            .dropdown-content1 a {
                color: white;
                padding: 12px 16px;
                text-decoration: none;
                display: block;

            }
            .dropdown-content1 a:hover {
                color: red;
            }
            .dropdown1:hover .dropdown-content1 {
                display: block;
            }
            .username1 {
                margin-right: 30px;
                font-size: 18px;
                margin-top: 4px;
            }
        </style>
    </head>
    <body>
        <div style="height: 50px"></div>
        <nav class="navbar1 navbar navbar-expand-lg navbar-light">
            <div class="container-fluid container1">
                <div class="logo1">
                    <a href="home">
                        <img src="img/fpt.jpg" alt="logoFPT">
                    </a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="navbar-nav main-nav1">
                        <li class="nav-item">
                            <a class="nav-link" href="home" style="color: red;">Trang chủ</a>
                        </li>
                        <c:if test="${sessionScope.currentUser.role == 2}">
                            <li class="nav-item">
                                <a class="nav-link" href="booking">Đặt sân </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="">Tin tức</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="equipment">Phụ kiện</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="food">Đồ ăn</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Giới thiệu</a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.currentUser.role == 3}">
                            <li class="nav-item">
                                <a class="nav-link" href="admin">Quản Lí</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="booking">Đặt sân </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="">Tin tức</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="equipment">Phụ kiện</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="food">Đồ ăn</a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.currentUser.role == 1}">
                            <li class="nav-item">
                                <a class="nav-link" href="admin">Quản lí người dùng</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="managebooking">Quản lí Sân</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="manageequipment">Quản lí Phụ kiện</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="managefood">Quản lí Đồ ăn</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Giới thiệu</a>
                            </li>
                        </c:if>
                    </ul>
                </div>

                <c:if test="${sessionScope.currentUser != null}">
                    <div class="auth-btn1 dropdown1">
                        <div class="dropdown-title1">
                            <span class="material-symbols-outlined" style="margin-right:10px">
                                <img src="https://th.bing.com/th/id/OIP.HVfKqvRnZdWUc2fsEkSAKgAAAA?w=350&h=350&rs=1&pid=ImgDetMain" width="100%" height="50px" alt="alt"/>
                            </span>
                            <div class="username1">${sessionScope.currentUser.email}</div>
                        </div>
                        <div class="dropdown-content1">
                            <a href="">Thông tin cá nhân</a>
                            <a href="historybooking">Lịch sử dặt sân</a>
                            <a href="historyequipment">Lịch sử mua phụ kiện</a>
                            <a href="historyfood">Lịch sử mua đồ ăn</a>
                            <a href="logout">Đăng xuất</a>
                        </div>
                    </div>
                </c:if>
            </div>
        </nav>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
