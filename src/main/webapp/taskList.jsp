<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.model.Task" %>
<%@ page import="com.dao.TaskDao" %>
<%@ page import="com.dao.TaskDao" %>
<%@ page import="com.model.Task" %>
<%@ page import="com.dao.ProjectDao" %>
<%@ page import="com.model.Project" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Task List - Constructoor</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="style/project.css">
    <style>
        .btn {
        font-size: 1em;
        border-radius: 12px;
        padding: 10px 20px;

        margin: 5px 8px;
        transition: all 0.3s ease-in-out;
        text-align: center;
        display: inline-block;
    }

    .btn-primary {
        background: linear-gradient(90deg, #005bb5, #0077e6);
        border: none;
        color: #fff;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .btn-primary:hover {
        background: linear-gradient(90deg, #004d9e, #0066cc);
        box-shadow: 0 6px 12px rgba(0, 102, 204, 0.3);
        transform: translateY(-2px);
    }

    .btn-danger {
        background: linear-gradient(90deg, #b50000, #e60000);
        border: none;
        color: #fff;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .btn-danger:hover {
        background: linear-gradient(90deg, #990000, #cc0000);
        box-shadow: 0 6px 12px rgba(204, 0, 0, 0.3);
        transform: translateY(-2px);
    }

    .btn-success {
        background: linear-gradient(90deg, #008a00, #00b300);
        border: none;
        color: #fff;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .btn-success:hover {
        background: linear-gradient(90deg, #007a00, #009900);
        box-shadow: 0 6px 12px rgba(0, 153, 0, 0.3);
        transform: translateY(-2px);
    }

    .btn-info {
        background: linear-gradient(90deg, #17a2b8, #1cc5dc);
        border: none;
        color: #fff;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .btn-info:hover {
        background: linear-gradient(90deg, #139ba7, #17a2b8);
        box-shadow: 0 6px 12px rgba(23, 162, 184, 0.3);
        transform: translateY(-2px);
    }</style>
</head>

<body>

<!-- Page Header -->
<section class="page-header">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <h1>Task List</h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index" class="text-white">Home</a></li>
                        <li class="breadcrumb-item active text-white" aria-current="page">Tasks</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</section>

<!-- Task List Section -->
<section class="project-list-section">
    <div class="container">
        <div class="container py-5">
            <%
                int projectId = (Integer) request.getAttribute("projectId");
                ProjectDao projectDao = new ProjectDao();
                Project project = projectDao.getProjectById(projectId);
                List<Task> tasks = (List<Task>) request.getAttribute("tasks");
            %>

            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2>Tasks for Project: <%= project.getName() %></h2>
                <a href="task?action=create&projectId=<%= projectId %>" class="btn btn-primary">Add New Task</a>
            </div>

            <div class="row">
                <%
                    if (tasks != null && !tasks.isEmpty()) {
                        for (Task task : tasks) {
                %>
                <div class="col-md-4 mb-4">
                    <div class="card">
                        <div class="card-body">
                            <p class="card-text"><%= task.getDescription() %></p>
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item"><strong>Start Date:</strong> <%= task.getStart_date() %></li>
                                <li class="list-group-item"><strong>End Date:</strong> <%= task.getEnd_date() %></li>
                            </ul>

                            <div class="mt-3">
                                <a href="task?action=edit&id=<%= task.getId() %>" class="btn btn-sm btn-primary">Edit</a>
                                <a href="task?action=delete&id=<%= task.getId() %>&projectId=<%= projectId %>"
                                   class="btn btn-sm btn-danger"
                                   onclick="return confirm('Are you sure you want to delete this task?');">
                                    Delete
                                </a>
                                <a href="resource?action=select&taskId=<%= task.getId() %>&projectId=<%= projectId %>"
                                   class="btn btn-sm btn-outline-primary">Add resource</a>
                                <a href="resource?action=viewAssignments&taskId=<%= task.getId() %>&projectId=<%= projectId %>"
                                   class="btn btn-sm btn-outline-info">View Resources</a>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                    }
                } else {
                %>
                <div class="col-12">
                    <div class="alert alert-info" role="alert">
                        No tasks found for this project.
                    </div>
                </div>
                <%
                    }
                %>
            </div>

            <div class="mt-4">
                <a href="project?action=view&id=<%= projectId %>" class="btn btn-secondary">Back to Project</a>
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