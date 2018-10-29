package com;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;

@WebServlet(name = "/ServletEditUser")
public class ServletEditUser extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        MysqlConn mysqlConn=new MysqlConn(response,"/Admin/edit_user.jsp");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String id = request.getParameter("id");
        String tel = request.getParameter("tel");
        String email = request.getParameter("email");
        try {
            String sql = "update customer \r\n" +

                    "set Cpassword ='" + password + "',"+"Cname='"+ name +"',"+
                    "Ctel="+ tel +","+"Cemail='"+ email +"'"+
                    "where Cid="+id;
            System.out.print(sql);
            PreparedStatement pstmt;
            pstmt = (PreparedStatement) mysqlConn.conn.prepareStatement(sql);
            if (pstmt.executeUpdate()==1) {
                System.out.print("Success");
                request.getRequestDispatcher("/Admin/user_list.jsp").forward(request, response);
            }
            else {
                System.out.print("error");
                response.getWriter().print("<script> alert(\"ERROR: Incorrect insert!\");" +
                        "window.location.href='/Admin/user_list.jsp';</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
