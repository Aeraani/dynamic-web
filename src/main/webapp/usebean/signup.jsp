<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<header class="bg-primary text-white text-center p-3">
    <h1>회원가입</h1>
</header>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">홈</a>
        <a class="nav-link" href="#">로그인</a>
    </div>
</nav>

<div class="container mt-4">
    <div class="row">
        <aside class="col-md-3">
            <div class="bg-light p-3 rounded">
                <h5>메뉴</h5>
                <ul class="nav flex-column">
                    <li class="nav-item"><a class="nav-link" href="#">링크1</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">링크2</a></li>
                </ul>
            </div>
        </aside>

        <main class="col-md-6">
<%--            <form action="<%=request.getContextPath()%>/signup" method="post">--%>
                <form action="<%=request.getContextPath()%>/usebean/signupresult.jsp" method="post">
                <div class="mb-3">
                    <label for="username" class="form-label">아이디</label>
                    <input type="text" class="form-control" id="username" name="username">
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">비밀번호</label>
                    <input type="password" class="form-control" id="password" name="password">
                </div>
                <div class="mb-3">
                    <label class="form-label">성별</label><br>
                    <input type="radio" name="gender" value="남자"> 남자
                    <input type="radio" name="gender" value="여자"> 여자
                </div>
                <div class="mb-3">
                    <label class="form-label">취미</label><br>
                    <input type="checkbox" name="hobby" value="독서"> 독서
                    <input type="checkbox" name="hobby" value="운동"> 운동
                    <input type="checkbox" name="hobby" value="게임"> 게임
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">이메일</label>
                    <input type="email" class="form-control" id="email" name="email">
                </div>
                <button type="submit" class="btn btn-primary">회원가입</button>
            </form>
        </main>

        <aside class="col-md-3">
            <div class="bg-light p-3 rounded">
                <h5>광고 영역</h5>
                <p>이곳에 광고를 넣으세요.</p>
            </div>
        </aside>
    </div>
</div>

<footer class="bg-dark text-white text-center p-3 mt-4">
    &copy; 2025 회원가입 페이지
</footer>
</body>
</html>

