<%--
  Created by IntelliJ IDEA.
  User: 86155
  Date: 2021/6/24
  Time: 18:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改书籍页面</title>

    <%@ include file="/WEB-INF/common/head.jsp"%>


    <style>
        table{/*设置tr标签行间距 ： border-collapse属性加上border-spacing属性*/
            border-collapse: separate;
            border-spacing: 5px 50px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h2>
                    <small>修改书籍</small>
                </h2>
            </div>
        </div>
    </div>
    <form action="${pageContext.request.contextPath}/book/updateBook" method="post">
        <table>
            <tr>
                <td>书籍名称:<input type="text" name="bookName" value="${books.bookName}"></td>
            <tr>
                <td>书籍数量:<input type="text" name="bookCounts" value="${books.bookCounts}"></td>
            </tr>
            <tr>
                <td>书籍描述:<input type="text" name="detail" value="${books.detail}"></td>
            </tr>
            <tr>
                <td><input type="submit"></td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
