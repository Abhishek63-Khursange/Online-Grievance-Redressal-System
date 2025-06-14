<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Register Complaint - Grievance Portal</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(to right, #f8f9fa, #e3f2fd);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        .form-box {
            max-width: 600px;
            margin: auto;
            padding: 30px;
            background-color: white;
            border-radius: 15px;
            box-shadow: 0px 0px 15px rgba(0,0,0,0.1);
        }
    </style>
</head>

<%
    HttpSession sessionCheck = request.getSession(false);
    String email = (sessionCheck != null) ? (String) sessionCheck.getAttribute("userEmail") : null;
    String role = (sessionCheck != null) ? (String) sessionCheck.getAttribute("role") : null;

    if (email == null || !"user".equals(role)) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold" href="dashboard.jsp">
            <i class="bi bi-flag-fill me-1"></i>Grievance Portal
        </a>
        <div class="d-flex">
            <a href="dashboard.jsp" class="btn btn-outline-light me-2"><i class="bi bi-house-door"></i> Dashboard</a>
            <a href="LogoutServlet" class="btn btn-outline-danger"><i class="bi bi-box-arrow-right"></i> Logout</a>
        </div>
    </div>
</nav>

<!-- Complaint Form -->
<div class="container my-5">
    <div class="form-box">
        <h3 class="text-center mb-4"><i class="bi bi-exclamation-triangle-fill text-warning"></i> Register a Complaint</h3>

        <form action="ComplaintServlet" method="post">
            <div class="mb-3">
                <label for="category" class="form-label">Complaint Category</label>
                <select class="form-select" name="category" id="category" required>
                    <option value="">-- Select Category --</option>
                    <option value="Infrastructure">Infrastructure</option>
                    <option value="Staff Behavior">Staff Behavior</option>
                    <option value="Academic Issues">Academic Issues</option>
                    <option value="Others">Others</option>
                </select>
            </div>

            <div class="mb-3">
                <label for="description" class="form-label">Complaint Description</label>
                <textarea class="form-control" name="description" id="description" rows="5"
                          placeholder="Provide detailed information about your issue" required></textarea>
            </div>

            <div class="text-center">
                <button type="submit" class="btn btn-primary w-100">
                    <i class="bi bi-pencil-square me-1"></i> Submit Complaint
                </button>
            </div>
        </form>
    </div>
</div>

<!-- Footer -->
<footer class="bg-dark text-white text-center py-3 mt-auto">
    <small>&copy; 2025 Grievance Portal. All rights reserved.</small>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
