package com.model;

import java.sql.Date;

public class Task {
    private int id , id_project;
    private String description;
    Date start_date,end_date;

    public Task(int id,int id_project,  String description, Date start_date, Date end_date) {
        this.id = id;
        this.id_project = id_project;
        this.description = description;
        this.start_date = start_date;
        this.end_date = end_date;
    }

    public Task(int id_project,String description, Date start_date, Date end_date) {
        this.id_project = id_project;
        this.description = description;
        this.start_date = start_date;
        this.end_date = end_date;
    }

    public Task() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }






    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getStart_date() {
        return start_date;
    }

    public void setStart_date(Date start_date) {
        this.start_date = start_date;
    }

    public Date getEnd_date() {
        return end_date;
    }

    public void setEnd_date(Date end_date) {
        this.end_date = end_date;
    }

    public int getId_project() {
        return id_project;
    }

    public void setId_project(int id_project) {
        this.id_project = id_project;
    }
}