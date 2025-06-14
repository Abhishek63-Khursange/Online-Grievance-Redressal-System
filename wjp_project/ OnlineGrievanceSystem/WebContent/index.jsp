<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Online Grievance Redressal System</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Custom Styles -->
    <style>
        body {
            background-image: url('assets/img/bg2.jpg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            backdrop-filter: blur(8px);
            min-height: 100vh;
        }

        .blur-overlay {
            background-color: rgba(255, 255, 255, 0.85);
            backdrop-filter: blur(10px);
            padding: 2rem;
            border-radius: 1rem;
            margin-top: 2rem;
        }

        .hero-img {
            max-height: 400px;
            object-fit: cover;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
        }

        .card {
            transition: all 0.3s ease;
            border: none;
            border-radius: 12px;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
        }

        .instruction-card {
            border-left: 5px solid #0d6efd;
            background-color: #e9f2ff;
        }

        footer {
            background-color: #212529;
            color: #ccc;
        }

        .marquee-container {
            overflow: hidden;
            position: relative;
            height: 40px;
        }

        .marquee-text {
            position: absolute;
            white-space: nowrap;
            will-change: transform;
            animation: scroll-left 12s linear infinite;
        }

        @keyframes scroll-left {
            from { transform: translateX(100%); }
            to { transform: translateX(-100%); }
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
    <div class="container-fluid">
        <a class="navbar-brand" href="#"><i class="bi bi-shield-lock-fill me-2"></i>Grievance Portal</a>
        <div>
            <a href="login.jsp" class="btn btn-outline-light me-2"><i class="bi bi-box-arrow-in-right"></i> Login</a>
            <a href="register.jsp" class="btn btn-outline-light me-2"><i class="bi bi-person-plus-fill"></i> Register</a>
            <a href="about.jsp" class="btn btn-outline-light"><i class="bi bi-info-circle-fill"></i> About Us</a>
        </div>
    </div>
</nav>

<!-- Marquee -->
<div class="marquee-container bg-warning">
    <div class="marquee-text text-dark fw-semibold">
        📢 Welcome to the Online Grievance Redressal System — Transparent | Secure | Fast!
    </div>
</div>

<!-- Main Content -->
<div class="container blur-overlay">

    <div class="text-center mb-5">
    <h1 class="display-5 fw-bold">Online Grievance Redressal System</h1>
    <p class="lead text-muted">A centralized platform for lodging and tracking your complaints easily and securely.</p>
    
    <!-- Replace static image with animated GIF -->
    <img src="assets/img/bgv1.gif" alt="Grievance GIF" class="img-fluid hero-img mt-3">
</div>
    

    <!-- Highlighted Instruction Card -->
    <div class="row justify-content-center mb-4">
        <div class="col-md-10">
            <div class="card instruction-card shadow p-4 text-center">
                <div class="card-body">
                    <i class="bi bi-info-circle-fill fs-1 text-primary mb-2"></i>
                    <h5 class="card-title fw-bold text-primary">Important Instructions</h5>
                    <p class="card-text fs-5 text-dark">
                        To raise a complaint, please <strong>register</strong> first using your email and password. 
                        After successful registration, log in and submit your grievance with the necessary details.
                    </p>
                    <!-- Trigger Modal -->
                    <button class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#instructionModal">
                        View Full Instructions
                    </button>
                </div>
            </div>
        </div>
    </div>

<!-- Modal without dark background and allows page scroll -->
<div class="modal fade" id="instructionModal" tabindex="-1" aria-labelledby="instructionModalLabel"
     aria-hidden="true" data-bs-backdrop="false" data-bs-scroll="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content border-3 border-warning shadow-lg">
            <div class="modal-header bg-warning text-dark">
                <h5 class="modal-title" id="instructionModalLabel">
                    <i class="bi bi-bookmark-check-fill me-2"></i> How to Raise a Complaint
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body fs-5 bg-white text-dark">
                <ol>
                    <li><strong>Register</strong> with your name, email, and password.</li>
                    <li><strong>Log in</strong> using your credentials.</li>
                    <li><strong>Submit your complaint</strong> by filling the form and selecting a category.</li>
                    <li>Track the status of your complaint anytime.</li>
                </ol>
            </div>
            <div class="modal-footer bg-light">
                <button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>


   

    <!-- Feature Cards -->
    <div class="row g-4">
        <div class="col-md-4">
            <div class="card text-center shadow-sm bg-white">
                <div class="card-body">
                    <i class="bi bi-pencil-square fs-1 text-primary mb-3"></i>
                    <h5 class="card-title">User Registration</h5>
                    <p class="card-text text-muted">Create an account to register your complaints and track updates.</p>
                    <a href="register.jsp" class="btn btn-outline-primary">Register</a>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card text-center shadow-sm bg-white">
                <div class="card-body">
                    <i class="bi bi-journal-text fs-1 text-success mb-3"></i>
                    <h5 class="card-title">File a Complaint</h5>
                    <p class="card-text text-muted">Log in to raise issues with details and choose the relevant category.</p>
                    <a href="login.jsp" class="btn btn-outline-success">Login</a>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card text-center shadow-sm bg-white">
                <div class="card-body">
                    <i class="bi bi-person-gear fs-1 text-danger mb-3"></i>
                    <h5 class="card-title">Admin Dashboard</h5>
                    <p class="card-text text-muted">Admins can manage and resolve complaints with timely responses.</p>
                    <a href="admin.jsp" class="btn btn-outline-danger">Admin Login</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<footer class="text-center py-3 mt-5">
    <small>&copy; 2025 Online Grievance Redressal System. All rights reserved.</small>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>