
<%@ page session="true" %>
<%
    session.invalidate(); //(username|admin).invalidate(); => session이 가르키는 데이터(username|admin)를 reset해주는 기능을 invalidata가 한다
    response.sendRedirect("login.jsp");
%>