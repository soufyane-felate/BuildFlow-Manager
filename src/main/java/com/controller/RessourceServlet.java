package com.controller;

import com.dao.ResourceDao;
import com.dao.AssignmentDao;
import com.dao.TaskDao;
import com.model.Resource;
import com.model.Task;
import com.model.Assignment;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/resource")
public class RessourceServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "list":
                listResources(req, resp);
                break;
            case "select":
                selectResourcesForTask(req, resp);
                break;
            case "viewAssignments":
                viewResourceAssignments(req, resp);
                break;
            default:
                listResources(req, resp);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        switch (action) {
            case "addResource":
                try {
                    addResource(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "assignToTask":
                try {
                    assignResourceToTask(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "deleteAssignment":
                try {
                    deleteAssignment(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "updateResource":
                try {
                    updateResource(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "deleteResource":
                try {
                    deleteResource(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
        }
    }
    private void updateResource(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String type = req.getParameter("type");
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        String supplierInfo = req.getParameter("supplierInfo");

        Resource resource = new Resource();
        resource.setId(id);
        resource.setName(name);
        resource.setType(type);
        resource.setQuantity(quantity);
        resource.setSupplierInfo(supplierInfo);

        ResourceDao resourceDao = new ResourceDao();
        resourceDao.updateResource(resource);

        resp.sendRedirect("resource?action=list&status=success");
    }

    private void deleteResource(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException {
        int resourceId = Integer.parseInt(req.getParameter("id"));
       try {
           ResourceDao resourceDao = new ResourceDao();
           resourceDao.deleteResource(resourceId);
           System.out.println("delete resource success");
           resp.sendRedirect("resource?action=list&status=success");
       }catch (SQLException e){
           e.printStackTrace();
           System.out.println(e.getMessage());
       }

    }
    private void listResources(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            ResourceDao resourceDao = new ResourceDao();
            List<Resource> resources = resourceDao.getAllRessource();
            req.setAttribute("resources", resources);
            req.getRequestDispatcher("ressourceList.jsp").forward(req, resp);
        } catch (SQLException e) {
            throw new ServletException("Error retrieving resources", e);
        }
    }

    private void selectResourcesForTask(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int taskId = Integer.parseInt(req.getParameter("taskId"));
        int projectId = Integer.parseInt(req.getParameter("projectId"));

        try {
            TaskDao taskDao = new TaskDao();
            Task task = taskDao.getTaskById(taskId);

            ResourceDao resourceDao = new ResourceDao();
            List<Resource> resources = resourceDao.getAllRessource();

            resources.removeIf(resource -> resource.getQuantity() <= 0);

            AssignmentDao assignmentDao = new AssignmentDao();
            List<Assignment> existingAssignments = assignmentDao.getAssignmentsByTaskId(taskId);

            req.setAttribute("task", task);
            req.setAttribute("projectId", projectId);
            req.setAttribute("resources", resources);
            req.setAttribute("existingAssignments", existingAssignments);

            req.getRequestDispatcher("selectResources.jsp").forward(req, resp);
        } catch (SQLException e) {
            throw new ServletException("Error retrieving resources or task data", e);
        }
    }

    private void viewResourceAssignments(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int taskId = Integer.parseInt(req.getParameter("taskId"));
        int projectId = Integer.parseInt(req.getParameter("projectId"));

        try {
            TaskDao taskDao = new TaskDao();
            Task task = taskDao.getTaskById(taskId);

            AssignmentDao assignmentDao = new AssignmentDao();
            List<Assignment> assignments = assignmentDao.getAssignmentsByTaskId(taskId);

            req.setAttribute("task", task);
            req.setAttribute("projectId", projectId);
            req.setAttribute("assignments", assignments);

            req.getRequestDispatcher("viewAssignments.jsp").forward(req, resp);
        } catch (SQLException e) {
            throw new ServletException("Error retrieving assignment data", e);
        }
    }

    private void addResource(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException {
        String name = req.getParameter("name");
        String type = req.getParameter("type");
        String supplierInfo = req.getParameter("supplierInfo");
        int quantity = Integer.parseInt(req.getParameter("quantity"));

        try {
            Resource resource = new Resource();
            resource.setName(name);
            resource.setType(type);
            resource.setQuantity(quantity);
            resource.setSupplierInfo(supplierInfo);

            ResourceDao resourceDao = new ResourceDao();
            resourceDao.addResource(resource);

            resp.sendRedirect("resource?action=list&status=success");
        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("resource?action=list&status=error&message=" + e.getMessage());
        }
    }

    private void assignResourceToTask(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException {
        int taskId = Integer.parseInt(req.getParameter("taskId"));
        int projectId = Integer.parseInt(req.getParameter("projectId"));
        String[] resourceIds = req.getParameterValues("resourceId");

        AssignmentDao assignmentDao = new AssignmentDao();
        ResourceDao resourceDao = new ResourceDao();
        boolean hasInsufficientResources = false;

        if (resourceIds != null) {
            for (String resourceIdStr : resourceIds) {
                int resourceId = Integer.parseInt(resourceIdStr);
                int requestedQuantity = Integer.parseInt(req.getParameter("quantity_" + resourceId));

                if (requestedQuantity > 0) {
                    // Check if there's enough quantity available
                    Resource resource = resourceDao.getResourceById(resourceId);
                    if (resource != null && resource.getQuantity() >= requestedQuantity) {
                        try {
                            assignmentDao.assignResourceToTask(taskId, resourceId, requestedQuantity);
                        } catch (SQLException e) {
                            e.printStackTrace();
                            resp.sendRedirect("resource?action=select&taskId=" + taskId +
                                    "&projectId=" + projectId +
                                    "&status=error&message=Error+assigning+resources");
                            return;
                        }
                    } else {
                        hasInsufficientResources = true;
                    }
                }
            }
        }

        if (hasInsufficientResources) {
            resp.sendRedirect("resource?action=select&taskId=" + taskId +
                    "&projectId=" + projectId +
                    "&status=warning&message=Some+resources+had+insufficient+quantity");
        } else {
            resp.sendRedirect("task?action=list&projectId=" + projectId + "&status=success");
        }
    }

    private void deleteAssignment(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException {
        int assignmentId = Integer.parseInt(req.getParameter("assignmentId"));
        int taskId = Integer.parseInt(req.getParameter("taskId"));
        int projectId = Integer.parseInt(req.getParameter("projectId"));

        AssignmentDao assignmentDao = new AssignmentDao();
        try {
            assignmentDao.deleteAssignment(assignmentId);
            resp.sendRedirect("resource?action=viewAssignments&taskId=" + taskId +
                    "&projectId=" + projectId + "&status=success");
        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("resource?action=viewAssignments&taskId=" + taskId +
                    "&projectId=" + projectId +
                    "&status=error&message=Error+removing+assignment");
        }
    }
}