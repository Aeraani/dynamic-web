<%@ page contentType="text/html; charset=UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>404 - Page Not Found</title>
  <style>
    body { font-family: Arial, sans-serif; text-align: center; margin-top: 100px; }
    h1 { color: #d9534f; }
    a { text-decoration: none; color: #0275d8; }
  </style>
</head>
<body>
<h1>404 - 페이지를 찾을 수 없습니다.</h1>
<p>요청하신 페이지가 존재하지 않거나 이동되었어요.</p>
<p><a href="${pageContext.request.contextPath}/member?action=loginForm">홈으로 돌아가기</a></p>
</body>
</html>
