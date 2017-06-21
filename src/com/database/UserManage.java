package com.database;

import com.password.Password;
import org.json.JSONArray;
import org.json.JSONObject;
import sun.awt.image.ImageWatched;

import java.awt.*;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

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
                java.util.Date date = new Date();
                SimpleDateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//24小时制
                String register_time = sdformat.format(date);
                System.out.println(register_time);
                String passwordHash = PasswordHash.SHA256(password);
                String sql1="insert into users(username,password_hash,register_time) values ('"+username+"','"+passwordHash+"','"+
                        register_time+"')";
                statement.execute(sql1);
                System.out.println("register!");
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
                Integer res = statement.executeUpdate(sql);
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
    public static String modifyInformation(String username, String nickname, Boolean Sex, String p_sign, String birth,String tel,String email,String address,String introduce) {
        try {
            Connection connection = LinkDatabase.getConnection();
            Statement statement = connection.createStatement();
            Integer sex ;
            if (Sex){
                sex = 1;
            }
            else {
                sex = 0;
            }
            String sql="update users set Sex='"+sex+"',p_sign='"+p_sign+"',birth='"+birth+"',tel='"+tel+"',email='"+email+"',place='"+address+"',introduce='"+introduce+"',nickname='"+nickname+"' where username='"+username+"'";
            Integer rs=statement.executeUpdate(sql);

        }
        catch (Exception e){e.printStackTrace();}
        return null;
    }
    public static String getInformation(String username){
        Connection connection = LinkDatabase.getConnection();
        try {
            Statement statement = connection.createStatement();
            String sql = "SELECT * from users WHERE username='" + username + "'";
            ResultSet result = statement.executeQuery(sql);
            JSONObject json = new JSONObject();
            if (result.next()){
                json.put("username", result.getString("username"));
                json.put("nickname", result.getString("nickname"));
                json.put("p_sign", result.getString("p_sign"));
                json.put("birth", result.getString("birth"));
                json.put("phone", result.getString("tel"));
                json.put("email", result.getString("email"));
                json.put("address", result.getString("place"));
                json.put("introduce", result.getString("introduce"));
                json.put("register_time", result.getString("register_time").substring(0,19));
                if (result.getInt("sex") == 1){
                    json.put("sex", "male");
                }
                else {
                    json.put("sex", "female");
                }
                //todo add history
                return json.toString();
            }
            return "";
        }
        catch (Exception e){
            e.printStackTrace();
            return "";
        }
    }
}
