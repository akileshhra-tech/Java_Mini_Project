<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>ProductWebApp — Dashboard</title>
  <%@ include file="common_styles.jsp" %>
  <style>
    .hero { text-align: center; padding: 3.5rem 1rem 2.5rem; }
    .hero h1 { font-family: 'DM Serif Display', serif; font-size: 2.8rem; line-height: 1.15; margin-bottom: 0.75rem; }
    .hero h1 span { color: var(--accent); }
    .hero p { color: var(--muted); font-size: 1rem; max-width: 480px; margin: 0 auto 2rem; }
    .menu-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(200px,1fr)); gap: 1rem; }
    .menu-card {
      background: var(--card); border: 1px solid var(--border); border-radius: var(--radius);
      padding: 1.75rem 1.5rem; text-decoration: none; color: var(--text);
      transition: border-color 0.2s, transform 0.15s;
      display: flex; flex-direction: column; gap: 0.5rem;
    }
    .menu-card:hover { border-color: var(--accent); transform: translateY(-2px); }
    .menu-card .icon { font-size: 1.75rem; }
    .menu-card .label { font-weight: 600; font-size: 1rem; }
    .menu-card .desc  { font-size: 0.8rem; color: var(--muted); }
  </style>
</head>
<body>
<nav>
  <a class="nav-brand" href="index.jsp">📦 ProductWebApp</a>
  <div class="nav-links">
    <a href="index.jsp" class="active">Home</a>
    <a href="DisplayProductsServlet">Products</a>
    <a href="productadd.jsp">Add</a>
    <a href="productupdate.jsp">Update</a>
    <a href="productdelete.jsp">Delete</a>
    <a href="ReportCriteriaServlet">Reports</a>
  </div>
</nav>

<div class="container">
  <div class="hero">
    <h1>Product <span>Management</span><br>System</h1>
    <p>Manage your inventory, update records, and generate insightful reports — all in one place.</p>
  </div>

  <div class="menu-grid">
    <a href="DisplayProductsServlet" class="menu-card">
      <div class="icon">🗂️</div>
      <div class="label">View Products</div>
      <div class="desc">Browse the full product catalogue</div>
    </a>
    <a href="productadd.jsp" class="menu-card">
      <div class="icon">➕</div>
      <div class="label">Add Product</div>
      <div class="desc">Register a new product</div>
    </a>
    <a href="productupdate.jsp" class="menu-card">
      <div class="icon">✏️</div>
      <div class="label">Update Product</div>
      <div class="desc">Modify existing product details</div>
    </a>
    <a href="productdelete.jsp" class="menu-card">
      <div class="icon">🗑️</div>
      <div class="label">Delete Product</div>
      <div class="desc">Remove obsolete products</div>
    </a>
    <a href="ReportCriteriaServlet" class="menu-card">
      <div class="icon">📊</div>
      <div class="label">Reports</div>
      <div class="desc">Price, category & top-selling reports</div>
    </a>
  </div>
</div>
</body>
</html>
