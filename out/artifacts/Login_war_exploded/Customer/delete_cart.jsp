<%--
  Created by IntelliJ IDEA.
  User: KEKE
  Date: 2018/7/26
  Time: 13:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
<head>
    <title>add_cart</title>
</head>
<body>

<%
    String name=request.getParameter("name");
    String username="User";
    try{
        if(session.getAttribute("username")!=null)
            username = (String) session.getAttribute("username");
    }catch (Exception e) {
        e.printStackTrace();
    }
    session.setAttribute("username",username);
%>

<sql:setDataSource var="snapshot" driver="com.mysql.cj.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/test?serverTimezone=GMT&allowPublicKeyRetrieval=true&characterEncoding=utf-8&useSSL=false"
                   user="root"  password="software"/>

<sql:update dataSource="${snapshot}" var="count">
    DELETE FROM test.cart WHERE Cname ='<%=username%>' && Pname='<%=name%>';
</sql:update>
<jsp:forward page="cart.jsp"/>
</body>
</html>
