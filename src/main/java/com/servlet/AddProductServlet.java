package com.servlet;

import com.dao.ProductDAO;
import com.model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/AddProductServlet")
public class AddProductServlet extends HttpServlet {

    private final ProductDAO dao = new ProductDAO();

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
            boolean success = dao.addProduct(p);

            req.setAttribute("message", success
                ? "✅ Product added successfully!"
                : "❌ Failed to add product. ID may already exist.");
            req.setAttribute("msgType", success ? "success" : "error");

        } catch (NumberFormatException e) {
            req.setAttribute("message", "❌ Invalid input. Please check all fields.");
            req.setAttribute("msgType", "error");
        }

        req.getRequestDispatcher("productadd.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        resp.sendRedirect("productadd.jsp");
    }
}
