<%--
  Created by IntelliJ IDEA.
  User: KEKE
  Date: 2018/7/8
  Time: 8:34
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
</head>
<body>
<!-- login -->
<div class="login-section">
    <div class="signup">
        <div class="modal-content modal-info">
            <div class="modal-header">
                <h3>FORGOT PASSWORD ?</h3>
                <p>Enter Email to reset password </p>
            </div>
            <div class="modal-body modal-spa">
                <div class="login-form">
                    <form action="/Forget_Password/ServletForget" method="post" id="signup">
                        <ol>
                            <li>
                                <input type="name" id="name" name="name" placeholder="Enter your username" title="Please enter a valid username" required="">
                                <input type="email" id="email" name="email" placeholder="Enter your email" title="Please enter a valid email" required="">

                                  <p class="validation01">
                                    <span class="invalid">Please enter a valid email address e.g. mail@example.com</span>
                                    <span class="valid">Thank you for entering a valid email</span>
                                </p>
                            </li>
                        </ol>
                        <input type="submit" value="SEND">
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- //login -->
</div>

</body>
</html>