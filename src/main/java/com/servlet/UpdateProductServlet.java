package com.servlet;

import com.dao.ProductDAO;
import com.model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/UpdateProductServlet")
public class UpdateProductServlet extends HttpServlet {

    private final ProductDAO dao = new ProductDAO();

    // GET: load product data into the form
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String idParam = req.getParameter("productID");
        if (idParam != null && !idParam.isEmpty()) {
            try {
                int id = Integer.parseInt(idParam.trim());
                Product p = dao.getProductByID(id);
                if (p != null) {
                    req.setAttribute("product", p);
                } else {
                    req.setAttribute("message", "❌ No product found with ID: " + id);
                    req.setAttribute("msgType", "error");
                }
            } catch (NumberFormatException e) {
                req.setAttribute("message", "❌ Invalid Product ID.");
                req.setAttribute("msgType", "error");
            }
        }
        req.getRequestDispatcher("productupdate.jsp").forward(req, resp);
    }

    // POST: save updated data
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            int    id       = Integer.parseInt(req.getParameter("productID").trim());
            String name     = req.getParameter("productName").trim();
            String category = req.getParameter("category").trim();
            double price    = Double.parseDouble(req.getParameter("price").trim());
            int    qty      = Integer.parseInt(req.getParameter("quantity").trim());

            Product p = new Product(id, name, category, price, qty);
            boolean success = dao.updateProduct(p);

            req.setAttribute("message", success
                ? "✅ Product updated successfully!"
                : "❌ Update failed. Product ID not found.");
            req.setAttribute("msgType", success ? "success" : "error");

            if (success) req.setAttribute("product", p);

        } catch (NumberFormatException e) {
            req.setAttribute("message", "❌ Invalid input. Please check all fields.");
            req.setAttribute("msgType", "error");
        }

        req.getRequestDispatcher("productupdate.jsp").forward(req, resp);
    }
}
