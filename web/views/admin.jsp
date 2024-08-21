<%-- 
    Document   : AdminPage
    Created on : Jul 8, 2024, 3:59:11 PM
    Author     : ai
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <style>
            .container {
                margin-top: 30px;
            }
            .table {
                width: 100%;
                margin-bottom: 1rem;
                color: #212529;
            }
            .table th,
            .table td {
                padding: 2rem; /* Increased padding for better readability */
                vertical-align: middle; /* Center align text vertically */
                border-top: 1px solid #dee2e6;
                height: 50px;
            }
            .table thead th {
                vertical-align: middle; /* Center align text vertically */
                border-bottom: 2px solid #dee2e6;
            }
            .table-striped tbody tr:nth-of-type(odd) {
                background-color: rgba(0, 0, 0, 0.05);
            }
            .table-striped tbody tr:hover {
                background-color: rgba(0, 0, 0, 0.075);
            }
        </style>
    </head>
    <body>
        <%@include file="/components/header.jsp"%>
        <div style="height: 50px"></div>
        <div class="container">
            <h2 style="text-align: center;padding:10px">Manager User</h2>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Username</th>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>Address</th>
                        <th>Role</th>
                        <th>Status</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="history" items="${getAllUser}">
                        <tr>
                            <td>${history.user_id}</td>
                            <td>${history.username}</td>
                            <td>${history.phone}</td>
                            <td>${history.email}</td>
                            <td>${history.address}</td>
                            <c:choose>
                                <c:when test="${history.role eq 1}">
                                    <td>admin</td>
                                </c:when>
                                <c:when test="${history.role eq 2}">
                                    <td>customer</td>
                                </c:when>
                                <c:when test="${history.role eq 3}">
                                    <td>staff</td>
                                </c:when>
                            </c:choose>
                            <c:if test="${sessionScope.currentUser.role == 1}">
                                <c:if test="${history.role != 1 }">
                                    <td>
                                        <button class="btn btn-primary update-btn" data-id="${history.user_id}" data-role="${history.role}">Update</button>
                                    </td>
                                </c:if>
                                <c:if test="${history.role == 1}">
                                    <td></td>
                                </c:if>
                            </c:if> 

                            <c:if test="${sessionScope.currentUser.role == 3}">

                                <td> <a href="viewdetailuser?customerid=${history.user_id}">View detail history user</a>  </td>
                            </c:if>
                        </tr>
                        <!-- Modal for each user -->
                    <div class="modal fade" id="updateModal_${history.user_id}" tabindex="-1" aria-labelledby="updateModalLabel_${history.user_id}" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="updateModalLabel_${history.user_id}">Update User Role</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form id="updateForm_${history.user_id}" method="post" action="updaterole">
                                        <input type="hidden" id="userId_${history.user_id}" name="user_id" value="${history.user_id}">
                                        <div class="mb-3">
                                            <label for="userRole_${history.user_id}" class="form-label">Role</label>
                                            <c:choose>
                                                <c:when test="${history.role == 2}">
                                                    <br>
                                                    <input type="radio" id="userRole_${history.user_id}_staff" name="role" value="3" checked>
                                                    <label for="userRole_${history.user_id}_staff">Staff</label>
                                                    <br>
                                                    <input type="radio" id="userRole_${history.user_id}_admin" name="role" value="1">
                                                    <label for="userRole_${history.user_id}_admin">Admin</label>
                                                </c:when>
                                                <c:when test="${history.role == 3}">
                                                    <input type="radio" id="userRole_${history.user_id}_admin" name="role" value="1" checked>
                                                    <label for="userRole_${history.user_id}_admin">Admin</label>
                                                </c:when>
                                            </c:choose>


                                        </div>
                                        <button type="submit" class="btn btn-primary">Save changes</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End Modal -->
                </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                var updateButtons = document.querySelectorAll('.update-btn');
                updateButtons.forEach(function (button) {
                    button.addEventListener('click', function () {
                        var userId = button.getAttribute('data-id');
                        var userRole = button.getAttribute('data-role');

                        // Hide any open modals first
                        var modals = document.querySelectorAll('.modal');
                        modals.forEach(function (modal) {
                            var bsModal = bootstrap.Modal.getInstance(modal);
                            if (bsModal) {
                                bsModal.hide();
                            }
                        });

                        // Show the modal for the clicked button
                        var updateModal = new bootstrap.Modal(document.getElementById('updateModal_' + userId));
                        updateModal.show();

                        // Set the initial role value in the modal
                        document.getElementById('userRole_' + userId).value = userRole;
                    });
                });
            });
        </script>
    </body>
</html>
