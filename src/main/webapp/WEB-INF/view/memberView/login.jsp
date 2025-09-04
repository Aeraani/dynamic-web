<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>로그인</title></head>
<body>
<h2>로그인</h2>

<form method="post" action="${pageContext.request.contextPath}/member?action=login">
    <div>
        <label>아이디</label>
        <input type="text" name="username" required />
    </div>
    <div>
        <label>비밀번호</label>
        <input type="password" name="password" required />
    </div>
    <button type="submit">로그인</button>
</form>

<c:if test="${not empty error}">
    <p style="color:red">${error}</p>
</c:if>

<p>
    아직 회원이 아니신가요?
    <a href="${pageContext.request.contextPath}/member?action=signupForm">회원가입</a>
</p>
</body>
</html>
