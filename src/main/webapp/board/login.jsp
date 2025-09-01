
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/include/header.jsp" %>
<% //scriptlet
    String message = "";
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        //username이 admin이고 password가 1234이면
        if ("admin".equals(username) && "1234".equals(password)) {
            //로그인을 성공했을 때 session에 username을 저장한다
            //session 은 service때 기본으로 만들어지는 객체
            session.setAttribute("user", username); //user가 session의 key , key는 다른 이름이어도 됨 / username은 value (user라는 이름으로 username저장)
            //response는 응답객체 (객체니까 응답 기능을 갖고있는 객체). 그래서 응답객체 안의 stream데이터를 기반으로 welcome.jsp로 이동 한다
            response.sendRedirect("welcome.jsp");
            return;
        } else {
            message = "Invalid credentials";
        }
    }
%>
<div class="container mt-5">
    <h2>Login</h2>
    <form method="post">
        <div class="form-group">
            <label>Username</label>
            <input type="text" name="username" class="form-control" required>
        </div>
        <div class="form-group">
            <label>Password</label>
            <input type="password" name="password" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-primary">Login</button>
        <div class="text-danger mt-2"><%= message %></div>
    </form>
</div>
<%@ include file="/include/footer.jsp" %>