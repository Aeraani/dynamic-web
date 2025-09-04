<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="pageTitle" value="글쓰기"/>
<jsp:include page="/WEB-INF/jspf/header.jsp"/>

<a href="<c:url value='/board'><c:param name='action' value='list'/></c:url>" class="btn btn-link p-0 mb-3">&larr; 목록</a>

<h3 class="mb-3">새 글 작성</h3>

<form action="<c:url value='/board'/>" method="post" class="needs-validation" novalidate>
    <div class="mb-3">
        <label class="form-label">제목</label>
        <input type="text" name="title" class="form-control" required>
        <div class="invalid-feedback">제목을 입력하세요.</div>
    </div>
    <div class="mb-3">
        <label class="form-label">내용</label>
        <textarea name="content" class="form-control" rows="6" required></textarea>
        <div class="invalid-feedback">내용을 입력하세요.</div>
    </div>
    <button class="btn btn-primary" type="submit">등록</button>
</form>



<jsp:include page="/WEB-INF/jspf/footer.jsp"/>