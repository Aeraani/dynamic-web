<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>JSP - Hello World</title>
</head>
<body>
<%--<%--%>
<%--  if (session.getAttribute("user") != null) {--%>
<%--    response.sendRedirect("board/welcome.jsp");--%>
<%--  } else {--%>
<%--    response.sendRedirect("board/login.jsp");--%>
<%--  }--%>
<%--%>--%>
<%--&lt;%&ndash;<h1><%= "Hello World!" %>&ndash;%&gt;--%>
<%--</h1>--%>
<%--<br/>--%>
<%--<a href="colorServlet">colorSevlet</a>--%>
<%--<a href="hello-servlet">Hello Servlet</a><br>--%>
<%--<a href="lifeCycleServlet">"lifeCycleServlet"</a>--%>

<%-- index.jsp는 Root 경로에 보여진다--%>
<a href="write.do?cmd=write">Write</a><%-- 여기를 누르면 DispatcherSernlet의 service호출 --%>
<%-- 특정 url이 발생하면 특정 Servlet이 불려진다.
 @WebServlet("*.do") 이 부분을 만나면 DispatcherServlet이 생성되고 Service 메서드가 호출되고
 Service메서드 안애서 Mapper를 수행 해서 cmd(명령)이 따른 관련 Action을 생성해서 executr함수를 호출함.
 그러면 execute함수는 model(비즈니스로직)부분을 수행한다
 그 다음은 ?
 특정 경로로 이동한다.
 그러니까 이동하는 방식 2가지가 있다. (redirect, forward(=dispetcher))
 처음에는 직접 코드를 구현해서 응용히세요...
 --%>
<a href="list.do?cmd=list">List</a><%-- 여기를 누르면 DispatcherSernlet의 service호출 --%>
<a href="ui.do?cmd=loginui">Login</a>
</body>
</html>
