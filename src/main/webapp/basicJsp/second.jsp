<%--
  Created by IntelliJ IDEA.
  User: taera
  Date: 2025-08-22
  Time: 오후 2:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        .table-wrap{overflow:auto; border:1px solid #e5e7eb; border-radius:12px}
        table{width:100%; border-collapse:collapse; background:#fff; font-size:14px}
        caption{caption-side:bottom; text-align:left; color:#6b7280; padding:8px 4px 0}
        th,td{padding:10px 12px; border-bottom:1px solid #e5e7eb; text-align:left; vertical-align:middle}
        thead th{background:#f8fafc; position:sticky; top:0; z-index:1}

        /* 옵션: 줄무늬 / 호버 */
        .table-striped tbody tr:nth-child(even){background:#fafafa}
        .table-hover tbody tr:hover{background:#f1f5f9}

        /* 옵션: 테두리형 */
        .table-bordered{border:1px solid #e5e7eb}
        .table-bordered th,.table-bordered td{border:1px solid #e5e7eb}

        /* 옵션: 밀도 */
        .table-compact th,.table-compact td{padding:6px 8px}
        .table-comfortable th,.table-comfortable td{padding:14px 16px}

        /* 숫자 정렬 유틸 */
        .num{ text-align:right; font-variant-numeric:tabular-nums }
    </style>
</head>
<body topmargin="50">
<%--scriptlet은 service메소드 영역--%>

<table class="table-striped table-hover table-bordered table-compact">
    <thead>
    <tr>
        <%
            for(int i=2;i<=9;i++){
        %>
        <td><%=i%>단</td>
        <%
            }
        %>
    </tr>
    </thead>
    <tbody>
    <%
        for(int i=1;i<=9;i++){
    %>
    <tr>
        <%
            for(int j=2;j<=9;j++){
        %>
        <td><%=j%>*<%=i%>=<%=j*i%></td>
        <%
            }
        %>
    </tr>
    <%
        }
    %>

    </tbody>

</table>





</body>
</html>