<%--
  Created by IntelliJ IDEA.
  User: taera
  Date: 2025-08-27
  Time: 오전 1:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%request.setAttribute("active","board");%>
<%@ include file="../common/top.jsp" %>
<%
  // list.jsp에서 전달받은 글 번호
  String id = request.getParameter("id");
  if (id == null) id = "0";

  String title, author, date, body;
  switch (id) {
    case "8":
      title = "강아지 사료 추천";
      author = "love";
      date = "2025-08-26";
      body = "<p>이 사료 진짜 눈물 덜나요!! 다들 한번 ㅊ츄라이츄라이..</p>"
              + "<img src='../image/now.jpg' width='30%' alt='강아지사료'>";
      break;
    case "7":
      title = "충격 고창석 닮은 강아지 실존..";
      author = "park";
      date = "2025-08-25";
      body = "<p>고창석 닮은 강아지 보고가세요</p>"
              + "<img src='../image/고창석.jpg' width='30%' alt='고창석닮은강아지'>";
      break;
    case "6":
      title = "인절미 귀여워ㅜㅜ";
      author = "ddang";
      date = "2025-08-25";
      body = "<p>노릇노릇한 털빛이 인절미 같은 강아지</p>"
              + "<img src='../image/인절미.jpg' width='30%' alt='인절미강아지'>";
      break;
    case "5":
      title = "땅콩찹쌀 사랑해";
      author = "kong";
      date = "2025-08-24";
      body = "<P>우리집 땅콩이와 찹쌀이는 세상에서 제일 귀여운 존재입니다 ♥</p>"
              +"<img src='../image/땅찹사랑해.jpg' width='30%' alt='땅찹사랑해'>";
      break;
    case "4":
      title = "똥개";
      author = "chap";
      date = "2025-08-24";
      body = "<P>사실 강아지 중 최고는 똥개임</p>"
              +"<img src='../image/똥개.jpg' width='30%' alt='똥강아지'>";
      break;
    case "3":
      title = "애기 강아지";
      author = "ssal";
      date = "2025-08-23";
      body = "<P>새로 태어난강아지ㅜㅜ 너무 귀엽죠ㅠㅠ</p>"
              +"<img src='../image/새끼강아지.jpg' width='30%' alt='새끼강아지'>";
      break;
    case "2":
      title = "웃긴 강아지";
      author = "cute";
      date = "2025-08-23";
      body = "<P>진짜 웃기게 생긴 강아지ㅋㅋㅋㅋ</p>"
              +"<img src='../image/웃긴강아지.jpg' width='30%' alt='웃긴강아지'>";
      break;
    case "1":
      title = "강아지 자랑";
      author = "aeran";
      date = "2025-08-22";
      body = "<P>사이 좋은 강아지들</p>"
              +"<img src='../image/자랑.jpg' width='30%' alt='사이좋은강아지'>";
      break;
    default:
      title = "글을 찾을 수 없습니다";
      author = "-";
      date = "-";
      body = "유효하지 않은 글 번호입니다.";
  }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Board List Detail</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<div class="container mt-4" style="max-width: 900px;">
  <div class="card shadow-sm">
    <div class="card-header bg-secondary text-white">
      <h4 class="mb-0"><%= title %></h4>
    </div>
    <div class="card-body">
      <p class="text-muted mb-2">
        글번호 <%= id %> · 작성자 <%= author %> · <%= date %>
      </p>
      <hr>
      <p class="card-text fs-5" style="line-height:1.7;">
        <%= body %>
      </p>
    </div>
    <div class="card-footer text-end">
      <a href="list.jsp" class="btn btn-outline-secondary">목록으로</a>
    </div>
  </div>
</div>

</body>
</html>
<jsp:include page="../common/bottom.jsp" />