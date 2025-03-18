<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Resources - Constructoor</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>

        footer {
            background-color: #1a1a1a;
            color: #fff;
            padding: 80px 0 20px;
        }

        .footer-logo {
            margin-bottom: 25px;
        }

        .footer-text {
            color: #aaa;
            margin-bottom: 30px;
        }

        .footer-title {
            font-size: 20px;
            margin-bottom: 30px;
            color: #fff;
            position: relative;
        }

        .footer-links li {
            margin-bottom: 15px;
        }

        .footer-links a {
            color: #aaa;
            text-decoration: none;
            transition: all 0.3s;
        }

        .footer-links a:hover {
            color: var(--primary-color);
            padding-left: 5px;
        }

        .footer-contact li {
            margin-bottom: 15px;
            color: #aaa;
        }

        .footer-contact i {
            color: var(--primary-color);
            margin-right: 10px;
        }

        .copyright {
            padding: 20px 0;
            border-top: 1px solid #2a2a2a;
            margin-top: 60px;
            text-align: center;
            color: #aaa;
        }
        .row{
            display: flex;
            justify-content: space-around;
        }

        :root {
            --primary-color: #ff5e14;
            --dark-blue: #1a3263;
            --dark-gray: rgb(10, 11, 14);
            --light-gray: #f8f9fa;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            background-color: #f5f5f5;
        }

        /* Header & Navigation */
        .top-header {
            background-color: var(--primary-color);
            color: #fff;
            padding: 8px 0;
        }

        .top-header a {
            color: #fff;
            text-decoration: none;
            margin-right: 15px;
            font-size: 14px;
        }

        .top-header .social-icons a {
            margin-left: 10px;
            margin-right: 0;
        }

        .navbar {
            background-color: #fff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 15px 0;
        }

        .navbar-brand {
            font-weight: 700;
            font-size: 24px;
            color: var(--primary-color);
        }

        .navbar-nav .nav-link {
            color: var(--dark-gray);
            font-weight: 500;
            padding: 0 15px;
        }

        .navbar-nav .nav-link:hover,
        .navbar-nav .nav-link.active {
            color: var(--primary-color);
        }

        /* Page Header */
        .page-header {
            background: linear-gradient(rgba(0, 39, 77, 0.8), rgba(0, 39, 77, 0.8)), url('/image/buildflow.jpg') no-repeat center center/cover;
            color: #fff;
            padding: 60px 0;
            margin-bottom: 40px;
        }

        .page-header h1 {
            font-weight: 700;
        }
        /* Page Header */
        .page-header {
            background: linear-gradient(rgba(0, 39, 77, 0.7), rgba(0, 39, 77, 0.7)), url('image/buildflow.jpg') no-repeat center center/cover;
            color: #fff;
            padding: 60px 0;
            margin-bottom: 40px;
        }

        .page-header h1 {
            font-weight: 700;
        }

        /* Form Styling */
        .form-section {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin-bottom: 60px;
        }

        .form-section h2 {
            color: var(--dark-blue);
            margin-bottom: 30px;
            padding-bottom: 15px;
            border-bottom: 1px solid #eee;
        }

        .form-label {
            font-weight: 500;
            color: var(--dark-gray);
        }

        .form-control {
            border: 1px solid #ddd;
            border-radius: 4px;
            padding: 10px 15px;
        }

        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.25rem rgba(255, 94, 20, 0.25);
        }

        .btn-primary {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
            padding: 10px 30px;
            font-weight: 500;
            transition: all 0.3s;
        }

        .btn-primary:hover {
            background-color: #e54b09;
            border-color: #e54b09;
        }

        .btn-outline-secondary {
            color: var(--dark-gray);
            border-color: #ddd;
        }

        .btn-outline-secondary:hover {
            background-color: var(--light-gray);
            color: var(--dark-gray);
        }


    </style>
