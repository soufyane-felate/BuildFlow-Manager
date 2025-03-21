<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Project Form</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">
</head>
<style>
.card-custom {
    border: none;
    border-radius: 15px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.card-custom:hover {
    transform: scale(1.05);
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
}

.card-custom .card-body {
    padding: 20px;
    background: linear-gradient(135deg, #f8f9fa, #e3e4e6);
}

.btn-primary {
    border-radius: 20px;
    box-shadow: 0 4px 6px rgba(0, 123, 255, 0.3);
    transition: box-shadow 0.3s ease;
}

.btn-primary:hover {
    box-shadow: 0 6px 10px rgba(0, 123, 255, 0.5);
}

.form-label {
    font-weight: bold;
}

.form-section {
    padding: 50px 0;
}</style>
<body>
<section class="form-section">
    <div class="container mt-5">
        <div class="row">
            <div class="col-lg-10 mx-auto">
                <h2 class="text-center mb-4">Edit Project Information</h2>
                <div class="card card-custom">
                    <div class="card-body">
                        <% if (request.getParameter("status") != null && request.getParameter("status").equals("error")) { %>
                        <div class="alert alert-danger">
                            Error: <%= request.getParameter("message") != null ? request.getParameter("message") : "Unknown error occurred" %>
                        </div>
                        <% } %>

                        <form id="projectForm" action="project" method="post">
                            <input type="hidden" name="action" value="update">
                            <input type="hidden" name="id" value="${project.id}">
                            <div class="row g-4">
                                <div class="col-md-12">
                                    <label for="projectName" class="form-label">Project Name*</label>
                                    <input type="text" class="form-control" id="projectName" name="name" value="${project.name}" required>
                                </div>

                                <div class="col-md-12">
                                    <label for="projectDescription" class="form-label">Project Description*</label>
                                    <textarea class="form-control" id="projectDescription" rows="4" name="description" required>${project.description}</textarea>
                                </div>

                                <div class="col-md-6">
                                    <label for="startDate" class="form-label">Start Date*</label>
                                    <input type="date" class="form-control" id="startDate" name="startDate" value="${project.start_date}" required>
                                </div>

                                <div class="col-md-6">
                                    <label for="endDate" class="form-label">End Date*</label>
                                    <input type="date" class="form-control" id="endDate" name="endDate" value="${project.end_date}" required>
                                </div>

                                <div class="col-md-6">
                                    <label for="budget" class="form-label">Budget ($)*</label>
                                    <input type="number" step="0.01" class="form-control" name="budget" id="budget" value="${project.budget}" required>
                                </div>

                                <div class="col-md-12 mt-4">
                                    <div class="d-flex justify-content-between">
                                        <a href="project" class="btn btn-outline-secondary">Cancel</a>
                                        <button type="submit" class="btn btn-primary">Update Project</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>