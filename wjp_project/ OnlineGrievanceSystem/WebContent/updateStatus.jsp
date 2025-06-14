<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Status</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center">Update Complaint Status</h2>
    <form action="UpdateStatusServlet" method="post" class="col-md-6 offset-md-3">
        <input type="hidden" name="complaintId" value="<!-- dynamic id -->">
        <div class="mb-3">
            <label class="form-label">New Status</label>
            <select name="status" class="form-select">
                <option value="Pending">Pending</option>
                <option value="In Progress">In Progress</option>
                <option value="Resolved">Resolved</option>
            </select>
        </div>
        <button type="submit" class="btn btn-success w-100">Update</button>
    </form>
</div>
</body>
</html>