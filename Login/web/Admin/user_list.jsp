<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <title>User List</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="style/adminStyle.css" rel="stylesheet" type="text/css" />
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
                    window.location.href = "delete.jsp?table=userbatch&delid=" + check_val;
                }
            }
        }

        function confirmdel(numstring) {
            if (confirm("Are you Sure To Delete？")) {
                window.location.href = "delete.jsp?table=user&id=" + numstring;
            }
        }

    </script>
</head>

<body>
<sql:setDataSource var="snapshot" driver="com.mysql.cj.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/test?serverTimezone=GMT&allowPublicKeyRetrieval=true&characterEncoding=utf-8&useSSL=false"
                   user="root"  password="software"/>

<sql:query dataSource="${snapshot}" var="result">
    SELECT *FROM test.customer;
</sql:query>

    <div class="wrap">
        <div class="page-title">
            <span class="modular fl"><i class="user"></i><em>User List</em></span>
            <span class="modular fr"><a href="add_user.jsp" class="pt-link-btn">Add User</a></span>
        </div>
        <div class="operate">
            <form action="/Admin/ServletQueryCustomer?web=user_list"  method="post">
                <img src="images/icon_search.gif" />
                <input type="text" class="textBox length-long" name="text"placeholder="Enter User ID/Tel/Email..." />
                <input type="submit" value="Search" class="tdBtn" />
            </form>
        </div>
        <table class="list-style Interlaced">
            <tr>
                <th>User ID</th>
                <th>Photo</th>
                <th>Name</th>
                <th>Gender</th>
                <th>Level</th>
                <th>Email</th>
                <th>Telephone</th>
                <th>BirthDay</th>
                <th>Operation</th>
            </tr>
            <c:forEach var="row" items="${result.rows}">
            <tr>
                <td class="center">
                        <span>
                            <input type="checkbox" class="middle children-checkbox" name="check" value="${row.Cid}"/>
                            ${row.Cid}
                        </span>
                </td>
                <td class="center"><img width="60px" height="60px" src="../${row.Cprofile}"/></td>
                <td class="center">${row.Cname}</td>
                <td class="center">${row.Cgender}</td>
                <td class="center">${row.Clevel}</td>
                <td class="center">${row.Cemail}</td>
                <td class="center">${row.Ctel}</td>
                <td class="center">${row.Cbirth}</td>
                <td class="center">
                    <a href="edit_user.jsp?Cid=${row.Cid}" class="inline-block" title="Edit">
                        <img src="images/icon_edit.gif" />
                    </a>
                    <a onclick="confirmdel(${row.Cid})"  class="inline-block" title="Delete">
                        <img src="images/icon_trash.gif" />
                    </a>
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
                <input type="button" value="Delete Selected" class="btnStyle" onclick="checkdel()" />
            </div>
        </div>
    </div>
</body>

</html>