package com.database.Utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

public class CookieUtil {
    /**
     * 设置cookie
     * @param response
     * @param name  cookie名字
     * @param value cookie值
     * @param maxAge cookie生命周期  以秒为单位
     */
    public static void addCookie(HttpServletResponse response, String name, String value, int maxAge){
        Cookie cookie = new Cookie(name,value);
        cookie.setPath("/");
        if(maxAge>0)  cookie.setMaxAge(maxAge);
        response.addCookie(cookie);
    }

    /**
     * 根据名字获取cookie
     * @param request
     * @param name cookie名字
     * @return
     */
    public static Cookie getCookieByName(HttpServletRequest request,String name){
        Map<String,Cookie> cookieMap = ReadCookieMap(request);
        if(cookieMap.containsKey(name)){
            Cookie cookie = (Cookie)cookieMap.get(name);
            return cookie;
        }else{
            return null;
        }
    }



    /**
     * 将cookie封装到Map里面
     * @param request
     * @return
     */
    private static Map<String,Cookie> ReadCookieMap(HttpServletRequest request){
        Map<String,Cookie> cookieMap = new HashMap<String,Cookie>();
        Cookie[] cookies = request.getCookies();
        if(null!=cookies){
            for(Cookie cookie : cookies){
                cookieMap.put(cookie.getName(), cookie);
            }
        }
        return cookieMap;
    }


    //删除所有cookie
    public static void removeAllCookies(HttpServletRequest req,HttpServletResponse resp){
        Cookie[] cookies = req.getCookies();
        for(Cookie cookie: cookies){
            cookie.setMaxAge(0);
            cookie.setPath("/");
            resp.addCookie(cookie);
        }
    }
    //根据cookie名称移除cookie
    public static void removeCookieByName(String cookie_name,HttpServletRequest request,HttpServletResponse resp){
        Cookie cookie = null;
        Cookie[] cookies = null;
        // 获取当前域名下的cookies，是一个数组
        cookies = request.getCookies();
        if( cookies != null ){
            for (int i = 0; i < cookies.length; i++){
                cookie = cookies[i];
                if((cookie.getName()).compareTo(cookie_name) == 0 ){
                    cookie.setMaxAge(0);
                    resp.addCookie(cookie);
                }
            }
        }
    }

}
