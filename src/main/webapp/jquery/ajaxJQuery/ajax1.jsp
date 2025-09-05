<%--
  Created by IntelliJ IDEA.
  User: taera
  Date: 2025-09-05
  Time: 오전 11:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script>
        $(function(){//loadfunction
            $("#message").mouseover(function (){
                $("h1#ajax").html("Loading...");
                $.ajax({
                    url:"ping.jsp",
                    method:"GET",
                    dataType:"text",
                    contentType:"text/html;charset=UTF-8",
                    success:function (data){
                        $("#app").text("Hello Ajax");

                    },
                    error:function (data){
                        $("#app").text("에러: " + xhr.status);

                    }
                })
            });

            $("#ajax").on('click',function (){
                console.log('ajax Loading')
               $("h1#ajax").html("Loading...");
               $.ajax({
                   url:"ping.jsp",
                   method:"GET",
                   dataType:"text",
                   contentType:"text/html;charset=UTF-8",
                   success:function (data){
                       $("#app").text(data);

                   },
                   error:function (data){
                       $("#app").text("에러: " + xhr.status);

                   }
               })
            });
        });
    </script>
</head>
<body>
<h1 id="ajax">Jquery Ajax</h1>
<h1 id="message">Jquery Ajax Message</h1>
<div id="app">

</div>
</body>
</html>
