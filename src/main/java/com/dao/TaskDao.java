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

    public List<Task> getAllTasks() throws SQLException {
        List<Task> tasks = new ArrayList<>();
        String query="SELECT * FROM Task ";
        try(Connection con=DBConnection.getConnection();
            PreparedStatement prst=con.prepareStatement(query);
            ResultSet res=prst.executeQuery();)
        {
            while (res.next()) {
                Task task=new Task();
                task.setId(res.getInt("id"));
                task.setDescription(res.getString("description"));
                task.setStart_date(res.getDate("start_date"));
                task.setEnd_date(res.getDate("end_date"));
                task.setProject_id(res.getInt("projectId"));
                tasks.add(task);
            }
        }
        return tasks;
    }
}
