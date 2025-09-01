<%--
  Created by IntelliJ IDEA.
  User: taera
  Date: 2025-08-31
  Time: 오후 11:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String ctx = request.getContextPath();
String message = (String) request.getAttribute("message");%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2><%= message != null ? message : "" %></h2>
<a href="<%= ctx %>/logout">로그아웃</a>
</body>
</html>
