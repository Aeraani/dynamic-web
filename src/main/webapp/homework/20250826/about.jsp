<%--
  Created by IntelliJ IDEA.
  User: taera
  Date: 2025-08-28
  Time: 오전 3:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%request.setAttribute("active","about");%>
<%@ include file="common/top.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<div class="container mt-3">
    <h2>About Lovely Dog</h2>
    <p> 🐶 Lovely Dog Site는 강아지를 사랑하는 사람들이 사진과 이야기를 공유하는 공간입니다.</p>
    <div class="card">
        <div class="card-body">
            <p class="card-text">로그인 후 다양한 사진과 이야기를 공유해주세요!</p>
            <img src="image/3.jpg" width="20%">
            <img src="image/4.jpg" width="20%">
            <img src="image/이인절미.jpg" width="20%">
            <img src="image/함설.jpg" width="20%"><br><br>
            <a href="login.jsp" class="card-link">🔓Login🔓</a><br>
            <a href="signup.jsp" class="card-link">🔐Signup🔐</a>
        </div>
    </div>
</div>

</body>
</html>
<jsp:include page="common/bottom.jsp" />

