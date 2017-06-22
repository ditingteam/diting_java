package com.database;

import org.json.JSONArray;
import org.json.JSONObject;

import javax.lang.model.util.SimpleElementVisitor6;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 * Created by Administrator on 2017/6/21.
 */
public class VideoManagement {
    public static String searchVideo(String video_name) {
        try {
            Connection connection = LinkDatabase.getConnection();
            Statement statement = connection.createStatement();
            JSONArray data = new JSONArray();
            String sql1 = "SELECT Uinfo,Uimage,Uname from video WHERE Uname LIKE '%" + video_name + "%' ";
            ResultSet rs = statement.executeQuery(sql1);
            while(rs.next()){
                JSONObject json = new JSONObject();
                json.put("info", rs.getString("Uinfo"));
                json.put("title", rs.getString("Uname"));
                json.put("img", rs.getString("Uimage")); //去LINK表查
                JSONArray link = new JSONArray();
                Statement statement1 = connection.createStatement();
                String sql2 = "SELECT id from video WHERE Uname='"+rs.getString("Uname")+"'";
                ResultSet rs1 = statement1.executeQuery(sql2);
                rs1.next();
                Statement statement2 = connection.createStatement();
                String sql3="SELECT link from video_link WHERE Vid='"+rs1.getString("id")+"' ORDER BY episode ASC";
                ResultSet rs2 = statement2.executeQuery((sql3));
                while(rs2.next()){
                    link.put(rs2.getString("link"));
                }
                json.put("link",link);
                data.put(json);
            }
            return  data.toString();
        } catch (Exception e) {
            e.printStackTrace();
        }
    return null;
    }
}
