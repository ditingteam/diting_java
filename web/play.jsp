<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1"
    <script src="js/bootstrap.min.js"></script>
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>播放</title>
    <!-- Bootstrap -->
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
            <form class="navbar-form navbar-left ">
                <div class="form-group">
                    <input type="text" class="form-control" name="sousuo" placeholder="楚乔传">
                </div>
                <button type="submit" class="btn btn-default">搜索</button>
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
    <div class="col-lg-8">
        <div class="embed-responsive embed-responsive-16by9">
            <iframe class="embed-responsive-item"
                    src="<%=request.getParameter("playAddress")%>"></iframe>
        </div>
    </div>
    <div class="col-lg-3">
        <div><h1>&nbsp;</h1></div>
        <div><h1>&nbsp;</h1></div>
        <div><h1>&nbsp;</h1></div>
        <div><h1>&nbsp;</h1></div>
        <div><h1>&nbsp;</h1></div>
        <div><h1>&nbsp;</h1></div>
        <div><h1>&nbsp;</h1></div>
        <%if (session.getAttribute("login") != null && session.getAttribute("login") == "ok") {%>
        <form class="navbar-form navbar-left ">
        <div class="form-group">
            <input type="text" class="form-control" name="sousuo" placeholder="666666">
        </div>
        <button type="submit" class="btn btn-default">发送弹幕</button>
        </form>
        <%}else {%>
        <p><h4>登陆后才能发送弹幕！</h4></p>
        <a href="/login">
            <button type="submit" class="btn btn-default">登陆</button>
        </a>
        <%}%>
    </div>
</div>
<div class="row">
    <div class="col-md-1">
    </div>
    <div class="col-md-10">
        <p style="font-size:30px; ">用户评论：</p>
        <div class="media">
            <div class="media-left">
                <a href="个人信息">
                    <img class="img-circle" src="https://static.youku.com/user/img/avatar/310/41.jpg" width="100"
                         height="100">
                </a>
            </div>
            <div class="media-body">
                <h4 class="media-heading">昵称</h4>
                这AV拍的还可以，男女主表情丰富、动作到位，配音还很好听，我给5分！
            </div>
        </div>
        <div class="media">
            <div class="media-left">
                <a href="个人信息">
                    <img class="img-circle" src="https://static.youku.com/user/img/avatar/310/41.jpg" width="100"
                         height="100">
                </a>
            </div>
            <div class="media-body">
                <h4 class="media-heading">昵称</h4>
                这AV拍的还可以，男女主表情丰富、动作到位，配音还很好听，我给5分！
            </div>
        </div>
        <div class="media">
            <div class="media-left">
                <a href="个人信息">
                    <img class="img-circle" src="https://static.youku.com/user/img/avatar/310/41.jpg" width="100"
                         height="100">
                </a>
            </div>
            <div class="media-body">
                <h4 class="media-heading">昵称</h4>
                这AV拍的还可以，男女主表情丰富、动作到位，配音还很好听，我给5分！
            </div>
        </div>
        <div class="media">
            <div class="media-left">
                <a href="个人信息">
                    <img class="img-circle" src="https://static.youku.com/user/img/avatar/310/41.jpg" width="100"
                         height="100">
                </a>
            </div>
            <div class="media-body">
                <h4 class="media-heading">昵称</h4>
                这AV拍的还可以，男女主表情丰富、动作到位，配音还很好听，我给5分！
            </div>
        </div>
        <nav class="navbar navbar-default navbar-static-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                            aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
                <%if (session.getAttribute("login") != null && session.getAttribute("login") == "ok") {%>
                <div id="navbar" class="navbar-collapse collapse">
                    <p><h4>发表评论：</h4></p>
                    <form class="navbar-form navbar-left ">
                        <div class="form-group">
                            <input style="width: 300%" type="text" class="form-control" name="sousuo" placeholder="">
                            <button type="submit" class="btn btn-default">发表</button>
                        </div>

                    </form>
                </div><!--/.nav-collapse -->

                <%}else {%>
                <div id="navbar" class="navbar-collapse collapse">
                    <p><h4>登陆后才能发表评论！</h4></p>
                    <a href="/login">
                        <button type="submit" class="btn btn-default">登陆</button>
                    </a>
                </div><!--/.nav-collapse -->
                <%}%>
            </div>
        </nav>
    </div>
    <div class="col-md-1">
    </div>
</div>
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="WEB-INF/js/bootstrap.min.js"></script>
</body>
</html>