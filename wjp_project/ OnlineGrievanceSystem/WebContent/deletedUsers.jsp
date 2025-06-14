<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.ogrievance.model.User" %>
<%@ page import="com.ogrievance.dao.UserDao" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Deleted Users</title>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
    <h2 class="text-center mb-4"><i class="bi bi-person-dash-fill text-danger"></i> Deleted Users</h2>

    <%
        List<User> deletedUsers = UserDao.getAllDeletedUsers();
        request.setAttribute("deletedUsers", deletedUsers);
    %>

    <c:if test="${empty deletedUsers}">
        <div class="alert alert-info text-center">No deleted users found.</div>
    </c:if>

    <c:if test="${not empty deletedUsers}">
        <table class="table table-bordered table-hover">
            <thead class="table-dark text-center">
                <tr>
                    <th>ID</th>
                    <th>Email</th>
                    <th>Name</th>
                    <th>Role</th>
                    <th>Deleted At</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="u" items="${deletedUsers}">
                    <tr class="text-center">
                        <td>${u.id}</td>
                        <td>${u.email}</td>
                        <td>${u.name}</td>
                        <td>${u.role}</td>
                        <td>${u.deletedAt}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>
</div>

</body>
</html>
