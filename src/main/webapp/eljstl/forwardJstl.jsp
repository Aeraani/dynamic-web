
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%--private int id;--%>
<%--private String title;--%>
<%--private String content;--%>
<%--private LocalDateTime createdAt;--%>
<%--private LocalDateTime updatedAt;--%>
<div class="container">
    <h2>Contextual Classes</h2>
    <p>Contextual classes can be used to color the table, table rows or table cells. The classes that can be used are: .table-primary, .table-success, .table-info, .table-warning, .table-danger, .table-active, .table-secondary, .table-light and .table-dark:</p>
    <table class="table">
        <thead>
        <tr>
            <th>NO</th>
            <th>ID</th>
            <th>TITLE</th>
            <th>CONTENT</th>
            <th>CREATEAT</th>
        </tr>
        </thead>
        <tbody>
        <%-- forEach(반복문) --%>
        <c:forEach var="i" items="${list}" varStatus="cnt">
            <c:choose>
                <c:when test="${cnt.count mod 2 eq 0}">
                    <tr>
                        <td>${cnt.count}</td>
                        <td>${i.id}</td>
                        <td>${i.title}</td>
                        <td>${i.content}</td>
                        <td>${i.createdAt}</td>
                    </tr>
                </c:when>
                <c:when test="${cnt.count mod 3 eq 0}">
                    <tr class="table-primary">
                        <td>${cnt.count}</td>
                        <td>${i.id}</td>
                        <td>${i.title}</td>
                        <td>${i.content}</td>
                        <td>${i.createdAt}</td>
                    </tr>
                </c:when>

                <c:otherwise>
                    <tr class="table-success">
                        <td>${cnt.count}</td>
                        <td>${i.id}</td>
                        <td>${i.title}</td>
                        <td>${i.content}</td>
                        <td>${i.createdAt}</td>
                    </tr>

                </c:otherwise>
            </c:choose>
        </c:forEach>

        </tbody>
    </table>
</div>

</body>
</html>