<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<div class="container">
    <br>
    <h2>로그인</h2>
    <form method="post" action="${pageContext.request.contextPath}/member?action=login">
        <div class="form-group">
            <label for="id">아이디:</label>
            <input  type="text" class="form-control" style="width: 300px" placeholder="Enter id" name="username" required >
        </div>
        <div class="form-group">
            <label for="pwd">비밀번호:</label>
            <input type="password" class="form-control" style="width: 300px" placeholder="Enter password" name="password" required>
        </div>
        <button type="submit" class="btn btn-primary">Login</button>
    </form>
    <c:if test="${not empty error}">
        <p style="color:red">${error}</p>
    </c:if>
    <p>
        아직 회원이 아니신가요?
        <a href="${pageContext.request.contextPath}/member?action=signupForm">회원가입</a>
    </p>
</div>

</body>
</html>