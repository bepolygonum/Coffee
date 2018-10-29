<%--
  Created by IntelliJ IDEA.
  User: KEKE
  Date: 2018/7/26
  Time: 23:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
<head>
    <title>Search</title>
</head>
<body>
<%
    String search=request.getParameter("Search");
%>
<sql:setDataSource var="snapshot" driver="com.mysql.cj.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/test?serverTimezone=GMT&allowPublicKeyRetrieval=true&characterEncoding=utf-8&useSSL=false"
                   user="root"  password="software"/>

<sql:query dataSource="${snapshot}" var="resultCid" >
    SELECT * FROM test.product  where Pname='<%=search%>';
</sql:query>

<c:forEach var="row" items="${resultCid.rows}">
    <jsp:forward page="detail.jsp?pname=${row.Pname}"/>
</c:forEach>

</body>
</html>
