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
import java.util.Date;
@WebServlet("/task")
public class TaskServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("task.jsp").forward(req, resp);
    }

   public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
   {
       String action = req.getParameter("action");
       switch (action)
       {
           case "create":
               createTask(req,resp);
                break;
       }
   }



    private void createTask(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String description = req.getParameter("description");
        String startDatestr = req.getParameter("startDate");
        String endDatestr = req.getParameter("endDate");
        int projectId = Integer.parseInt(req.getParameter("project"));

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        try {
            java.util.Date utilStartDate = sdf.parse(startDatestr);
            java.util.Date utilEndDate = sdf.parse(endDatestr);

            java.sql.Date startdate = new java.sql.Date(utilStartDate.getTime());
            java.sql.Date enddate = new java.sql.Date(utilEndDate.getTime());

            Task task = new Task();
            task.setDescription(description);
            task.setStart_date(startdate);
            task.setEnd_date(enddate);
            task.setProject_id(projectId);

            TaskDao taskDao = new TaskDao();
            taskDao.addTask(task);

            System.out.println("Task created successfully");
            System.out.println(task);

            resp.sendRedirect("task?action=view&id=" + task.getId() + "&status=success");
        } catch (ParseException | SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("task.jsp?status=error&message=" + e.getMessage());
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }


}
