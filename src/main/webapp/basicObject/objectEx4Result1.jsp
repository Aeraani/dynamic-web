<%--
  Created by IntelliJ IDEA.
  User: taera
  Date: 2025-08-27
  Time: 오후 2:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String data=request.getParameter("data");
    request.setAttribute("data",data);
    session.setAttribute("data",data);
    application.setAttribute("data",data);
%>
<h1><a href="objectEx4Result2.jsp"> Data=<%=data%></a></h1>
</body>
</html>
