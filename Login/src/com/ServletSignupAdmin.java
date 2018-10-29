package com;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;

@WebServlet(name = "/ServletSignupAdmin")
public class ServletSignupAdmin extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        MysqlConn mysqlConn=new MysqlConn(response,"/Admin/signup.jsp");

        String aname = request.getParameter("Aname");
        String apassword = request.getParameter("Apassword");
        try {
            String sql = "SELECT Aname\r\n" +
                    "FROM test.admin\r\n" +
                    "WHERE Aname='"+aname +"'";
            System.out.print(sql);
            ResultSet rs = mysqlConn.st.executeQuery(sql);
            if (rs.next()) {
                response.getWriter().print("<script> alert(\"ERROR: Duplicate username!\");" +
                        "window.location.href='/Admin/signup.jsp';</script>");
                return;
            }
            String sql1 = "insert into test.admin\r\n" +
                    "(Aname,Apassword)"+"values ('"+aname+"','"+apassword+"')";

            System.out.print(sql1);
            mysqlConn.st.executeUpdate(sql1);
            request.getRequestDispatcher("/Admin/login.jsp").forward(request,response);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}