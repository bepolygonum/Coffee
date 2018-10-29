package com;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(name = "/ServletRevisePwd")
public class ServletRevisePwd extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MysqlConn mysqlConn=new MysqlConn(response,"/Admin/revise_password.jsp");
        String password = request.getParameter("password");
        String new_password = request.getParameter("new_password");
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        if(new_password.isEmpty())  new_password=password;
        try {
            String _sql="select Apassword from test.admin where Aname='"+name+"'";
            ResultSet rs = mysqlConn.st.executeQuery(_sql);
            if (rs.next()&&password.equals(rs.getString("Apassword"))) {
                System.out.print("Success");
            }
            else {
                System.out.print("error");
                response.getWriter().print("<script> alert(\"ERROR: Incorrect username or password!\");" +
                        "window.location.href='/Admin/staff_list.jsp';</script>");
                return;
            }
            String sql = "update test.admin \r\n" +
                    "set Apassword ='" + new_password +
                    "',Agender ='" + gender +
                    "',Aemail ='" + email +
                    "'where Aname='"+name+"'";
            System.out.print(sql);
            PreparedStatement pstmt;
            pstmt = (PreparedStatement) mysqlConn.conn.prepareStatement(sql);
            if (pstmt.executeUpdate()==1) {
                System.out.print("Success");
                response.getWriter().print("<script> window.location.href='/Admin/staff_list.jsp';</script>");
            }
            else {
                System.out.print("error");
                response.getWriter().print("<script> alert(\"ERROR: Incorrect update!\");" +
                        "window.location.href='/Admin/staff_list.jsp';</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
