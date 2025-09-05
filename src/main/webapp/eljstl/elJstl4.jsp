<%--
  Created by IntelliJ IDEA.
  User: taera
  Date: 2025-09-04
  Time: 오후 4:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <%--
   http://localhost:8080/jstlLesson?action=function (forward로 오게하세요)

   ---%>
    <title>Title</title>
</head>
<body>
<p>Length of 'hello': ${fn:length('hello')}</p>
<p>Upper case 'hello': ${fn:toUpperCase('hello')}</p>
<p>Lower case 'HELLO': ${fn:toLowerCase('HELLO')}</p>
<p>Substring of 'hello' from 1 to 3: ${fn:substring('hello', 1, 3)}</p>
<p>Substring before 'lo' in 'hello': ${fn:substringBefore('hello', 'lo')}</p>
<p>Substring after 'he' in 'hello': ${fn:substringAfter('hello', 'he')}</p>
<p>Replace 'l' with 'w' in 'hello': ${fn:replace('hello', 'l', 'w')}</p>
<p>Trim '  hello  ': '${fn:trim('  hello  ')}'</p>
<p>ContainsIgnoreCase 'HE' in 'hello': ${fn:containsIgnoreCase('hello', 'HE')}</p>
<p>StartsWith 'he' in 'hello'i: ${fn:startsWith('hello', 'he')}</p>
<p>EndsWith 'lo' in 'hello': ${fn:endsWith('hello', 'lo')}</p>
<p>IndexOf 'l' in 'hello': ${fn:indexOf('hello', 'l')}</p>


<c:forTokens var="token" items="java,oop,spring" delims=",">
    <p>${token}</p>
</c:forTokens>
<c:url value="eljstl1.jsp" var="pageUrl" />
<a href="${pageUrl}">Link</a>
<%
    response.sendRedirect();
%>
<c:redirect url="${pageUrl}"/>

<c:set var="uu" value="testServer"/>
<c:url value="/eljstl/elJstlParam.jsp" var="pageUrl">
    <c:param name="no" value="1"/>
    <c:param name="job" value="${uu}"/>
</c:url>
<a href="${pageUrl}">Link</a>

</body>
</html>
