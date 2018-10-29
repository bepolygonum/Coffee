package com;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;

@WebServlet(name = "/ServletAddStaff")
public class ServletAddStaff extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        MysqlConn mysqlConn=new MysqlConn(response,"/Admin/staff_list.jsp");

        String aid = request.getParameter("Aid");
        String aname = request.getParameter("Aname");
        String agender = request.getParameter("Agender");
        String aemail = request.getParameter("Aemail");
        String apassword = request.getParameter("Apassword");
        try {
            String sql = "SELECT Aid\r\n" +
                    "FROM test.admin\r\n" +
                    "WHERE Aid='"+aname +"'";
            System.out.print(sql);
            ResultSet rs = mysqlConn.st.executeQuery(sql);
            if (rs.next()) {
                response.getWriter().print("<script> alert(\"ERROR: Duplicate username!\");" +
                        "window.location.href='/Admin/staff_list.jsp';</script>");
                return;
            }
            String sql1 = "insert into test.admin\r\n" +
                    "(Aid,Aname,Apassword,Agender,Aemail)"+"values ('"+aid+"','"+aname+"','"+apassword+"','"+agender+"','"+aemail+"')";

            System.out.print(sql1);
            mysqlConn.st.executeUpdate(sql1);
            request.getRequestDispatcher("/Admin/staff_list.jsp").forward(request,response);
        } catch (Exception e) {
            response.getWriter().print("<script> alert(\"ERROR: Insert error!\"); </script>");
            e.printStackTrace();
        }

    }
}
