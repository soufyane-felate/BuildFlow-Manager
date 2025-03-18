package com.dao;

import com.model.Resource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ResourceDao {
    public void addResource(Resource resource) throws SQLException {
      String sql="INSERT INTO Ressource(name,type,quantity)VALUE(?,?,?,?)";
      try(Connection con=DBConnection.getConnection();
          PreparedStatement prst = con.prepareStatement(sql);)
      {
          prst.setString(1,resource.getName());
          prst.setString(2,resource.getType());
          prst.setInt(3,resource.getQuantity());
          prst.executeUpdate();
      }
    }
}
