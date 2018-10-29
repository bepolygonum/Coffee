<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Revise Password</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="style/adminStyle.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<%
    String name=request.getParameter("name");
%>

<sql:setDataSource var="snapshot" driver="com.mysql.cj.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/test?serverTimezone=GMT&allowPublicKeyRetrieval=true&characterEncoding=utf-8&useSSL=false"
                   user="root"  password="software"/>

<sql:query dataSource="${snapshot}" var="result">
    SELECT *FROM test.admin where Aname='<%=name%>';
</sql:query>
<div class="wrap">
    <div class="page-title">
        <span class="modular fl"><i class="user"></i><em>Revise Password</em></span>
    </div>
    <table class="noborder">

        <c:forEach var="row" items="${result.rows}">
        <form action="/Admin/ServletRevisePwd" method="post">
            <tr>
                <td width="15%" style="text-align:right;">User Name：</td>
                <td><input type="text" name="name" class="textBox length-middle" value="${row.Aname}"/></td>
            </tr>
            <tr>
                <td width="15%" style="text-align:right;">Gender：</td>
                <td><input type="text" name="gender" class="textBox length-middle" value="${row.Agender}"/></td>
            </tr>
            <tr>
                <td width="15%" style="text-align:right;">Email：</td>
                <td><input type="text" name="email" class="textBox length-middle" value="${row.Aemail}"/></td>
            </tr>
        <tr>
            <td style="text-align:right;">Old Password：</td>
            <td><input type="password" name="password" class="textBox length-middle" value="${row.Apassword}"/></td>
        </tr>
        <tr>
            <td style="text-align:right;">New Password：</td>
            <td><input type="password" name="new_password" class="textBox length-middle"/></td>
        </tr>
        <tr>
            <td style="text-align:right;">Confirm Password：</td>
            <td><input type="password"  class="textBox length-middle"/></td>
        </tr>
        <tr>
            <td style="text-align:right;"></td>
            <td><input type="submit" class="tdBtn" value="Confirm"/></td>
        </tr>
        </form>
        </c:forEach>
    </table>
</div>
</body>
</html>