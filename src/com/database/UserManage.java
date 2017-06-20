package com.database;

import org.json.JSONArray;
import org.json.JSONObject;
import sun.awt.image.ImageWatched;

import java.awt.*;
import java.sql.*;

/**
 * Created by Administrator on 2017/6/20.
 */
public class UserManage {
    public static String sign(String username,String password) {
        try {
            Connection connection = LinkDatabase.getConnection();
            Statement statement = connection.createStatement();
            String sql="select * from users where users.username='"+username+"'";
            ResultSet rs = statement.executeQuery(sql);
            if(rs.next()) {
               return "this username already exist";
            }
            else{
                String sql1="insert into users(username,password_hash) values ('"+username+"','"+password+"')";
                statement.execute(sql1);
                System.out.println("已经添加成功");
            }
        }
        catch(Exception e){e.printStackTrace();}
        return null;
    }
    public static String login(String username,String password){
        try{
            Connection connection = LinkDatabase.getConnection();
            Statement statement = connection.createStatement();
            String sql="select * from users where users.username='"+username+"' and users.password_hash='"+password+"'";
            ResultSet rs=statement.executeQuery(sql);
            if(rs.next()){
                return "ture";
            }
            else{
                return "你输入错误";
            }
        }
        catch (Exception e){e.printStackTrace();}
        return null;
    }
    public static String modifypassword(String username,String password) {
        try {
            Connection connection = LinkDatabase.getConnection();
            Statement statement = connection.createStatement();
            String sql="update users set password_hash='"+password+"' where username='"+username+"'";
            ResultSet rs=statement.executeQuery(sql);

        }
        catch (Exception e){e.printStackTrace();}
        return null;
    }
    public static String modifyInformation(String username, Boolean Sex, TextArea p_sign, String birth,String tel,String email,String address,String introduce) {
        try {
            Connection connection = LinkDatabase.getConnection();
            Statement statement = connection.createStatement();
            String sql="update users set Sex='"+Sex+"',p_sign='"+p_sign+"',birth='"+birth+"',tel='"+tel+"',email='"+email+"',address='"+address+"',introduce='"+introduce+"' where username='"+username+"'";
            ResultSet rs=statement.executeQuery(sql);

        }
        catch (Exception e){e.printStackTrace();}
        return null;
    }
}
