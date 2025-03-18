<%--
  Created by IntelliJ IDEA.
  User: LEADER
  Date: 3/17/2025
  Time: 12:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

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

</body>
</html>
