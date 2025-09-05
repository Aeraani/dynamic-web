<%--
  Created by IntelliJ IDEA.
  User: taera
  Date: 2025-09-05
  Time: 오후 3:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
    $(function (){
        $("#btn").click(function (){
           $.ajax({
             url:"/time",
             dataType:"text",
             success:function (data){
                 console.log(data);
             },
               error:function (jpXHR, textStatus, errorThrown){
                 console.log(jpXHR.responseText);
               }
           });
        });

    });
</script>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <button id="btn">/time</button>
    <div id="out"></div>
</body>
</html>
