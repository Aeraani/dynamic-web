<%--
  Created by IntelliJ IDEA.
  User: taera
  Date: 2025-09-04
  Time: 오후 8:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>BoardList</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<div class="container">
    <h2>게시글 목록</h2>
    <a href="${pageContext.request.contextPath}/board1?action=writeForm">글쓰기</a> |
    <a href="${pageContext.request.contextPath}/member?action=editForm">회원정보수정</a> |
    <a href="${pageContext.request.contextPath}/member?action=logout">로그아웃</a> |
    <a href="${pageContext.request.contextPath}/board1?action=search">검색🔍</a>
    <table class="table">
        <thead>
        <tr>
            <th>ID</th>
            <th>제목</th>
            <th>작성자</th>
            <th>조회수</th>
            <th>작성일</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="b" items="${boards}">
        <tr>
            <td>${b.id}</td>
            <td><a href="${pageContext.request.contextPath}/board1?action=view&id=${b.id}">${b.title}</a></td>
            <td>${b.writer_id}</td>
            <td>${b.view_cnt}</td>
            <td>${b.created_at}</td>
        </tr>
        </c:forEach>
        </tbody>
    </table>
    <nav aria-label="Page navigation">
        <ul class="pagination">
    <c:forEach var="i" begin="1" end="${totalPages}">
        <li class="page-item ${i == page ? 'active' : ''}">
            <a class="page-link" href="${pageContext.request.contextPath}/board1?action=list&page=${i}">${i}</a>
        </li>
    </c:forEach>
        </ul>
    </nav>
</body>
</html>