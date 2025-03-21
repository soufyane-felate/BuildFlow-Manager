<%@ page import="com.model.Task" %>
<%@ page import="com.model.Assignment" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Resource Assignments</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container py-5">
    <%
        Task task = (Task) request.getAttribute("task");
        int projectId = (Integer) request.getAttribute("projectId");
        List<Assignment> assignments = (List<Assignment>) request.getAttribute("assignments");
    %>

    <div class="mb-4">
        <h2>Resource Assignments for Task: <%= task.getDescription() %></h2>
    </div>

    <% if (assignments != null && !assignments.isEmpty()) { %>
    <div class="table-responsive">
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>Resource Name</th>
                <th>Type</th>
                <th>Quantity Assigned</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <% for (Assignment assignment : assignments) { %>
            <tr>
                <td><%= assignment.getResourceName() %></td>
                <td><%= assignment.getResourceType() %></td>
                <td><%= assignment.getQuantity() %></td>
                <td>
                    <form action="resource" method="post" style="display: inline;">
                        <input type="hidden" name="action" value="deleteAssignment">
                        <input type="hidden" name="assignmentId" value="<%= assignment.getId() %>">
                        <input type="hidden" name="taskId" value="<%= task.getId() %>">
                        <input type="hidden" name="projectId" value="<%= projectId %>">
                        <button type="submit" class="btn btn-sm btn-danger"
                                onclick="return confirm('Are you sure you want to remove this resource assignment?');">
                            Remove
                        </button>
                    </form>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
    <% } else { %>
    <div class="alert alert-info" role="alert">
        No resources assigned to this task yet.
    </div>
    <% } %>

    <div class="mt-4">
        <a href="resource?action=select&taskId=<%= task.getId() %>&projectId=<%= projectId %>" class="btn btn-primary">
            Add More Resources
        </a>
        <a href="task?action=view&projectId=<%= projectId %>" class="btn btn-secondary">
            Back to Tasks
        </a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>