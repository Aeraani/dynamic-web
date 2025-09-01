<%--
  Created by IntelliJ IDEA.
  User: taera
  Date: 2025-08-27
  Time: 오후 3:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>LIST PAGE</h1>
request.getAttribute("bean")=<%=request.getAttribute("bean")%><br>
session.getAttribute("bean")=<%=session.getAttribute("bean")%><br>
application.getAttribute("bean")=<%=application.getAttribute("bean")%><br>
</body>
</html>
