package com.database;

import com.password.Password;
import org.json.JSONArray;
import org.json.JSONObject;
import sun.awt.image.ImageWatched;

import java.awt.*;
import java.sql.*;

/**
 * Created by Administrator on 2017/6/20.
 */
public class UserManage {
    public static Boolean register(String username,String password) {
        try {
            Connection connection = LinkDatabase.getConnection();
            Statement statement = connection.createStatement();
            String sql="select * from users where users.username='"+username+"'";
            ResultSet rs = statement.executeQuery(sql);
            if(rs.next()) {
               return false;
            }
            else{
                String passwordHash = PasswordHash.SHA256(password);
                String sql1="insert into users(username,password_hash) values ('"+username+"','"+passwordHash+"')";
                statement.execute(sql1);
                System.out.println("已经添加成功");
                return true;
            }
        }
        catch(Exception e){e.printStackTrace();}
        return null;
    }
    public static String login(String username,String password){
        try{
            Connection connection = LinkDatabase.getConnection();
            Statement statement = connection.createStatement();
            String passwordHash = PasswordHash.SHA256(password);
            String sql="select * from users where users.username='"+username+"' and users.password_hash='"+passwordHash+"'";
            ResultSet rs=statement.executeQuery(sql);
            if(rs.next()){
                System.out.println("login!");
                return username;
            }
            else{
                return null;
            }
        }
        catch (Exception e){e.printStackTrace();}
        return null;
    }
    public static Boolean changePassword(String username,String oldPassword, String newPassword) {
        try {
            Connection connection = LinkDatabase.getConnection();
            Statement statement = connection.createStatement();
            String newPasswordHash = PasswordHash.SHA256(newPassword);
            if (UserManage.login(username, oldPassword) != null) {
                String sql = "update users set password_hash='"+newPasswordHash+"' where username='"+username+"'";
                Integer res = statement.executeUpdate(String.format(sql, newPasswordHash, username));
                if (res != null && res != 0) {
                    System.out.println("change!");
                    return true;
                }
            }
            return false;

        }
        catch (Exception e){e.printStackTrace();
            return false;}

    }
    public static String modifyInformation(String username, Boolean Sex, TextArea p_sign, String birth,String tel,String email,String address,String introduce) {
        try {
            Connection connection = LinkDatabase.getConnection();
            Statement statement = connection.createStatement();
            String sql="update users set Sex='"+Sex+"',p_sign='"+p_sign+"',birth='"+birth+"',tel='"+tel+"',email='"+email+"',address='"+address+"',introduce='"+introduce+"' where username='"+username+"'";
            Integer rs=statement.executeUpdate(sql);

        }
        catch (Exception e){e.printStackTrace();}
        return null;
    }
}
