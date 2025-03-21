<%@ page import="com.dao.ResourceDao" %>
<%@ page import="com.model.Resource" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Resource Inventory</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container py-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>Resource Inventory</h2>
        <a href="resource.jsp" class="btn btn-primary">Add New Resource</a>
    </div>

    <%
        String status = request.getParameter("status");
        String message = request.getParameter("message");

        if (status != null) {
            String alertClass = status.equals("success") ? "alert-success" : "alert-danger";
    %>
    <div class="alert <%= alertClass %> alert-dismissible fade show" role="alert">
        <%= message != null ? message : (status.equals("success") ? "Operation completed successfully." : "An error occurred.") %>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <% } %>

    <div class="row">
        <%
            List<Resource> resources = (List<Resource>) request.getAttribute("resources");
            if (resources != null && !resources.isEmpty()) {
                for (Resource resource : resources) {
        %>
        <div class="col-md-4 mb-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title"><%= resource.getName() %></h5>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item"><strong>Type:</strong> <%= resource.getType() %></li>
                        <li class="list-group-item">
                            <strong>Quantity:</strong>
                            <span class="<%= resource.getQuantity() > 0 ? "text-success" : "text-danger" %>">
                                        <%= resource.getQuantity() %>
                                    </span>
                        </li>
                        <li class="list-group-item"><strong>Supplier:</strong> <%= resource.getSupplierInfo() %></li>
                    </ul>

                    <div class="mt-3">
                        <a href="resource?action=edit&id=<%= resource.getId() %>" class="btn btn-sm btn-primary">Edit</a>
                        <a href="resource?action=delete&id=<%= resource.getId() %>"
                           class="btn btn-sm btn-danger"
                           onclick="return confirm('Are you sure you want to delete this resource?');">
                            Delete
                        </a>
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
                No resources found. Add some resources to get started.
            </div>
        </div>
        <%
            }
        %>
    </div>

    <div class="mt-4">
        <a href="index.jsp" class="btn btn-secondary">Back to Dashboard</a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>