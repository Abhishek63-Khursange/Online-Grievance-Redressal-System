<%@ page import="java.util.*, com.ogrievance.dao.UserDao, com.ogrievance.model.User" %>
<%
    List<User> userList = UserDao.getAllUsers();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
    <div class="card shadow rounded">
        <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
            <h4 class="mb-0"><i class="bi bi-people-fill me-2"></i>User Management</h4>
            <span class="badge bg-secondary">Total Users: <%= userList.size() %></span>
        </div>

        <div class="card-body">
            <table class="table table-striped table-hover align-middle">
                <thead class="table-dark">
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Full Name</th>
                        <th scope="col">Email</th>
                        <th scope="col">Role</th>
                        <th scope="col" class="text-center">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        if (userList.isEmpty()) {
                    %>
                        <tr>
                            <td colspan="5" class="text-center text-muted">No users found.</td>
                        </tr>
                    <%
                        } else {
                            for (User u : userList) {
                    %>
                    <tr>
                        <td><%= u.getId() %></td>
                        <td><%= u.getName() %></td>
                        <td><%= u.getEmail() %></td>
                        <td>
                            <span class="badge 
                                <%= "admin".equals(u.getRole()) ? "bg-danger" : "bg-info text-dark" %>">
                                <%= u.getRole().toUpperCase() %>
                            </span>
                        </td>
                        <td class="text-center">
                            <a href="DeleteUserServlet?id=<%= u.getId() %>"
                               class="btn btn-outline-danger btn-sm"
                               onclick="return confirm('Are you sure you want to delete this user?');">
                                <i class="bi bi-trash3-fill"></i> Delete
                            </a>
                        </td>
                    </tr>
                    <%
                            }
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
</html>
