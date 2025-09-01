<%--
  Created by IntelliJ IDEA.
  User: taera
  Date: 2025-08-28
  Time: 오전 1:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%request.setCharacterEncoding("UTF-8"); // POST 전용%>
<%@ include file="common/top.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>회원가입 정보</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<div class="container mt-3">
    <h2>회원가입 정보</h2>

        <div class="mb-3 mt-3">
            <label for="comment">입력 정보:</label>
            <textarea class="form-control" rows="5" id="comment" name="text">
                • 이름: <%= request.getParameter("name") %>
                • 이메일: <%= request.getParameter("email") %>
                • 비밀번호: <%= request.getParameter("password") %>
                • 성별: <%= request.getParameter("gender") %>
                • 정보저장: <%=request.getParameter("remember") %>
            </textarea>
        </div>
    <button type="button" class="btn btn-secondary" onclick="location.href='index.jsp'">HOME</button>

</div>

</body>
</html>
<jsp:include page="common/bottom.jsp" />
