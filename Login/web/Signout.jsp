<%--
  Created by IntelliJ IDEA.
  User: KEKE
  Date: 2018/7/26
  Time: 23:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<body>
<%
    session.setAttribute("username", "User");
%>
<jsp:forward page="index.jsp"/>
</body>
</html>
