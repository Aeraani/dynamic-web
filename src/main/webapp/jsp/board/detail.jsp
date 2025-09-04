<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="pageTitle" value="게시글 상세"/>
<jsp:include page="/WEB-INF/jspf/header.jsp"/>

<a href="<c:url value='/board'><c:param name='action' value='list'/></c:url>" class="btn btn-link p-0 mb-3">&larr; 목록</a>

<h3 class="mt-2"><c:out value="${board.title}"/></h3>
<p class="text-muted">작성: ${board.createdAt} / 수정: ${board.updatedAt}</p>

<div class="card mb-4">
    <div class="card-body" style="white-space:pre-line"><c:out value="${board.content}"/></div>
</div>

<h5 class="mt-4">수정</h5>
<form action="<c:url value='/board'/>" method="post" class="mt-2 needs-validation" novalidate>
    <input type="hidden" name="id" value="${board.id}">
    <div class="mb-3">
        <label class="form-label">제목</label>
        <input type="text" class="form-control" name="title" value="${board.title}" required>
        <div class="invalid-feedback">제목을 입력하세요.</div>
    </div>
    <div class="mb-3">
        <label class="form-label">내용</label>
        <textarea class="form-control" name="content" rows="5" required><c:out value="${board.content}"/></textarea>
        <div class="invalid-feedback">내용을 입력하세요.</div>
    </div>
    <button class="btn btn-primary" type="submit">저장</button>
    <a class="btn btn-secondary" href="<c:url value='/board'><c:param name='action' value='list'/></c:url>">취소</a>
</form>

<jsp:include page="/WEB-INF/jspf/footer.jsp"/>