<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page isErrorPage="true" %> <!-- exception 객체를 사용하려면 isErrorPage를 true로 설정 -->
<!DOCTYPE html>
<html>
<head>
    <title>JSP 내장 객체 예제</title>
</head>
<body>
<h1>JSP 내장 객체 예제</h1>

<!-- request 객체 사용 -->
<h2>Request 객체</h2>
<p>클라이언트의 IP 주소: <%= request.getRemoteAddr() %></p>
<p>클라이언트가 보낸 파라미터 'name': <%= request.getParameter("name") %></p>

<!-- response 객체 사용 -->
<h2>Response 객체</h2>
<% response.setContentType("text/html;charset=UTF-8"); %>
<p>Response의 Content Type 설정 완료</p>

<!-- session 객체 사용 -->
<h2>Session 객체</h2>
<% session.setAttribute("sessionAttribute", "Session Value"); %>
<p>세션에 설정된 속성: <%= session.getAttribute("sessionAttribute") %></p>

<!-- application 객체 사용 -->
<h2>Application 객체</h2>
<% application.setAttribute("appName", "My JSP Application"); %>
<p>애플리케이션 이름: <%= application.getAttribute("appName") %></p>

<!-- out 객체 사용 -->
<h2>Out 객체</h2>
<% out.println("This is printed using the out object."); %>

<!-- pageContext 객체 사용 -->
<h2>PageContext 객체</h2>
<% pageContext.setAttribute("pageContextAttribute", "PageContext Value"); %>
<p>페이지 컨텍스트 속성: <%= pageContext.getAttribute("pageContextAttribute") %></p>

<!-- exception 객체 사용 -->
<h2>Exception 객체</h2>
<% if (exception != null) { %>
<p>예외 메시지: <%= exception.getMessage() %></p>
<% } else { %>
<p>예외가 발생하지 않았습니다.</p>
<% } %>
</body>
</html>

