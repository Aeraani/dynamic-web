<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
         import="java.util.Enumeration" %>
<%
    // 파라미터 읽기 전에 인코딩 설정
    request.setCharacterEncoding("UTF-8");

    // 1) 단일 값
    String username = request.getParameter("username");
    String email = request.getParameter("email");

    // 2) 복수 값(체크박스 등)
    String[] hobbies = request.getParameterValues("hobby");

    // 3) 모든 파라미터 나열
    Enumeration<String> names = request.getParameterNames();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입 결과</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">
<h2 class="mb-4">전송된 회원가입 정보</h2>

<ul class="list-group">
    <!-- 아이디 -->
    <li class="list-group-item">
        <strong>아이디:</strong>
        <%= (username != null && !username.isEmpty()) ? username : "미입력" %>
    </li>

    <!-- 취미(복수 값) -->
    <li class="list-group-item">
        <strong>취미:</strong>
        <%
            if (hobbies != null && hobbies.length > 0) {
                out.print(String.join(", ", hobbies));
            } else {
                out.print("선택 없음");
            }
        %>
    </li>

    <!-- 모든 파라미터 나열 -->
    <li class="list-group-item">
        <strong>모든 파라미터 목록:</strong>
        <ul class="mt-2">
            <%
                while (names.hasMoreElements()) {
                    String param = names.nextElement();
                    String[] vals = request.getParameterValues(param);
            %>
            <li><%= param %> = <%= (vals != null) ? String.join(", ", vals) : "" %></li>
            <%
                }
            %>
        </ul>
    </li>

    <!-- 이메일 -->
    <li class="list-group-item">
        <strong>이메일:</strong>
        <%= (email != null && !email.isEmpty()) ? email : "미입력" %>
    </li>
</ul>

<a href="signup.html" class="btn btn-secondary mt-3">돌아가기</a>
</body>
</html>

