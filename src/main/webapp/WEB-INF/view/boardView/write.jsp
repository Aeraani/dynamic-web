<%--&lt;%&ndash;--%>
<%--  Created by IntelliJ IDEA.--%>
<%--  User: taera--%>
<%--  Date: 2025-09-04--%>
<%--  Time: 오후 9:57--%>
<%--  To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Title</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h2>글 작성</h2>--%>
<%--<form action="${pageContext.request.contextPath}/board1?action=write" method="post">--%>
<%--&lt;%&ndash;  제목: <input type="text" name="title"><br>&ndash;%&gt;--%>
<%--&lt;%&ndash;  내용: <textarea name="content" rows="5" cols="40"></textarea><br>&ndash;%&gt;--%>
<%--    <div class="form-group">--%>
<%--        제목: <textarea class="form-control" rows="5" id="comment" name="text"></textarea><br>--%>
<%--        내용: <textarea class="form-control" rows="5" id="comment" name="text"></textarea>--%>
<%--    </div>--%>
<%--    <button type="submit" class="btn btn-primary">등록</button>--%>

<%--</form>--%>

<%--</body>--%>
<%--</html>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>글 등록</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<div class="container">
    <h2>글 작성</h2>
    <form action="${pageContext.request.contextPath}/board1?action=write" method="post">
<div class="form-group">
    <label for="title">제목: </label>
    <input type="text" class="form-control" id="title" name="title">
</div>
<div class="form-group">
    <label for="content">내용: </label>
    <input type="text" class="form-control" id="content" name="content">
</div>
<button type="submit" class="btn btn-primary">글 등록</button>
</form>
</div>
</body>
</html>
