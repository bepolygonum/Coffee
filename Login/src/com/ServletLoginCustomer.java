package com;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;

@WebServlet(name = "/ServletLoginCustomer")
public class ServletLoginCustomer extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        MysqlConn mysqlConn=new MysqlConn(response,"/Customer/index.jsp");
        String cname = request.getParameter("Cname");
        String cpassword = request.getParameter("Cpassword");
        try {
            String sql = "SELECT Cname,Cpassword\r\n" +
                    "FROM customer\r\n" +
                    "WHERE Cname='" + cname +
                    "'&& Cpassword='" + cpassword+"'";
            System.out.print(sql);
            ResultSet rs = mysqlConn.st.executeQuery(sql);
            if (rs.next()) {
                System.out.print("Success");
                request.getSession().setAttribute("username",cname);
                request.getRequestDispatcher("../index.jsp").forward(request, response);
            }
            else {
                System.out.print("error");
                response.getWriter().print("<script> alert(\"ERROR: Incorrect username or password!\");" +
                        "window.location.href='/Customer/login.jsp';</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}