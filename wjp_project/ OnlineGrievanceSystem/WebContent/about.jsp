<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>About Us - Grievance Portal</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            min-height: 100vh;
            background: linear-gradient(270deg, #00bcd4, #2196f3, #673ab7);
            background-size: 600% 600%;
            animation: gradientMove 15s ease infinite;
            display: flex;
            flex-direction: column;
        }

        @keyframes gradientMove {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .section-title {
            color: #fff;
            text-shadow: 1px 1px 3px rgba(0,0,0,0.5);
        }

        .card {
            background: rgba(255, 255, 255, 0.85);
            backdrop-filter: blur(8px);
            border: none;
            transition: all 0.3s;
            border-radius: 15px;
        }

        .card:hover {
            box-shadow: 0 8px 30px rgba(0,0,0,0.2);
            transform: scale(1.02);
        }

        .developer-img {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 50%;
            border: 3px solid #fff;
            margin-bottom: 1rem;
        }

        footer {
            background: #000000cc;
            color: #ddd;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold" href="index.jsp"><i class="bi bi-shield-lock-fill me-2"></i>Grievance Portal</a>
        <div>
            <a href="index.jsp" class="btn btn-outline-light me-2"><i class="bi bi-house"></i> Home</a>
            <a href="login.jsp" class="btn btn-outline-light"><i class="bi bi-box-arrow-in-right"></i> Login</a>
        </div>
    </div>
</nav>

<!-- About Section -->
<div class="container py-5 flex-grow-1">
    <div class="text-center mb-5">
        <h2 class="section-title">About Us</h2>
        <p class="lead text-light">Making grievance redressal simple, secure, and transparent for all users.</p>
    </div>

    <div class="row g-4">
        <div class="col-md-6">
            <div class="card p-4 shadow-sm h-100">
                <h5 class="mb-3"><i class="bi bi-flag-fill text-primary me-2"></i>Our Mission</h5>
                <p>Our mission is to empower citizens, students, and employees to raise their concerns in a secure, transparent, and efficient manner. We aim to bridge the communication gap between institutions and users by offering a streamlined grievance management system.</p>
            </div>
        </div>

        <div class="col-md-6">
            <div class="card p-4 shadow-sm h-100">
                <h5 class="mb-3"><i class="bi bi-shield-check text-success me-2"></i>Our Values</h5>
                <ul>
                    <li>🛡️ Transparency</li>
                    <li>⚡ Efficiency</li>
                    <li>🔐 Security</li>
                    <li>💬 Responsiveness</li>
                    <li>👥 Accountability</li>
                </ul>
            </div>
        </div>
    </div>

    <div class="card mt-5 p-4 shadow-sm">
        <h5><i class="bi bi-building text-danger me-2"></i>Who We Serve</h5>
        <p>Whether you’re a student lodging a campus complaint or a citizen reporting an issue to an authority, this system is designed for you. We ensure every voice is heard and every concern is addressed through our organized and easy-to-use platform.</p>
    </div>

    <!-- Developer Profiles -->
    <div class="mt-5 text-center">
        <h2 class="section-title">Meet the Developers</h2>
        <p class="text-light">The passionate team behind this project.</p>
    </div>

    <div class="row mt-4 g-4 justify-content-center">
        <!-- Developer 1 -->
        <div class="col-md-4">
            <div class="card text-center p-4 shadow-sm h-100">
                <img src="assets/img/dev1.png" alt="Developer 1" class="developer-img mx-auto">
                <h5 class="fw-bold mb-1">Abhishek Khursange</h5>
                <p class="text-muted mb-1">📞 +91-8806868675</p>
                <p class="text-muted mb-2">✉️ abhishekkhursange63@gmail.com</p>
                <a href="https://linkedin.com/in/abhishek-khursange7" class="btn btn-outline-primary btn-sm" target="_blank">
                    <i class="bi bi-linkedin"></i> LinkedIn
                </a>
            </div>
        </div>

        <!-- Developer 2 -->
        <div class="col-md-4">
            <div class="card text-center p-4 shadow-sm h-100">
                <img src="assets/img/dev2.jpg" alt="Developer 2" class="developer-img mx-auto">
                <h5 class="fw-bold mb-1">Aditya Raj Harsh</h5>
                <p class="text-muted mb-1">📞 +91-9123456789</p>
                <p class="text-muted mb-2">✉️ adityarajharsh4@gmail.com</p>
                <a href="https://www.linkedin.com/in/aditya-raj-harsh-24a41421b" class="btn btn-outline-primary btn-sm" target="_blank">
                    <i class="bi bi-linkedin"></i> LinkedIn
                </a>
            </div>
        </div>

        <!-- Developer 3 -->
        <div class="col-md-4">
            <div class="card text-center p-4 shadow-sm h-100">
                <img src="assets/img/dev3.jpg" alt="Developer 3" class="developer-img mx-auto">
                <h5 class="fw-bold mb-1">Anjali Dixit</h5>
                <p class="text-muted mb-1">📞 +91-9988776655</p>
                <p class="text-muted mb-2">✉️ anjalidixit1120@gmail.com</p>
                <a href="https://www.linkedin.com/in/raviverma" class="btn btn-outline-primary btn-sm" target="_blank">
                    <i class="bi bi-linkedin"></i> LinkedIn
                </a>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<footer class="text-center py-3 mt-auto">
    <small>&copy; 2025 Online Grievance Redressal System. All rights reserved.</small>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
