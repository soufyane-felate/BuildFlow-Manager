package com.dao;

import com.model.Task;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class TaskDao {
    public void addTask(Task task) throws SQLException {
       String query="INSERT INTO Task(description ,start_date,end_date,projectId)VALUES(?,?,?,?)";
               try(Connection con=DBConnection.getConnection();
               PreparedStatement prst = con.prepareStatement(query))
               {
                   prst.setString(1, task.getDescription());
                   prst.setDate(2, new java.sql.Date(task.getStart_date().getTime()));
                   prst.setDate(3, new java.sql.Date(task.getEnd_date().getTime()));
                   prst.setInt(4, task.getProject_id());
                   prst.executeUpdate();
               }
    }
}
