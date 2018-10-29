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

@WebServlet(name = "/ServletQueryOrder")
public class ServletQueryOrder extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Map> list = new ArrayList<Map>();
        String query = request.getParameter("queryInput");
        String jspurl = request.getParameter("webjsp");
        MysqlConn mysqlConn;
        if (jspurl.equals("order_list")) {
            mysqlConn = new MysqlConn(response, "/Admin/order_list.jsp");
        } else {
            mysqlConn = new MysqlConn(response, "/Admin/query_Order.jsp");
        }

        try {
            String sql = null;
            if (query.matches("^[0-9]+$")) {
                sql = "select * from test.order where Oid=" + query;
                System.out.println(sql);
            } else if (query.matches("^[a-zA-Z\u4e00-\u9fa5]+$")) {
                sql = "select * from test.order where Cname='" + query + "'";
                System.out.println(sql);
            }

            ResultSet rs = mysqlConn.st.executeQuery(sql);

            if (!rs.next()) {
                System.out.print("Null");
                response.getWriter().print("<script> alert(\"RESULT: NO RESULT!\");" +
                        "window.location.href='/Admin/order_list.jsp';</script>");
            } else {
                System.out.println(sql);
                do {
                    System.out.print("Success hello");
                    int cid = rs.getInt("Cid");
                    int id = rs.getInt("Oid");
                    String name = rs.getString("Cname");
                    int num = rs.getInt("Mnum");
                    double price = rs.getDouble("Oprice");
                    double discount = rs.getDouble("Odiscount");
                    String state = rs.getString("Ofinish");
                    String remark = rs.getString("Oremark");

                    Map map = new HashMap();
                    map.put("Oid", id);
                    map.put("Cid", cid);
                    map.put("Cname", name);
                    map.put("Mnum", num);
                    map.put("Oprice", price);
                    map.put("Odiscount", discount);
                    map.put("Ofinish", state);
                    map.put("Oremark", remark);
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
        request.getRequestDispatcher("/Admin/query_Order.jsp").forward(request, response);
    }
}
