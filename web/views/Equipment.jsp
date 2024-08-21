<%-- 
    Document   : Food
    Created on : Jul 7, 2024, 6:40:19 AM
    Author     : ai
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Food Store</title>
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

            .food-name {
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
            <h2 class="text-center mb-4">Equipment Store</h2>
            <div class="row">
                <div class="col-md-12">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col">Image</th>
                                <th scope="col">Equipment Name</th>
                                <th scope="col">Price</th>
                                <th scope="col">Quantity</th>
                                <th scope="col">Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="e" items="${equipmentList}">
                                <tr class="equipment-row" data-equipment-id="${e.equipment_id}"> 
                                    <td><img src="img/${e.img}" alt="${e.equipment_name}" style="max-width: 100px;"></td>
                                    <td class="equip-name">${e.equipment_name}</td>
                                    <td class="price">${e.price}</td>
                                    <td class="quantity-column">
                                        <input type="number" class="form-control quantity" value="0" min="0" data-price="${e.price}">
                                    </td>
                                    <td class="total-price">0</td>
                                </tr>
                            </c:forEach>
                            <!-- Total row -->
                            <tr>
                                <td colspan="4" class="text-end"><strong>Total:</strong></td>
                                <td id="total-sum">0</td>
                            </tr>
                            <!-- Buy button -->
                            <tr>
                                <td colspan="5" class="text-end">
                                    <button type="button" class="btn btn-primary" id="buyButton">Buy Now</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <form id="dataForm" action="equipment" method="post">
            <input type="hidden" id="jsonData" name="jsonData">
        </form>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <!-- Optional: add your own scripts here -->
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                function updateTotalSum() {
                    let totalSum = 0;
                    const items = [];

                    document.querySelectorAll('.equipment-row').forEach(row => {
                        const id = row.dataset.equipmentId;
                        const quantity = parseInt(row.querySelector('.quantity').value);
                        const price = parseFloat(row.querySelector('.price').textContent);
                        const totalPrice = price * quantity;

                        const totalCell = row.querySelector('.total-price');
                        totalCell.textContent = totalPrice.toFixed(2);

                        if (quantity > 0) {
                            items.push({
                                id: id,
                                quantity: quantity,
                                totalPrice: totalPrice
                            });
                        }

                        totalSum += totalPrice;
                    });

                    document.getElementById('total-sum').textContent = totalSum.toFixed(2);

                    document.getElementById('jsonData').value = JSON.stringify(items);
                }

                const quantityInputs = document.querySelectorAll('.quantity');

                quantityInputs.forEach(input => {
                    input.addEventListener('change', function () {
                        updateTotalSum();
                    });
                });

                document.getElementById('buyButton').addEventListener('click', function () {
                    updateTotalSum();
                    alert("Are you sure to buy it?");

                    document.getElementById('dataForm').submit();
                });

                updateTotalSum();
            });
        </script>

    </body>
</html>
