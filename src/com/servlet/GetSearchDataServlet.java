package com.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "GetSearchDataServlet", urlPatterns = {"/search_data"})
public class GetSearchDataServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String data = "[{\"info\": \"西魏年间乱世混战，大批平民在战乱中沦为奴隶，命如草芥。奴籍少女楚乔被送入人猎场供贵族娱乐射杀，幸得西凉世子燕洵暗中相救。随后她被带进权倾朝野的门阀宇文家，受到开明贵族宇文玥关注，被迫接受严厉训练的同时，更与燕洵结下深厚友谊。西魏门阀争斗，燕洵一家被屠，深陷绝境，楚乔与他生死相守并力助他逃脱困局。然而回到西凉后，燕洵野心膨胀，不惜以满城百姓的性命为代价割据称雄。楚乔在绝望中与燕洵分道扬镳，并与力求“天下一统、释奴止戈”的宇文玥并肩作战，粉碎了燕洵的复仇计划，成为心怀苍生的巾帼将军。\", \"links\": [\"http://player.youku.com/player.php/sid/XMjgwNjYyNjEwMA==/v.swf\", \"http://player.youku.com/player.php/sid/XMjgwNjcxMzU3Ng==/v.swf\", \"http://player.youku.com/player.php/sid/XMjgwODY4NzU1Ng==/v.swf\", \"http://player.youku.com/player.php/sid/XMjgwODY4Nzg1Ng==/v.swf\", \"http://player.youku.com/player.php/sid/XMjgxMDczMjcwOA==/v.swf\", \"http://player.youku.com/player.php/sid/XMjgxMDczMjkxNg==/v.swf\", \"http://player.youku.com/player.php/sid/XMjgxMjczMTg5Mg==/v.swf\", \"http://player.youku.com/player.php/sid/XMjgxMjgzNjkxNg==/v.swf\", \"http://player.youku.com/player.php/sid/XMjgyMDcyNDU1Ng==/v.swf\", \"http://player.youku.com/player.php/sid/XMjgyMDcyNDkzMg==/v.swf\", \"http://player.youku.com/player.php/sid/XMjgyMjcwMzQwNA==/v.swf\", \"http://player.youku.com/player.php/sid/XMjgyMjcwNDU1Mg==/v.swf\", \"http://player.youku.com/player.php/sid/XMjgyNDc2MTk0MA==/v.swf\", \"http://player.youku.com/player.php/sid/XMjgyNDg3Mjk2MA==/v.swf\", \"http://player.youku.com/player.php/sid/XMjgyNzA2NTI4MA==/v.swf\", \"http://player.youku.com/player.php/sid/XMjgyNzA2NTg5Mg==/v.swf\"], \"img\": \"http://g2.ykimg.com/051600005934C587ADBDD3647F09BF4B\", \"title\": \"楚乔传 TV版\"}, {\"info\": \"西魏年间乱世混战，大批平民在战乱中沦为奴隶，命如草芥。奴籍少女楚乔被送入人猎场供贵族娱乐射杀，幸得西凉世子燕洵暗中相救。随后她被带进权倾朝野的门阀宇文家，受到开明贵族宇文玥关注，被迫接受严厉训练的同时，更与燕洵结下深厚友谊。西魏门阀争斗，燕洵一家被屠，深陷绝境，楚乔与他生死相守并力助他逃脱困局。然而回到西凉后，燕洵野心膨胀，不惜以满城百姓的性命为代价割据称雄。楚乔在绝望中与燕洵分道扬镳，并与力求“天下一统、释奴止戈”的宇文玥并肩作战，粉碎了燕洵的复仇计划，成为心怀苍生的巾帼将军。\", \"links\": [\"http://player.youku.com/player.php/sid/XMjgwNTg1MzAwOA==/v.swf\", \"http://player.youku.com/player.php/sid/XMjgwNTg1MzAyMA==/v.swf\", \"http://player.youku.com/player.php/sid/XMjgwODEyNTAxMg==/v.swf\", \"http://player.youku.com/player.php/sid/XMjgwODEyNTA0NA==/v.swf\", \"http://player.youku.com/player.php/sid/XMjgxMDMwOTEwNA==/v.swf\", \"http://player.youku.com/player.php/sid/XMjgxMDMwOTAyNA==/v.swf\", \"http://player.youku.com/player.php/sid/XMjgxMjIyODM4NA==/v.swf\", \"http://player.youku.com/player.php/sid/XMjgxMjIyODM2OA==/v.swf\", \"http://player.youku.com/player.php/sid/XMjgxOTk3Njk3Ng==/v.swf\", \"http://player.youku.com/player.php/sid/XMjgxOTk3NzAwNA==/v.swf\", \"http://player.youku.com/player.php/sid/XMjgyMjAwNDAxMg==/v.swf\", \"http://player.youku.com/player.php/sid/XMjgyMjEzMzc1Ng==/v.swf\", \"http://player.youku.com/player.php/sid/XMjgyNDA1NTYyOA==/v.swf\", \"http://player.youku.com/player.php/sid/XMjgyNDA1NTY0MA==/v.swf\", \"http://player.youku.com/player.php/sid/XMjgyNjIyODM5Mg==/v.swf\", \"http://player.youku.com/player.php/sid/XMjgyNjE1MjcyMA==/v.swf\"], \"img\": \"http://g3.ykimg.com/051600005934CFCBADBA1FF75E0D39C0\", \"title\": \"楚乔传 DVD版\"}]";
        PrintWriter writer = response.getWriter();
        writer.print(data);
        writer.flush();
        writer.close();
    }
}
