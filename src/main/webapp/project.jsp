<%--
  Created by IntelliJ IDEA.
  User: LEADER
  Date: 3/16/2025
  Time: 6:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create New Project - Constructoor</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="style/project.css">
</head>
<body>
<!-- Top Header -->
<div class="top-header d-none d-md-block">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <a href="tel:+212622725296"><i class="fas fa-phone-alt"></i> +212 622725296</a>
                <a href="mailto:soufyanfellat03@gmail.com"><i class="fas fa-envelope"></i> soufyanfellat03@gmail.com</a>
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
        <a class="navbar-brand" href="index">
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
                        <li><a class="dropdown-item" href="resource">Add Resources</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Page Header -->
<section class="page-header">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <h1>Create New Project</h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index" class="text-white">Home</a></li>
                        <li class="breadcrumb-item"><a href="/project" class="text-white">Projects</a></li>
                        <li class="breadcrumb-item active text-white" aria-current="page">New Project</li>
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
                <h2>Project Information</h2>
                <div class="card-body">
                    <% if (request.getParameter("status") != null && request.getParameter("status").equals("error")) { %>
                    <div class="alert alert-danger">
                        Error: <%= request.getParameter("message") != null ? request.getParameter("message") : "Unknown error occurred" %>
                    </div>
                    <% } %>

                    <form id="projectForm" action="project" method="post">
                        <input type="hidden" name="action" value="create">

                        <div class="row g-4">
                            <div class="col-md-12">
                                <label for="projectName" class="form-label">Project Name*</label>
                                <input type="text" class="form-control" id="projectName" name="name" required>
                            </div>

                            <div class="col-md-12">
                                <label for="projectDescription" class="form-label">Project Description*</label>
                                <textarea class="form-control" id="projectDescription" rows="4" name="description" required></textarea>
                            </div>

                            <div class="col-md-6">
                                <label for="startDate" class="form-label">Start Date*</label>
                                <input type="date" class="form-control" id="startDate" name="startDate" required>
                            </div>

                            <div class="col-md-6">
                                <label for="endDate" class="form-label">End Date*</label>
                                <input type="date" class="form-control" id="endDate" name="endDate" required>
                            </div>

                            <div class="col-md-6">
                                <label for="budget" class="form-label">Budget ($)*</label>
                                <input type="number" step="0.01" class="form-control" name="budget" id="budget" required>
                            </div>

                            <div class="col-md-6">
                                <label for="projectManager" class="form-label">Project Manager</label>
                                <input type="text" class="form-control" id="projectManager" name="projectManager">
                            </div>

                            <div class="col-md-12 mt-4">
                                <div class="d-flex justify-content-between">
                                    <a href="project" class="btn btn-outline-secondary">Cancel</a>
                                    <button type="submit" class="btn btn-primary">Save Project</button>
                                </div>
                            </div>
                        </div>
                    </form>
            </div>
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
<script>
    document.getElementById("projectForm").addEventListener("submit", function(event) {
        const projectName = document.getElementById("projectName").value.trim();
        const projectDescription = document.getElementById("projectDescription").value.trim();
        const startDate = document.getElementById("startDate").value;
        const endDate = document.getElementById("endDate").value;
        const budget = parseFloat(document.getElementById("budget").value);

        if (!projectName || !projectDescription || !startDate || !endDate || isNaN(budget)) {
            alert("Please fill in all required fields.");
            event.preventDefault();
            return;
        }

        if (new Date(endDate) < new Date(startDate)) {
            alert("End date cannot be earlier than start date.");
            event.preventDefault();
            return;
        }

        if (budget <= 0) {
            alert("Budget must be a positive number.");
            event.preventDefault();
            return;
        }
    });
</script>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
