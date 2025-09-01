<%--
  Created by IntelliJ IDEA.
  User: taera
  Date: 2025-08-25
  Time: 오후 3:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
%>
<%
    String name=request.getParameter("name");
    String email=request.getParameter("email");
    String pwd=request.getParameter("pwd");
    String remember=request.getParameter("remember");
%>
Name= <%=name%>
Email= <%=email%>
Password= <%=pwd%>
ReMember me= <%=remember%>
</body>
</html>
