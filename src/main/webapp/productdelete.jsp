<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.Product" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>Delete Product</title>
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
    <a href="productdelete.jsp" class="active">Delete</a>
    <a href="ReportCriteriaServlet">Reports</a>
  </div>
</nav>

<div class="container">
  <h1 class="page-title">Delete <span>Product</span></h1>

  <%
    String msg     = (String) request.getAttribute("message");
    String msgType = (String) request.getAttribute("msgType");
    if (msg != null) {
  %>
    <div class="alert alert-<%= msgType %>"><%= msg %></div>
  <% } %>

  <%-- Step 1: Search --%>
  <div class="card">
    <h3 style="margin-bottom:1rem; font-size:1rem; color:var(--muted);">Step 1 — Find Product by ID</h3>
    <form action="DeleteProductServlet" method="get" style="display:flex; gap:0.75rem; align-items:flex-end;">
      <div class="form-group" style="margin:0; flex:1;">
        <label>Product ID</label>
        <input type="number" name="productID" placeholder="Enter product ID" required min="1"/>
      </div>
      <button type="submit" class="btn btn-ghost">Search</button>
    </form>
  </div>

  <%-- Step 2: Confirm deletion --%>
  <%
    Product p = (Product) request.getAttribute("product");
    if (p != null) {
  %>
  <div class="card" style="border-color: var(--red)33;">
    <h3 style="margin-bottom:1rem; font-size:1rem; color:var(--red);">Step 2 — Confirm Deletion</h3>
    <table style="margin-bottom:1.5rem;">
      <tr><th>ID</th><td><%= p.getProductID() %></td></tr>
      <tr><th>Name</th><td><%= p.getProductName() %></td></tr>
      <tr><th>Category</th><td><%= p.getCategory() %></td></tr>
      <tr><th>Price</th><td>₹<%= String.format("%.2f", p.getPrice()) %></td></tr>
      <tr><th>Quantity</th><td><%= p.getQuantity() %></td></tr>
    </table>
    <p style="color:var(--muted); font-size:0.85rem; margin-bottom:1.25rem;">
      ⚠️ This action cannot be undone. The product will be permanently removed.
    </p>
    <form action="DeleteProductServlet" method="post" style="display:inline;">
      <input type="hidden" name="productID" value="<%= p.getProductID() %>"/>
      <button type="submit" class="btn btn-danger">Confirm Delete</button>
      <a href="productdelete.jsp" class="btn btn-ghost" style="margin-left:0.75rem;">Cancel</a>
    </form>
  </div>
  <% } %>
</div>
</body>
</html>
