package com.dao;

import com.model.Project;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProjectDao {
    public void addProject(Project project) throws SQLException {
        String query="INSERT INTO Project(name,description,start_date,end_date,budget) VALUES(?,?,?,?,?)";
        try(Connection con =DBConnection.getConnection();
            PreparedStatement prst=con.prepareStatement(query))
        {
            prst.setString(1,project.getName());
            prst.setString(2,project.getDescription());
            prst.setDate(3, (Date) project.getStart_date());
            prst.setDate(4, (Date) project.getEnd_date());
            prst.setDouble(5, project.getBudget());
            prst.executeUpdate();
        }
    }
    public List<Project> getAllProjects() throws SQLException {
        List<Project> projects = new ArrayList<>();
        String query="SELECT * FROM Project";
        try(Connection con =DBConnection.getConnection();
        PreparedStatement prst=con.prepareStatement(query);
        ResultSet rs=prst.executeQuery()
        )
        {
            while(rs.next()){
            Project project = new Project();
            project.setId(rs.getInt("id"));
            project.setName(rs.getString("name"));
            project.setDescription(rs.getString("description"));
            project.setStart_date(rs.getDate("start_date"));
            project.setEnd_date(rs.getDate("end_date"));
            project.setBudget(rs.getDouble("budget"));
            projects.add(project);
        }
        }
    return projects;
    }
    public Project getProjectById(int id) throws SQLException {
        Project project = null;
        String query="SELECT * FROM Project WHERE id=?";
        try(Connection con =DBConnection.getConnection();
        PreparedStatement prst=con.prepareStatement(query);
      )
        {
           prst.setInt(1,id);
           try(ResultSet rs=prst.executeQuery()) {
             if(rs.next()) {
                  project = new Project();
                 project.setId(rs.getInt("id"));
                 project.setName(rs.getString("name"));
                 project.setDescription(rs.getString("description"));
                 project.setStart_date(rs.getDate("start_date"));
                 project.setEnd_date(rs.getDate("end_date"));
                 project.setBudget(rs.getDouble("budget"));
             }
           }
        }
        return project;
    }
    public void deleteProject(int projectId) throws SQLException {
        String query="DELETE FROM Project WHERE id=?";
        try(Connection con =DBConnection.getConnection();
        PreparedStatement prst=con.prepareStatement(query))
        {
            prst.setInt(1,projectId);
            prst.executeUpdate();

        }
    }




}
