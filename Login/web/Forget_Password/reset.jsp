<%--
  Created by IntelliJ IDEA.
  User: KEKE
  Date: 2018/7/8
  Time: 8:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Sign Up</title>
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <!-- Custom Theme files -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Sign Up Password Form Widget Responsive, Login form web template, Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
    <!--google fonts-->
    <link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>
    <script src="js/jquery-2.1.4.min.js"></script>
    <%
        String name = request.getParameter("name");
    %>
    <script>
        function check() {
            if(input1.value != input2.value) {
                alert("两次输入密码不一致！")
                input1.value = "";
                input2.value = "";
            }
        }
    </script>
</head>
<body>
<!-- login -->
<div class="login-section">
    <div class="login">
        <div class="modal-content modal-info">
            <div class="modal-header">
                <h3>CHANGE PASSWORD</h3>
            </div>
            <div class="modal-body modal-spa">
                <div class="login-form">
                    <form action="/Forget_Password/ServletReset" method="post">
                        <input type="hidden" name="name" value="<%=name%>">
                        <input type="password" class="lock" id="input1" name="password" placeholder="New password" required="" />
                        <input type="password" class="lock" id="input2" name="password" placeholder="Confirm password" required="" onblur="check()"  />
                        <input type="submit" value="SUBMIT">
                    </form>
                </div>
            </div>
        </div>
        <!-- //login -->
    </div>
</div>
</body>
</html>
