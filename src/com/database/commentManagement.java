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
public class commentManagement {
    public static String getComment(String video_link){
        try{
        Connection connection = LinkDatabase.getConnection();
        Statement statement = connection.createStatement();
        String sql = "SELECT * from video_link  WHERE link='"+video_link+"'";
        ResultSet rs = statement.executeQuery(sql);
        rs.next();
        Statement statement1 = connection.createStatement();
        String sql1 = "SELECT * from comment WHERE Uid='"+rs.getString("id")+"'";
        ResultSet rs1 = statement1.executeQuery(sql1);
        JSONArray data = new JSONArray();
        while(rs1.next()){
            JSONObject json = new JSONObject();
            json.put("comment", rs1.getString("comment_text"));
            Statement statement0 = connection.createStatement();
            String sql0 = "select username from users where id='"+rs.getString("Vid")+"'";
            ResultSet rs0 = statement0.executeQuery(sql0);
            rs0.next();
            json.put("username",rs0.getString("username"));
            json.put("date",rs1.getString("Hdate"));
            data.put(json);
        }
        return data.toString();
        }
        catch (Exception e) {e.printStackTrace();}
    return null;
    }
    public static String addComment(String video_link,String username,String comment){
        try{
            java.util.Date date = new Date();
            SimpleDateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//24小时制
            String Hdate = sdformat.format(date);
            Connection connection = LinkDatabase.getConnection();
            Statement statement = connection.createStatement();
            String sql = "SELECT id from video_link  WHERE link='"+video_link+"'";
            ResultSet rs = statement.executeQuery(sql);
            rs.next();
            Statement statement0 = connection.createStatement();
            String sql0 = "SELECT id from users  WHERE username='"+username+"'";
            ResultSet rs0 = statement0.executeQuery(sql0);
            Statement statement1 = connection.createStatement();
            rs0.next();
            String sql1 = "insert into comment(Uno,Uid,comment_text,Hdate) values ('"+rs0.getString("id")+"','"+rs.getString("id")+"','"+comment+"','"+
                    Hdate+"')";
            statement1.execute(sql1);
            System.out.println("success for comment!");
        }
        catch (Exception e) {e.printStackTrace();}
        return null;
    }
    public static String deleteComment(String username,String video_link,String date){
        try{
            Connection connection = LinkDatabase.getConnection();
            Statement statement = connection.createStatement();
            String sql = "SELECT id from video_link  WHERE link='"+video_link+"'";
            ResultSet rs = statement.executeQuery(sql);
            rs.next();
            Statement statement0 = connection.createStatement();
            String sql0 = "SELECT id from users  WHERE username='"+username+"'";
            ResultSet rs0 = statement0.executeQuery(sql);
            rs0.next();

            Statement statement1 = connection.createStatement();
            String sql1 = "DELETE FROM comment WHERE Uno='"+rs0.getString("id")+"' and Hdate='"+date+"'and Uid='"+rs.getString("id")+"'";
            statement1.execute(sql1);
            System.out.println("success for delete!");
        }
        catch (Exception e) {e.printStackTrace();}
        return null;
    }

}
