package com;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "/ServletReset")
public class ServletReset extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        MysqlConn mysqlConn = new MysqlConn(response, "/Forget_password/reset.jsp");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        try {
            String sql = "update customer \r\n" +

                    "set Cpassword ='" + password + "' where Cname='" + name + "'";
            System.out.print(sql);
            PreparedStatement pstmt;
            pstmt = (PreparedStatement) mysqlConn.conn.prepareStatement(sql);
            if (pstmt.executeUpdate() == 1) {
                System.out.print("Success");
                request.getRequestDispatcher("/Customer/login.jsp").forward(request, response);
            } else {
                System.out.print("error");
                response.getWriter().print("<script> alert(\"ERROR: Incorrect new password!\");" +
                        "window.location.href='/Forget_Password/forget.jsp';</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
