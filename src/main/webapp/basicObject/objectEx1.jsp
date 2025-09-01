<%--
  Created by IntelliJ IDEA.
  User: taera
  Date: 2025-08-26
  Time: 오후 4:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
request.getMethod()=<%=request.getMethod()%>
request.changeSessionId()=<%=request.changeSessionId()%>
request.getCookies()=<%=request.getCookies()%>
request.getContextPath()=<%=request.getContextPath()%>
request.getHeader("RequestMethod")=<%=request.getHeader("RequestMethod")%>
request.getHeaderNames()=<%=request.getHeaderNames()%>
request.getSession()=<%=request.getSession()%>
request.getProtocol()=<%=request.getProtocol()%>
request.getLocalPort()=<%=request.getLocalPort()%>
</body>
</html>
