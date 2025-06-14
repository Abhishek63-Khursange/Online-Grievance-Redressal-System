<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Register - Grievance Portal</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            min-height: 100vh;
            margin: 0;
            display: flex;
            flex-direction: column;
            background: linear-gradient(270deg, #00bcd4, #2196f3, #673ab7);
            background-size: 600% 600%;
            animation: gradientMove 15s ease infinite;
        }

        @keyframes gradientMove {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .register-box {
            max-width: 500px;
            margin: auto;
            padding: 40px;
            background: rgba(255, 255, 255, 0.85);
            backdrop-filter: blur(10px);
            border-radius: 15px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.2);
            animation: fadeSlide 1s ease-in-out;
        }

        @keyframes fadeSlide {
            from { opacity: 0; transform: translateY(-30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .form-control:focus {
            box-shadow: none;
            border-color: #2196f3;
        }

        .btn-primary {
            background: linear-gradient(to right, #2196f3, #673ab7);
            border: none;
            transition: 0.3s ease;
        }

        .btn-primary:hover {
            background: linear-gradient(to right, #673ab7, #2196f3);
            transform: scale(1.03);
        }

        footer {
            background-color: #000000cc;
            color: #ddd;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold" href="index.jsp"><i class="bi bi-person-plus-fill me-2"></i>Grievance Portal</a>
        <div>
            <a href="login.jsp" class="btn btn-outline-light"><i class="bi bi-box-arrow-in-right"></i> Login</a>
        </div>
    </div>
</nav>

<!-- Registration Form -->
<div class="container d-flex justify-content-center align-items-center flex-grow-1">
    <div class="register-box mt-5">
        <h3 class="text-center mb-4 fw-bold text-primary"><i class="bi bi-person-fill-add me-2"></i>User Registration</h3>

        <form action="RegisterServlet" method="post">
            <div class="mb-3">
                <label class="form-label">Full Name</label>
                <input type="text" name="name" class="form-control" placeholder="Enter your full name" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Email Address</label>
                <input type="email" name="email" class="form-control" placeholder="example@mail.com" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Password</label>
                <input type="password" name="password" class="form-control" placeholder="Create a password" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Phone Number</label>
                <input type="text" name="phone" class="form-control" placeholder="10-digit phone number" required>
            </div>
            <button type="submit" class="btn btn-primary w-100">
                <i class="bi bi-person-check-fill me-1"></i>Register
            </button>
        </form>
    </div>
</div>

<!-- Footer -->
<footer class="text-center py-3 mt-auto">
    <small>&copy; 2025 Grievance Portal. All Rights Reserved.</small>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
