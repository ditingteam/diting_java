<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>个人信息</title>
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    //加载个人信息
    <script>
        $(document).ready(function () {
            $.get("/get_information", function (data) {
                var temp_json = JSON.parse(data)
                $("#nickname")[0].textContent = temp_json.nickname
                $("#p_sign")[0].textContent = temp_json.p_sign
                $("#birthday")[0].textContent = temp_json.birth
                $("#phone")[0].textContent = temp_json.phone
                $("#email")[0].textContent = temp_json.email
                $("#address")[0].textContent = temp_json.address
                $("#_time")[0].textContent = temp_json.register_time
                $("#info")[0].textContent = temp_json.introduce
                $("#username_h")[0].textContent = temp_json.username
                if (temp_json.sex == "male")
                    $("#sex")[0].textContent = "男"
                else if (temp_json.sex == "female")
                    $("#sex")[0].textContent = "女"
                else
                    $("#sex")[0].textContent = " "
            })
        })
    </script>
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
                <li><a href="/information">个人信息</a></li>
                <li><a href="/logout">退出</a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>
<div><h1>&nbsp;</h1></div>
<div class="row">
    <div class="container theme-showcase" role="main">
        <div class="jumbotron">
            <div class="row">
                <div class="col-lg-4">
                    <img class="img-circle" src="https://static.youku.com/user/img/avatar/310/41.jpg"
                         alt="Generic placeholder image" width="140" height="140">
                    <h2 >你好<span id="username_h"></span></h2>
                    <p>
                    <h3>欢迎回家</h3></p>
                    <div class="col-md-6">
                        <div class="page-header">
                            <p><a href="/compile_information">
                                <button type="button" class="btn btn-lg btn-default">完善个人信息</button>
                            </a></p>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="page-header">
                            <p><a href="/change_password">
                                <button type="button" class="btn btn-lg btn-default">修改密码</button>
                            </a></p>
                        </div>
                    </div>
                </div><!-- /.col-lg-4 -->
                <div class="col-lg-4">
                    <p>
                    <h3>昵称：<span id="nickname"></span></h3></p>
                    <p><h4>性别：<span id="sex"></span></h4></p>
                    <p><h4>个签：<span id="p_sign"></span></h4></p>
                    <p><h4>生日：<span id="birthday"></span></h4></p>
                    <p><h4>电话：<span id="phone"></span></h4></p>
                </div><!-- /.col-lg-4 -->
                <div class="col-lg-4">
                    <p><h4>email：<span id="email"></span></h4></p>
                    <p><h4>所在地：<span id="address"></span></h4></p>
                    <p><h4>注册时间：<span id="_time"></span></h4></p>
                    <p><h4>个人简介：<span id="info"></span></h4></p>
                </div><!-- /.col-lg-4 -->
            </div>
        </div>
    </div>
</div>
</body>
</html>