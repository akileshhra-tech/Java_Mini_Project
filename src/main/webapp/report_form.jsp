<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>Generate Report</title>
  <%@ include file="common_styles.jsp" %>
  <style>
    .report-tabs { display: flex; gap: 0.5rem; margin-bottom: 1.5rem; }
    .tab-btn {
      padding: 0.55rem 1.1rem; border-radius: 8px; border: 1px solid var(--border);
      background: transparent; color: var(--muted); font-size: 0.875rem;
      font-family: inherit; cursor: pointer; font-weight: 500; transition: all 0.15s;
    }
    .tab-btn.active, .tab-btn:hover { background: var(--accent); color: #fff; border-color: var(--accent); }
    .panel { display: none; }
    .panel.active { display: block; }
  </style>
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
  <h1 class="page-title">Generate <span>Reports</span></h1>

  <%
    String msg     = (String) request.getAttribute("message");
    String msgType = (String) request.getAttribute("msgType");
    if (msg != null) {
  %>
    <div class="alert alert-<%= msgType %>"><%= msg %></div>
  <% } %>

  <div class="card">
    <div class="report-tabs">
      <button class="tab-btn active" onclick="showTab('price')">💰 Price Filter</button>
      <button class="tab-btn" onclick="showTab('category')">🏷️ By Category</button>
      <button class="tab-btn" onclick="showTab('topn')">🏆 Top N Products</button>
    </div>

    <%-- Panel 1: Price Above --%>
    <div id="panel-price" class="panel active">
      <p style="color:var(--muted); font-size:0.875rem; margin-bottom:1rem;">
        List all products whose price exceeds the given threshold.
      </p>
      <form action="ReportServlet" method="post">
        <input type="hidden" name="reportType" value="priceAbove"/>
        <div class="form-group">
          <label>Minimum Price (₹)</label>
          <input type="number" name="minPrice" placeholder="e.g. 500" required min="0" step="0.01"/>
        </div>
        <button type="submit" class="btn btn-primary">Generate Report</button>
      </form>
    </div>

    <%-- Panel 2: By Category --%>
    <div id="panel-category" class="panel">
      <p style="color:var(--muted); font-size:0.875rem; margin-bottom:1rem;">
        Show all products belonging to a specific category.
      </p>
      <form action="ReportServlet" method="post">
        <input type="hidden" name="reportType" value="byCategory"/>
        <div class="form-group">
          <label>Category</label>
          <%
            @SuppressWarnings("unchecked")
            List<String> categories = (List<String>) request.getAttribute("categories");
          %>
          <% if (categories != null && !categories.isEmpty()) { %>
            <select name="category">
              <% for (String cat : categories) { %>
                <option value="<%= cat %>"><%= cat %></option>
              <% } %>
            </select>
          <% } else { %>
            <input type="text" name="category" placeholder="e.g. Electronics" required maxlength="50"/>
          <% } %>
        </div>
        <button type="submit" class="btn btn-primary">Generate Report</button>
      </form>
    </div>

    <%-- Panel 3: Top N --%>
    <div id="panel-topn" class="panel">
      <p style="color:var(--muted); font-size:0.875rem; margin-bottom:1rem;">
        Retrieve the top N products ranked by stock quantity.
      </p>
      <form action="ReportServlet" method="post">
        <input type="hidden" name="reportType" value="topN"/>
        <div class="form-group">
          <label>Number of Products (N)</label>
          <input type="number" name="topN" placeholder="e.g. 5" required min="1" max="100"/>
        </div>
        <button type="submit" class="btn btn-primary">Generate Report</button>
      </form>
    </div>
  </div>
</div>

<script>
function showTab(name) {
  document.querySelectorAll('.panel').forEach(p => p.classList.remove('active'));
  document.querySelectorAll('.tab-btn').forEach(b => b.classList.remove('active'));
  document.getElementById('panel-' + name).classList.add('active');
  event.currentTarget.classList.add('active');
}
</script>
</body>
</html>
