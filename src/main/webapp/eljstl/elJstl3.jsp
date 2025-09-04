<%--
  Created by IntelliJ IDEA.
  User: taera
  Date: 2025-09-04
  Time: 오후 3:38
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
<h1>EL 연산자와 예약어 예제</h1>

<!-- 산술 연산자 -->
<p>더하기: ${1 + 2}</p>
<p>빼기: ${10 - 3}</p>
<p>곱하기: ${4 * 5}</p>
<p>나누기: ${10 / 2}</p>
<p>나누기 (div): ${10 div 2}</p>
<p>나머지: ${10 % 3}</p>
<p>나머지 (mod): ${10 mod 3}</p>

<!-- 논리 연산자 -->
<p>AND: ${true && false}</p>
<p>AND (and): ${true and false}</p>
<p>OR: ${true || false}</p>
<p>OR (or): ${true or false}</p>
<p>NOT: ${!true}</p>
<p>NOT (not): ${not true}</p>

<!-- 관계 연산자 -->
<p>등호: ${1 == 1}</p>
<p>등호 (eq): ${1 eq 1}</p>
<p>부등호: ${1 != 2}</p>
<p>부등호 (ne): ${1 ne 2}</p>
<p>보다 작다: ${1 < 2}</p>
<p>보다 작다 (lt): ${1 lt 2}</p>
<p>보다 크다: ${2 > 1}</p>
<p>보다 크다 (gt): ${2 gt 1}</p>
<p>보다 작거나 같다: ${1 <= 2}</p>
<p>보다 작거나 같다 (le): ${1 le 2}</p>
<p>보다 크거나 같다: ${2 >= 1}</p>
<p>보다 크거나 같다 (ge): ${2 ge 1}</p>

<!-- 예약어 -->
<p>true: ${true}</p>
<p>false: ${false}</p>
<p>null: ${null}</p>
<p>empty (null 값 검사): ${empty null}</p>

<!-- 빈 값 검사 -->
<c:set var="list" value="${emptyList}" />
<p>empty (빈 리스트 검사): ${empty list}</p>
</body>
</html>
