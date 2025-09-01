<%--
  Created by IntelliJ IDEA.
  User: taera
  Date: 2025-08-27
  Time: 오후 11:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%request.setAttribute("active","gallery");%>
<%@ include file="common/top.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Gallery</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<div class="container mt-4">
    <h1 class="h4 mb-3">🐶Lovely Dog과 함께하는 강아지🐶</h1>
    <p class="text-muted mb-4">브라우저 크기에 따라 1→2→3열로 바뀝니다.</p>

    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">

        <div class="col">
            <div class="card h-100">
                <img src="image/1.jpg" class="card-img-top" alt="강아지 1">
                <div class="card-body">
                    <h5 class="card-title">박땅콩</h5>
                    <p class="card-text">6살 토이푸들 입니다🐾</p>
                </div>
            </div>
        </div>

        <div class="col">
            <div class="card h-100">
                <img src="image/4.jpg" class="card-img-top" alt="강아지 2">
                <div class="card-body">
                    <h5 class="card-title">박찹쌀</h5>
                    <p class="card-text">4살 토이푸들 입니다🐾</p>
                </div>
            </div>
        </div>

        <div class="col">
            <div class="card h-100">
                <img src="image/이아롱.jpg" class="card-img-top" alt="강아지 3">
                <div class="card-body">
                    <h5 class="card-title">이아롱</h5>
                    <p class="card-text">10살 진돗개 입니다🐾</p>
                </div>
            </div>
        </div>

        <div class="col">
            <div class="card h-100">
                <img src="image/이인절미.jpg" class="card-img-top" alt="강아지 4">
                <div class="card-body">
                    <h5 class="card-title">인절미</h5>
                    <p class="card-text">1살 말티푸 입니다🐾</p>
                </div>
            </div>
        </div>

        <div class="col">
            <div class="card h-100">
                <img src="image/함설.jpg" class="card-img-top" alt="강아지 5">
                <div class="card-body">
                    <h5 class="card-title">함설</h5>
                    <p class="card-text">7살 말티즈 입니다🐾</p>
                </div>
            </div>
        </div>

        <div class="col">
            <div class="card h-100">
                <img src="image/깨돌이.jpg" class="card-img-top" alt="강아지 6">
                <div class="card-body">
                    <h5 class="card-title">깨돌이</h5>
                    <p class="card-text">3살 말티푸 입니다🐾</p>
                </div>
            </div>
        </div>
</div>
</div>

</body>
</html>
<jsp:include page="common/bottom.jsp" />
