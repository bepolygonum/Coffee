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

@WebServlet(name = "/ServletQueryProduct")
public class ServletQueryProduct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Map> list = new ArrayList<Map>();
        String query = request.getParameter("input");
        String jspurl = request.getParameter("web");
        int a=0;
        MysqlConn mysqlConn;
        if (jspurl.equals("product_list")) {
            mysqlConn = new MysqlConn(response, "/Admin/product_list.jsp");
            a=1;
        } else if (jspurl.equals("recycle_bin")) {
            mysqlConn = new MysqlConn(response, "/Admin/recycle_bin.jsp");
            a=2;
        } else if (jspurl.equals("query_Product")) {
            mysqlConn = new MysqlConn(response, "/Admin/query_Product.jsp");
            a=1;
        } else {
            mysqlConn = new MysqlConn(response, "/Admin/query_Recycle.jsp");
            a=2;
        }

        try {
            String sql = null;
            if (a==1) {
                if (query.matches("^[0-9]+$")) {
                    sql = "select * from test.product where Pid=" + query;
                    System.out.println(sql);
                } else if (query.matches("^[a-zA-Z\u4e00-\u9fa5]+$")) {
                    sql = "select * from test.product where Pname='" + query + "'";
                    System.out.println(sql);
                } else if (query.matches("^\\*[a-zA-Z\\s-,]+$")) {
                    query=query.substring(1);
                    sql = "select * from test.product where PTname='" + query + "'";
                    System.out.println(sql);
                }
            } else if(a==2) {
                if (query.matches("^[0-9]+$")) {
                    sql = "select * from test.product_out where Pid=" + query;
                    System.out.println(sql);
                } else if (query.matches("^[a-zA-Z\u4e00-\u9fa5]+$")) {
                    sql = "select * from test.product_out where Pname='" + query + "'";
                    System.out.println(sql);
                } else if (query.matches("^\\*[a-zA-Z\u4e00-\u9fa5\\s-,]]+$")) {
                    query=query.substring(1);
                    sql = "select * from test.product_out where PTname='" + query + "'";
                    System.out.println(sql);
                }
            }

            ResultSet rs = mysqlConn.st.executeQuery(sql);
            if (rs.next()) {
                System.out.println(sql);
                do {
                    int pid = rs.getInt("Pid");
                    int ptid = rs.getInt("PTid");
                    String pdescription_word = rs.getString("Pdescription_word");
                    String pdescription_img = rs.getString("Pdescription_img");
                    String pname = rs.getString("Pname");
                    String ptname = rs.getString("PTname");
                    double price = rs.getDouble("Pprice");
                    double price_v = rs.getDouble("Pprice_v");
                    int pnum = rs.getInt("Pnum");

                    Map map = new HashMap();
                    map.put("Pid", pid);
                    map.put("PTid", ptid);
                    map.put("Pdescription_word", pdescription_word);
                    map.put("Pdescription_img", pdescription_img);
                    map.put("Pname", pname);
                    map.put("PTname", ptname);
                    map.put("Pprice", price);
                    map.put("Pprice_v", price_v);
                    map.put("Pnum", pnum);
                    //用键值对存入到map集合中

                    System.out.println(map);
                    list.add(map);//在将map集合对象存入list集合
                    System.out.println("放入集合");
                    for (Map map_1 : list) {
                        System.out.println(map_1);
                    }//在打印台遍历出数据查看是否有错误
                    //request.getRequestDispatcher("/Admin/order_list.jsp").forward(request, response);
                } while (rs.next());
            } else {
                System.out.print("Null");
                response.getWriter().print("<script> alert(\"RESULT: NO RESULT!\");" +
                        "window.location.href='/Admin/product_list.jsp';</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("key_list", list);//将list集合数据放入到request中共享
        if (a==1) {
            request.getRequestDispatcher("/Admin/query_Product.jsp").forward(request, response);
        } else if(a==2) {
            request.getRequestDispatcher("/Admin/query_Recycle.jsp").forward(request, response);
        }
    }
}
