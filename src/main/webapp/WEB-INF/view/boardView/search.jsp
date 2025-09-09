<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>BoardSearch</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div class="container">
  <h2 class="mb-3">게시글 검색</h2>
  <form action="${pageContext.request.contextPath}/board1" method="get"  class="form-inline mb-3" accept-charset="UTF-8">
    <input type="hidden" name="action" value="search">
    <div class="form-group">
      <select id="type" name="type" class="form-control mr-2" style="width:100px">
        <option value="title"  ${type == 'title'  ? 'selected' : ''}>제목</option>
        <option  value="content"${type == 'content'? 'selected' : ''}>내용</option>
        <option  value="writer" ${type == 'writer' ? 'selected' : ''}>작성자</option>
      </select>
    </div>
    <input id="keyword" type="text" name="keyword" class="form-control mr-2" style="width: 200px" value="${fn:escapeXml(keyword)}"
           placeholder="검색어를 입력하세요.."  required>
    <button type="submit" class="btn btn-primary" >검색</button>
</form>
    <c:choose>
    <c:when test="${empty boards}">
      <p>검색 결과가 없습니다.</p>
    </c:when>
    <c:otherwise>
    <div class="container">
      <h2>검색 결과</h2>
      <table class="table">
        <thead>
        <tr>
          <th>ID</th>
          <th>제목</th>
          <th>작성자</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="b" items="${boards}">
        <tr>
          <td>${b.id}</td>
          <td>
            <a href="<c:url value='/board1'>
                       <c:param name='action' value='view'/>
                       <c:param name='id' value='${b.id}'/>
                     </c:url>">${fn:escapeXml(b.title)}</a>
          </td>
          <td>${b.writer_id}</td>
        </tr>
        </c:forEach>
        </tbody>
      </table>
        </c:otherwise>
        </c:choose>
    <a href="${pageContext.request.contextPath}/board1?action=list">목록으로</a>
    </div>
</body>
</html>