package com.model;

public class Resource {
    private int id,quantity,supplier_id;
    private String name,type;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getSupplier_id() {
        return supplier_id;
    }

    public void setSupplier_id(int supplier_id) {
        this.supplier_id = supplier_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Resource(int id, int quantity, int supplier_id, String name, String type) {
        this.id = id;
        this.quantity = quantity;
        this.supplier_id = supplier_id;
        this.name = name;
        this.type = type;
    }

    public Resource(int quantity, int supplier_id, String name, String type) {
        this.quantity = quantity;
        this.supplier_id = supplier_id;
        this.name = name;
        this.type = type;
    }

    public Resource(int quantity, String name, String type) {
        this.quantity = quantity;
        this.name = name;
        this.type = type;
    }

    public Resource() {
    }
}
