package com.servlet;

import com.dao.ProductDAO;
import com.model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/DeleteProductServlet")
public class DeleteProductServlet extends HttpServlet {

    private final ProductDAO dao = new ProductDAO();

    // GET: look up product to confirm before deleting
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
        req.getRequestDispatcher("productdelete.jsp").forward(req, resp);
    }

    // POST: perform actual deletion
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            int id = Integer.parseInt(req.getParameter("productID").trim());
            boolean success = dao.deleteProduct(id);

            req.setAttribute("message", success
                ? "✅ Product (ID: " + id + ") deleted successfully!"
                : "❌ Delete failed. Product ID not found.");
            req.setAttribute("msgType", success ? "success" : "error");

        } catch (NumberFormatException e) {
            req.setAttribute("message", "❌ Invalid Product ID.");
            req.setAttribute("msgType", "error");
        }

        req.getRequestDispatcher("productdelete.jsp").forward(req, resp);
    }
}
