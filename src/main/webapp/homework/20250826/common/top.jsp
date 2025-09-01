<%--
  Created by IntelliJ IDEA.
  User: taera
  Date: 2025-08-26
  Time: 오후 11:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Lovely Dog Site</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<nav class="navbar navbar-expand-sm bg-secondary navbar-dark sticky-top">
  <div class="container-fluid">
    <ul class="navbar-nav">
      <% String active = request.getParameter("active"); %>
      <li class="nav-item">
        <a class="nav-link ${param.active == 'home' ? 'active' : ''}"
           href="${pageContext.request.contextPath}/homework/20250826/index.jsp">Home</a>
      </li>
      <li class="nav-item">
        <a class="nav-link ${param.active == 'board' ? 'active' : ''}"
           href="${pageContext.request.contextPath}/homework/20250826/board/list.jsp">Board</a>
      </li>
      <li class="nav-item">
        <a class="nav-link ${param.active == 'gallery' ? 'active' : ''}"
           href="${pageContext.request.contextPath}/homework/20250826/gallery.jsp">Gallery</a>
      </li>
      <li class="nav-item">
        <a class="nav-link ${param.active == 'about' ? 'active' : ''}"
           href="${pageContext.request.contextPath}/homework/20250826/about.jsp">About</a>
      </li>
      <li class="nav-item">
        <a class="nav-link ${param.active == 'login' ? 'active' : ''}"
           href="${pageContext.request.contextPath}/homework/20250826/login.jsp">Login</a>
      </li>
      <li class="nav-item">
        <a class="nav-link ${param.active == 'signup' ? 'active' : ''}"
           href="${pageContext.request.contextPath}/homework/20250826/signup.jsp">Sign up</a>
      </li>
    </ul>
  </div>
</nav>

</body>
</html>

