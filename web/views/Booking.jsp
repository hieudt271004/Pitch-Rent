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
            <span class="check-date">Check Date: ${checkDate}</span>
            <h2>Field Time Schedule</h2>
            <form action="booking" method="get"> 
                <div class="mb-3" style="display: flex; align-items: center;">
                    <label for="checkDate" class="form-label">Choose date to check status on day:</label>
                    <input type="date" id="checkDate" name="checkDate" class="form-control" value="${checkDate}">
                    <button type="submit" class="btn btn-primary">Check</button>
                </div>
            </form>

            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Field ID</th>
                        <th>Start Time</th>
                        <th>End Time</th>
                        <th>Price</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>

                    <c:forEach var="fieldTime" items="${fieldTimelist}">
                        <tr>
                            <td>${fieldTime.fieldId}</td>
                            <td>${fieldTime.startTime}</td>
                            <td>${fieldTime.endTime}</td>
                            <td>${fieldTime.price}</td>
                            <c:set var="isBooked" value="false" />
                            <c:forEach var="book" items="${listAllFieldTimeOnDay}">
                                <c:if test="${book.fieldTimeId == fieldTime.fieldTimeId}">
                                    <c:set var="isBooked" value="true" />
                                </c:if>
                            </c:forEach>
                            <td>
                                <c:choose>
                                    <c:when test="${isBooked}">
                                        <span class="status-booked">Booked</span>
                                    </c:when>
                                    <c:otherwise>
                                        <button type="button" class="btn btn-success status-available" data-bs-toggle="modal" data-bs-target="#fieldInfoModal${fieldTime.fieldTimeId}">
                                            Available
                                        </button>

                                        <!-- Modal -->
                                        <div class="modal fade" id="fieldInfoModal${fieldTime.fieldTimeId}" tabindex="-1" aria-labelledby="fieldInfoModalLabel${fieldTime.fieldTimeId}" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="fieldInfoModalLabel${fieldTime.fieldTimeId}">Field Details</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <form id="bookNowForm${fieldTime.fieldId}" action="fieldtimeorder" method="post">
                                                        <div class="modal-body">
                                                            <p>ID: ${fieldTime.fieldTimeId}</p>
                                                            <p>Field ID: ${fieldTime.fieldId}</p>
                                                            <p>Start Time: ${fieldTime.startTime}</p>
                                                            <p>End Time: ${fieldTime.endTime}</p>
                                                            <p>Price: ${fieldTime.price}</p>
                                                            <input type="hidden" name="checkDate" value="${checkDate}" />
                                                            <input type="hidden" name="fieldId" value="${fieldTime.fieldTimeId}" />
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button class="btn btn-primary">
                                                                Book Now
                                                            </button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>

                </tbody>
            </table>
        </div>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
        <script src="text">
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
