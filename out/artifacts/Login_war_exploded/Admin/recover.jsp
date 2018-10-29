<%--
  Created by IntelliJ IDEA.
  User: magic
  Date: 7/25/2018
  Time: 2:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<html>
<head>
    <title>Recover</title>
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
    <c:when test="${table=='recover'}">
        <sql:query dataSource="${snapshot}" var="result">
            SELECT * from product_out WHERE Pid = <%=id%>;
        </sql:query>
        <sql:update dataSource="${snapshot}" var="count">
            DELETE FROM product_out WHERE Pid = <%=id%>;
        </sql:update>

        <c:forEach var="row" items="${result.rows}">
            <sql:update dataSource="${snapshot}" var="count">
                INSERT INTO test.product VALUES (${row.Pid},${row.PTid},'${row.Pdescription_word}',
                '${row.Pdescription_img}','${row.Pname}',${row.Pprice},${row.Pprice_v},${row.Pnum},'${row.PTname}');
            </sql:update>
        </c:forEach>
        <jsp:forward page="recycle_bin.jsp"/>
    </c:when>
    <c:when test="${table=='recoverbatch'}">
        <sql:query dataSource="${snapshot}" var="result">
            SELECT * from product_out WHERE Pid in (<%=number%>);
        </sql:query>
        <sql:update dataSource="${snapshot}" var="count">
            DELETE FROM product_out WHERE Pid in (<%=number%>);
        </sql:update>

        <c:forEach var="row" items="${result.rows}">
            <sql:update dataSource="${snapshot}" var="count">
                INSERT INTO test.product VALUES (${row.Pid},${row.PTid},'${row.Pdescription_word}',
                '${row.Pdescription_img}','${row.Pname}',${row.Pprice},${row.Pprice_v},${row.Pnum},'${row.PTname}');
            </sql:update>
        </c:forEach>
        <jsp:forward page="recycle_bin.jsp"/>
    </c:when>
</c:choose>
</body>
</html>
