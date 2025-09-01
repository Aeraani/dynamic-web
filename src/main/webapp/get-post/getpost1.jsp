<%--
  Created by IntelliJ IDEA.
  User: taera
  Date: 2025-08-27
  Time: 오후 4:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>주문 방식 비교</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">
<h2 class="mb-4">주문 방식 비교 (GET / POST)</h2>

<h4>GET 방식 주문</h4>
<form action="order" method="get" class="mb-4">
    이름: <input type="text" name="name"><br>
    상품:
    <select name="item">
        <option value="노트북">노트북</option>
        <option value="마우스">마우스</option>
    </select>
    <br>
    <input type="submit" value="GET 방식 주문" class="btn btn-outline-primary mt-2">
</form>

<h4>POST 방식 주문</h4>
<form action="order" method="post">
    이름: <input type="text" name="name"><br>
    상품:
    <select name="item">
        <option value="키보드">키보드</option>
        <option value="모니터">모니터</option>
    </select>
    <br>
    <input type="submit" value="POST 방식 주문" class="btn btn-outline-success mt-2">
</form>
</body>
</html>

