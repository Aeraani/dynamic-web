<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>회원가입</title></head>
<body>
<h2>회원가입</h2>

<form method="post" action="${pageContext.request.contextPath}/member?action=signup">
    <div>
        <label>아이디</label>
        <input type="text" name="username" required />
    </div>
    <div>
        <label>비밀번호</label>
        <input type="password" name="password" required />
    </div>
    <div>
        <label>닉네임</label>
        <input type="text" name="nickname" required />
    </div>
    <button type="submit">가입하기</button>
</form>

<c:if test="${not empty error}">
    <p style="color:red">${error}</p>
</c:if>

<p>
    이미 계정이 있나요?
    <a href="${pageContext.request.contextPath}/member?action=loginForm">로그인</a>
</p>
</body>
</html>
