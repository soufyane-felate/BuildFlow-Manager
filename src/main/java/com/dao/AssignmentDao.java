package com.dao;

import com.model.Assignment;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AssignmentDao {

    public void assignResourceToTask(int taskId, int resourceId, int quantity) throws SQLException {
        Connection con = null;
        PreparedStatement prst = null;

        try {
            con = DBConnection.getConnection();
            con.setAutoCommit(false);

            ResourceDao resourceDao = new ResourceDao();
            resourceDao.decreaseResourceQuantity(resourceId, quantity);

            String query = "INSERT INTO Assignment(taskId, ressourceId, userquantity) VALUES(?, ?, ?)";
            prst = con.prepareStatement(query);
            prst.setInt(1, taskId);
            prst.setInt(2, resourceId);
            prst.setInt(3, quantity);
            prst.executeUpdate();

            con.commit();
        } catch (SQLException e) {
            if (con != null) {
                try {
                    con.rollback();
                } catch (SQLException ex) {
                    throw new SQLException("Error during transaction rollback", ex);
                }
            }
            throw e;
        } finally {
            if (prst != null) {
                prst.close();
            }
            if (con != null) {
                con.setAutoCommit(true);
                con.close();
            }
        }
    }

    public Assignment getAssignmentById(int id) throws SQLException {
        String query = "SELECT a.id, a.taskId, a.ressourceId, a.userquantity, r.name, r.type " +
                "FROM Assignment a " +
                "JOIN Ressource r ON a.ressourceId = r.id " +
                "WHERE a.id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement prst = con.prepareStatement(query)) {
            prst.setInt(1, id);
            try (ResultSet rs = prst.executeQuery()) {
                if (rs.next()) {
                    Assignment assignment = new Assignment();
                    assignment.setId(rs.getInt("id"));
                    assignment.setTaskId(rs.getInt("taskId"));
                    assignment.setResourceId(rs.getInt("ressourceId"));
                    assignment.setQuantity(rs.getInt("userquantity"));
                    assignment.setResourceName(rs.getString("name"));
                    assignment.setResourceType(rs.getString("type"));
                    return assignment;
                }
            }
        }
        return null;
    }

    public List<Assignment> getAssignmentsByTaskId(int taskId) throws SQLException {
        List<Assignment> assignments = new ArrayList<>();
        String query = "SELECT a.id, a.taskId, a.ressourceId, a.userquantity, r.name, r.type " +
                "FROM Assignment a " +
                "JOIN Ressource r ON a.ressourceId = r.id " +
                "WHERE a.taskId = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement prst = con.prepareStatement(query)) {
            prst.setInt(1, taskId);
            try (ResultSet rs = prst.executeQuery()) {
                while (rs.next()) {
                    Assignment assignment = new Assignment();
                    assignment.setId(rs.getInt("id"));
                    assignment.setTaskId(rs.getInt("taskId"));
                    assignment.setResourceId(rs.getInt("ressourceId"));
                    assignment.setQuantity(rs.getInt("userquantity"));
                    assignment.setResourceName(rs.getString("name"));
                    assignment.setResourceType(rs.getString("type"));
                    assignments.add(assignment);
                }
            }
        }
        return assignments;
    }

    public void deleteAssignment(int assignmentId) throws SQLException {
        Connection con = null;
        PreparedStatement prst = null;

        try {
            Assignment assignment = getAssignmentById(assignmentId);
            if (assignment == null) return;

            con = DBConnection.getConnection();
            con.setAutoCommit(false);

            String query = "DELETE FROM Assignment WHERE id = ?";
            prst = con.prepareStatement(query);
            prst.setInt(1, assignmentId);
            prst.executeUpdate();

            ResourceDao resourceDao = new ResourceDao();
            resourceDao.increaseResourceQuantity(assignment.getResourceId(), assignment.getQuantity());

            con.commit();
        } catch (SQLException e) {
            if (con != null) {
                try {
                    con.rollback();
                } catch (SQLException ex) {
                    throw new SQLException("Error during transaction rollback", ex);
                }
            }
            throw e;
        } finally {
            if (prst != null) {
                prst.close();
            }
            if (con != null) {
                con.setAutoCommit(true);
                con.close();
            }
        }
    }
}