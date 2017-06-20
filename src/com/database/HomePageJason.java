package com.database;

import org.json.JSONArray;
import org.json.JSONObject;

import java.sql.*;

/**
 * Created by Administrator on 2017/6/20.
 */
public class HomePageJason {
    public static String getData() {
        // 驱动程序名
        String driver = "com.mysql.jdbc.Driver";

        // URL指向要访问的数据库名scutcs
        String url = "jdbc:mysql://127.0.0.1:3306/diting&useUnicode=true&characterEncoding=UTF8";

        // MySQL配置时的用户名
        String user = "root";

        // MySQL配置时的密码
        String password = "admin";

        try {
            // 加载驱动程序
            Class.forName(driver);

            // 连续数据库
            Connection conn = DriverManager.getConnection(url, user, password);

            if (!conn.isClosed())
                System.out.println("Succeeded connecting to the Database!");

            // statement用来执行SQL语句
            Statement statement = conn.createStatement();// 要执行的SQL语句

            JSONObject json = new JSONObject();//第一个
            String sql = "select * from hotlist";
            ResultSet rs = statement.executeQuery(sql);
            JDBCTest gx = new JDBCTest();
            JSONArray hotlist = gx.resultSetToJson(rs);
            json.put("热剧榜单", hotlist);
            String sql1 = "select * from super_drama";
            ResultSet rs1 = statement.executeQuery(sql1);
            JDBCTest gx1 = new JDBCTest();
            JSONArray super_drama = gx1.resultSetToJson(rs1);
            json.put("超级网剧", super_drama);
            String sql2 = "select * from exclusiveplanning";
            ResultSet rs2 = statement.executeQuery(sql2);
            JDBCTest gx2 = new JDBCTest();
            JSONArray exclusiveplanning = gx2.resultSetToJson(rs2);
            json.put("独家策划", exclusiveplanning);
            String sql3 = "select * from peakviewingtime";// 结果集
            ResultSet rs3 = statement.executeQuery(sql3);
            JDBCTest gx3 = new JDBCTest();
            JSONArray peakviewingtime = gx3.resultSetToJson(rs3);
            json.put("黄金档", peakviewingtime);
            String sql4 = "select * from exclusive_video_website";// 结果集
            ResultSet rs4 = statement.executeQuery(sql4);
            JDBCTest gx4 = new JDBCTest();
            JSONArray exclusive_video_website = gx4.resultSetToJson(rs4);
            json.put("独家视频官网", exclusive_video_website);
            String sql5 = "select * from new_drama_trailer";// 结果集
            ResultSet rs5 = statement.executeQuery(sql5);
            JDBCTest gx5 = new JDBCTest();
            JSONArray new_drama_trailer = gx5.resultSetToJson(rs5);
            json.put("新剧预告", new_drama_trailer);
            rs.close();
            rs1.close();
            rs2.close();
            rs3.close();
            rs4.close();
            rs5.close();
            conn.close();
            return json.toString();

        } catch (ClassNotFoundException e) {


            System.out.println("Sorry,can`t find the Driver!");
            e.printStackTrace();


        } catch (SQLException e) {


            e.printStackTrace();


        } catch (Exception e) {


            e.printStackTrace();
        }
        return null;
    }
}
