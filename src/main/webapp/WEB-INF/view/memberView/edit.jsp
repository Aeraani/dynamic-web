<%--<%@ page contentType="text/html; charset=UTF-8" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head><meta charset="UTF-8"><title>내 정보</title></head>--%>
<%--<body>--%>
<%--<h2>내 정보 수정</h2>--%>

<%--<!-- 로그인 사용자 정보 표시 -->--%>
<%--<p>아이디(변경불가): <strong>${sessionScope.loginMember.username}</strong></p>--%>

<%--<form method="post" action="${pageContext.request.contextPath}/member?action=update">--%>
<%--    <div>--%>
<%--        <label>닉네임</label>--%>
<%--        <input type="text" name="nickname"--%>
<%--               value="${sessionScope.loginMember.nickname}" required />--%>
<%--    </div>--%>

<%--    <div>--%>
<%--        <label>비밀번호 (변경 시에만 입력)</label>--%>
<%--        <input type="password" name="password" placeholder="새 비밀번호(선택)" />--%>
<%--    </div>--%>

<%--    <button type="submit">수정하기</button>--%>
<%--</form>--%>

<%--<hr/>--%>

<%--<!-- 탈퇴 버튼: POST로 보내기 -->--%>
<%--<form method="post" action="${pageContext.request.contextPath}/member?action=deleteMember"--%>
<%--      onsubmit="return confirm('정말 탈퇴하시겠어요?');">--%>
<%--    <button type="submit" style="color:red">회원 탈퇴</button>--%>
<%--</form>--%>

<%--<p>--%>
<%--    <a href="${pageContext.request.contextPath}/board?action=list">게시판 목록</a>--%>
<%--    |--%>
<%--    <!-- 로그아웃도 POST 권장 -->--%>
<%--<form method="post" action="${pageContext.request.contextPath}/member?action=logout" style="display:inline">--%>
<%--    <button type="submit">로그아웃</button>--%>
<%--</form>--%>
<%--</p>--%>

<%--<c:if test="${not empty error}">--%>
<%--    <p style="color:red">${error}</p>--%>
<%--</c:if>--%>
<%--<c:if test="${not empty message}">--%>
<%--    <p style="color:green">${message}</p>--%>
<%--</c:if>--%>
<%--</body>--%>
<%--</html>--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>MyPage</title>
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
    <h2>내 정보 수정</h2>
    <h5>    <a href="${pageContext.request.contextPath}/board1?action=list">게시판 목록</a></h5>
    <p>아이디(변경불가): <strong>${sessionScope.loginMember.username}</strong></p>
    <form method="post" action="${pageContext.request.contextPath}/member?action=update">
        <div class="form-group">
            <label for="nickname">닉네임:</label>
            <input  type="text" class="form-control" style="width: 300px" placeholder="Enter nickname" name="nickname" required >
        </div>
        <div class="form-group">
            <label for="pwd">비밀번호 (변경 시 입력):</label>
            <input type="password" class="form-control" style="width: 300px" placeholder="New password" name="password" >
        </div>
        <button type="submit" class="btn btn-primary">수정하기</button>
    </form><br>
    <form method="post" action="${pageContext.request.contextPath}/member?action=deleteMember"
          onsubmit="return confirm('정말 탈퇴하시겠어요?');" class="d-inline-block">
        <button type="submit" class="btn btn-danger">회원 탈퇴</button>
    </form>

    <form method="post" action="${pageContext.request.contextPath}/member?action=logout" class="d-inline-block">
        <button type="submit" class="btn btn-secondary">로그아웃</button>
    </form>


    <c:if test="${not empty error}">
    <p style="color:red">${error}</p>
    </c:if>
    <c:if test="${not empty message}">
    <p style="color:green">${message}</p>
    </c:if>
</body>
</html>
