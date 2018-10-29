<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <title>Edit Category</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="style/adminStyle.css" rel="stylesheet" type="text/css" />
</head>

<body>
    <div class="wrap">
        <div class="page-title">
            <span class="modular fl"><i></i><em>Edit Category</em></span>
            <span class="modular fr"><a href="product_category.jsp" class="pt-link-btn">Product List</a></span>
        </div>

        <form action="/Admin/ServletAddType" method="post">
            <table class="list-style">
                <tr>
                    <td style="text-align:right;">Category ID：</td>
                    <td>
                        <input type="text" class="textBox length-short" name="Tid" />
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right;">Category Name：</td>
                    <td>
                        <input type="text" class="textBox" name="Tname"/>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right;">Description：</td>
                    <td>
                        <textarea type="text" class="textarea" name="Tdescription"></textarea>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right;"></td>
                    <td><input type="submit" value="Confirm" class="tdBtn" /></td>
                </tr>
            </table>
        </form>
    </div>
</body>

</html>