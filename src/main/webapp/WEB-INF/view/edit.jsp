<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>회원정보 수정</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5" style="max-width: 500px;">
    <h2 class="mb-4 text-center">회원정보 수정</h2>

    <!-- 수정 폼 -->
    <form action="${pageContext.request.contextPath}/member?action=update" method="post">
        <div class="form-group">
            <label>아이디 (수정 불가)</label>
            <input type="text" class="form-control" value="${loginMember.username}" readonly>
        </div>
        <div class="form-group">
            <label for="nickname">닉네임</label>
            <input type="text" class="form-control" id="nickname" name="nickname"
                   value="${loginMember.nickname}" required>
        </div>
        <div class="form-group">
            <label for="password">새 비밀번호</label>
            <input type="password" class="form-control" id="password" name="password"
                   placeholder="변경하지 않으려면 비워두세요">
        </div>

        <button type="submit" class="btn btn-primary btn-block">수정하기</button>
    </form>

    <hr class="my-4">

    <!-- 탈퇴 버튼 -->
    <form action="${pageContext.request.contextPath}/member?action=delete" method="post"
          onsubmit="return confirm('정말 탈퇴하시겠습니까?');">
        <button type="submit" class="btn btn-danger btn-block">회원 탈퇴</button>
    </form>

    <div class="mt-3 text-center">
        <a href="${pageContext.request.contextPath}/board?action=list" class="btn btn-link">게시판으로 돌아가기</a>
    </div>
</div>
</body>
</html>
