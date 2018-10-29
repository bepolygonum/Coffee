package com;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;

@WebServlet(name = "/ServletSignupCustomer")
public class ServletSignupCustomer extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        MysqlConn mysqlConn=new MysqlConn(response,"/Customer/signup.jsp");

        String Cname = request.getParameter("Cname");
        String Cpassword = request.getParameter("Cpassword");
        String Cemail = request.getParameter("Cemail");
        try {
            String sql = "SELECT Cname\r\n" +
                    "FROM customer\r\n" +
                    "WHERE Cname='" + Cname + "'";
            System.out.print(sql);
            ResultSet rs = mysqlConn.st.executeQuery(sql);
            if (rs.next()) {
                response.getWriter().print("<script> alert(\"ERROR: Duplicate username!\");" +
                        "window.location.href='/Customer/signup.jsp';</script>");
                return;
            }
            String sql1 = "insert into customer\r\n" +
                    "(Cname,Cpassword,Cemail,Clevel)"+"values ("+"\'"+Cname+"\'"+","+"\'"+Cpassword+"\'"+
                    ","+"\'"+Cemail+"\'"+","+1+")";

            System.out.print(sql1);
            mysqlConn.st.executeUpdate(sql1);
            request.getRequestDispatcher("/Customer/login.jsp").forward(request,response);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}