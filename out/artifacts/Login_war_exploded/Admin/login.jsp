<%--
  Created by IntelliJ IDEA.
  User: KEKE
  Date: 2018/7/4
  Time: 15:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=gb2312" language="java"
         import="java.sql.*"  %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Driver"%>

<html>
<head>
    <title>Register</title>
    <link href="css/snow.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/style1.css" rel="stylesheet" type="text/css" media="all" />
</head>

<body>
<div class="snow-container">
    <div class="snow foreground"></div>
    <div class="snow foreground layered"></div>
    <div class="snow middleground"></div>
    <div class="snow middleground layered"></div>
    <div class="snow background"></div>
    <div class="snow background layered"></div>
</div>
<div class="top-buttons-agileinfo">

</div>
<div class="main-agileits">
    <div class="form-w3-agile">
        <h1 class="sub-agileits-w3layouts">Sign In</h1>
        <form method="post" action="/Admin/ServletLoginAdmin">
            <input type="name" name="Aname" placeholder="username" required="" />
            <input type="password" name="Apassword" placeholder="password" required="" />
            <div class="submit-w3l">
                <input type="submit" value="submit">
            </div>

        </form>
    </div>
</div>

</body>

</html>