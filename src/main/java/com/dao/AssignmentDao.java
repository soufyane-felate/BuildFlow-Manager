package com.dao;


import com.model.Resource;
import com.model.Task;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AssignmentDao {

    public void addResource(Resource resource) throws SQLException {
        String sql = "INSERT INTO Ressource(name, type, quantity, supplierInfo) VALUES (?, ?, ?, ?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement prst = con.prepareStatement(sql)) {
            prst.setString(1, resource.getName());
            prst.setString(2, resource.getType());
            prst.setInt(3, resource.getQuantity());
            prst.setString(4, resource.getSupplierInfo());
            prst.executeUpdate();
        }
    }

    public List<Resource> getAllResources() throws SQLException {
        String sql = "SELECT * FROM Ressource";
        List<Resource> resourceList = new ArrayList<>();
        try (Connection con = DBConnection.getConnection();
             PreparedStatement prst = con.prepareStatement(sql);
             ResultSet rs = prst.executeQuery()) {

            while (rs.next()) {
                Resource resource = new Resource();
                resource.setId(rs.getInt("id"));
                resource.setName(rs.getString("name"));
                resource.setType(rs.getString("type"));
                resource.setQuantity(rs.getInt("quantity"));
                resource.setSupplierInfo(rs.getString("supplierInfo"));
                resourceList.add(resource);
            }
        }
        return resourceList;
    }

    public void updateResource(Resource resource) throws SQLException {
        String query = "UPDATE Ressource SET name=?, type=?, quantity=?, supplierInfo=? WHERE id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement prst = con.prepareStatement(query)) {
            prst.setString(1, resource.getName());
            prst.setString(2, resource.getType());
            prst.setInt(3, resource.getQuantity());
            prst.setString(4, resource.getSupplierInfo());
            prst.setInt(5, resource.getId());
            prst.executeUpdate();
        }
    }

    public void deleteResource(int resourceId) throws SQLException {
        String query = "DELETE FROM Ressource WHERE id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement prst = con.prepareStatement(query)) {
            prst.setInt(1, resourceId);
            prst.executeUpdate();
        }
    }

    public void assignResourceToTask(int taskId, int resourceId, int usedQuantity) throws SQLException {
        String assignQuery = "INSERT INTO Assignment(taskId, ressourceId, userquantity) VALUES (?, ?, ?)";
        String updateResourceQuery = "UPDATE Ressource SET quantity = quantity - ? WHERE id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement assignStmt = con.prepareStatement(assignQuery);
             PreparedStatement updateStmt = con.prepareStatement(updateResourceQuery)) {

            assignStmt.setInt(1, taskId);
            assignStmt.setInt(2, resourceId);
            assignStmt.setInt(3, usedQuantity);
            assignStmt.executeUpdate();

            updateStmt.setInt(1, usedQuantity);
            updateStmt.setInt(2, resourceId);
            updateStmt.executeUpdate();
        }
    }
}
