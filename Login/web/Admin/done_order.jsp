<%--
  Created by IntelliJ IDEA.
  User: magic
  Date: 7/25/2018
  Time: 10:30 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<html>
<head>
    <title>Done Order</title>
</head>
<body>
<%
    String getdel=request.getParameter("delid");
    String number=getdel.substring(0,getdel.length()-1);
    System.out.println(number);
    String d="Done";
    String sql="UPDATE test.order set Ofinish= '"+ d+"' where Oid in ("+number+")";

%>


<sql:setDataSource var="snapshot" driver="com.mysql.cj.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/test?serverTimezone=GMT&allowPublicKeyRetrieval=true&characterEncoding=utf-8&useSSL=false"
                   user="root" password="software"/>

    <sql:update dataSource="${snapshot}" var="count">
        <%=sql%>
    </sql:update>
    <jsp:forward page="order_list.jsp"/>
</body>
</html>
