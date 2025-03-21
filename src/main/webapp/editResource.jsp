<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.model.Resource" %>
<%@ page import="com.dao.ResourceDao" %>
<%@ page import="java.sql.SQLException" %>

<%
    Resource resource = null;
    int resourceId = Integer.parseInt(request.getParameter("id"));
    ResourceDao resourceDao = new ResourceDao();
    try {
        resource = resourceDao.getResourceById(resourceId);
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Resource - Constructoor</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="style/project.css">
</head>
<body>

<!-- Page Header -->
<section class="page-header">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <h1>Edit Resource</h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index" class="text-white">Home</a></li>
                        <li class="breadcrumb-item active text-white" aria-current="page">Edit Resource</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</section>

<!-- Edit Resource Form -->
<section class="edit-resource-section">
    <div class="container">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="card shadow p-4">
                    <h3 class="card-title text-center mb-4">Edit Resource</h3>
                    <form action="resource" method="post">
                        <input type="hidden" name="action" value="updateResource">
                        <input type="hidden" name="id" value="<%= resource.getId() %>">

                        <div class="mb-3">
                            <label for="name" class="form-label">Name</label>
                            <input type="text" class="form-control" id="name" name="name" value="<%= resource.getName() %>" required>
                        </div>

                        <div class="mb-3">
                            <label for="type" class="form-label">Type</label>
                            <input type="text" class="form-control" id="type" name="type" value="<%= resource.getType() %>" required>
                        </div>

                        <div class="mb-3">
                            <label for="quantity" class="form-label">Quantity</label>
                            <input type="number" class="form-control" id="quantity" name="quantity" value="<%= resource.getQuantity() %>" required>
                        </div>

                        <div class="mb-3">
                            <label for="supplierInfo" class="form-label">Supplier Info</label>
                            <input type="text" class="form-control" id="supplierInfo" name="supplierInfo" value="<%= resource.getSupplierInfo() %>" required>
                        </div>

                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary">Update Resource</button>
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>