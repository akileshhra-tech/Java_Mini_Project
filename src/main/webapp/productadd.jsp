<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>Add Product</title>
  <%@ include file="common_styles.jsp" %>
</head>
<body>
<nav>
  <a class="nav-brand" href="index.jsp">📦 ProductWebApp</a>
  <div class="nav-links">
    <a href="index.jsp">Home</a>
    <a href="DisplayProductsServlet">Products</a>
    <a href="productadd.jsp" class="active">Add</a>
    <a href="productupdate.jsp">Update</a>
    <a href="productdelete.jsp">Delete</a>
    <a href="ReportCriteriaServlet">Reports</a>
  </div>
</nav>

<div class="container">
  <h1 class="page-title">Add <span>New Product</span></h1>

  <%-- Alert message --%>
  <%
    String msg     = (String) request.getAttribute("message");
    String msgType = (String) request.getAttribute("msgType");
    if (msg != null) {
  %>
    <div class="alert alert-<%= msgType %>"><%= msg %></div>
  <% } %>

  <div class="card">
    <form action="AddProductServlet" method="post">
      <div class="form-group">
        <label>Product ID</label>
        <input type="number" name="productID" placeholder="e.g. 101" required min="1"/>
      </div>
      <div class="form-group">
        <label>Product Name</label>
        <input type="text" name="productName" placeholder="e.g. Wireless Keyboard" required maxlength="100"/>
      </div>
      <div class="form-group">
        <label>Category</label>
        <input type="text" name="category" placeholder="e.g. Electronics" required maxlength="50"/>
      </div>
      <div class="form-group">
        <label>Price (₹)</label>
        <input type="number" name="price" placeholder="e.g. 1299.00" required min="0" step="0.01"/>
      </div>
      <div class="form-group">
        <label>Quantity</label>
        <input type="number" name="quantity" placeholder="e.g. 50" required min="0"/>
      </div>
      <div style="display:flex; gap:0.75rem; margin-top:1.5rem;">
        <button type="submit" class="btn btn-primary">Add Product</button>
        <a href="index.jsp" class="btn btn-ghost">Cancel</a>
      </div>
    </form>
  </div>
</div>
</body>
</html>
