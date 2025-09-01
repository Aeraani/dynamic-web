<%--
  Created by IntelliJ IDEA.
  User: taera
  Date: 2025-08-27
  Time: 오전 12:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%request.setAttribute("active","home");%>
<%@ include file="common/top.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<!-- Carousel -->
<div id="demo" class="carousel slide" data-bs-ride="carousel">

  <!-- Indicators/dots -->
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="3"></button>
  </div>

  <!-- The slideshow/carousel -->
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="image/1.jpg" alt="땅콩1" class="d-block mx-auto" style="width:30%">
    </div>
    <div class="carousel-item">
      <img src="image/2.jpg" alt="찹쌀1" class="d-block mx-auto" style="width:30%">
    </div>
    <div class="carousel-item">
      <img src="image/3.jpg" alt="땅콩2" class="d-block mx-auto" style="width:30%">
    </div>
    <div class="carousel-item">
      <img src="image/4.jpg" alt="찹쌀2" class="d-block mx-auto" style="width:30%">
    </div>
  </div>

  <!-- Left and right controls/icons -->
  <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" style="filter: invert(60%);"></span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
    <span class="carousel-control-next-icon" style="filter: invert(60%);"></span>
  </button>
</div>

<div class="container-fluid mt-3">
  <h3>A cute puppy saves the world.</h3>
  <p>Please share a photo of the cute puppy!</p>
</div>

</body>
</html>
<jsp:include page="common/bottom.jsp" />
