<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="com.ogrievance.model.Complaint" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>User Dashboard</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            background: #f0f2f5;
        }
        .badge {
            font-size: 0.85em;
        }
        .table-hover tbody tr:hover {
            background-color: #e9ecef;
        }
        .floating-btn {
            position: fixed;
            bottom: 30px;
            right: 30px;
            z-index: 1000;
        }
        .navbar-brand i,
        .navbar-brand {
            color: #6f42c1 !important;
        }
        .purple-text {
            color: #6f42c1 !important;
        }
        .modal-header {
            border-bottom: none;
            background-color: #6f42c1 !important;
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
        <a class="navbar-brand" href="#">
            <i class="bi bi-flag-fill"></i> Grievance Portal
        </a>
        <div class="d-flex align-items-center">
            <span class="text-white me-3">👤 <strong><%= email %></strong> | <span class="text-info">User</span></span>
            <a href="LogoutServlet" class="btn btn-sm btn-outline-light">
                <i class="bi bi-box-arrow-right"></i> Logout
            </a>
        </div>
    </div>
</nav>

<!-- Page Content -->
<div class="container mt-5">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h2 class="purple-text"><i class="bi bi-card-list"></i> Your Complaints</h2>
    </div>

    <!-- Search -->
    <div class="row mb-4">
        <div class="col-md-6 offset-md-3">
            <input type="text" id="searchInput" class="form-control" placeholder="🔍 Search by category or description">
        </div>
    </div>

    <!-- Complaint Table -->
    <c:if test="${empty userComplaints}">
        <div class="alert alert-info text-center">You haven't submitted any complaints yet.</div>
    </c:if>

    <c:if test="${not empty userComplaints}">
        <div class="table-responsive shadow-sm">
            <table class="table table-bordered table-hover align-middle bg-white" id="complaintTable">
                <thead class="table-dark text-center">
                    <tr>
                        <th>ID</th>
                        <th>Category</th>
                        <th>Description</th>
                        <th>Status</th>
                        <th colspan="2">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="c" items="${userComplaints}">
                        <tr>
                            <td class="text-center">${c.id}</td>
                            <td>${c.category}</td>
                            <td>${c.description}</td>
                            <td class="text-center">
                                <span class="badge 
                                    <c:choose>
                                        <c:when test="${c.status == 'Pending'}">bg-warning text-dark</c:when>
                                        <c:when test="${c.status == 'Resolved'}">bg-success</c:when>
                                        <c:otherwise>bg-secondary</c:otherwise>
                                    </c:choose>
                                ">${c.status}</span>
                            </td>
                            <td class="text-center">
                                <button class="btn btn-sm btn-outline-purple" 
                                        onclick="viewComplaint('${c.id}', '${c.category}', '${c.description}', '${c.status}')">
                                    <i class="bi bi-eye-fill purple-text"></i> View
                                </button>
                            </td>
                            <td class="text-center">
                                <a href="DownloadPDFServlet?id=${c.id}" class="btn btn-sm btn-outline-secondary">
                                    <i class="bi bi-download"></i> PDF
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </c:if>
</div>

<!-- Floating Register Complaint Button -->
<a href="complaint.jsp" class="btn btn-lg floating-btn shadow" style="background-color:#6f42c1; color: #fff;">
    <i class="bi bi-plus-circle-fill"></i> Register Complaint
</a>

<!-- View Modal -->
<div class="modal fade" id="viewModal" tabindex="-1" aria-labelledby="viewModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content shadow">
      <div class="modal-header text-white">
        <h5 class="modal-title" id="viewModalLabel"><i class="bi bi-info-circle-fill"></i> Complaint Details</h5>
        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <p><strong>ID:</strong> <span id="compId"></span></p>
        <p><strong>Category:</strong> <span id="compCat"></span></p>
        <p><strong>Description:</strong> <span id="compDesc"></span></p>
        <p><strong>Status:</strong> <span id="compStatus"></span></p>
      </div>
    </div>
  </div>
</div>

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function viewComplaint(id, category, description, status) {
        document.getElementById('compId').innerText = id;
        document.getElementById('compCat').innerText = category;
        document.getElementById('compDesc').innerText = description;
        document.getElementById('compStatus').innerText = status;
        new bootstrap.Modal(document.getElementById('viewModal')).show();
    }

    document.getElementById("searchInput").addEventListener("keyup", function () {
        const filter = this.value.toLowerCase();
        const rows = document.querySelectorAll("#complaintTable tbody tr");

        rows.forEach(row => {
            const category = row.cells[1].textContent.toLowerCase();
            const desc = row.cells[2].textContent.toLowerCase();
            row.style.display = (category.includes(filter) || desc.includes(filter)) ? "" : "none";
        });
    });
</script>

</body>
</html>