</head>
<body>
<!-- Top Header -->
<div class="top-header d-none d-md-block">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <a href="tel:+16271000212"><i class="fas fa-phone-alt"></i> +212 622725296</a>
                <a href="mailto:soufyanfellat03@gmail.com"><i class="fas fa-envelope"></i>soufyanfellat03@gmail.com</a>
                <a href="#"><i class="far fa-clock"></i> Mon - Sat 8:00 - 17:30</a>
            </div>
            <div class="col-md-4 text-end social-icons">
                <a href="https://www.facebook.com/soufyan.mohamed.923?mibextid=rS40aB7S9Ucbxw6v"><i class="fab fa-facebook-f"></i></a>
                <a href="https://www.instagram.com/felate_soufyane/"><i class="fab fa-instagram"></i></a>
                <a href="https://www.linkedin.com/in/felate-soufyane-03f/"><i class="fab fa-linkedin-in"></i></a>
            </div>
        </div>
    </div>
</div>

<!-- Navigation -->
<nav class="navbar navbar-expand-lg sticky-top">
    <div class="container">
        <a class="navbar-brand" href="index.html">
            <span style="color: #FF5E14;">Constructoor</span>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="index">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">About Us</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="project">Projects</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Contact Us</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown">
                        Management
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="project">New Project</a></li>
                        <li><a class="dropdown-item" href="task">New Task</a></li>
                    </ul>
                </li>
            </ul>
            <div class="ms-3">
                <a href="#" class="btn btn-outline-secondary btn-sm">
                    <i class="fas fa-search"></i>
                </a>
            </div>
        </div>
    </div>
</nav>

<!-- Page Header -->
<section class="page-header">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <h1>Add New Resources</h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.html" class="text-white">Home</a></li>
                        <li class="breadcrumb-item"><a href="#" class="text-white">Projects</a></li>
                        <li class="breadcrumb-item active text-white" aria-current="page">Add Resources</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</section>

<!-- Form Section -->
<section class="form-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-10 mx-auto">
                <h2>Resource Details</h2>
                <form id="resourceForm" action="resource" method="post">
                    <input type="hidden" name="action" value="addResource">
                    <div class="row g-4">
                        <div class="col-md-12">
                            <label for="resourceName" class="form-label">Resource Name*</label>
                            <input type="text" class="form-control" id="resourceName" name="name" required>
                        </div>

                        <div class="col-md-6">
                            <label for="resourceType" class="form-label">Resource Type*</label>
                            <select class="form-select" id="resourceType" name="type" required>
                                <option value="" selected disabled>Select a type</option>
                                <option value="material">Material</option>
                                <option value="equipment">Equipment</option>
                                <option value="tool">Tool</option>
                                <option value="other">Other</option>
                            </select>
                        </div>

                        <div class="col-md-6">
                            <label for="resourceQuantity" class="form-label">Quantity*</label>
                            <input type="number" class="form-control" name="quantity" id="resourceQuantity" required>
                        </div>





                        <div class="col-12">
                            <button type="submit" class="btn btn-primary">Add Resource</button>
                            <button type="reset" class="btn btn-outline-secondary">Reset</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>
<footer id="footer">

    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-6 mb-4 mb-lg-0">
                <div class="footer-logo">
                    <h3><span style="color: #FF5E14;">Constructoor</span></h3>
                </div>
                <p class="footer-text">We are a leading construction company committed to providing high-quality services, innovative solutions, and exceptional client satisfaction.</p>
                <div class="social-icons">
                    <a href="https://www.facebook.com/soufyan.mohamed.923?mibextid=rS40aB7S9Ucbxw6v"><i class="fab fa-facebook-f"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="https://www.instagram.com/felate_soufyane/"><i class="fab fa-instagram"></i></a>
                    <a href="https://www.linkedin.com/in/felate-soufyane-03f/"><i class="fab fa-linkedin-in"></i></a>
                </div>
            </div>

            <div class="col-lg-3 col-md-6">
                <h4 class="footer-title">Contact Info</h4>
                <ul class="list-unstyled footer-contact">
                    <li><i class="fas fa-map-marker-alt"></i>25060 Boujaad ,MAR</li>
                    <li><i class="fas fa-phone-alt"></i> +212 622725296</li>
                    <li><i class="fas fa-envelope"></i> soufyanfellat03@gmail.com</li>
                    <li><i class="far fa-clock"></i> Mon - Sat: 8:00 - 17:30</li>
                </ul>
            </div>
        </div>
        <div class="copyright">
            <p>&copy; 2025 Constructoor. All Rights Reserved.</p>
        </div>
    </div>

</footer>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>