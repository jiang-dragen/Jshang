<%--
  Created by IntelliJ IDEA.
  User: 86155
  Date: 2021/6/22
  Time: 19:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>书籍页面</title>
    <%
        pageContext.setAttribute("PATH",request.getContextPath());
    %>

    <%@ include file="/WEB-INF/common/loginHead.jsp"%>



    <script type="text/javascript">
        $(function () {
            let pn = ${pageInfo.pages}
            $("#register").click(function (){
                // alert("注册页面")
                /*  let url = "${PATH}/user/toRegister";

                location.href = url;*/

                        let url = "${PATH}/user/toRegister";

                        location.href = url;
            });

            $("#login").click(function (){
                let s1 = $("#exampleInputUsername").val()
                let  s2 = $("#exampleInputPassword1").val()
                let url = "${PATH}/user/login?username="+s1+"&password="+s2;
                location.href = url;
                console.log("成功");
            });
        });
    </script>
</head>
<body>
<h1 style="color: beige;font-size: 60px">登录</h1>
<br>
<%--<a href="${pageContext.request.contextPath}/book/allBooks">进入书籍页面</a><br>--%>
<div class="container">
    <h1></h1>
    <div class="row clearfix">
        <div class="col-md-12 column">
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-4 column">
        </div>
        <div class="col-md-4 column">
            <form role="form" action="user/login">
                <div class="form-group" style="color: beige;font-size: 25px">
                    <label for="exampleInputUsername">Username</label>
                    <span style="color:red; font-size: small">${empty requestScope.get('msg') ? "" : requestScope.get('msg')}</span>
                    <input name="username" value="${requestScope.username}" type="text" class="form-control"
                           id="exampleInputUsername" placeholder="Username"/>
                </div>
                <div class="form-group" style="color: beige;font-size: 25px">
                    <label for="exampleInputPassword1">Password</label><input value="${requestScope.password}" type="password" name="password" class="form-control"
                                                                              id="exampleInputPassword1" placeholder="Password"/>
                </div>
                <%--<div class="checkbox" style="color: beige">
                    <label><input type="checkbox" style="height: 20px;width: 20px"/>Check me out</label>
                </div>--%>
                <button type="submit" class="btn btn-info" style="font-size: 20px" id="login">登录</button>
                <button type="button" class="btn btn-info" style="font-size: 20px" id="register">注册</button>
            </form>
        </div>
        <div class="col-md-4 column">

        </div>
    </div>

</div>

</body>
</html>
