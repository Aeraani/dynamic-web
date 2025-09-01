<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>JSP - Hello World</title>
</head>
<body>
<%--<%--%>
<%--  if (session.getAttribute("user") != null) {--%>
<%--    response.sendRedirect("board/welcome.jsp");--%>
<%--  } else {--%>
<%--    response.sendRedirect("board/login.jsp");--%>
<%--  }--%>
<%--%>--%>
<%--&lt;%&ndash;<h1><%= "Hello World!" %>&ndash;%&gt;--%>
<%--</h1>--%>
<%--<br/>--%>
<%--<a href="colorServlet">colorSevlet</a>--%>
<%--<a href="hello-servlet">Hello Servlet</a><br>--%>
<%--<a href="lifeCycleServlet">"lifeCycleServlet"</a>--%>
<a href="write.do?cmd=write">Write</a>
<a href="list.do?cmd=list">List</a>
</body>
</html>
