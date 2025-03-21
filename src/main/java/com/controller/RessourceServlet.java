package com.controller;

import com.dao.ResourceDao;
import com.model.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/resource")
public class RessourceServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("resource.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        switch (action) {
            case "addResource":
                try {
                    addResource(req,resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
        }
    }

    private void addResource(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException {
        String name = req.getParameter("name");
        String type = req.getParameter("type");
        String supplierInfo=req.getParameter("supplierInfo");
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        try {
            Resource resource = new Resource();
            resource.setName(name);
            resource.setType(type);
            resource.setQuantity(quantity);
            resource.setSupplierInfo(supplierInfo);
            ResourceDao resourceDao = new ResourceDao();
            resourceDao.addResource(resource);
            resp.sendRedirect("resource?action=view&id=" + resource.getId() + "&status=success");
        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("resource?status=error&message=" + e.getMessage());
        }
    }
}
