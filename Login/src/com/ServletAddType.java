package com;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;

@WebServlet(name = "/ServletAddType")
public class ServletAddType extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        MysqlConn mysqlConn=new MysqlConn(response,"/Admin/add_category.jsp");
        String Ti = request.getParameter("Tid");
        int Tid= Integer.valueOf(Ti).intValue();
        String Tname = new String(request.getParameter("Tname").getBytes("ISO-8859-1"),"utf-8");
        String Tdescription = new String(request.getParameter("Tdescription").getBytes("ISO-8859-1"),"utf-8");
        try {
            String sql = "SELECT Tid\r\n" +
                    "FROM test.type\r\n" +
                    "WHERE Tid=" + Tid ;
            System.out.print(sql);
            ResultSet rs = mysqlConn.st.executeQuery(sql);
            if (rs.next()) {
                response.getWriter().print("<script> alert(\"ERROR: Duplicate username!\");" +
                        "window.location.href='/Admin/product_category.jsp';</script>");
                return;
            }
            String sql1 = "insert into type\r\n" +
                    "(Tid,Tname,Tdescription)"+"values ("+Tid+","+"\'"+Tname+"\'"+
                    ","+"\'"+Tdescription+"\')";

            System.out.print(sql1);
            mysqlConn.st.executeUpdate(sql1);
            request.getRequestDispatcher("/Admin/product_category.jsp").forward(request,response);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
