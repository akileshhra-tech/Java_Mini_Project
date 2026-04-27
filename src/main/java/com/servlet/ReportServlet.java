package com.servlet;

import com.dao.ProductDAO;
import com.model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet {

    private final ProductDAO dao = new ProductDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String reportType = req.getParameter("reportType");
        List<Product> results = null;
        String reportTitle   = "";
        String reportDesc    = "";

        try {
            switch (reportType) {

                case "priceAbove": {
                    double minPrice = Double.parseDouble(req.getParameter("minPrice").trim());
                    results     = dao.getProductsAbovePrice(minPrice);
                    reportTitle = "Products with Price > ₹" + String.format("%.2f", minPrice);
                    reportDesc  = results.size() + " product(s) found above the price threshold.";
                    break;
                }

                case "byCategory": {
                    String category = req.getParameter("category").trim();
                    results     = dao.getProductsByCategory(category);
                    reportTitle = "Products in Category: " + category;
                    reportDesc  = results.size() + " product(s) found in this category.";
                    break;
                }

                case "topN": {
                    int n   = Integer.parseInt(req.getParameter("topN").trim());
                    results     = dao.getTopNProducts(n);
                    reportTitle = "Top " + n + " Products by Quantity";
                    reportDesc  = "Showing the highest-stocked " + n + " product(s).";
                    break;
                }

                default:
                    req.setAttribute("message", "❌ Unknown report type selected.");
                    req.setAttribute("msgType", "error");
                    req.getRequestDispatcher("report_form.jsp").forward(req, resp);
                    return;
            }

        } catch (NumberFormatException e) {
            req.setAttribute("message", "❌ Invalid numeric input for the report criteria.");
            req.setAttribute("msgType", "error");
            req.getRequestDispatcher("report_form.jsp").forward(req, resp);
            return;
        }

        req.setAttribute("results",     results);
        req.setAttribute("reportTitle", reportTitle);
        req.setAttribute("reportDesc",  reportDesc);
        req.setAttribute("reportType",  reportType);
        req.getRequestDispatcher("report_result.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        resp.sendRedirect("ReportCriteriaServlet");
    }
}
