package com;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "/ServletQueryCustomer")
public class ServletQueryCustomer extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Map> list = new ArrayList<Map>();
        String query = request.getParameter("text");
        String jspurl = request.getParameter("web");
        MysqlConn mysqlConn;
        if (jspurl.equals("user_list")) {
            mysqlConn = new MysqlConn(response, "/Admin/user_list.jsp");
        } else {
            mysqlConn = new MysqlConn(response, "/Admin/query_User.jsp");
        }

        try {
            String sql = null;
            if (query.matches("^[0-9]+$")) {
                sql = "select * from test.customer where Cid=" + query;
                System.out.println(sql);
            } else if (query.matches("^[a-zA-Z\u4e00-\u9fa5]+$")) {
                sql = "select * from test.customer where Cname='" + query + "'";
                System.out.println(sql);
            }else if (query.matches("^[A-Za-z\\d]+([-_.][A-Za-z\\d]+)*@([A-Za-z\\d]+[-.])+[A-Za-z\\d]{2,4}$")) {
                sql = "select * from test.customer where Cname='" + query + "'";
                System.out.println(sql);
            }


            ResultSet rs = mysqlConn.st.executeQuery(sql);

            if (!rs.next()) {
                System.out.print("Null");
                response.getWriter().print("<script> alert(\"RESULT: NO RESULT!\");" +
                        "window.location.href='/Admin/query_User.jsp';</script>");
            } else {
                System.out.println(sql);
                do {
                    System.out.print("Success hello");
                    int cid = rs.getInt("Cid");
                    String name = rs.getString("Cname");
                    String tel = rs.getString("Ctel");
                    String email = rs.getString("Cemail");
                    String profile = rs.getString("Cprofile");
                    String gender = rs.getString("Cgender");
                    String  birth= rs.getString("Cbirth");
                    int level = rs.getInt("Clevel");

                    Map map = new HashMap();
                    map.put("Cid", cid);
                    map.put("Cname", name);
                    map.put("Ctel", tel);
                    map.put("Cemail", email);
                    map.put("Cprofile", profile);
                    map.put("Cgender", gender);
                    map.put("Cbirth", birth);
                    map.put("Clevel", level);

                    //用键值对存入到map集合中
                    System.out.println(map);
                    list.add(map);//在将map集合对象存入list集合
                    System.out.println("放入集合");
                    for (Map map_1 : list) {
                        System.out.println(map_1);
                    }//在打印台遍历出数据查看是否有错误
                    //request.getRequestDispatcher("/Admin/order_list.jsp").forward(request, response);
                } while (rs.next());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("key_list", list);//将list集合数据放入到request中共享
        request.getRequestDispatcher("/Admin/query_User.jsp").forward(request, response);
    }
}