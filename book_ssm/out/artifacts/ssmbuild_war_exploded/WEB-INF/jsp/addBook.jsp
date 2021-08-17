<%--
  Created by IntelliJ IDEA.
  User: 86155
  Date: 2021/6/24
  Time: 12:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加图书</title>

    <%@ include file="/WEB-INF/common/head.jsp"%>

    <style type="text/css">
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
                <h1>
                    <small>新增书籍</small>
                </h1>
            </div>
        </div>
    </div>
    <form action="${pageContext.request.contextPath}/book/addBook" method="post">
        <table>
            <tr>
                <td>书籍名称:<input type="text" name="bookName"></td>
            <tr>
                <td>书籍数量:<input type="text" name="bookCounts"></td>
            </tr>
            <tr>
                <td>书籍描述:<input type="text" name="detail"></td>
            </tr>
            <tr>
                <td><input type="submit"></td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
