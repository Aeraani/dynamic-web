<%--
  Created by IntelliJ IDEA.
  User: taera
  Date: 2025-08-29
  Time: 오전 11:45
  To change this template use File | Settings | File Templates.
--%>
<%--페이지디렉티브. 디렉티브 없으면 jsp아님--%>
<%--buffer="none" autoFlush="false" qjvjfmf 없게 만드는 코드--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>process.jsp</h2>
<%
    request.setCharacterEncoding("UTF-8");
    String name = request.getParameter("username");
    request.setAttribute("name",name);
    //response.sendRedirect("result.jsp");


//    JSP/Servlet에서 클라이언트 요청으로 서버 내부에서 다른자원(JSP,Html,Servlet)전달하는 기능을
//    forward를 하면 서버 내부로 이동 ---> 브라우저의 주소창은 변하지 않음
    //forward방식 : 서블릿 내부에서 불러주고 url바꾸지 않음. input.jsp에서 버튼 눌러 process.jsp로 오면
    // url은 process.jsp에서 바뀌지 않고 result.jsp를 화면에 보여줌
    // 버퍼가 없으면 실행되지 않음
    RequestDispatcher rd=request.getRequestDispatcher("result.jsp");
    rd.forward(request,response);
%>

</body>
</html>
