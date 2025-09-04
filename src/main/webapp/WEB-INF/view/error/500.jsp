<%@ page contentType="text/html; charset=UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>500 - Server Error</title>
  <style>
    body { font-family: Arial, sans-serif; text-align: center; margin-top: 100px; }
    h1 { color: #d9534f; }
    pre { text-align: left; width: 60%; margin: 20px auto; background: #f8f9fa; padding: 10px; border: 1px solid #ccc; }
    a { text-decoration: none; color: #0275d8; }
  </style>
</head>
<body>
<h1>500 - 서버 오류가 발생했습니다.</h1>
<p>잠시 후 다시 시도해주세요.</p>

<!-- 개발 중일 때만 보이도록 예외 정보 출력 -->
<c:if test="${pageContext.exception != null}">
  <h3>에러 메시지</h3>
  <pre><%= exception.getMessage() %></pre>
</c:if>

<p><a href="${pageContext.request.contextPath}/member?action=loginForm">홈으로 돌아가기</a></p>
</body>
</html>
