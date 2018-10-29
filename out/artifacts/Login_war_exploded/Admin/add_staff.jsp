<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <title>Add Administrator</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="style/adminStyle.css" rel="stylesheet" type="text/css" />
</head>

<body>
    <div class="wrap">
        <div class="page-title">
            <span class="modular fl"><i class="add_user"></i><em>Add Administrator</em></span>
            <span class="modular fr"><a href="staff_list.jsp" class="pt-link-btn">Administrator List</a></span>
        </div>
        <form action="/Admin/ServletAddStaff" method="post">
            <table class="list-style">
                <tr>
                    <td style="width:15%;text-align:right;">Administrator ID：</td>
                    <td><input type="text" class="textBox length-middle" name="Aid" /></td>
                </tr>
                <tr>
                    <td style="width:15%;text-align:right;">Administrator Name：</td>
                    <td><input type="text" class="textBox length-middle" name="Aname"/></td>
                </tr>
                <tr>
                    <td style="width:15%;text-align:right;">Administrator Gender：</td>
                    <td><input type="text" class="textBox length-middle" name="Agender"/></td>
                </tr>
                <tr>
                    <td style="width:15%;text-align:right;">Administrator Email：</td>
                    <td><input type="text" class="textBox length-middle" name="Aemail"/></td>
                </tr>
                <tr>
                    <td style="text-align:right;">Password：</td>
                    <td><input type="password" class="textBox length-middle" name="Apassword" /></td>
                </tr>
                <tr>
                    <td style="text-align:right;">Repeat Password：</td>
                    <td><input type="password" class="textBox length-middle" /></td>
                </tr>
                <tr>
                    <td style="text-align:right;"></td>
                    <td><input type="submit" class="tdBtn" value="New Administrator" /></td>
                </tr>
            </table>
        </form>
    </div>
</body>

</html>