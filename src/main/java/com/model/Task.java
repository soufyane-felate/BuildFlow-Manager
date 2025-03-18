package com.model;

import java.sql.Date;

public class Task {
    private int id,project_id;
    private String description;
    Date start_date,end_date;

    public Task(int id, int project_id,  String description, Date start_date, Date end_date) {
        this.id = id;
        this.project_id = project_id;
        this.description = description;
        this.start_date = start_date;
        this.end_date = end_date;
    }

    public Task(int project_id,  String description, Date start_date, Date end_date) {
        this.project_id = project_id;
        this.description = description;
        this.start_date = start_date;
        this.end_date = end_date;
    }

    public Task( String description, Date start_date, Date end_date) {
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

    public int getProject_id() {
        return project_id;
    }

    public void setProject_id(int project_id) {
        this.project_id = project_id;
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
}
