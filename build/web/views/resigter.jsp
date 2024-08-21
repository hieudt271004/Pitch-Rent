<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <style>
            body {
                background-color: #f8f9fa;
                background-image: url('https://i.pinimg.com/736x/0e/fd/9e/0efd9e4b5a627cdbc2ae55ede2db4153.jpg');
                background-size: cover;
                background-position: center;
                height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                overflow: hidden;
            }
            .card {
                padding: 20px;
                border-radius: 15px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            .form-control {
                border-radius: 10px;
            }
            .btn-primary {
                border-radius: 10px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-5">
                    <div class="card">
                        <h2 class="text-center mb-4">Register</h2>
                        <% 
         String errorMessage = (String) request.getAttribute("errorMessage");
         if (errorMessage != null) { 
                        %>
                        <div class="alert alert-danger" role="alert">
                            <%= errorMessage %>
                        </div>
                        <% 
                            } 
                        %>
                        <form action="resgiter" method="post">
                            <div class="mb-3">
                                <label for="username" class="form-label">Username</label>
                                <input type="text" class="form-control" id="username" name="username" required>
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Password</label>
                                <input type="password" class="form-control" id="password" name="password" required>
                            </div>
                            <div class="mb-3">
                                <label for="phone" class="form-label">Phone</label>
                                <input type="number" class="form-control" id="phone" name="phone" required>
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input type="email" class="form-control" id="email" name="email" required>
                            </div>
                            <div class="mb-3">
                                <label for="address" class="form-label">Address</label>
                                <textarea class="form-control" id="address" name="address" rows="4" required></textarea>
                            </div>
                            <div class="d-grid gap-2">
                                <button type="submit" class="btn btn-primary btn-block">Register</button>
                            </div>
                        </form>
                        <div class="mt-3 text-center">
                            <a href="login" class="link-primary">Back to login</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Bootstrap JS and dependencies -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>