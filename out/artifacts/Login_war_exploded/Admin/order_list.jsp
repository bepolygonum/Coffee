<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <title>Order List</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="style/adminStyle.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery.js"></script>
    <script src="js/public.js"></script>
    <script>

        function checkAll() {
            var all = document.getElementById('all');
            var one = document.getElementsByName('check');
            if (all.checked == true) {
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
                    window.location.href = "delete.jsp?table=orderbatch&delid=" + check_val;
                }
            }
        }

        function confirmdel(numstring) {
            if (confirm("Are you Sure To Delete？")) {
                window.location.href = "delete.jsp?table=order&id=" + numstring;
            }
        }

        function doneorder() {
            var obj = document.getElementsByName("check");
            var check_val = "";
            var flag=false;
            for(var i = 0; i < obj.length; i++){
                if(obj[i].checked){
                    check_val+=obj[i].value+",";
                    flag=true;
                }
            }
            if(flag)
            window.location.href = "done_order.jsp?delid=" + check_val;
        }
    </script>
</head>

<body>
<sql:setDataSource var="snapshot" driver="com.mysql.cj.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/test?serverTimezone=GMT&allowPublicKeyRetrieval=true&characterEncoding=utf-8&useSSL=false"
                   user="root"  password="software"/>

<sql:query dataSource="${snapshot}" var="result">
    SELECT *FROM test.order;
</sql:query>

    <div class="wrap">
        <div class="page-title">
            <span class="modular fl"><i class="order"></i><em>Order List</em></span>
        </div>
        <div class="operate">
            <form action="/Admin/ServletQueryOrder?webjsp=order_list" method="post">
                <img src="images/icon_search.gif" />
                <input type="text" class="textBox length-long" name="queryInput" placeholder="Enter Order ID/User Name..." />
                <input type="submit" value="Search" class="tdBtn" />
            </form>
        </div>

            <table class="list-style Interlaced">
            <tr>
                <th>Order ID</th>
                <th>User Name</th>
                <th>Amount</th>
                <th>Total</th>
                <th>Discount Total</th>
                <th>Status</th>
                <th>Remark</th>
                <th>Operation</th>
            </tr>
                <c:forEach var="row" items="${result.rows}">
                    <tr>
                        <td class="center">
                        <span>
                            <input type="checkbox" class="middle children-checkbox" name="check" value="${row.Oid}"/>
                            ${row.Oid}
                        </span>
                        </td>
                        <td class="center">${row.Cname}</td>
                        <td class="center">${row.Mnum}</td>
                        <td class="center">${row.Oprice}</td>
                        <td class="center">${row.Odiscount}</td>
                        <td class="center">${row.Ofinish}</td>
                        <td class="center">${row.Oremark}</td>
                        <td class="center">
                            <a href="order_detail.jsp?Oid=${row.Oid}&Cid=${row.Cid}&Mnum=${row.Mnum}&Cname=${row.Cname}" class="inline-block" title="View"><img src="images/icon_view.gif" /></a>
                        <a onclick="confirmdel('${row.Oid}')"  class="inline-block" title="Delete"><img src="images/icon_trash.gif" /></a>
                    </td>
                </tr>
                </c:forEach>
        </table>

        <!-- BatchOperation -->
        <div style="overflow:hidden;">
            <!-- Operation -->
            <div class="BatchOperation fl">
                <input type="checkbox" id="all" name="all" onclick="checkAll()" />
                <label for="all" class="btnStyle middle">Select All</label>
                <input type="button" value="Print" class="btnStyle" />
                <input type="button" value="Done" class="btnStyle" onclick="doneorder()" />
                <input type="button" value="Delete" class="btnStyle" onclick="checkdel()"/>
            </div>
        </div>

    </div>
</body>

</html>