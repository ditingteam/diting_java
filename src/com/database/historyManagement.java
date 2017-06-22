package com.database;

import org.json.JSONArray;
import org.json.JSONObject;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Administrator on 2017/6/21.
 */
public class historyManagement {
    public static JSONArray getUserHistory(String username){
        try{
            Connection connection = LinkDatabase.getConnection();
            Statement statement = connection.createStatement();
            String sql = "SELECT id from  users WHERE username='"+username+"'";
            ResultSet rs = statement.executeQuery(sql);
            rs.next();
            Statement statement1 = connection.createStatement();
            String sql1 = "SELECT * from history WHERE Uno='"+rs.getString("id")+"'";
            ResultSet rs1=statement1.executeQuery(sql1);
            JSONArray data = new JSONArray();
            while(rs1.next()){
                JSONObject json = new JSONObject();
                Statement statement2 = connection.createStatement();
                String sql2 = "SELECT * from video_link WHERE Vid='"+rs1.getString("Uid")+"'";
                ResultSet rs2=statement2.executeQuery(sql2);
                rs2.next();
                Statement statement3 = connection.createStatement();
                String sql3 = "SELECT Uname from video WHERE id='"+rs1.getString("Uid")+"'";
                ResultSet rs3=statement3.executeQuery(sql3);
                rs3.next();
                json.put("episode",rs2.getString("episode"));
                json.put("video_name",rs3.getString("Uname"));
                json.put("link",rs2.getString("link"));
                data.put(json);
            }
            return data;

        }
        catch (Exception e) {e.printStackTrace();}
        return null;
    }
    public static void addHistory(String username,String video_link){
        try{
            java.util.Date date = new Date();
            SimpleDateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//24小时制
            String Hdate = sdformat.format(date);
            Connection connection = LinkDatabase.getConnection();
            Statement statement = connection.createStatement();
            String sql = "SELECT id from users  WHERE username='"+username+"'";
            ResultSet rs = statement.executeQuery(sql);
            rs.next();
            Statement statement1 = connection.createStatement();
            String sql1 = "SELECT Vid from video_link  WHERE link='"+video_link+"'";
            ResultSet rs1 = statement1.executeQuery(sql1);
            rs1.next();
            Statement statement2 = connection.createStatement();
            String sql2 = "insert into history(Uid,Uno,Hdate) values ('"+rs1.getString("Vid")+"','"+rs.getString("id")+"','"+
                    Hdate+"')";
            statement2.execute(sql2);
        }
        catch (Exception e) {e.printStackTrace();}
    }


}
