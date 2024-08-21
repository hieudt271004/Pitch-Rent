<%-- 
    Document   : Home
    Created on : Jul 7, 2024, 5:37:31 AM
    Author     : ai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <style>

            .carousel-item img {
                height: 1000px;
            }
            .landing-page-content {
                text-align: center;
                padding: 50px;
            }
            .landing-page-content h1 {
                font-size: 3rem;
                margin-bottom: 20px;
            }
            .landing-page-content p {
                font-size: 1.2rem;
            }
        </style>
    </head>
    <body>
        <%@include file="/components/header.jsp"%>
        <div style="height:35px"></div>
        <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
            </div>
            <div class="carousel-inner">

                <div class="carousel-item active">
                    <img src="https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/09/hinh-nen-bong-da.jpg" class="d-block w-100" alt="Football 2">
                </div>
                <div class="carousel-item ">
                    <img src="https://thethaodonga.com/wp-content/uploads/2023/04/hinh-nen-cau-thu-bong-da2.jpg" class="d-block w-100" alt="Football 1">
                </div>

                <div class="carousel-item">
                    <img src="https://thethaodonga.com/wp-content/uploads/2023/05/hinh-anh-qua-bong-da-dep-2.jpg" class="d-block w-100" alt="Football 3">
                </div>
                <div class="carousel-item">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzIwmyOqIDeEeNSHfo2y0lUatnQlw8RxzN9Q&s" class="d-block w-100" alt="Football 4">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>

        <div class="landing-page-content">
            <h1>Welcome to Football Mania</h1>
            <p>Your ultimate destination for all football updates, news, and events. Join us to stay updated with the latest happenings in the world of football.</p>
        </div>
        <!-- Bootstrap JS and dependencies -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
