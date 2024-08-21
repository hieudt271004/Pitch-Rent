<%-- 
    Document   : Equipment
    Created on : Jul 7, 2024, 6:40:19 AM
    Author     : ai
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <!-- Custom CSS -->
        <style>
            body {
                background-color: #f8f9fa; /* Light background color */
            }

            .container {
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            h2 {
                color: #343a40;
            }

            .table thead th {
                background-color: #343a40;
                color: #fff;
            }

            .table tbody tr:nth-child(odd) {
                background-color: #f2f2f2;
            }

            .table tbody tr:hover {
                background-color: #e9ecef;
            }

            .quantity-column {
                width: 100px; /* Adjust the width as needed */
            }

            .quantity {
                max-width: 80px; /* Adjust the width as needed */
            }

            .equip-name {
                max-width: 100px;
            }

            .total-price {
                width: 200px;
            }

            img {
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                border-radius: 4px;
            }
        </style>
    </head>
    <body>
        <%@include file="/components/header.jsp"%>

        <div class="container mt-5">
            <c:if test="${sessionScope.currentUser.role == 1}">
                <button class="btn btn-secondary" type="button" data-toggle="modal" data-target="#addEquipmentModal">Thêm Đồ Ăn</button>
            </c:if>
            <!-- Add Equipment Modal -->
            <div class="modal fade" id="addEquipmentModal" tabindex="-1" role="dialog" aria-labelledby="addEquipmentModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="addEquipmentModalLabel">Thêm Đồ Ăn Mới</h5>

                        </div>
                        <div class="modal-body">
                            <form id="addEquipmentForm" action="managefood" method="post">
                                <input type="hidden" name="type" value="2">
                                <div class="form-group">
                                    <label for="equipmentName">Food Name</label>
                                    <input type="text" class="form-control" id="equipmentName" name="food_name" required>
                                </div>
                                <div class="form-group">
                                    <label for="equipmentPrice">Price</label>
                                    <input type="number" class="form-control" id="equipmentPrice" name="price" required>
                                </div>
                                <div class="form-group"  style="margin-top: 10px">
                                    <div class="op-up-up-coming-event">
                                        <input type="file" id="image" name="img" accept="image/gif, image/jpg, image/png" onchange="chooseFile(this)" />
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-primary" style="float: right; margin-top: 10px">Add</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <h2 class="text-center mb-4">Food Store</h2>
            <div class="row">
                <div class="col-md-12">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col">Image</th>
                                <th scope="col">Food Name</th>
                                <th scope="col">Price</th>
                                    <c:if test="${sessionScope.currentUser.role == 1}">
                                    <th scope="col">Action</th>
                                </c:if>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="f" items="${foodList}">
                                <tr class="food-row" data-food-id="${f.food_id}"> 
                                    <td><img src="img/${f.img}" alt="${f.food_name}" style="max-width: 100px;"></td>
                                    <td class="food-name">${f.food_name}</td>
                                    <td class="price">${f.price}</td>
                                    <c:if test="${sessionScope.currentUser.role == 1}">
                                        <td>
                                            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#popup-details-${f.food_id}">Update</button>
                                            <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal${f.food_id}">Delete</button>
                                        </td>
                                    </c:if>
                                </tr>
                                <!-- Update Modal -->
                            <div class="modal fade" id="popup-details-${f.food_id}" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
                                <div class="modal-dialog modal-dialog-centered" style="max-width: 400px">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h1 class="modal-title fs-5" id="exampleModalToggleLabel">Update Detail</h1>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <form action="managefood" method="post">
                                                <input type="hidden" name="food_id" value="${f.food_id}"/> 
                                                <input type="hidden" name="type" value="0">
                                                <div class="form-group">
                                                    <label for="name">Name</label>
                                                    <input type="text" class="form-control" id="equipment_name" name="food_name" value="${f.food_name}" required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="price">Price</label>
                                                    <input type="number" class="form-control" id="price" name="price" value="${f.price}" required>
                                                </div>
                                                <div class="form-group"  style="margin-top: 10px">
                                                    <div class="op-up-up-coming-event">
                                                        <input type="file" id="image" name="img" accept="image/gif, image/jpg, image/png" onchange="chooseFile(this)" />
                                                    </div>
                                                </div>
                                                <button type="submit" class="btn btn-primary" style="float: right; margin-top: 10px">Update</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Delete Confirmation Modal -->
                            <div class="modal fade" id="deleteModal${f.food_id}" tabindex="-1" aria-labelledby="deleteModalLabel${e.equipment_id}" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="deleteModalLabel${f.food_id}">Confirm Delete</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            Are you sure you want to delete ${f.food_name}?
                                        </div>
                                        <div class="modal-footer">
                                            <form action="managefood" method="post">
                                                <input type="hidden" name="food_id" value="${f.food_id}"/> 
                                                <input type="hidden" name="type" value="1">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                                <button type="submit" class="btn btn-danger">Delete</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>

        <!-- JavaScript của Bootstrap -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <!-- Optional: add your own scripts here -->
        <script>
                                                            $('.anyuser').chosen();
                                                            function chooseFile(fileInput) {
                                                                if (fileInput.files && fileInput.files[0]) {
                                                                    var reader = new FileReader();
                                                                    reader.onload = function (e) {
                                                                        console.log(e.target.result);
                                                                        $('#newimage').attr('src', e.target.result);
                                                                        $('#newimage').css("display", "block");
                                                                        //                         console.log($('#image1').attr('src'));
                                                                    };
                                                                    reader.readAsDataURL(fileInput.files[0]);
                                                                }
                                                            }
                                                            
                                                            function chooseFile(fileInput) {
                                                                if (fileInput.files && fileInput.files[0]) {
                                                                    var reader = new FileReader();
                                                                    reader.onload = function (e) {
                                                                        $('#image_profile').attr('src', e.target.result);
                                                                        // Save the image data to local storage only when a file is chosen
                                                                        //localStorage.setItem('imageData', e.target.result);
                                                                    }
                                                                    reader.readAsDataURL(fileInput.files[0]);
                                                                }
                                                            }
                                                            ;
                                                            
                                                            function chooseFileUpdate(fileInput, id) {
                                                                console.log(fileInput.files);
                                                                if (fileInput.files && fileInput.files[0]) {
                                                                    var reader = new FileReader();
                                                                    reader.onload = function (e) {
                                                                        $('#image' + id).attr('src', e.target.result);
                                                                        $('#image' + id).css("display", "block");
                                                                        $('#image' + id).css("width", "90px");
                                                                        $('#deleteimg' + id).css("display", "block");
                                                                    };
                                                                    reader.readAsDataURL(fileInput.files[0]);
                                                                }
                                                            }
                                                            function clearImage(id) {
                                                                //                Event.preventDefault();
                                                                $('#newimage').attr('src', null);
                                                                $('#newimage').css("display", "none");
                                                                $('#image' + id).attr('src', null);
                                                                $('#image' + id).css("display", "none");
                                                                $('#uploadedImage' + id).attr('src', null);
                                                                $('#deleteimg' + id).css("display", "none");
                                                                $('#uploadedImage' + id).attr('value', null);
                                                            }
        </script>

    </body>
</html>