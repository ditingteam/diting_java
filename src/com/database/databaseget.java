package com.database;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

class JDBCTest {

    public static void main(String[] args) {
        System.out.print(commentManagement.getComment("http://player.youku.com/player.php/sid/XMjgwODY4NzU1Ng==/v.swf"));
    }


}

