package com.model;

public class Task {
    private int id,project_id;
    private String name,description,start_date,end_date;

    public Task(int id, int project_id, String name, String description, String start_date, String end_date) {
        this.id = id;
        this.project_id = project_id;
        this.name = name;
        this.description = description;
        this.start_date = start_date;
        this.end_date = end_date;
    }

    public Task(int project_id, String name, String description, String start_date, String end_date) {
        this.project_id = project_id;
        this.name = name;
        this.description = description;
        this.start_date = start_date;
        this.end_date = end_date;
    }

    public Task(String name, String description, String start_date, String end_date) {
        this.name = name;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStart_date() {
        return start_date;
    }

    public void setStart_date(String start_date) {
        this.start_date = start_date;
    }

    public String getEnd_date() {
        return end_date;
    }

    public void setEnd_date(String end_date) {
        this.end_date = end_date;
    }
}
