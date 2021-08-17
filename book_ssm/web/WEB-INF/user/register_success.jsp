<%--
  Created by IntelliJ IDEA.
  User: 86155
  Date: 2021/8/15
  Time: 20:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册成功</title>
    <%
        pageContext.setAttribute("PATH",request.getContextPath());
    %>
    <%@ include file="/WEB-INF/common/head.jsp"%>
</head>


<body>

        <h1><a href="${PATH}/user/index">注册成功！ 返回首页</a></h1>

</body>
</html>
