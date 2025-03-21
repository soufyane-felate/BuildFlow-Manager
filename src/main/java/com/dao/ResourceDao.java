package com.dao;

import com.model.Resource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ResourceDao {
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

    public List<Resource> getAllRessource()throws SQLException {
        String sql="SELECT * FROM Ressource";
        List<Resource> resourceList=new ArrayList<>();
        try(Connection con=DBConnection.getConnection();
            PreparedStatement prst=con.prepareStatement(sql);
            ResultSet rs=prst.executeQuery();)
        {
            while (rs.next()) {
                Resource resource=new Resource();
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

    public Resource getResourceById(int id) throws SQLException {
        String sql = "SELECT * FROM Ressource WHERE id = ?";
        Resource resource = null;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement prst = con.prepareStatement(sql)) {
            prst.setInt(1, id);
            try (ResultSet rs = prst.executeQuery()) {
                if (rs.next()) {
                    resource = new Resource();
                    resource.setId(rs.getInt("id"));
                    resource.setName(rs.getString("name"));
                    resource.setType(rs.getString("type"));
                    resource.setQuantity(rs.getInt("quantity"));
                    resource.setSupplierInfo(rs.getString("supplierInfo"));
                }
            }
        }
        return resource;
    }
    public void updateResource(Resource resource) throws SQLException {
      String query="UPDATE Ressource SET name=?,type=?,quantity=? ,supplierInfo=? WHERE id=?";
      try(Connection con=DBConnection.getConnection();
      PreparedStatement prst=con.prepareStatement(query)
     )
      {
          prst.setString(1,resource.getName());
          prst.setString(2,resource.getType());
          prst.setInt(3,resource.getQuantity());
          prst.setString(4,resource.getSupplierInfo());
          prst.setInt(3,resource.getId());
          prst.executeUpdate();

      }
    }
    public void deleteResource(Resource resource)
            throws SQLException {
        String query="DELETE FROM Ressource WHERE id=?";
        try(Connection con=DBConnection.getConnection();
        PreparedStatement prst=con.prepareStatement(query))
        {
            prst.setInt(1,resource.getId());
            prst.executeUpdate();
        }
    }


    // Decrease the quantity of a resource by a specified amount
    public void decreaseResourceQuantity(int resourceId, int amount) throws SQLException {
        String query = "UPDATE Ressource SET quantity = quantity - ? WHERE id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement prst = con.prepareStatement(query)) {
            prst.setInt(1, amount);
            prst.setInt(2, resourceId);
            prst.executeUpdate();
        }
    }

    // Increase the quantity of a resource by a specified amount (for when assignments are removed)
    public void increaseResourceQuantity(int resourceId, int amount) throws SQLException {
        String query = "UPDATE Ressource SET quantity = quantity + ? WHERE id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement prst = con.prepareStatement(query)) {
            prst.setInt(1, amount);
            prst.setInt(2, resourceId);
            prst.executeUpdate();
        }
    }


}
