<%--
  Created by IntelliJ IDEA.
  User: 86155
  Date: 2021/8/11
  Time: 17:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册页面</title>
    <%
        pageContext.setAttribute("PATH", request.getContextPath());
    %>
    
    <%@ include file="/WEB-INF/common/register_head.jsp"%>

    
    <script type="text/javascript">
        $(function (){
            $("#firstname").blur(function (){
                $.ajax({
                    url:"${PATH}/user/ajaxRegister",
                    data:{"username" : this.value},
                    success:function (data){
                        if (data.toString() == "true"){
                            $("span.errorMsg").text("用户名不可用！");
                        }else if (data.toString() == "false"){
                            $("span.errorMsg").text("用户名可用");
                        }
                    }
                })
            })
            // 给验证码的图片，绑定单击事件
            $("#code_img").click(function () {
                // 在事件响应的function函数中有一个this对象。这个this对象，是当前正在响应事件的dom对象
                // src属性表示验证码img标签的 图片路径。它可读，可写
                // alert(this.src);
                this.src = "http://localhost:8080${PATH}/kaptcha.jpg?d=" + new Date();
            });

            // 给注册绑定单击事件
            $("#register").click(function () {
                // 验证用户名：必须由字母，数字下划线组成，并且长度为5到12位
                //1 获取用户名输入框里的内容
                var usernameText = $("#firstname").val();
                //2 创建正则表达式对象
                var usernamePatt = /^\w{5,12}$/;
                //3 使用test方法验证
                if (!usernamePatt.test(usernameText)) {
                    //4 提示用户结果
                    $("span.errorMsg").text("用户名不合法！");

                    return false;
                }

                // 验证密码：必须由字母，数字下划线组成，并且长度为5到12位
                //1 获取用户名输入框里的内容
                var passwordText = $("#Password").val();
                //2 创建正则表达式对象
                var passwordPatt = /^\w{5,12}$/;
                //3 使用test方法验证
                if (!passwordPatt.test(passwordText)) {
                    //4 提示用户结果
                    $("span.errorMsg").text("密码不合法！");

                    return false;
                }

                // 验证确认密码：和密码相同
                //1 获取确认密码内容
                var repwdText = $("#isPassword").val();
                //2 和密码相比较
                if (repwdText != passwordText) {
                    //3 提示用户
                    $("span.errorMsg").text("确认密码和密码不一致！");

                    return false;
                }

                // 邮箱验证：xxxxx@xxx.com
                //1 获取邮箱里的内容
                var emailText = $("#Email").val();
                //2 创建正则表达式对象
                var emailPatt = /^[a-z\d]+(\.[a-z\d]+)*@([\da-z](-[\da-z])?)+(\.{1,2}[a-z]+)+$/;
                //3 使用test方法验证是否合法
                if (!emailPatt.test(emailText)) {
                    //4 提示用户
                    $("span.errorMsg").text("邮箱格式不合法！");

                    return false;
                }

                // 验证码：现在只需要验证用户已输入。因为还没讲到服务器。验证码生成。
                var codeText = $("#code").val();

                //去掉验证码前后空格
                // alert("去空格前：["+codeText+"]")
                codeText = $.trim(codeText);
                // alert("去空格后：["+codeText+"]")

                if (codeText == null || codeText == "") {
                    //4 提示用户
                    $("span.errorMsg").text("验证码不能为空！");

                    return false;
                }

                // 去掉错误信息
                $("span.errorMsg").text("");

            });
        })
    </script>

   
</head>
<body>
    <h1 style="font-size: 50px">注册</h1>
<form class="form-horizontal" role="form" action="${PATH}/user/registerCode">
    <div class="form-group">
        <label for="firstname" class="col-sm-3">用户名</label>
        <span class="errorMsg" style="color: red ; font-size: 20px">
            ${requestScope.msg}
        </span>
        <div class="col-sm-10">
            <input value="${requestScope.username}" type="text" name="username" class="form-control" id="firstname" placeholder="Username">
        </div>
    </div>

    <div class="form-group">
        <label for="Password" class="col-sm-3">密码</label>
        <div class="col-sm-10">
            <input value="${requestScope.password}" type="password" name="password" class="form-control" id="Password" placeholder="Password">
        </div>
    </div>

    <div class="form-group">
        <label for="isPassword" class="col-sm-4">确认密码</label>
        <div class="col-sm-10">
            <input type="password" class="form-control" id="isPassword" placeholder="isPassword">
        </div>
    </div>

    <div class="form-group">
        <label for="Email" class="col-sm-4">电子邮箱</label>
        <div class="col-sm-10">
            <input value="${requestScope.email}" type="email" name="email" class="form-control" id="Email" placeholder="Email">
        </div>
    </div>

    <label style="color: red">验证码：</label>
    <input class="itxt" type="text" name="code" style="width: 100px;" id="code" />
    <img id="code_img" alt="" src="kaptcha.jpg" style="float: right; margin-right: 40px; width: 110px; height: 30px;">

    <div class="form-group">
        <div class="col-sm-offset-0 col-sm-10">
            <button id="register" type="submit" class="btn btn-large btn-primary">注册账号</button>
            <button type="button" class="btn btn-info"><a href="${PATH}/index.jsp">已有账号,返回登录~</a></button>
        </div>

    </div>

</form>
</body>
</html>
