<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.Product, java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>Report Results</title>
  <%@ include file="common_styles.jsp" %>
</head>
<body>
<nav>
  <a class="nav-brand" href="index.jsp">📦 ProductWebApp</a>
  <div class="nav-links">
    <a href="index.jsp">Home</a>
    <a href="DisplayProductsServlet">Products</a>
    <a href="productadd.jsp">Add</a>
    <a href="productupdate.jsp">Update</a>
    <a href="productdelete.jsp">Delete</a>
    <a href="ReportCriteriaServlet" class="active">Reports</a>
  </div>
</nav>

<div class="container">
  <%
    @SuppressWarnings("unchecked")
    List<Product> results     = (List<Product>) request.getAttribute("results");
    String reportTitle        = (String) request.getAttribute("reportTitle");
    String reportDesc         = (String) request.getAttribute("reportDesc");
    int count = (results != null) ? results.size() : 0;
  %>

  <div style="display:flex; align-items:center; justify-content:space-between; margin-bottom:1.5rem; flex-wrap:wrap; gap:1rem;">
    <h1 class="page-title" style="margin:0;">📊 <span><%= reportTitle %></span></h1>
    <a href="ReportCriteriaServlet" class="btn btn-ghost">← New Report</a>
  </div>

  <div class="stats">
    <div class="stat-card">
      <div class="stat-val"><%= count %></div>
      <div class="stat-lbl">Records Found</div>
    </div>
    <% if (results != null && count > 0) {
        double avg = results.stream().mapToDouble(Product::getPrice).average().orElse(0);
        double max = results.stream().mapToDouble(Product::getPrice).max().orElse(0);
    %>
    <div class="stat-card">
      <div class="stat-val">₹<%= String.format("%.0f", avg) %></div>
      <div class="stat-lbl">Average Price</div>
    </div>
    <div class="stat-card">
      <div class="stat-val">₹<%= String.format("%.0f", max) %></div>
      <div class="stat-lbl">Highest Price</div>
    </div>
    <% } %>
  </div>

  <div class="card">
    <p style="color:var(--muted); font-size:0.875rem; margin-bottom:1.25rem;"><%= reportDesc %></p>

    <% if (results == null || results.isEmpty()) { %>
      <div class="empty">
        <div class="empty-icon">🔍</div>
        <p>No products match the selected criteria.</p>
      </div>
    <% } else { %>
      <div class="table-wrap">
        <table>
          <thead>
            <tr>
              <th>#</th>
              <th>ID</th>
              <th>Product Name</th>
              <th>Category</th>
              <th>Price</th>
              <th>Quantity</th>
            </tr>
          </thead>
          <tbody>
            <% int rank = 1; for (Product p : results) { %>
            <tr>
              <td style="color:var(--muted);"><%= rank++ %></td>
              <td><%= p.getProductID() %></td>
              <td><strong><%= p.getProductName() %></strong></td>
              <td><span class="badge badge-blue"><%= p.getCategory() %></span></td>
              <td>₹<%= String.format("%.2f", p.getPrice()) %></td>
              <td><span class="badge badge-green"><%= p.getQuantity() %></span></td>
            </tr>
            <% } %>
          </tbody>
        </table>
      </div>
    <% } %>
  </div>
</div>
</body>
</html>
