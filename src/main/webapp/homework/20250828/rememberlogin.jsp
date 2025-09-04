<%--
  Created by IntelliJ IDEA.
  User: taera
  Date: 2025-08-31
  Time: 오후 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String savedId = (String) request.getAttribute("savedId");
    String ctx = request.getContextPath();
%>
<html>
<head>
    <title>Login</title>
</head>
<body>
<h1>로그인</h1>
<form action ="<%=ctx%>/rememberlogin" method="post">
    아이디: <input type ="text" name="id"  value="<%= savedId != null ? savedId : "" %>"><br>
    비밀번호 : <input type ="password" name="pwd"><br>
    <label><input type ="checkbox" name="rememberId"<%= savedId != null ? "checked" : "" %>> 아이디저장 </label><br>
    <button type="submit">로그인</button>
</form>
</body>
</html>
