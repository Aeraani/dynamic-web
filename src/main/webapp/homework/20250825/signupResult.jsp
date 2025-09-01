<%@ page import="java.util.Map" %>
<%@ page import="java.util.Enumeration" %><%--
  Created by IntelliJ IDEA.
  User: taera
  Date: 2025-08-26
  Time: 오후 9:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String gender = request.getParameter("gender");

    String[] hobby = request.getParameterValues("hobby");
    String[] skills = request.getParameterValues("skills");

    Map<String, String[]> paramMap = request.getParameterMap();

    Enumeration<String> namesEnum = request.getParameterNames();

%>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입 결과</title>
</head>
<body>
<h1>전송 된 회원가입 정보</h1>
<h3>getParameter</h3>
<table border="2px" cellspacing="0"   >
<thead>
<tr bgcolor="#fffacd">
    <th> </th>
    <th>가입 정보</th>
</tr>
</thead>
<tbody>
<tr> <td><strong>Name</strong></td>
<td><%= (name !=null && !name.isEmpty()) ? name: "미입력"%></td>
</tr>
<tr> <td><strong>Email</strong></td>
    <td><%= (email !=null && !email.isEmpty()) ? email: "미입력"%></td>
</tr>
<tr> <td><strong>Password</strong></td>
    <td><%= (password !=null && !password.isEmpty() ? password: "미입력")%></td>
</tr>
<tr> <td><strong>Gender</strong></td>
    <td><%= (gender !=null && !gender.isEmpty() ? gender: "미선택")%></td>
</tr>
</table>
<br>

<h3>getParameterValues </h3>
<div style="display:inline-block; padding:5px; border:2px solid darkorange;">
<strong>Hobby: </strong>
<% if (hobby !=null && hobby.length>0){
            out.print(String.join(", ",hobby));
        }else{
            out.print("선택 없음");
        }%>
<strong>Skills: </strong>
<% if (skills !=null && skills.length>0){
            out.print(String.join(", ",skills));
        }else{
            out.print("선택 없음");
        }%>
</div>
<br>
<h3>getParameterMap </h3>
<div style="display:inline-block; padding:5px; border:2px solid mediumpurple;">
    <%
        for(String key : paramMap.keySet() ){
            String []values=paramMap.get(key);
            out.print(key+"=");
            for(String v : values){
                out.println(v+" ");
            }
            out.println("<br>");
        }
    %>
</div>
<h3>getParameterNames </h3>
<div style="display:inline-block; padding:5px; border:2px solid hotpink;">
<%
    while(namesEnum.hasMoreElements()){
        String param = namesEnum.nextElement();
        String[]val=request.getParameterValues(param);

%>
    <li><%= param %> = <%= (val != null) ? String.join(", ", val) : "" %></li>
    <%
        }
    %>
</li>
</div>
</body>
</html>
