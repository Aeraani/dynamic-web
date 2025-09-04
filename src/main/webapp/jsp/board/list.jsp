<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="pageTitle" value="게시판 목록"/>
<%--<%@ include  file="/WEB-INF/jspf/header.jsp">--%>
<%@include file="/WEB-INF/jspf/header.jsp"%>
<h3 class="mb-3">게시판 목록</h3>

<table class="table table-striped align-middle">
    <thead>
    <tr>
        <th style="width:80px">번호</th>
        <th>제목</th>
        <th style="width:200px">작성일</th>
        <th style="width:160px">관리</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="b" items="${boards}">
        <tr>
            <td>${b.id}</td>
            <td>
                <a class="link-dark text-decoration-none" href="<c:url value='/board'><c:param name='action' value='view'/><c:param name='id' value='${b.id}'/></c:url>">
                    <c:out value="${b.title}"/>
                </a>
            </td>
            <td>${b.createdAt}</td>
            <td>
                <a class="btn btn-sm btn-outline-secondary" href="<c:url value='/board'><c:param name='action' value='view'/><c:param name='id' value='${b.id}'/></c:url>">보기</a>
                <a class="btn btn-sm btn-outline-danger" href="<c:url value='/board'><c:param name='action' value='delete'/><c:param name='id' value='${b.id}'/></c:url>"
                   onclick="return confirm('삭제할까요?');">삭제</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<jsp:include page="/WEB-INF/jspf/footer.jsp"/>