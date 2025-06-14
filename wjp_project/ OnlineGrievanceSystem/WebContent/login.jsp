<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login - Grievance Portal</title>
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
            background-color: #e6e6fa; /* light purple */
        }

        .login-box {
            max-width: 450px;
            margin: auto;
            padding: 40px;
            background: rgba(255, 255, 255, 0.85);
            backdrop-filter: blur(10px);
            border-radius: 15px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.2);
            animation: fadeIn 1s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .form-control:focus, .form-select:focus {
            box-shadow: none;
            border-color: #0d6efd;
        }

        .btn-primary {
            background: linear-gradient(to right, #0d6efd, #6610f2);
            border: none;
            transition: 0.3s ease;
        }

        .btn-primary:hover {
            background: linear-gradient(to right, #6610f2, #0d6efd);
            transform: scale(1.03);
        }

        footer {
            background-color: #000000cc;
            color: #ddd;
        }

        .alert {
            margin-top: 15px;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold" href="index.jsp"><i class="bi bi-shield-lock-fill me-2"></i>Grievance Portal</a>
        <div>
            <a href="register.jsp" class="btn btn-outline-light"><i class="bi bi-person-plus-fill"></i> Register</a>
        </div>
    </div>
</nav>

<!-- Login Container -->
<div class="container d-flex justify-content-center align-items-center flex-grow-1">
    <div class="login-box mt-5">
        <h3 class="text-center mb-4 fw-bold text-primary"><i class="bi bi-person-circle me-2"></i>User / Admin Login</h3>

        <!-- 🔔 Error Message Area -->
        <c:if test="${not empty errorMsg}">
            <div class="alert alert-danger text-center">
                <i class="bi bi-exclamation-triangle-fill me-1"></i> ${errorMsg}
            </div>
        </c:if>

        <!-- ✅ Logout success message -->
        <%
            String logout = request.getParameter("logout");
            if ("success".equals(logout)) {
        %>
            <div class="alert alert-success text-center">
                <i class="bi bi-check-circle-fill me-1"></i> You’ve been logged out successfully.
            </div>
        <%
            }
        %>

        <form action="LoginServlet" method="post" class="mt-3">
            <div class="mb-3">
                <label class="form-label">Email</label>
                <input type="email" name="email" class="form-control" placeholder="Enter your email" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Password</label>
                <input type="password" name="password" class="form-control" placeholder="Enter your password" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Role</label>
                <select name="role" class="form-select">
                    <option value="user">User</option>
                    <option value="admin">Admin</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary w-100">
                <i class="bi bi-box-arrow-in-right me-1"></i>Login
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
