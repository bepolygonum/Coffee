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
    <title>add_order</title>
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

<sql:query dataSource="${snapshot}" var="resultCid" >
    SELECT * FROM test.customer  where Cname='<%=username%>';
</sql:query>
<sql:query dataSource="${snapshot}" var="result" >
    SELECT *FROM test.cart  where Cname='<%=username%>';
</sql:query>

<c:set value="0" var="num" />
<c:set value="0" var="sum" />
<c:set value="0" var="sum1" />


<c:forEach var="row" items="${result.rows}">
    <c:set value="${num +row.num}" var="num" />
    <c:set value="${sum +row.price_v*row.num}" var="sum" />
    <c:set value="${sum1 +(row.price-row.price_v)*row.num}" var="sum1" />
    <sql:update dataSource="${snapshot}" var="count">
        DELETE FROM test.cart WHERE Cname ='<%=username%>' && Pname='${row.Pname}';
    </sql:update>
    <sql:query dataSource="${snapshot}" var="result2" >
        SELECT *FROM test.product  where Pname='${row.Pname}';
    </sql:query>
    <c:forEach var="row2" items="${result2.rows}">
    <sql:update dataSource="${snapshot}" var="result1">
        update test.product set Pnum= ${row2.Pnum-row.num} where Pname='${row2.Pname}';
    </sql:update>
    </c:forEach>
</c:forEach>


<c:forEach var="row" items="${resultCid.rows}">
    <sql:update dataSource="${snapshot}" var="result1">
        INSERT INTO test.order (Cid,Cname,Mnum,Oprice,Odiscount,Ofinish) VALUES (${row.Cid},'${row.Cname}',${num},${sum},${sum1},'No');
    </sql:update>
</c:forEach>


<c:forEach var="row" items="${result.rows}">
    <c:forEach var="row1" items="${resultCid.rows}">
        <sql:query dataSource="${snapshot}" var="result3" >
            SELECT *FROM test.order  where Cid=${row1.Cid} && Mnum = ${num}&& Oprice = ${sum} && Odiscount=${sum1} ;
        </sql:query>
    </c:forEach>

    <c:forEach var="row3" items="${result3.rows}">
        <sql:update dataSource="${snapshot}" var="count">
            INSERT INTO test.order_content (Oid,Pname,Pprice,Pprice_v,Pnum) VALUES (${row3.Oid},'${row.Pname}',${row.price},${row.price_v},${row.num});
        </sql:update>
    </c:forEach>
</c:forEach>
<jsp:forward page="cart.jsp"/>
</body>
</html>
