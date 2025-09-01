<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>결과 페이지</title></head>
<body>
<h2>결과 페이지</h2>

<!-- Forward일 경우: request에 저장한 message 확인 가능 -->
<p>메시지: <%= request.getAttribute("message") %></p>

</body>
</html>
