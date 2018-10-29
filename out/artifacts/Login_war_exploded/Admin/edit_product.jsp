<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Edit Product</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="style/adminStyle.css" rel="stylesheet" type="text/css" />
    <%
        String str1=request.getParameter("Pid");
        int Pid = Integer.valueOf(str1).intValue();
        String str=request.getParameter("choose");
        int choose = Integer.valueOf(str).intValue();
    %>
</head>

<body>

<c:set var="choose"><%=choose%></c:set>
<sql:setDataSource var="snapshot" driver="com.mysql.cj.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/test?serverTimezone=GMT&allowPublicKeyRetrieval=true&characterEncoding=utf-8&useSSL=false"
                   user="root"  password="software"/>
<c:choose>
    <c:when test="${choose==0}">
        <sql:query dataSource="${snapshot}" var="result">
            SELECT *FROM test.product where Pid=<%=Pid%>
        </sql:query>
    </c:when>
    <c:otherwise>
        <sql:query dataSource="${snapshot}" var="result">
            SELECT *FROM test.product_out where Pid=<%=Pid%>
        </sql:query>
    </c:otherwise>
</c:choose>
<div class="wrap">
    <div class="page-title">
        <span class="modular fl"><i class="add"></i><em>Edit Product</em></span>
        <span class="modular fr"><a href="product_list.jsp" class="pt-link-btn">Product List</a></span>
    </div>
    <form action="/Admin/ServletEditProduct?choose=${choose}" method="post" enctype="multipart/form-data">
        <table class="list-style">
            <c:forEach var="row" items="${result.rows}">
            <tr>
                <td style="text-align:right;width:15%;">Product ID：</td>
                <td><input type="text" class="textBox length-long" name="Pid" value="<%=Pid%>" readonly/></td>
            </tr>
            <tr>
                <td style="text-align:right;width:15%;">Product Name：</td>
                <td><input type="text" class="textBox length-long" name="Pname" value="${row.Pname}"/></td>
            </tr>
            <tr>
                <td style="text-align:right;">Category ID：</td>
                <td><input type="text" class="textBox length-long" name="PTid" value="${row.PTid}"/></td>
                </td>
            </tr>
            <tr>
                <td style="text-align:right;">Price：</td>
                <td>
                    <input type="text" class="textBox length-short" name="Pprice" value="${row.Pprice}"/>
                    <span>yuan</span>
                </td>
            </tr>
            <tr>
                <td style="text-align:right;">Discount Price：</td>
                <td>
                    <input type="text" class="textBox length-short" name="Pprice_v" value="${row.Pprice_v}" />
                    <span>yuan</span>
                </td>
            </tr>
            <tr>
                <td style="text-align:right;">Stock Number：</td>
                <td>
                    <input type="text" class="textBox length-short" name="Pnum" value="${row.Pnum}"/>
                </td>
            </tr>

                <tr>
                    <td style="text-align:right;">Picture：</td>
                    <td>
                        <img src="../${row.Pdescription_img}" width="80px" height="80px"/>
                        <input type="file" id="suoluetu"  name="uploadFile" />
                    </td>
                </tr>

                <td style="text-align:right;">Description：</td>
                <td><textarea class="textarea" name="Pdescription_word" >${row.Pdescription_word}</textarea></td>
            </tr>
            <tr>
                <td style="text-align:right;"></td>
                <td><input type="submit" value="Confirm" class="tdBtn" /></td>
            </tr>
            </c:forEach>
        </table>
    </form>
</div>
</body>

</html>