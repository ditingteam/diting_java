package com.database;

import com.password.Password;
import org.json.JSONArray;
import org.json.JSONObject;

import java.sql.*;

/**
 * Created by Administrator on 2017/6/20.
 */
public class LinkDatabase {
    public static Connection getConnection() {
        // 驱动程序名
        String driver = "com.mysql.jdbc.Driver";

        // URL指向要访问的数据库名scutcs
        String url = "jdbc:mysql://127.0.0.1:3306/diting?useUnicode=true&characterEncoding=UTF8";

        // MySQL配置时的用户名
        String user = "root";

        // MySQL配置时的密码
        // 配置在包com.password.Password类里面，自行建立
        String password = Password.password;

            // 加载驱动程序
        try{Class.forName(driver);

            // 连续数据库
        Connection conn = DriverManager.getConnection(url, user, password);
        return conn;}
        catch (Exception e){e.printStackTrace();}

        return null;
    }
}
