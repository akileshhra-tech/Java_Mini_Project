<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.Product" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>Update Product</title>
  <%@ include file="common_styles.jsp" %>
</head>
<body>
<nav>
  <a class="nav-brand" href="index.jsp">📦 ProductWebApp</a>
  <div class="nav-links">
    <a href="index.jsp">Home</a>
    <a href="DisplayProductsServlet">Products</a>
    <a href="productadd.jsp">Add</a>
    <a href="productupdate.jsp" class="active">Update</a>
    <a href="productdelete.jsp">Delete</a>
    <a href="ReportCriteriaServlet">Reports</a>
  </div>
</nav>

<div class="container">
  <h1 class="page-title">Update <span>Product</span></h1>

  <%
    String msg     = (String) request.getAttribute("message");
    String msgType = (String) request.getAttribute("msgType");
    if (msg != null) {
  %>
    <div class="alert alert-<%= msgType %>"><%= msg %></div>
  <% } %>

  <%-- Step 1: Search by ID --%>
  <div class="card">
    <h3 style="margin-bottom:1rem; font-size:1rem; color:var(--muted);">Step 1 — Find Product by ID</h3>
    <form action="UpdateProductServlet" method="get" style="display:flex; gap:0.75rem; align-items:flex-end;">
      <div class="form-group" style="margin:0; flex:1;">
        <label>Product ID</label>
        <input type="number" name="productID" placeholder="Enter product ID" required min="1"/>
      </div>
      <button type="submit" class="btn btn-ghost">Search</button>
    </form>
  </div>

  <%-- Step 2: Edit Form (only if product found) --%>
  <%
    Product p = (Product) request.getAttribute("product");
    if (p != null) {
  %>
  <div class="card">
    <h3 style="margin-bottom:1rem; font-size:1rem; color:var(--muted);">Step 2 — Edit Details</h3>
    <form action="UpdateProductServlet" method="post">
      <input type="hidden" name="productID" value="<%= p.getProductID() %>"/>
      <div class="form-group">
        <label>Product ID</label>
        <input type="text" value="<%= p.getProductID() %>" disabled/>
      </div>
      <div class="form-group">
        <label>Product Name</label>
        <input type="text" name="productName" value="<%= p.getProductName() %>" required maxlength="100"/>
      </div>
      <div class="form-group">
        <label>Category</label>
        <input type="text" name="category" value="<%= p.getCategory() %>" required maxlength="50"/>
      </div>
      <div class="form-group">
        <label>Price (₹)</label>
        <input type="number" name="price" value="<%= p.getPrice() %>" required min="0" step="0.01"/>
      </div>
      <div class="form-group">
        <label>Quantity</label>
        <input type="number" name="quantity" value="<%= p.getQuantity() %>" required min="0"/>
      </div>
      <div style="display:flex; gap:0.75rem; margin-top:1.5rem;">
        <button type="submit" class="btn btn-warning">Save Changes</button>
        <a href="productupdate.jsp" class="btn btn-ghost">Reset</a>
      </div>
    </form>
  </div>
  <% } %>
</div>
</body>
</html>
