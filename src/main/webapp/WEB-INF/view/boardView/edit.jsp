<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>BoardEdit</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <br>
    <h2>글 수정</h2>
    <form action="${pageContext.request.contextPath}/board1?action=edit" method="post">
        <input type="hidden" name="id" value="${board.id}">
        <div class="form-group" style="max-width:600px;">
            <label for="title">제목</label>
            <input type="text" id="title" name="title" class="form-control" value="${board.title}" required>
        </div>
        <div class="form-group" style="max-width:600px;">
            <label for="content">내용</label>
            <textarea id="content" name="content" class="form-control" rows="8" required><c:out value="${board.content}"/></textarea>
        </div>
        <button type="submit" class="btn btn-primary">수정하기</button>
    </form>
</div>
</body>
</html>
