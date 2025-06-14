<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background: #f0f2f5;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .navbar {
            background: linear-gradient(90deg, #6610f2, #6f42c1);
        }

        .card {
            border: none;
        }

        .card-header {
            background: linear-gradient(90deg, #6610f2, #6f42c1);
        }

        .card-header h4 {
            color: #fff;
        }

        .btn-primary {
            background: linear-gradient(to right, #6610f2, #6f42c1);
            border: none;
        }

        .btn-primary:hover {
            background: linear-gradient(to right, #6f42c1, #6610f2);
        }

        .btn-outline-danger:hover {
            background-color: #dc3545;
            color: #fff;
        }

        footer {
            margin-top: auto;
            background-color: #343a40;
            color: #ccc;
            padding: 10px 0;
            text-align: center;
        }

        .table thead {
            background-color: #343a40;
            color: #fff;
        }

        .form-select, .form-control {
            font-size: 0.9rem;
        }

        .badge {
            font-size: 0.85rem;
        }
        
        .btn:hover {
    transform: scale(1.05);
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
}
        
        
        
    </style>
</head>

<%
    HttpSession sessionCheck = request.getSession(false);
    String email = (sessionCheck != null) ? (String) sessionCheck.getAttribute("userEmail") : null;
    String role = (sessionCheck != null) ? (String) sessionCheck.getAttribute("role") : null;

    if (email == null || !"admin".equals(role)) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark shadow">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold" href="#"><i class="bi bi-shield-lock-fill"></i> Admin Panel</a>
        <ul class="navbar-nav ms-auto align-items-center gap-2">
            <li class="nav-item">
                <span class="nav-link">Welcome: <strong><%= email %></strong></span>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="userList.jsp"><i class="bi bi-people-fill"></i> Manage Users</a>
            </li>
            <li class="nav-item">
                <a class="btn btn-outline-danger btn-sm" href="LogoutServlet"><i class="bi bi-box-arrow-right"></i> Logout</a>
            </li>
        </ul>
    </div>
</nav>

<!-- Main -->
<div class="container mt-5">
    <div class="card shadow-sm">
        <div class="card-header d-flex justify-content-between align-items-center">
            <h4 class="mb-0"><i class="bi bi-exclamation-triangle-fill me-2"></i> All Complaints</h4>
            <input type="text" id="searchInput" class="form-control form-control-sm w-50" placeholder="🔍 Search by email, category, or status">
        </div>
        <div class="card-body">
            <!-- Alerts -->
            <c:if test="${param.success == 'updated'}">
                <div class="alert alert-success text-center">✅ Status updated successfully!</div>
            </c:if>
            <c:if test="${param.error == 'updateFailed'}">
                <div class="alert alert-danger text-center">❌ Failed to update complaint status. Try again.</div>
            </c:if>
            <c:if test="${param.error == 'exception'}">
                <div class="alert alert-warning text-center">⚠️ An internal error occurred.</div>
            </c:if>

            <c:if test="${empty complaintList}">
                <div class="alert alert-info text-center">ℹ️ No complaints submitted yet.</div>
            </c:if>

            <c:if test="${not empty complaintList}">
                <div class="table-responsive">
                    <table class="table table-hover table-striped align-middle" id="complaintTable">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Email</th>
                                <th>Category</th>
                                <th>Description</th>
                                <th>Status</th>
                                <th class="text-center">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="c" items="${complaintList}">
                                <tr>
                                    <td>${c.id}</td>
                                    <td>${c.email}</td>
                                    <td>${c.category}</td>
                                    <td>${c.description}</td>
                                    <td>
                                        <span class="badge
                                            <c:choose>
                                                <c:when test="${c.status == 'Pending'}">bg-warning text-dark</c:when>
                                                <c:when test="${c.status == 'Resolved'}">bg-success</c:when>
                                                <c:otherwise>bg-info text-dark</c:otherwise>
                                            </c:choose>
                                        ">${c.status}</span>
                                    </td>
                                    <td class="d-flex gap-2 justify-content-center">
                                        <form action="UpdateStatusServlet" method="post" class="d-flex gap-2">
                                            <input type="hidden" name="complaintId" value="${c.id}">
                                            <select name="status" class="form-select form-select-sm w-auto">
                                                <option ${c.status == 'Pending' ? 'selected' : ''}>Pending</option>
                                                <option ${c.status == 'In Progress' ? 'selected' : ''}>In Progress</option>
                                                <option ${c.status == 'Resolved' ? 'selected' : ''}>Resolved</option>
                                            </select>
                                            <button type="submit" class="btn btn-sm btn-primary">Update</button>
                                        </form>
                                        <a href="DeleteComplaintServlet?id=${c.id}" class="btn btn-sm btn-danger"
                                           onclick="return confirm('Are you sure you want to delete this complaint?');">
                                            Delete
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>
        </div>
    </div>
</div>
<div class="text-center my-4">
    <a href="deletedRecords.jsp" class="btn btn-lg fw-bold text-white" style="background: linear-gradient(to right, #6610f2, #6f42c1); border-radius: 50px; padding: 10px 30px;">
        <i class="bi bi-archive-fill"></i> View Deleted Records
    </a>
</div>

<footer>
    &copy; 2025 Grievance Portal | Admin Panel
</footer>

<!-- Scripts -->
<script>
    document.getElementById("searchInput").addEventListener("keyup", function () {
        const filter = this.value.toLowerCase();
        document.querySelectorAll("#complaintTable tbody tr").forEach(function (row) {
            const email = row.cells[1].textContent.toLowerCase();
            const category = row.cells[2].textContent.toLowerCase();
            const status = row.cells[4].textContent.toLowerCase();
            row.style.display = (email.includes(filter) || category.includes(filter) || status.includes(filter)) ? "" : "none";
        });
    });
</script>


</body>
</html>
