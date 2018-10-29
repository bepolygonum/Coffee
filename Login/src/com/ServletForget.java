package com;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;

@WebServlet(name = "/ServletForget")
public class ServletForget extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        MysqlConn mysqlConn=new MysqlConn(response,"/Forget_password/forget.jsp");
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        try {
            String sql = "SELECT Cemail,Cname \r\n" +
                    "FROM customer\r\n" +
                    "WHERE Cemail ='" + email + "'&&Cname ="+"'"+name+"'";
            System.out.print(sql);
            ResultSet rs = mysqlConn.st.executeQuery(sql);
            if (rs.next()) {
                System.out.print("Success");
                request.getRequestDispatcher("/Forget_Password/reset.jsp?first="+name).forward(request, response);
            }
            else {
                System.out.print("error");
                response.getWriter().print("<script> alert(\"ERROR: Incorrect username or email!\");" +
                        "window.location.href='/Forget_Password/forget.jsp';</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
