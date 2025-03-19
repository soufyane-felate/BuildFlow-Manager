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
      String sql="INSERT INTO Ressource(name,type,quantity)VALUE(?,?,?)";
      try(Connection con=DBConnection.getConnection();
          PreparedStatement prst = con.prepareStatement(sql);)
      {
          prst.setString(1,resource.getName());
          prst.setString(2,resource.getType());
          prst.setInt(3,resource.getQuantity());
          prst.executeUpdate();
      }
    }

    public List<Resource> getAllRessource()throws SQLException {
        String sql="SELECT * FROM Ressource";
        List<Resource> resourceList=new ArrayList<Resource>();
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
                resourceList.add(resource);
            }
        }
        return resourceList;

    }
    public void updateResource(Resource resource) throws SQLException {
      String query="UPDATE Ressource SET name=?,type=? WHERE id=?";
      try(Connection con=DBConnection.getConnection();
      PreparedStatement prst=con.prepareStatement(query)
     )
      {
          prst.setString(1,resource.getName());
          prst.setString(2,resource.getType());
          prst.setInt(3,resource.getId());
          prst.executeUpdate();

      }
    }
    public void deleteResource(Resource resource) throws SQLException {
        String query="DELETE FROM Ressource WHERE id=?";
        try(Connection con=DBConnection.getConnection();
        PreparedStatement prst=con.prepareStatement(query))
        {
            prst.setInt(1,resource.getId());
            prst.executeUpdate();
        }
    }
}
