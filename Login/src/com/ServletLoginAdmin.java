package com;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;

@WebServlet(name = "/ServletLoginAdmin")
public class ServletLoginAdmin extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        MysqlConn mysqlConn=new MysqlConn(response,"/Admin/login.jsp");
        String aname = request.getParameter("Aname");
        String apassword = request.getParameter("Apassword");
        try {
            String sql = "SELECT Aname,Apassword\r\n" +
                    "FROM test.admin\r\n" +
                    "WHERE Aname='" + aname +
                    "'&& Apassword='" + apassword+"'";
            System.out.print(sql);
            ResultSet rs = mysqlConn.st.executeQuery(sql);
            if (rs.next()) {
                System.out.print("Success");
                request.getRequestDispatcher("/Admin/index.html").forward(request, response);
            }
            else {
                System.out.print("error");
                response.getWriter().print("<script> alert(\"ERROR: Incorrect username or password!\");" +
                        "window.location.href='/Admin/login.jsp';</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}