<%@ page session="true" %>
<%--<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>--%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>MySite</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%-- 시멘틱의 네비게이션 사용 --%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="../index.jsp">MySite</a>
    <div class="collapse navbar-collapse">
        <ul class="navbar-nav ml-auto">
            <%
                String user = (String) session.getAttribute("user");
                if (user != null) {
            %>
            <li class="nav-item"><a class="nav-link" href="index.jsp">FreeBoard</a></li>
            <li class="nav-item"><a class="nav-link" href="notice.jsp">Notice</a></li>
            <li class="nav-item"><a class="nav-link" href="logout.jsp">Logout</a></li>
            <%
            } else {
            %>
            <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
            <li class="nav-item"><a class="nav-link" href="signup.jsp">Sign Up</a></li>
            <%
                }
            %>
        </ul>
    </div>
</nav>