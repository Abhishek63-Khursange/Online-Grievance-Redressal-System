<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.ogrievance.dbutils.DBUtils" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Deleted Records</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background: #f9fafc;
        }
        h3 {
            background: linear-gradient(to right, #a0c4ff, #bdb2ff);
            color: #333;
            padding: 10px;
            border-radius: 10px;
        }
        .back-btn {
            background: linear-gradient(to right, #a0c4ff, #bdb2ff);
            color: #333;
            border: none;
            border-radius: 30px;
            padding: 8px 20px;
            text-decoration: none;
            font-weight: 500;
        }
        .back-btn:hover {
            background: linear-gradient(to right, #bdb2ff, #a0c4ff);
            color: #000;
        }
        .table th {
            background: #e0e7ff;
            color: #333;
        }
        .card-header {
            background: #cddafd;
            color: #333;
            font-weight: 600;
        }
        .table-striped tbody tr:nth-of-type(odd) {
            background-color: #f1f5ff;
        }
    </style>
</head>
<body>

<div class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h3><i class="bi bi-archive-fill"></i> Deleted Records</h3>
        <a href="admin.jsp" class="back-btn"><i class="bi bi-arrow-left-circle"></i> Back to Dashboard</a>
    </div>

    <div class="card shadow-sm mb-4">
        <div class="card-header">
            <i class="bi bi-exclamation-triangle-fill"></i> Deleted Complaints
        </div>
        <div class="card-body p-0">
            <table class="table table-striped mb-0">
                <thead>
                    <tr><th>ID</th><th>Category</th><th>Description</th><th>Status</th><th>Deleted At</th></tr>
                </thead>
                <tbody>
                <%
                    Connection con = DBUtils.getConnection();
                    PreparedStatement ps = con.prepareStatement("SELECT * FROM deleted_complaints");
                    ResultSet rs = ps.executeQuery();
                    boolean hasComplaints = false;
                    while(rs.next()) {
                        hasComplaints = true;
                %>
                    <tr>
                        <td><%= rs.getInt("complaint_id") %></td>
                        <td><%= rs.getString("category") %></td>
                        <td><%= rs.getString("description") %></td>
                        <td><%= rs.getString("status") %></td>
                        <td><%= rs.getTimestamp("deleted_at") %></td>
                    </tr>
                <%
                    }
                    if (!hasComplaints) {
                %>
                    <tr><td colspan="5" class="text-center text-muted">No deleted complaints found.</td></tr>
                <%
                    }
                    DBUtils.close(con, ps);
                %>
                </tbody>
            </table>
        </div>
    </div>

    <div class="card shadow-sm">
        <div class="card-header">
            <i class="bi bi-person-dash-fill"></i> Deleted Users
        </div>
        <div class="card-body p-0">
            <table class="table table-striped mb-0">
                <thead>
                    <tr><th>User ID</th><th>Email</th><th>Name</th><th>Deleted At</th></tr>
                </thead>
                <tbody>
                <%
                    con = DBUtils.getConnection();
                    ps = con.prepareStatement("SELECT * FROM deleted_users");
                    rs = ps.executeQuery();
                    boolean hasUsers = false;
                    while(rs.next()) {
                        hasUsers = true;
                %>
                    <tr>
                        <td><%= rs.getInt("id") %></td>
                        <td><%= rs.getString("email") %></td>
                        <td><%= rs.getString("name") %></td>
                        <td><%= rs.getTimestamp("deleted_at") %></td>
                    </tr>
                <%
                    }
                    if (!hasUsers) {
                %>
                    <tr><td colspan="4" class="text-center text-muted">No deleted users found.</td></tr>
                <%
                    }
                    DBUtils.close(con, ps);
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
</html>
