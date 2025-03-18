/*package com.dao;

import com.model.Project;
import com.model.Resource;
import com.model.Task;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

public class test {

    // Project insertion - already implemented in your ProjectDao class
    public void addProject(Project project) throws SQLException {
        String query = "INSERT INTO Project(name, description, start_date, end_date, budget) VALUES (?, ?, ?, ?, ?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement prst = con.prepareStatement(query)) {
            prst.setString(1, project.getName());
            prst.setString(2, project.getDescription());
            prst.setDate(3, new java.sql.Date(project.getStart_date().getTime()));
            prst.setDate(4, new java.sql.Date(project.getEnd_date().getTime()));
            prst.setDouble(5, project.getBudget());
            prst.executeUpdate();
        }
    }

    // Task insertion
    public void addTask(Task task) throws SQLException {
        String query = "INSERT INTO Task(description, start_date, end_date, projectId) VALUES (?, ?, ?, ?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement prst = con.prepareStatement(query)) {
            prst.setString(1, task.getDescription());
            prst.setDate(2, new java.sql.Date(task.getStart_date().getTime()));
            prst.setDate(3, new java.sql.Date(task.getEnd_date().getTime()));
            prst.setInt(4, task.getProjectId());
            prst.executeUpdate();
        }
    }

    // Resource insertion
    public void addResource(Resource resource) throws SQLException {
        String query = "INSERT INTO Ressource(name, type, quantity) VALUES (?, ?, ?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement prst = con.prepareStatement(query)) {
            prst.setString(1, resource.getName());
            prst.setString(2, resource.getType());
            prst.setInt(3, resource.getQuantity());
            prst.executeUpdate();
        }
    }

    // Assignment insertion
    public void addAssignment(Assignment assignment) throws SQLException {
        String query = "INSERT INTO Assignment(taskId, ressourceId, userquantity) VALUES (?, ?, ?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement prst = con.prepareStatement(query)) {
            prst.setInt(1, assignment.getTaskId());
            prst.setInt(2, assignment.getRessourceId());
            prst.setInt(3, assignment.getUserQuantity());
            prst.executeUpdate();
        }
    }
}






public class TaskDao {
    // Add a task to the database
    public void addTask(Task task) throws SQLException {
        String query = "INSERT INTO Task(description, start_date, end_date, projectId) VALUES (?, ?, ?, ?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement prst = con.prepareStatement(query)) {
            prst.setString(1, task.getDescription());
            prst.setDate(2, new java.sql.Date(task.getStart_date().getTime()));
            prst.setDate(3, new java.sql.Date(task.getEnd_date().getTime()));
            prst.setInt(4, task.getProjectId());
            prst.executeUpdate();
        }
    }

    // Get all tasks for a specific project
    public List<Task> getTasksByProjectId(int projectId) throws SQLException {
        List<Task> tasks = new ArrayList<>();
        String query = "SELECT * FROM Task WHERE projectId = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement prst = con.prepareStatement(query)) {
            prst.setInt(1, projectId);
            try (ResultSet rs = prst.executeQuery()) {
                while (rs.next()) {
                    Task task = new Task();
                    task.setId(rs.getInt("id"));
                    task.setDescription(rs.getString("description"));
                    task.setStart_date(rs.getDate("start_date"));
                    task.setEnd_date(rs.getDate("end_date"));
                    task.setProjectId(rs.getInt("projectId"));
                    tasks.add(task);
                }
            }
        }
        return tasks;
    }

    // Get a task by its ID
    public Task getTaskById(int id) throws SQLException {
        Task task = null;
        String query = "SELECT * FROM Task WHERE id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement prst = con.prepareStatement(query)) {
            prst.setInt(1, id);
            try (ResultSet rs = prst.executeQuery()) {
                if (rs.next()) {
                    task = new Task();
                    task.setId(rs.getInt("id"));
                    task.setDescription(rs.getString("description"));
                    task.setStart_date(rs.getDate("start_date"));
                    task.setEnd_date(rs.getDate("end_date"));
                    task.setProjectId(rs.getInt("projectId"));
                }
            }
        }
        return task;
    }

    // Delete a task
    public void deleteTask(int taskId) throws SQLException {
        String query = "DELETE FROM Task WHERE id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement prst = con.prepareStatement(query)) {
            prst.setInt(1, taskId);
            prst.executeUpdate();
        }
    }
}



@WebServlet("/task")
public class TaskServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("create".equals(action)) {
            createTask(req, resp);
        } else if ("delete".equals(action)) {
            deleteTask(req, resp);
        }
    }

    private void createTask(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String description = req.getParameter("description");
        String startDateStr = req.getParameter("startDate");
        String endDateStr = req.getParameter("endDate");
        int projectId = Integer.parseInt(req.getParameter("projectId"));

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        try {
            Date startDate = sdf.parse(startDateStr);
            Date endDate = sdf.parse(endDateStr);

            Task task = new Task();
            task.setDescription(description);
            task.setStart_date(startDate);
            task.setEnd_date(endDate);
            task.setProjectId(projectId);

            TaskDao taskDao = new TaskDao();
            taskDao.addTask(task);

            resp.sendRedirect("project-detail.jsp?id=" + projectId + "&status=success");
        } catch (ParseException | SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("project-detail.jsp?id=" + projectId + "&status=error");
        }
    }

    private void deleteTask(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int taskId = Integer.parseInt(req.getParameter("taskId"));
        int projectId = Integer.parseInt(req.getParameter("projectId"));

        try {
            TaskDao taskDao = new TaskDao();
            taskDao.deleteTask(taskId);

            resp.sendRedirect("project-detail.jsp?id=" + projectId + "&status=success");
        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("project-detail.jsp?id=" + projectId + "&status=error");
        }
    }
}

// Similar servlet classes should be created for ResourceServlet and AssignmentServlet
// Similar classes should be created for ResourceDao and AssignmentDao
*/