<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <title>Product List</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="style/adminStyle.css" rel="stylesheet" type="text/css" />
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
            <span class="modular fl"><i class="add"></i><em>Add Product</em></span>
            <span class="modular fr"><a href="product_list.jsp" class="pt-link-btn">Product List</a></span>
        </div>
        <form action="/Admin/ServletAddProduct" method="post" enctype="multipart/form-data">
            <table class="list-style">
                <tr>
                    <td style="text-align:right;width:15%;">Product Name <font color="red">*</font>：</td>
                    <td><input type="text" class="textBox length-long" name="Pname"/></td>
                </tr>
                <tr>
                    <td style="text-align:right;">Category <font color="red">*</font>：</td>
                    <td>
                        <select  class="textBox length-long" name="PTid" >
                            <c:forEach var="row" items="${result.rows}">
                                <option value="${row.Tid}">${row.Tname}</option>
                            </c:forEach>
                        </select>
                    </td>

                </tr>
                <tr>
                    <td style="text-align:right;">Price <font color="red">*</font>：</td>
                    <td>
                        <input type="text" class="textBox length-short" name="Pprice"/>
                        <span>yuan</span>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right;">Discount Price <font color="red">*</font>：</td>
                    <td>
                        <input type="text" class="textBox length-short" name="Pprice_v"/>
                        <span>yuan</span>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right;">Stock Number <font color="red">*</font>：</td>
                    <td>
                        <input type="text" class="textBox length-short" name="Pnum"/>
                    </td>
                </tr>

                <tr>
                    <td style="text-align:right;">Picture：</td>
                    <td>
                            <input type="file" id="suoluetu"  name="uploadFile" />
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right;">Description：</td>
                    <td><textarea class="textarea" name="Pdescription_word"></textarea></td>
                </tr>
                <tr>
                    <td style="text-align:right;"></td>
                    <td><input type="submit" value="New Product" class="tdBtn" /></td>
                </tr>
            </table>
        </form>
    </div>
</body>

</html>