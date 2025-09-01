<%--
  Created by IntelliJ IDEA.
  User: taera
  Date: 2025-08-28
  Time: 오후 3:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

</head>
<body>
<%
  session.invalidate();//세션이 무효화
  response.sendRedirect("login.jsp");
%>

</body>
</html>
