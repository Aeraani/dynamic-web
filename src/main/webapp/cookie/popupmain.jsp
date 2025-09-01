<%--
  Created by IntelliJ IDEA.
  User: taera
  Date: 2025-08-29
  Time: 오전 10:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script
            src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
            crossorigin="anonymous"></script>

</head>
<%
    //쿠킨혹인
    boolean showpopup=true;
    Cookie[] cookies= request.getCookies();
    if(cookies!=null){
        for(Cookie c:cookies){
            if("popupYN".equals(c.getName())&& "done".equals(c.getValue())){
                showpopup=false;
            }
        }
    }
    request.setAttribute("showpopup",showpopup);
%>
<body>

<h1>메인페이지</h1>
</body>
<script>
    $(function(){// 로드상태
        //alert(${showpopup});
        if(${showpopup})
            window.open("popup.jsp","notice","width=400,height=400");
    });
</script>
</html>
