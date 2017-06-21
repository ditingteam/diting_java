package com.database;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.sql.*;

class JDBCTest {

    public static void main(String[] args){
        String username ;
        username = UserManage.login("xiaochao666", "a000000");
        if (username != null)
            System.out.println("login!");
        else {
            System.out.println("login failed");
        }
        if (UserManage.changePassword("xiaochao666", "a000000", "a111111")){
            System.out.println("change!");
        }
        else {
            System.out.println("failed change");
        }
        username = UserManage.login("xiaochao666", "a000000");
        if (username != null)
            System.out.println("login!");
        else {
            System.out.println("login failed");
        }
        username = UserManage.login("xiaochao666", "a111111");
        if (username != null)
            System.out.println("login!");
        else {
            System.out.println("login failed");
        }
    }

    public JSONArray resultSetToJson(ResultSet rs) throws SQLException,JSONException
    {
        // json数组
        JSONArray array = new JSONArray();

        // 获取列数
        ResultSetMetaData metaData = rs.getMetaData();
        int columnCount = metaData.getColumnCount();

        // 遍历ResultSet中的每条数据
        while (rs.next()) {
            JSONObject jsonObj = new JSONObject();

            // 遍历每一列
            for (int i = 1; i <= columnCount; i++) {
                String columnName =metaData.getColumnLabel(i);
                String value = rs.getString(columnName);
                String name = columnName.substring(1);
                jsonObj.put(name, value);
            }
            array.put(jsonObj);
        }

        return array;
    }
}

