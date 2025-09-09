
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Boardview</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<div class="container">
    <h2>게시글 상세</h2>
    <table class="table">
        <thead>
        <tr>
            <th>ID</th>
            <th>제목</th>
            <th>내용</th>
            <th>작성자</th>
            <th>조회수</th>
            <th>작성일</th>
            <th>수정일</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>${board.id}</td>
            <td>${board.title}</td>
            <td>${board.content}</td>
            <td>${board.writer_id}</td>
            <td>${board.view_cnt}</td>
            <td>${board.created_at}</td>
            <td>${board.updated_at}</td>
        </tr>
        </tbody>

    </table>
    <a href="${pageContext.request.contextPath}/board1?action=list">목록으로</a>|
    <a href="${pageContext.request.contextPath}/board1?action=editForm&id=${board.id}">수정</a>

    <form action="${pageContext.request.contextPath}/board1?action=delete" method="post" style="display:inline;">
        <input type="hidden" name="id" value="${board.id}">
        <button type="submit" class="btn btn-primary">삭제</button>
    </form>

</body>
</html>