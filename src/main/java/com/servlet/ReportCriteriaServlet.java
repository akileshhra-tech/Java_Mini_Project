package com.servlet;

import com.dao.ProductDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/ReportCriteriaServlet")
public class ReportCriteriaServlet extends HttpServlet {

    private final ProductDAO dao = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // Pass distinct categories to the form for the dropdown
        List<String> categories = dao.getAllCategories();
        req.setAttribute("categories", categories);
        req.getRequestDispatcher("report_form.jsp").forward(req, resp);
    }
}
