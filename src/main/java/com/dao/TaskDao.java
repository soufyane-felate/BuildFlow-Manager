package com.dao;

import com.model.Resource;
import com.model.Task;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TaskDao {
    public void addTask(Task task) throws SQLException {
        String query = "INSERT INTO Task(description, start_date, end_date) VALUES(?, ?, ?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement prst = con.prepareStatement(query)) {
            prst.setString(1, task.getDescription());
            prst.setDate(2, new java.sql.Date(task.getStart_date().getTime()));
            prst.setDate(3, new java.sql.Date(task.getEnd_date().getTime()));
            prst.executeUpdate();
        }
    }

    public List<Task> getAllTasks() throws SQLException {
        List<Task> tasks = new ArrayList<>();
        String query = "SELECT * FROM Task";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement prst = con.prepareStatement(query);
             ResultSet res = prst.executeQuery()) {
            while (res.next()) {
                Task task = new Task();
                task.setId(res.getInt("id"));
                task.setDescription(res.getString("description"));
                task.setStart_date(res.getDate("start_date"));
                task.setEnd_date(res.getDate("end_date"));
                try {
                    task.setId_project(res.getInt("projectId"));
                } catch (SQLException e) {
                }
                tasks.add(task);
            }
        }
        return tasks;
    }

    public Task getTaskById(int id) throws SQLException {
        Task task = null;
        String query = "SELECT * FROM Task WHERE id=?";
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
                    try {
                        task.setId_project(rs.getInt("projectId"));
                    } catch (SQLException e) {
                    }
                }
            }
        }
        return task;
    }

    public void createAndAssignTask(Task task) throws SQLException {
        String sql = "INSERT INTO Task(description, start_date, end_date, projectId) VALUES(?, ?, ?, ?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement prst = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            prst.setString(1, task.getDescription());
            prst.setDate(2, new java.sql.Date(task.getStart_date().getTime()));
            prst.setDate(3, new java.sql.Date(task.getEnd_date().getTime()));
            prst.setInt(4, task.getId_project());
            prst.executeUpdate();
        }
    }

    public List<Task> getTasksByProjectId(int projectId) throws SQLException {
        List<Task> tasks = new ArrayList<>();
        String query = "SELECT * FROM Task WHERE projectId=?";
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
                    task.setId_project(rs.getInt("projectId"));
                    tasks.add(task);
                }
            }
        }
        return tasks;
    }

    public void updateTask(Task task) throws SQLException {
        String query = "UPDATE Task SET description=?, start_date=?, end_date=? WHERE id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement prst = con.prepareStatement(query)) {
            prst.setString(1, task.getDescription());
            prst.setDate(2, new java.sql.Date(task.getStart_date().getTime()));
            prst.setDate(3, new java.sql.Date(task.getEnd_date().getTime()));
            prst.setInt(4, task.getId());
            prst.executeUpdate();
        }
    }

    public void deleteTask(int taskId) throws SQLException {
        String deleteAssignmentsQuery = "DELETE FROM Assignment WHERE taskId=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement prst = con.prepareStatement(deleteAssignmentsQuery)) {
            prst.setInt(1, taskId);
            prst.executeUpdate();
        }

        String deleteTaskQuery = "DELETE FROM Task WHERE id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement prst = con.prepareStatement(deleteTaskQuery)) {
            prst.setInt(1, taskId);
            prst.executeUpdate();
        }
    }
}