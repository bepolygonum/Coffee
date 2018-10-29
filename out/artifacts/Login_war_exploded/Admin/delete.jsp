<%--
  Created by IntelliJ IDEA.
  User: KEKE
  Date: 2018/7/11
  Time: 9:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<html>
<head>
</head>
<body>
<%
    String str1 = request.getParameter("id");
    int id=0;
    if(str1!=null){
        id = Integer.valueOf(str1).intValue();
    }
    String table = request.getParameter("table");
    String getdel=request.getParameter("delid");
    String number="";
    if(getdel!=null)
    number=getdel.substring(0,getdel.length()-1);
%>
<sql:setDataSource var="snapshot" driver="com.mysql.cj.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/test?serverTimezone=GMT&allowPublicKeyRetrieval=true&characterEncoding=utf-8&useSSL=false"
                   user="root" password="software"/>
<c:set var="table"><%=table%>
</c:set>
<c:choose>
    <c:when test="${table=='user'}">
        <sql:update dataSource="${snapshot}" var="count">
            DELETE FROM test.customer WHERE Cid = <%=id%>;
        </sql:update>
        <a href="user_list.jsp"></a>
    </c:when>
    <c:when test="${table=='userbatch'}">
        <sql:update dataSource="${snapshot}" var="count">
            DELETE FROM test.customer WHERE Cid in (<%=number%>);
        </sql:update>
        <a href="user_list.jsp"></a>
    </c:when>
    <c:when test="${table=='staff'}">
        <sql:update dataSource="${snapshot}" var="count">
            DELETE FROM test.admin WHERE Aid = <%=id%>;
        </sql:update>

        <jsp:forward page="staff_list.jsp"/>
    </c:when>
    <c:when test="${table=='staffbatch'}">
        <sql:update dataSource="${snapshot}" var="count">
            DELETE FROM test.admin WHERE Aid in (<%=number%>);
        </sql:update>

        <jsp:forward page="staff_list.jsp"/>
    </c:when>
    <c:when test="${table=='product'}">

        <sql:query dataSource="${snapshot}" var="result">
            SELECT * from product WHERE Pid = <%=id%>;
        </sql:query>
        <sql:update dataSource="${snapshot}" var="count">
            DELETE FROM product WHERE Pid = <%=id%>;
        </sql:update>

        <c:forEach var="row" items="${result.rows}">
            <sql:update dataSource="${snapshot}" var="count">
                INSERT INTO test.product_out VALUES (${row.Pid},${row.PTid},'${row.Pdescription_word}',
                '${row.Pdescription_img}','${row.Pname}',${row.Pprice},${row.Pprice_v},${row.Pnum},'${row.PTname}');
            </sql:update>
        </c:forEach>
        <jsp:forward page="product_list.jsp"/>
    </c:when>

    <c:when test="${table=='productbatch'}">

        <sql:query dataSource="${snapshot}" var="result">
            SELECT * from product WHERE Pid in (<%=number%>);
        </sql:query>
        <sql:update dataSource="${snapshot}" var="count">
            DELETE FROM product WHERE Pid in (<%=number%>);
        </sql:update>

        <c:forEach var="row" items="${result.rows}">
            <sql:update dataSource="${snapshot}" var="count">
                INSERT INTO test.product_out VALUES (${row.Pid},${row.PTid},'${row.Pdescription_word}',
                '${row.Pdescription_img}','${row.Pname}',${row.Pprice},${row.Pprice_v},${row.Pnum},'${row.PTname}');
            </sql:update>
        </c:forEach>
        <jsp:forward page="product_list.jsp"/>
    </c:when>

    <c:when test="${table=='product_out'}">
        <sql:update dataSource="${snapshot}" var="count">
            DELETE FROM test.product_out WHERE Pid = <%=id%>;
        </sql:update>
        <jsp:forward page="recycle_bin.jsp"/>
    </c:when>

    <c:when test="${table=='outbatch'}">
        <sql:update dataSource="${snapshot}" var="count">
            DELETE FROM test.product_out WHERE Pid in (<%=number%>);
        </sql:update>
        <jsp:forward page="recycle_bin.jsp"/>
    </c:when>
    <c:when test="${table=='order'}">
        <sql:update dataSource="${snapshot}" var="count">
            DELETE FROM test.order WHERE Oid = <%=id%>;
        </sql:update>
        <sql:update dataSource="${snapshot}" var="count">
            DELETE FROM test.order_content WHERE Oid = <%=id%>;
        </sql:update>
        <jsp:forward page="order_list.jsp"/>
    </c:when>
    <c:when test="${table=='orderbatch'}">
        <sql:update dataSource="${snapshot}" var="count">
            DELETE FROM test.order WHERE Oid in (<%=number%>);
        </sql:update>
        <sql:update dataSource="${snapshot}" var="count">
            DELETE FROM test.order_content WHERE Oid in (<%=number%>);
        </sql:update>
        <jsp:forward page="order_list.jsp"/>
    </c:when>
    <c:when test="${table=='type'}">
        <sql:update dataSource="${snapshot}" var="count">
            DELETE FROM test.type WHERE Tid = <%=id%>;
        </sql:update>
        <jsp:forward page="product_category.jsp"/>
    </c:when>
    <c:when test="${table=='typebatch'}">
        <sql:update dataSource="${snapshot}" var="count">
            DELETE FROM test.type WHERE Tid in (<%=number%>);
        </sql:update>
        <jsp:forward page="product_category.jsp"/>
    </c:when>

</c:choose>

</body>
</html>
