<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: taera
  Date: 2025-08-25
  Time: 오후 4:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--<%--%>
<%--    Enumeration<String> enumeration= request.getParameterNames();--%>
<%--    while (enumeration.hasMoreElements()){--%>
<%--        String names=enumeration.nextElement();--%>
<%--        System.out.println(names+":"+request.getParameter(names));--%>
<%--    }--%>
<%--%>--%>
<%
    Map<String,String[]> map = request.getParameterMap();
    for(String key : map.keySet()){
        String []values=map.get(key);
        System.out.print(key+"=");;
        for(String v:values){
            System.out.print(v+" ");
        }//for
        System.out.println();
    }
%>
</body>
</html>
