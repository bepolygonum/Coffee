<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <title>Order Detail</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="style/adminStyle.css" rel="stylesheet" type="text/css" />
</head>

<body>
<%
    String str=request.getParameter("Oid");
    int Oid = Integer.valueOf(str).intValue();
    String str1=request.getParameter("Cid");
    int Cid = Integer.valueOf(str1).intValue();
    String str2=request.getParameter("Mnum");
    int Mnum = Integer.valueOf(str2).intValue();
    String str3=request.getParameter("Cname");
    String Cname=String.valueOf(str3);
%>
<sql:setDataSource var="snapshot" driver="com.mysql.cj.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/test?serverTimezone=GMT&allowPublicKeyRetrieval=true&characterEncoding=utf-8&useSSL=false"
                   user="root"  password="software"/>

<sql:query dataSource="${snapshot}" var="result">
    SELECT *FROM test.order_content where Oid=<%=Oid%>;
</sql:query>

    <div class="wrap">
        <div class="page-title">
            <span class="modular fl"><i class="order"></i><em><%=Cname%></em></span>
            <span class="modular fr"><a href="order_list.jsp" class="pt-link-btn">Order List</a></span>
        </div>
        <dl class="orderDetail">
            <dt class="order-h">Order Detail</dt>
            <dd>
                <ul>
                    <li>
                        <span class="h-cont h-right">Order ID：</span>
                        <span class="h-cont h-left"><%=Oid%></span>
                    </li>
                    <li>
                        <span class="h-cont h-right">Amount：</span>
                        <span class="h-cont h-left"><%=Mnum%></span>
                    </li>
                </ul>
            </dd>

            <dd>
                <table class="list-style">
                    <tr>
                        <th>Product Name</th>
                        <th>Price</th>
                        <th>Discount Price</th>
                        <th>Quantity</th>
                        <th>Total</th>
                    </tr>
                    <c:forEach var="row" items="${result.rows}">
                        <tr>
                            <td class="center">${row.Pname}</td>
                            <td class="center">${row.Pprice}</td>
                            <td class="center">${row.Pprice_v}</td>
                            <td class="center">${row.Pnum}</td>
                            <td class="center">
                                <c:out value="${row.Pprice*row.Pnum}" />
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </dd>
            <dd>
                <table class="noborder">
                    <tr>
                        <td>
                            <div class="BatchOperation" align="right">
                                <input type="button" value="Print" class="btnStyle" />
                                <input type="button" value="Done" class="btnStyle" />
                                <input type="button" value="Cancel" class="btnStyle" />
                            </div>
                        </td>
                    </tr>
                </table>
            </dd>
            <dd>
            </dd>
        </dl>
    </div>
</body>

</html>