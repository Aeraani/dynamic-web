<%--
  Created by IntelliJ IDEA.
  User: taera
  Date: 2025-09-04
  Time: 오후 3:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%-- 숫자 연산 --%>
<p>Sum: ${1 + 2}</p>
<p>Difference: ${10 - 3}</p>

<%-- 비교 연산 --%>
<c:if test="${user.age >= 18}">
    <p>User is an adult.</p>
</c:if>

<%-- 논리 연산 --%>
<c:if test="${user.age >= 18 && user.age < 60}">
    <p>User is an adult but not a senior.</p>
</c:if>

<%-- 빈 값 검사 --%>
<c:if test="${empty user.name}">
    <p>User name is not set.</p>
</c:if>


</body>
</html>
