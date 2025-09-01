
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%
  if (session.getAttribute("user") == null) {
    response.sendRedirect("login.jsp");
    return;
  }
%>
<%@ include file="/include/header.jsp" %>
<div class="container mt-5">
  <h2>공지사항</h2>
  <table class="table table-striped">
    <thead class="thead-dark">
    <tr>
      <th>#</th>
      <th>공지 제목</th>
      <th>작성일</th>
    </tr>
    </thead>
    <tbody>
    <tr onclick="alert('공지 1 확인')">
      <td>1</td>
      <td>사이트 점검 안내</td>
      <td>2025-05-20</td>
    </tr>
    <tr onclick="alert('공지 2 확인')">
      <td>2</td>
      <td>신규 기능 출시</td>
      <td>2025-05-25</td>
    </tr>
    </tbody>
  </table>
</div>
<%@ include file="/include/footer.jsp" %>