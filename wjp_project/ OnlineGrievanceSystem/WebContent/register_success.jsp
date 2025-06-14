<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registration Success</title>
    <script>
        // Show alert then redirect after short delay
        window.onload = function () {
            alert("✅ Registration successful! Redirecting to login...");
            setTimeout(function () {
                window.location.href = "login.jsp";
            }, 500); // Delay 0.5 sec after alert
        };
    </script>
</head>
<body>
</body>
</html>
