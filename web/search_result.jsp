<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String search = new String( request.getParameter("sousuo").getBytes("ISO-8859-1"),"UTF-8");

    session.setAttribute("search", search);
%>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>搜索结果</title>

    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <!-- Bootstrap -->
    //动态加载剧集列表
    <script type="text/html" id="tempCol">
        <div class="col-sm-1">
            <div class="list-group">
                <a href="播放链接" style="width: 45px" class="list-group-item active">1</a>
            </div>
        </div>
    </script>
    <script type="text/javascript">
        function createCol(j) {
            var html2 = $("#tempCol")[0].innerHTML
            var para2 = document.createElement("div")
            para2.innerHTML = html2
            var x = $(".episodeCol")
            x[j].appendChild(para2)
        }
    </script>
    <script>
        $(document).ready(function () {
            $.get("/search_data", function (data) {
                var temp_json = JSON.parse(data)
                var play_address = "/video_play_homepage"
                //简介加载
                $("#informationPlay")[0].textContent = temp_json[0].info
                $("#imgPlay")[0].src = temp_json[0].img
                $("#namePlay")[0].text = temp_json[0].title
                $("#imgPlay")[0].parentNode.href = play_address + "?playAddress=" + temp_json[0].links[0]
                $("#namePlay")[0].href = play_address + "?playAddress=" + temp_json[0].links[0]
                //加载剧集列表
                for (var i = 0; i < temp_json[0].links.length - 1; i++)
                    createCol(0)
                var playList = $(".list-group-item")
                for (var i = 0; i < temp_json[0].links.length; i++) {
                    playList[i].href = play_address + "?playAddress=" + temp_json[0].links[i]
                    playList[i].textContent = i + 1
                }
            })
        })
    </script>
    <link href="css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <!-- The mobile navbar-toggle button can be safely removed since you do not need it in a non-responsive implementation -->
            <a class="navbar-brand" href="/index">谛听视频网站</a>
        </div>
        <!-- Note that the .navbar-collapse and .collapse classes have been removed from the #navbar -->
        <div id="navbar">
            <ul class="nav navbar-nav">
                <li class="active"><a href="/index">主页</a></li>
            </ul>
            <form class="navbar-form navbar-left " action="/search">
                <div class="form-group">
                    <input type="text" class="form-control" name="sousuo" placeholder="楚乔传">
                </div>
                <button type="submit" class="btn btn-default" action="/search">搜索</button>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <%if (session.getAttribute("login") != null && session.getAttribute("login") == "ok") {%>
                <li><a href="/information">个人信息</a></li>
                <li><a href="/logout">退出</a></li>

                <%}else {%>
                <li><a href="/login">登陆</a></li>
                <li><a href="/register">注册</a></li>
                <%}%>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>
<div><h1>&nbsp;</h1></div>
<div class="row">
    <div class="col-lg-1">
    </div>
    <div class="col-lg-9">
        <div class="row">
            <div class="col-md-3">
                <a href="播放链接第一集">
                    <div class="thumbnail">
                        <img src="http://g2.ykimg.com/051600005940A2E6ADBA1FD24B0BE1A3">
                    </div>
                </a>
            </div>
            <div class="col-md-9">
                <p>
                <h1><a class="name1" href="播放链接">寒武纪</a></h1></p>
                <p><h4>简介：</h4><h5>
                <!--row排行，col-sm-1排列-->
                <div class="row">
                    <div class="col-sm-1">
                        <div class="list-group">
                            <a href="播放链接" style="width: 45px" class="list-group-item active">1</a>
                        </div>
                    </div>
                    <div class="col-sm-1">
                        <div class="list-group">
                            <a href="播放链接" style="width: 45px" class="list-group-item active">1</a>
                        </div>
                    </div>
                    <div class="col-sm-1">
                        <div class="list-group">
                            <a href="播放链接" style="width: 45px" class="list-group-item active">1</a>
                        </div>
                    </div>
                    <div class="col-sm-1">
                        <div class="list-group">
                            <a href="播放链接" style="width: 45px" class="list-group-item active">1</a>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-1">
                        <div class="list-group">
                            <a href="播放链接" style="width: 45px" class="list-group-item active">1</a>
                        </div>
                    </div>
                    <div class="col-sm-1">
                        <div class="list-group">
                            <a href="播放链接" style="width: 45px" class="list-group-item active">1</a>
                        </div>
                    </div>
                    <div class="col-sm-1">
                        <div class="list-group">
                            <a href="播放链接" style="width: 45px" class="list-group-item active">1</a>
                        </div>
                    </div>
                    <div class="col-sm-1">
                        <div class="list-group">
                            <a href="播放链接" style="width: 45px" class="list-group-item active">1</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-2">
    </div>
</div>

</body>
</html>