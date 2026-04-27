<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.Product, java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>All Products</title>
  <%@ include file="common_styles.jsp" %>
  <style>
    .search-bar {
      display: flex; gap: 0.75rem; margin-bottom: 1.25rem;
    }
    .search-bar input {
      flex: 1;
    }
    #searchInput { text-transform: none; }
  </style>
</head>
<body>
<nav>
  <a class="nav-brand" href="index.jsp">📦 ProductWebApp</a>
  <div class="nav-links">
    <a href="index.jsp">Home</a>
    <a href="DisplayProductsServlet" class="active">Products</a>
    <a href="productadd.jsp">Add</a>
    <a href="productupdate.jsp">Update</a>
    <a href="productdelete.jsp">Delete</a>
    <a href="ReportCriteriaServlet">Reports</a>
  </div>
</nav>

<div class="container">
  <%
    List<Product> products = (List<Product>) request.getAttribute("products");
    int total = (products != null) ? products.size() : 0;
    double totalValue = 0;
    if (products != null) for (Product p : products) totalValue += p.getPrice() * p.getQuantity();
  %>

  <h1 class="page-title">Product <span>Catalogue</span></h1>

  <div class="stats">
    <div class="stat-card">
      <div class="stat-val"><%= total %></div>
      <div class="stat-lbl">Total Products</div>
    </div>
    <div class="stat-card">
      <div class="stat-val">₹<%= String.format("%,.0f", totalValue) %></div>
      <div class="stat-lbl">Inventory Value</div>
    </div>
    <div class="stat-card" style="display:flex; align-items:center;">
      <a href="productadd.jsp" class="btn btn-primary">+ Add Product</a>
    </div>
  </div>

  <div class="card">
    <div class="search-bar">
      <input type="text" id="searchInput" placeholder="Filter by name, category…" onkeyup="filterTable()"/>
    </div>

    <% if (products == null || products.isEmpty()) { %>
      <div class="empty">
        <div class="empty-icon">📭</div>
        <p>No products found. <a href="productadd.jsp" style="color:var(--accent)">Add one now</a>.</p>
      </div>
    <% } else { %>
      <div class="table-wrap">
        <table id="productTable">
          <thead>
            <tr>
              <th>ID</th>
              <th>Product Name</th>
              <th>Category</th>
              <th>Price</th>
              <th>Quantity</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            <% for (Product p : products) { %>
            <tr>
              <td><%= p.getProductID() %></td>
              <td><strong><%= p.getProductName() %></strong></td>
              <td><span class="badge badge-blue"><%= p.getCategory() %></span></td>
              <td>₹<%= String.format("%.2f", p.getPrice()) %></td>
              <td>
                <span class="badge <%= p.getQuantity() > 10 ? "badge-green" : "badge-blue" %>">
                  <%= p.getQuantity() %>
                </span>
              </td>
              <td style="display:flex; gap:0.5rem;">
                <a href="UpdateProductServlet?productID=<%= p.getProductID() %>" class="btn btn-warning btn-sm">Edit</a>
                <a href="DeleteProductServlet?productID=<%= p.getProductID() %>" class="btn btn-danger btn-sm">Delete</a>
              </td>
            </tr>
            <% } %>
          </tbody>
        </table>
      </div>
    <% } %>
  </div>
</div>

<script>
function filterTable() {
  const q = document.getElementById('searchInput').value.toLowerCase();
  document.querySelectorAll('#productTable tbody tr').forEach(row => {
    row.style.display = row.textContent.toLowerCase().includes(q) ? '' : 'none';
  });
}
</script>
</body>
</html>
