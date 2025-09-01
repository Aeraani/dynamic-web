<%--
  Created by IntelliJ IDEA.
  User: taera
  Date: 2025-08-25
  Time: 오후 1:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>  <%--  패이지디렉티브 부분 --%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%-- Script (디크레이션+스크립트릿+익스프래션 --%>
<%-- Class Area 디크리션 --%>
<%!
    int count=0;
    public void sum(int data){
        // 메서드 생성
    }
%>

<%-- serviceMethod 스크립트릿 --%>
<%
    int num=0;
    count++;
    num++;
    // public void show(){
    // 자바는 메서드 안에 메서드 생성 불가}
%>

<%-- Expression 표현식 --%>
COUNT=<%=count%><br>
NUM=<%=num%>
</body>
</html>
