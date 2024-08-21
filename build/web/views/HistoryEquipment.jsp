<%-- 
    Document   : HistoryEquipment
    Created on : Jul 8, 2024, 3:59:11 PM
    Author     : ai
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Equipment Order History</title>
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
            <h2 style="text-align: center;padding:10px">Equipment Order History</h2>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Equipment Name</th>
                        <th>Quantity</th>
                        <th>Order Date</th>
                        <th>Total Amount</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="history" items="${getHistoryEquipment}">
                        <tr>
                            <td>${history.equipment_name}</td>
                            <td>${history.quantity}</td>
                            <td>${history.order_date}</td>
                            <td>${history.total_amount}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
    </body>
</html>
