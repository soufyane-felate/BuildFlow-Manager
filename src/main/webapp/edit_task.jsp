<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.model.Task" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Task - Constructoor</title>
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

        .btn-secondary {
            background: linear-gradient(90deg, #6c757d, #868e96);
            border: none;
            color: #fff;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .btn-secondary:hover {
            background: linear-gradient(90deg, #5a6268, #71787e);
            box-shadow: 0 6px 12px rgba(108, 117, 125, 0.3);
            transform: translateY(-2px);
        }
    </style>
</head>
<body>

<!-- Page Header -->
<section class="page-header">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <h1>Edit Task</h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index" class="text-white">Home</a></li>
                        <li class="breadcrumb-item"><a href="project?action=view&id=${task.id_project}" class="text-white">Project</a></li>
                        <li class="breadcrumb-item active text-white" aria-current="page">Edit Task</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</section>

<!-- Edit Task Form Section -->
<section class="form-section my-5">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card shadow">
                    <div class="card-body p-5">
                        <%
                            Task task = (Task) request.getAttribute("task");
                            String status = request.getParameter("status");
                            String message = request.getParameter("message");

                            // Format dates for input fields
                            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                            String startDate = "";
                            String endDate = "";

                            if (task.getStart_date() != null) {
                                startDate = sdf.format(task.getStart_date());
                            }

                            if (task.getEnd_date() != null) {
                                endDate = sdf.format(task.getEnd_date());
                            }
                        %>

                        <% if ("error".equals(status) && message != null) { %>
                        <div class="alert alert-danger" role="alert">
                            <%= message %>
                        </div>
                        <% } %>

                        <h3 class="card-title mb-4">Edit Task</h3>
                        <form action="task" method="post">
                            <input type="hidden" name="action" value="update">
                            <input type="hidden" name="id" value="<%= task.getId() %>">
                            <input type="hidden" name="projectId" value="<%= task.getId_project() %>">

                            <div class="mb-3">
                                <label for="description" class="form-label">Task Description</label>
                                <textarea class="form-control" id="description" name="description" rows="3" required><%= task.getDescription() %></textarea>
                            </div>

                            <div class="mb-3">
                                <label for="startDate" class="form-label">Start Date</label>
                                <input type="date" class="form-control" id="startDate" name="startDate" value="<%= startDate %>" required>
                            </div>

                            <div class="mb-3">
                                <label for="endDate" class="form-label">End Date</label>
                                <input type="date" class="form-control" id="endDate" name="endDate" value="<%= endDate %>" required>
                            </div>

                            <div class="d-flex justify-content-between mt-4">
                                <a href="task?action=list&projectId=<%= task.getId_project() %>" class="btn btn-secondary">Cancel</a>
                                <button type="submit" class="btn btn-primary">Update Task</button>
                            </div>
                        </form>
                    </div>
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
                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                </div>
            </div>

            <div class="col-lg-3 col-md-6">
                <h4 class="footer-title">Contact Info</h4>
                <ul class="list-unstyled footer-contact">
                    <li><i class="fas fa-map-marker-alt"></i> 25060 Boujaad, MAR</li>
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