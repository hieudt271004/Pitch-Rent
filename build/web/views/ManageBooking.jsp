<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking Page</title>
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
                padding: 1rem; /* Increased padding for better readability */
                vertical-align: middle; /* Center align text vertically */
                border-top: 1px solid #dee2e6;
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
            input[type="date"] {
                padding: 0.5rem 1rem; /* Adjusted padding for input */
                font-size: 1rem;
                line-height: 2;
                color: #495057;
                background-color: #fff;
                background-clip: padding-box;
                border: 1px solid #ced4da;
                border-radius: 0.25rem;
                transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
                width: 200px;
                margin-right: 10px; /* Spacing between input and button */
            }
            .btn-primary {
                padding: 0.5rem 1rem; /* Adjusted padding for button */
            }
            .status-booked {
                background-color: #dc3545;
                color: white;
                padding: 0.5rem 1rem;
                border-radius: 0.25rem;
                display: inline-block;
            }
            .status-available {
                padding: 0.5rem 1rem;
                border-radius: 0.25rem;
                display: inline-block;
            }
            .check-date {
                font-weight: bold;
                font-size: 1.2rem;
                color: #007bff;
                margin-bottom: 20px;
                display: block;
            }
        </style>
    </head>
    <body>
        <%@include file="/components/header.jsp"%>
        <div style="height: 50px"></div>
        <div class="container">
            <c:if test="${sessionScope.currentUser.role == 1}">
                <button type="button" class="btn btn-secondary mb-3" data-bs-toggle="modal" data-bs-target="#addFieldTimeModal">
                    Thêm Lịch Sân
                </button>
            </c:if>
            <h2 class="text-center mb-4">Manage Booking</h2>
            <h4 style="color: red" class="modal-title" id="addEquipmentModalLabel">${error}</h4>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Field ID</th>
                        <th>Start Time</th>
                        <th>End Time</th>
                        <th>Price</th>
                            <c:if test="${sessionScope.currentUser.role == 1}">
                            <th>Action</th>
                            </c:if>
                    </tr>
                </thead>
                <c:forEach var="fieldTime" items="${fieldTimelist}">
                    <tr>
                        <td>${fieldTime.fieldId}</td>
                        <td>${fieldTime.startTime}</td>
                        <td>${fieldTime.endTime}</td>
                        <td>${fieldTime.price}</td>
                        <c:if test="${sessionScope.currentUser.role == 1}">
                            <td>
                                <button type="button" class="btn btn-success status-available" data-bs-toggle="modal" data-bs-target="#fieldInfoModal${fieldTime.fieldTimeId}">
                                    Update
                                </button>
                                <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteFieldModal${fieldTime.fieldTimeId}">
                                    Delete
                                </button>
                                <!-- Update Modal -->
                                <div class="modal fade" id="fieldInfoModal${fieldTime.fieldTimeId}" tabindex="-1" aria-labelledby="fieldInfoModalLabel${fieldTime.fieldTimeId}" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title">Update Field Details</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <form id="updateFieldForm${fieldTime.fieldId}" action="managebooking" method="post">
                                                <div class="modal-body">
                                                    <div class="mb-3">
                                                        <label for="startTime${fieldTime.fieldTimeId}" class="form-label">Start Time</label>
                                                        <input type="time" class="form-control" id="startTime${fieldTime.fieldTimeId}" name="startTime" value="${fieldTime.startTime}" required>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label for="endTime${fieldTime.fieldTimeId}" class="form-label">End Time</label>
                                                        <input type="time" class="form-control" id="endTime${fieldTime.fieldTimeId}" name="endTime" value="${fieldTime.endTime}" required>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label for="price${fieldTime.fieldTimeId}" class="form-label">Price</label>
                                                        <input type="number" class="form-control" id="price${fieldTime.fieldTimeId}" name="price" value="${fieldTime.price}" required>
                                                    </div>
                                                    <input type="hidden" name="fieldTimeId" value="${fieldTime.fieldTimeId}" />
                                                    <input type="hidden" name="type" value="0" />
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="submit" class="btn btn-primary">
                                                        Update
                                                    </button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <!-- Delete Modal -->
                                <div class="modal fade" id="deleteFieldModal${fieldTime.fieldTimeId}" tabindex="-1" aria-labelledby="deleteFieldModalLabel${fieldTime.fieldTimeId}" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="deleteFieldModalLabel${fieldTime.fieldTimeId}">Confirm Delete</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <p>Are you sure you want to delete this field time?</p>
                                                <p>Start Time: ${fieldTime.startTime}</p>
                                                <p>End Time: ${fieldTime.endTime}</p>
                                                <p>Price: ${fieldTime.price}</p>
                                            </div>
                                            <div class="modal-footer">
                                                <form id="deleteFieldForm${fieldTime.fieldTimeId}" action="managebooking" method="post">
                                                    <input type="hidden" name="fieldTimeId" value="${fieldTime.fieldTimeId}" />
                                                    <input type="hidden" name="type" value="1" />

                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                                    <button type="submit" class="btn btn-danger">Delete</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </c:if>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <!-- Add Field Time Modal -->
        <div class="modal fade" id="addFieldTimeModal" tabindex="-1" aria-labelledby="addFieldTimeModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addFieldTimeModalLabel">Add New Field Time</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form id="addFieldTimeForm" action="managebooking" method="post">
                        <input type="hidden" name="type" value="2">
                        <div class="modal-body">
                            <div class="mb-3">
                                <label for="startTime" class="form-label">Start Time</label>
                                <input type="time" class="form-control" id="startTime" name="startTime" required>
                            </div>
                            <div class="mb-3">
                                <label for="endTime" class="form-label">End Time</label>
                                <input type="time" class="form-control" id="endTime" name="endTime" required>
                            </div>
                            <div class="mb-3">
                                <label for="price" class="form-label">Price</label>
                                <input type="number" class="form-control" id="price" name="price" required>
                            </div>
                            <div class="mb-3">
                                <label for="place" class="form-label">Location</label>
                                <select name="location" class="form-control">
                                    <option value="1">Sân 1</option>
                                    <option value="2">Sân 2</option>
                                </select>

                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-primary">Add</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
    </body>
</html>
