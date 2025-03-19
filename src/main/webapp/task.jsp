<%@ page import="com.model.Project" %>
<%@ page import="com.dao.ProjectDao" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: LEADER
  Date: 3/16/2025
  Time: 6:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create New Task - Constructoor</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="style/task.css">
</head>
<body>
<%
  ProjectDao projectDao = new ProjectDao();
  List<Project> projects= new ArrayList<>();
  projects=projectDao.getAllProjects();
%>
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
                        <li><a class="dropdown-item" href="resource">New resource</a></li>
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
                <h1>Create New Task</h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index." class="text-white">Home</a></li>
                        <li class="breadcrumb-item"><a href="#" class="text-white">Projects</a></li>
                        <li class="breadcrumb-item active text-white" aria-current="page">New Task</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</section>

<!-- Form Section for task -->
<section class="form-section py-5">
    <div class="container">
        <div class="row">
            <div class="col-lg-10 mx-auto">
                <h2>Add Task to Project</h2>
                <form id="taskForm" action="task" method="post">
                    <input type="hidden" name="action" value="create">
                    <input type="hidden" name="projectId" value="<%= request.getAttribute("projectId") %>">

                    <div class="row g-4">
                        <div class="col-md-12">
                            <label for="taskDescription" class="form-label">Task Description*</label>
                            <textarea class="form-control" id="taskDescription" name="description" rows="3" required></textarea>
                        </div>

                        <div class="col-md-6">
                            <label for="startDate" class="form-label">Start Date*</label>
                            <input type="date" class="form-control" name="startDate" id="startDate" required>
                        </div>

                        <div class="col-md-6">
                            <label for="endDate" class="form-label">End Date*</label>
                            <input type="date" class="form-control" name="endDate" id="endDate" required>
                        </div>

                        <div class="col-12">
                            <button type="submit" class="btn btn-primary">Create Task</button>
                            <a href="project?action=view&id=<%= request.getAttribute("projectId") %>" class="btn btn-secondary">Cancel</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>


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




<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
