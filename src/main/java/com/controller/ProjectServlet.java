package com.controller;

import com.dao.ProjectDao;
import com.model.Project;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet("/project")
public class ProjectServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");


         if ("view".equals(action)) {
            viewProject(req, resp);
        } else if ("edit".equals(action)) {
            showEditForm(req, resp);
        } else if ("delete".equals(action)) {
            deleteProject(req, resp);
        } else {
            listProjects(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            resp.sendRedirect("project?status=error&message=Invalid action");
            return;
        }
        if ("create".equals(action)) {
            createProject(req, resp);
        } else if ("update".equals(action)) {
            updateProject(req, resp);
        }
    }

    private void createProject(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String name = req.getParameter("name");
        String description = req.getParameter("description");
        String startDateStr = req.getParameter("startDate");
        String endDateStr = req.getParameter("endDate");
        double budget = Double.parseDouble(req.getParameter("budget"));

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        try {
            Date startDate = sdf.parse(startDateStr);
            Date endDate = sdf.parse(endDateStr);

            Project project = new Project();
            project.setName(name);
            project.setDescription(description);
            project.setStart_date(startDate);
            project.setEnd_date(endDate);
            project.setBudget(budget);

            ProjectDao projectDao = new ProjectDao();
            projectDao.addProject(project);

            resp.sendRedirect("project?action=view&id=" + project.getId() + "&status=success");
        } catch (ParseException | SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("project?status=error&message=" + e.getMessage());
        }
    }

    private void updateProject(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id;
        try {
            id = Integer.parseInt(req.getParameter("id"));
        } catch (NumberFormatException e) {
            resp.sendRedirect("project?status=error&message=Invalid project ID");
            return;
        }

        String name = req.getParameter("name");
        String description = req.getParameter("description");
        String startDateStr = req.getParameter("startDate");
        String endDateStr = req.getParameter("endDate");

        double budget;
        try {
            budget = Double.parseDouble(req.getParameter("budget"));
        } catch (NumberFormatException e) {
            resp.sendRedirect("edit-project.jsp?id=" + id + "&status=error&message=Invalid budget format");
            return;
        }

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        try {
            Date startDate = sdf.parse(startDateStr);
            Date endDate = sdf.parse(endDateStr);

            Project project = new Project();
            project.setId(id);
            project.setName(name);
            project.setDescription(description);
            project.setStart_date(startDate);
            project.setEnd_date(endDate);
            project.setBudget(budget);

            ProjectDao projectDao = new ProjectDao();
            projectDao.updateProject(project);

            resp.sendRedirect("project?action=view&id=" + id + "&status=success");
        } catch (ParseException e) {
            resp.sendRedirect("edit-project.jsp?id=" + id + "&status=error&message=Invalid date format");
        } catch (SQLException e) {
            resp.sendRedirect("edit-project.jsp?id=" + id + "&status=error&message=Database error: " + e.getMessage());
        }
    }
    private void viewProject(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));

        try {
            ProjectDao projectDao = new ProjectDao();
            Project project = projectDao.getProjectById(id);

            if (project != null) {
                req.setAttribute("project", project);
                req.getRequestDispatcher("projectList").forward(req, resp);
            }
            else {resp.sendRedirect("project");}
        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("project?status=error&message=" + e.getMessage());
        }
    }

    private void showEditForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));

        try {
            ProjectDao projectDao = new ProjectDao();
            Project project = projectDao.getProjectById(id);

            if (project != null) {
                req.setAttribute("project", project);
                req.getRequestDispatcher("edit-project.jsp").forward(req, resp);
            } else {
                resp.sendRedirect("project?status=error&message=Project not found");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("project?status=error&message=" + e.getMessage());
        }
    }

    private void deleteProject(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));

        try {
            ProjectDao projectDao = new ProjectDao();
            projectDao.deleteProject(id);

            resp.sendRedirect("project?status=success&message=Project deleted successfully");
        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("project?status=error&message=" + e.getMessage());
        }
    }

    private void listProjects(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            ProjectDao projectDao = new ProjectDao();
            List<Project> projects = projectDao.getAllProjects();

            req.setAttribute("projects", projects);
            req.getRequestDispatcher("projectList").forward(req, resp);
        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("index?status=error&message=" + e.getMessage());
        }
    }
}