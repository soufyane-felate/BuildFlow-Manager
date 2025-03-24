<%@ page import="com.model.Task" %>
<%@ page import="com.model.Resource" %>
<%@ page import="com.model.Assignment" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Select Resources for Task</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container py-5">
    <%
        Task task = (Task) request.getAttribute("task");
        int projectId = (Integer) request.getAttribute("projectId");
        List<Resource> resources = (List<Resource>) request.getAttribute("resources");
        List<Assignment> existingAssignments = (List<Assignment>) request.getAttribute("existingAssignments");
        String status = request.getParameter("status");
        String message = request.getParameter("message");
    %>

    <div class="mb-4">
        <h2>Select Resources for Task: <%= task.getDescription() %></h2>
        <p>Choose resources and specify quantities to assign to this task.</p>
    </div>

    <% if (status != null) { %>
    <% if (status.equals("error")) { %>
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        <strong>Error!</strong> <%= message != null ? message : "An error occurred while processing your request." %>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <% } else if (status.equals("warning")) { %>
    <div class="alert alert-warning alert-dismissible fade show" role="alert">
        <strong>Warning!</strong> <%= message != null ? message : "Some issues occurred while processing your request." %>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <% } else if (status.equals("success")) { %>
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        <strong>Success!</strong> <%= message != null ? message : "Resources have been successfully assigned." %>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <% } %>
    <% } %>

    <% if (existingAssignments != null && !existingAssignments.isEmpty()) { %>
    <div class="mb-4">
        <h4>Current Assigned Resources</h4>
        <div class="table-responsive">
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>Resource Name</th>
                    <th>Type</th>
                    <th>Quantity Assigned</th>
                </tr>
                </thead>
                <tbody>
                <% for (Assignment assignment : existingAssignments) { %>
                <tr>
                    <td><%= assignment.getResourceName() %></td>
                    <td><%= assignment.getResourceType() %></td>
                    <td><%= assignment.getQuantity() %></td>
                </tr>
                <% } %>
                </tbody>
            </table>
        </div>
        <a href="resource?action=viewAssignments&taskId=<%= task.getId() %>&projectId=<%= projectId %>" class="btn btn-info mb-3">
            Manage Existing Assignments
        </a>
    </div>
    <% } %>

    <form action="resource" method="post">
        <input type="hidden" name="action" value="assignToTask">
        <input type="hidden" name="taskId" value="<%= task.getId() %>">
        <input type="hidden" name="projectId" value="<%= projectId %>">

        <div class="row">
            <% if (resources != null && !resources.isEmpty()) { %>
            <% for (Resource resource : resources) { %>
            <div class="col-md-4 mb-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"><%= resource.getName() %></h5>
                        <p class="card-text">Type: <%= resource.getType() %></p>
                        <p class="card-text">
                            <span class="text-success fw-bold">Available: <%= resource.getQuantity() %></span>
                        </p>

                        <div class="form-check mb-2">
                            <input class="form-check-input" type="checkbox" name="resourceId" value="<%= resource.getId() %>" id="resource<%= resource.getId() %>">
                            <label class="form-check-label" for="resource<%= resource.getId() %>">
                                Select this resource
                            </label>
                        </div>

                        <div class="mb-3">
                            <label for="quantity_<%= resource.getId() %>" class="form-label">Quantity:</label>
                            <input type="number" class="form-control" id="quantity_<%= resource.getId() %>"
                                   name="quantity_<%= resource.getId() %>" min="1" max="<%= resource.getQuantity() %>" value="1">
                            <small class="form-text text-muted">Max: <%= resource.getQuantity() %></small>
                        </div>
                    </div>
                </div>
            </div>
            <% } %>

            <div class="col-12 mt-3">
                <button type="submit" class="btn btn-primary">Assign Selected Resources</button>
                <a href="task?action=view&projectId=<%= projectId %>" class="btn btn-secondary">Cancel</a>
                <a href="addresource" class="btn btn-outline-secondary">Create new resource</a>
            </div>
            <% } else { %>
            <div class="col-12">
                <div class="alert alert-warning" role="alert">
                    No resources available. <a href="resource.jsp">Add resources</a> first.
                </div>
                <a href="task?action=view&projectId=<%= projectId %>" class="btn btn-secondary">Back to Tasks</a>
            </div>
            <% } %>
        </div>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>