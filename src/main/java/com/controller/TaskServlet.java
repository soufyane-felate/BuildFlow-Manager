package com.controller;

import com.dao.TaskDao;
import com.model.Task;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet("/task")
public class TaskServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("create".equals(action)) {
            int projectId = Integer.parseInt(req.getParameter("projectId"));
            req.setAttribute("projectId", projectId);
            req.getRequestDispatcher("task.jsp").forward(req, resp);
        } else if ("list".equals(action)) {
            listProjectTasks(req, resp);
        } else if ("edit".equals(action)) {
            editTask(req, resp);
        } else if ("delete".equals(action)) {
            deleteTask(req, resp);
        } else {
            req.getRequestDispatcher("task.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("create".equals(action)) {
            createTask(req, resp);
        } else if ("update".equals(action)) {
            updateTask(req, resp);
        }
    }

    private void createTask(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String description = req.getParameter("description");
        String startDateStr = req.getParameter("startDate");
        String endDateStr = req.getParameter("endDate");
        int projectId = Integer.parseInt(req.getParameter("projectId"));

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        try {
            java.util.Date utilStartDate = sdf.parse(startDateStr);
            java.util.Date utilEndDate = sdf.parse(endDateStr);

            java.sql.Date startDate = new java.sql.Date(utilStartDate.getTime());
            java.sql.Date endDate = new java.sql.Date(utilEndDate.getTime());

            Task task = new Task();
            task.setDescription(description);
            task.setStart_date(startDate);
            task.setEnd_date(endDate);
            task.setId_project(projectId);

            TaskDao taskDao = new TaskDao();
            taskDao.createAndAssignTask(task);

            System.out.println("Task created successfully");
            System.out.println(task);

            resp.sendRedirect("project?action=view&id=" + projectId + "&status=success");
        } catch (ParseException | SQLException e) {
            e.printStackTrace();
            System.out.println("error 1: " + e.getMessage());
            resp.sendRedirect("task?status=error&message=" + e.getMessage());
        }
    }

    private void listProjectTasks(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int projectId = Integer.parseInt(req.getParameter("projectId"));

        try {
            TaskDao taskDao = new TaskDao();
            List<Task> tasks = taskDao.getTasksByProjectId(projectId);

            req.setAttribute("tasks", tasks);
            req.setAttribute("projectId", projectId);
            req.getRequestDispatcher("taskList.jsp").forward(req, resp);
        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("project?status=error&message=" + e.getMessage());
        }
    }

    private void editTask(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int taskId = Integer.parseInt(req.getParameter("id"));

        try {
            TaskDao taskDao = new TaskDao();
            Task task = taskDao.getTaskById(taskId);

            if (task != null) {
                req.setAttribute("task", task);
                req.setAttribute("projectId", task.getId_project());
                req.getRequestDispatcher("edit_task.jsp").forward(req, resp);
            } else {
                resp.sendRedirect("project?status=error&message=Task not found");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("project?status=error&message=" + e.getMessage());
        }
    }

    private void updateTask(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int taskId = Integer.parseInt(req.getParameter("id"));
        String description = req.getParameter("description");
        String startDateStr = req.getParameter("startDate");
        String endDateStr = req.getParameter("endDate");
        int projectId = Integer.parseInt(req.getParameter("projectId"));

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        try {
            java.util.Date utilStartDate = sdf.parse(startDateStr);
            java.util.Date utilEndDate = sdf.parse(endDateStr);

            java.sql.Date startDate = new java.sql.Date(utilStartDate.getTime());
            java.sql.Date endDate = new java.sql.Date(utilEndDate.getTime());

            Task task = new Task();
            task.setId(taskId);
            task.setDescription(description);
            task.setStart_date(startDate);
            task.setEnd_date(endDate);
            task.setId_project(projectId);

            TaskDao taskDao = new TaskDao();
            taskDao.updateTask(task);

            System.out.println("Task updated successfully");

            resp.sendRedirect("task?action=list&projectId=" + projectId + "&status=success");
        } catch (ParseException | SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("task?action=edit&id=" + taskId + "&status=error&message=" + e.getMessage());
        }
    }

    private void deleteTask(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int taskId = Integer.parseInt(req.getParameter("id"));
        int projectId = Integer.parseInt(req.getParameter("projectId"));

        try {
            TaskDao taskDao = new TaskDao();
            taskDao.deleteTask(taskId);

            System.out.println("Task deleted successfully");

            resp.sendRedirect("task?action=list&projectId=" + projectId + "&status=success");
        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("task?action=list&projectId=" + projectId + "&status=error&message=" + e.getMessage());
            System.out.println("task?action=list&projectId=" + projectId + "&status=error&message=" + e.getMessage());
        }
    }
}