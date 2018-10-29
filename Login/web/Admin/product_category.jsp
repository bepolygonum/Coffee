<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <title>Product Category</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="style/adminStyle.css" rel="stylesheet" type="text/css" />
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
                    window.location.href = "delete.jsp?table=typebatch&delid=" + check_val;
                }
            }
        }

        function confirmdel(numstring) {
            if (confirm("Are you Sure To Delete？")) {
                window.location.href = "delete.jsp?table=type&id=" + numstring;
            }
        }
    </script>
</head>

<body>

<sql:setDataSource var="snapshot" driver="com.mysql.cj.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/test?serverTimezone=GMT&allowPublicKeyRetrieval=true&characterEncoding=utf-8&useSSL=false"
                   user="root"  password="software"/>

<sql:query dataSource="${snapshot}" var="result">
    SELECT *FROM test.type;
</sql:query>


    <div class="wrap">
        <div class="page-title">
            <span class="modular fl"><i></i><em>Product Category</em></span>
            <span class="modular fr"><a href="add_category.jsp" class="pt-link-btn">Add Category</a></span>
        </div>

        <table class="list-style">
            <tr>
                <th>Category ID</th>
                <th>Category Name</th>
                <th>Operation</th>
            </tr>
            <c:forEach var="row" items="${result.rows}">
                <tr>
                    <td>
                        <input type="checkbox" name="check" value="${row.Tid}"/>
                        <span>${row.Tid}</span>
                    </td>
                    <td class="center">${row.Tname}</td>
                    <td class="center">
                        <a href="edit_category.jsp?Pid=${row.Tid}" class="inline-block" title="Edit"><img
                                src="images/icon_edit.gif"/></a>
                        <a onclick="confirmdel(${row.Tid})"  class="inline-block" title="Delete"><img
                                src="images/icon_drop.gif"/></a>
                    </td>
                </tr>
            </c:forEach>

        </table>

        <!-- BatchOperation -->
        <div style="overflow:hidden;">
            <!-- Operation -->
            <div class="BatchOperation fl">
                <input type="checkbox" id="del" onclick="checkAll()" />
                <label for="del" class="btnStyle middle">Select All</label>
                <input type="button" value="Delete Selected" class="btnStyle" onclick="checkdel()"/>
            </div>

        </div>
    </div>

</body>

</html>