<%--
  Created by IntelliJ IDEA.
  User: taera
  Date: 2025-09-04
  Time: 오후 10:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>검색 결과</h2>

<form action="${pageContext.request.contextPath}/board1" method="get">
  <input type="hidden" name="action" value="search">
  <select name="type">
    <option value="title" ${type == 'title' ? 'selected' : ''}>제목</option>
    <option value="content" ${type == 'content' ? 'selected' : ''}>내용</option>
    <option value="writer" ${type == 'writer' ? 'selected' : ''}>작성자</option>
  </select>
  <input type="text" name="keyword" value="${keyword}">
  <button type="submit">검색</button>
</form>

<table border="1">
  <tr>
    <th>ID</th><th>제목</th><th>작성자</th><th>조회수</th><th>작성일</th>
  </tr>
  <c:forEach var="b" items="${boards}">
    <tr>
      <td>${b.id}</td>
      <td><a href="${pageContext.request.contextPath}/board1?action=view&id=${b.id}">${b.title}</a></td>
      <td>${b.writer_id}</td>
      <td>${b.view_cnt}</td>
      <td>${b.created_at}</td>
    </tr>
  </c:forEach>
</table>

<hr>
<a href="${pageContext.request.contextPath}/board1?action=list">목록으로</a>
</body>
</html>
