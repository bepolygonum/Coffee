<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <title>Edit User</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="style/adminStyle.css" rel="stylesheet" type="text/css"/>
    <%
        String str1 = request.getParameter("Cid");
        int Cid = Integer.valueOf(str1).intValue();
    %>
</head>

<body>
<sql:setDataSource var="snapshot" driver="com.mysql.cj.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/test?serverTimezone=GMT&allowPublicKeyRetrieval=true&characterEncoding=utf-8&useSSL=false"
                   user="root" password="software"/>

<sql:query dataSource="${snapshot}" var="result">
    SELECT *FROM test.customer where Cid=<%=Cid%>;
</sql:query>
<div class="wrap">
    <div class="page-title">
        <span class="modular fl"><i class="edit_user"></i><em>Edit User</em></span>
        <span class="modular fr"><a href="user_list.jsp" class="pt-link-btn">User List</a></span>
    </div>
    <form action="/Admin/ServletEditUser" method="post">

        <table class="list-style">
            <c:forEach var="row" items="${result.rows}">
                <tr>

                    <td style="width:15%;text-align:right;" name="id">User ID：</td>
                    <td><input type="text" class="textBox length-middle" readonly="false" name="id" value="<%=Cid%>"/>
                    </td>
                </tr>
                <tr>
                    <td style="width:15%;text-align:right;">User Name：</td>
                    <td><input type="text" class="textBox length-middle" name="name" value="${row.Cname}"/></td>
                </tr>
                <tr>
                    <td style="text-align:right;">Email：</td>
                    <td><input type="text" class="textBox length-middle" name="email" value="${row.Cemail}"/></td>
                </tr>
                <tr>
                    <td style="text-align:right;">Telephone：</td>
                    <td><input type="text" class="textBox length-middle" name="tel" value="${row.Ctel}"/></td>
                </tr>
                <tr>
                    <td style="text-align:right;">Level：</td>
                    <td>${row.Clevel}</td>
                </tr>
                <tr>
                    <td style="text-align:right;">New Password：</td>
                    <td><input type="password" class="textBox length-middle" name="password"/></td>
                </tr>
                <tr>
                    <td style="text-align:right;">Confirm Password：</td>
                    <td><input type="password" class="textBox length-middle"/></td>
                </tr>
                <tr>
                    <td style="text-align:right;"></td>
                    <td><input type="submit" class="tdBtn" value="Confirm"/></td>
                </tr>

            </c:forEach>
        </table>
    </form>
</div>
</body>

</html>