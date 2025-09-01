<%--
  Created by IntelliJ IDEA.
  User: taera
  Date: 2025-08-27
  Time: 오전 1:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%request.setAttribute("active","board");%>
<%@ include file="../common/top.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Board List</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<div class="container mt-3">
    <h2>게시글 목록</h2>
    <table class="table table-hover">
        <thead>
        <tr>
            <th style="width:80px;">번호</th>
            <th>제목</th>
            <th style="width:180px;">작성자</th>
            <th style="width:160px;">작성일</th>
        </tr>
        </thead>
        <tr>
            <td>8</td>
            <td><a href="detail.jsp?id=8" class="link-secondary text-decoration-none">강아지 사료 추천</a></td>
            <td>love</td>
            <td>2025-08-26</td>
        </tr>
        <tr>
            <td>7</td>
            <td><a href="detail.jsp?id=7" class="link-secondary text-decoration-none">충격 고창석 닮은 강아지 실존..</a></td>
            <td>park</td>
            <td>2025-08-25</td>
        </tr>
        <tr>
            <td>6</td>
            <td><a href="detail.jsp?id=6" class="link-secondary text-decoration-none">인절미 귀여워ㅜㅜ</a></td>
            <td>ddang</td>
            <td>2025-08-25</td>
        </tr>
        <tr>
            <td>5</td>
            <td><a href="detail.jsp?id=5" class="link-secondary text-decoration-none">땅콩찹쌀 사랑해</a></td>
            <td>kong</td>
            <td>2025-08-24</td>
        </tr>
        <tr>
            <td>4</td>
            <td><a href="detail.jsp?id=4" class="link-secondary text-decoration-none">똥개</a></td>
            <td>chap</td>
            <td>2025-08-24</td>
        </tr>
        <tr>
            <td>3</td>
            <td><a href="detail.jsp?id=3" class="link-secondary text-decoration-none">애기 강아지</a></td>
            <td>ssal</td>
            <td>2025-08-23</td>
        </tr>
        <tr>
            <td>2</td>
            <td><a href="detail.jsp?id=2" class="link-secondary text-decoration-none">웃긴 강아지</a></td>
            <td>cute</td>
            <td>2025-08-23</td>
        </tr>
        <tr>
            <td>1</td>
            <td><a href="detail.jsp?id=1" class="link-secondary text-decoration-none">강아지 자랑</a></td>
            <td>aeran</td>
            <td>2025-08-22</td>
        </tr>
        </tbody>
    </table>
</div>

</body>
</html>
<jsp:include page="../common/bottom.jsp" />