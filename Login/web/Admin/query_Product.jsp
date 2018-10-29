<%--
  Created by IntelliJ IDEA.
  User: magic
  Date: 7/19/2018
  Time: 3:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <title>Product List</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="style/adminStyle.css" rel="stylesheet" type="text/css"/>
    <script src="js/jquery.js"></script>
    <script src="js/public.js"></script>
    <script>
        function checkAll() {
            var all = document.getElementById('del'); //获取到点击全选的那个复选框的id
            var one = document.getElementsByName('check'); //获取到复选框的名称
            if (all.checked == true) { //因为获得的是数组，所以要循环 为每一个checked赋值
                for (var i = 0; i < one.length; i++) {
                    one[i].checked = true;
                }

            } else {
                for (var j = 0; j < one.length; j++) {
                    one[j].checked = false;
                }
            }
        }

        function checkdel() {

            var obj = document.getElementsByName("check");
            var check_val = "";
            var flag=false;
            for(var i = 0; i < obj.length; i++){
                if(obj[i].checked){
                    flag=true;
                    check_val+=obj[i].value+",";
                }
            }
            if (!flag) {
                alert("Please Choose Records To Delete ！");
                return false;
            } else {
                if (confirm("Are you Sure To Delete？")) {
                    window.location.href = "delete.jsp?table=productbatch&delid=" + check_val;
                }
            }
        }

        function confirmdel(numstring) {
            if (confirm("Are you Sure To Delete？")) {
                window.location.href = "delete.jsp?table=product&id=" + numstring;
            }
        }

    </script>
</head>

<body>
<sql:setDataSource var="snapshot" driver="com.mysql.cj.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/test?serverTimezone=GMT&allowPublicKeyRetrieval=true&characterEncoding=utf-8&useSSL=false"
                   user="root" password="software"/>

<div class="wrap">
    <div class="page-title">
        <span class="modular fl"><i></i><em>Product List</em></span>
        <span class="modular fr"><a href="add_product.jsp" class="pt-link-btn">Add Product</a></span>
    </div>
    <div class="operate">
        <form action="/Admin/ServletQueryProduct?web=query_Product" method="post">
            <img src="images/icon_search.gif" />
            <input type="text" class="textBox length-long" name="input" placeholder="Enter Product ID/Name/Category(Start With *)..."/>
            <input type="submit" value="Search" class="tdBtn"/>
        </form>
    </div>
    <table class="list-style Interlaced">
        <tr>
            <th>Product ID</th>
            <th>Name</th>
            <th>Category</th>
            <th>Picture</th>
            <th>Description</th>
            <th>Price</th>
            <th>Discount</th>
            <th>Stock</th>
            <th>Operation</th>
        </tr>
        <c:forEach var="row" items="${key_list}">
            <tr>
                <td class="center">
                        <span>
                            <input type="checkbox" class="middle children-checkbox" name="check" value="${row.Pid}"/>
                            ${row.Pid}
                        </span>
                </td>
                <td class="center">${row.Pname}</td>
                <td class="center">${row.PTname}</td>
                <td class="center"><img width="60px" height="60px"  src="../${row.Pdescription_img}"></td>
                <td class="center">${row.Pdescription_word}</td>
                <td class="center">${row.Pprice}</td>
                <td class="center">${row.Pprice_v}</td>
                <td class="center">${row.Pnum}</td>
                <td class="center">
                    <a href="edit_product.jsp?Pid=${row.Pid}&choose=0" class="inline-block" title="Edit"><img
                            src="images/icon_edit.gif"/></a>
                    <a onclick="confirmdel(${row.Pid})" class="inline-block" title="Delete"><img
                            src="images/icon_drop.gif"/></a>
                </td>
            </tr>
        </c:forEach>

    </table>
    <!-- BatchOperation -->
    <div style="overflow:hidden;">
        <!-- Operation -->
        <div class="BatchOperation fl">
            <input type="checkbox" id="del" onclick="checkAll()"/>
            <label for="del" class="btnStyle middle">Select All</label>
            <input type="button" value="Delete Selected" class="btnStyle" onclick="checkdel()"/>
        </div>
    </div>
</div>

</body>

</html>
