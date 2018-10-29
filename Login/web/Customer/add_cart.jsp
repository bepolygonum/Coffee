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
    String sql=" INSERT INTO test.cart (Cname,Pname,price,price_v,description_img) VALUES ('"+username+ "','";
    %>

<sql:setDataSource var="snapshot" driver="com.mysql.cj.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/test?serverTimezone=GMT&allowPublicKeyRetrieval=true&characterEncoding=utf-8&useSSL=false"
                   user="root"  password="software"/>
<sql:query dataSource="${snapshot}" var="result" >
    SELECT *FROM test.cart  where Pname='<%=name%>' && Cname='<%=username%>';
</sql:query>
<c:choose>
<c:when test="${result.rowCount == 0}">
<sql:query dataSource="${snapshot}" var="result1">
    SELECT *FROM test.product  where Pname='<%=name%>';
</sql:query>
    <li>${result1.rowCount}</li>
<c:forEach var="row" items="${result1.rows}">
    <sql:update dataSource="${snapshot}" var="result1">
       <%=sql%>${row.Pname}',${row.Pprice},${row.Pprice_v},'${row.Pdescription_img}');
    </sql:update>
</c:forEach>
</c:when>

<c:when test="${result.rowCount > 0}">
<c:forEach var="row" items="${result.rows}">
    <sql:update dataSource="${snapshot}" var="result">
        update test.cart set num= ${row.num+1} where Pname='<%=name%>' && Cname='<%=username%>';
    </sql:update>
</c:forEach>
</c:when>
</c:choose>
</body>
</html>
