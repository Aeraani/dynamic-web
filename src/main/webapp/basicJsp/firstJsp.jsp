<%--
  Created by IntelliJ IDEA.
  User: taera
  Date: 2025-08-22
  Time: 오후 1:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>  <%--디렉티브. 지시하는 것. 이 코드는 page가 붙어으니 페이지 지시자--%>
<html>
<head>
    <title>Title</title>
    <style>
        h1{
            font-family: 굴림체;
        }
    </style>
</head>
<h1>FirstJsp</h1>
<%
for(int i=1;i<=10;i++){
%>
<hr color="pink" size="100"></hr>
<%
}
%>


</body>
<%--자바스크립트해석기--%>
<script>
    function showMessage(message){

    }
</script>
</html>
