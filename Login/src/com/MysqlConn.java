package com;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class MysqlConn {
    public static final String jdbcDriver = "com.mysql.cj.jdbc.Driver";
    public Connection conn;
    public Statement st;
    public MysqlConn(HttpServletResponse response,String href) throws IOException {
        try {
            Class.forName(jdbcDriver);
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test?" +
                            "serverTimezone=GMT&allowPublicKeyRetrieval=true&characterEncoding=utf-8&useSSL=false",
                    "root","software");
            st = conn.createStatement();
        } catch (Exception e) {
            System.out.println("Connection error");
            response.getWriter().print("<script> alert(\"ERROR: Connection error!\");" +
                    "window.location.href='"+href+"';</script>");
            e.printStackTrace();
        }
    }
}

