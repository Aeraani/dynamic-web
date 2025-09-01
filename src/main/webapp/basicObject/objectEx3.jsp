<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: taera
  Date: 2025-08-27
  Time: 오후 1:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Session 객체</h1>
<%
    // request, response, pageContext (건물에 허락 없이 잠시 머무는 상태의 객체) url바뀌면 끝남
    // session (일정 시간동안 건물의 방을 빌린 상태 url바뀌어도 일정 시간 유지
    // application(ServletContext) (건물이 무너질 때 까지 건물 전체 사용) 소멸 전까지 유지
%>
session.getServletContext()= 는 웹어플리케이션의 전체범위에 접근할 떄 사용하는 메서드
<%=
    session.getServletContext()
%>

<br>
HttpSession의 구현체 StandardSessionFacade
session.getClass()= class org.apache.catalina.session.StandardSessionFacade
<%=
session.getClass()
%><br>

<%
    HttpSession session1; //session의 기본 자료형은 interface입니다
    session.setAttribute("msg","hello");
    session.setAttribute("massage","hi");
    session.getAttribute("msg"); //msg가 키 값인 hello벨류 가져옴
%>
session.getAttribute("msg")=<%=session.getAttribute("msg")%><br>
session.getMaxInactiveInterval()=<%=session.getMaxInactiveInterval()%><br>
session.getCreationTime()=<%=new Date(session.getCreationTime())%><br>
session.getLastAccessedTime()=<%=new Date(session.getLastAccessedTime())%><br>
</body>
</html>
