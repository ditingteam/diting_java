<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>注册</title>
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script>
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
                <button type="submit" class="btn btn-default">搜索</button>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="/login">登陆</a></li>
                <li><a href="/register">注册</a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>
<div><h1>&nbsp;</h1></div>
<div><h1>&nbsp;</h1></div>
<form class="form-horizontal" method="post" role="form">
    <div class="form-group required">
        <label for="inputEmail3" class="col-sm-3 control-label">请输入用户名</label>
        <div class="col-sm-5">
            <input type="text" class="form-control" id="inputEmail3" name="yonghuming" placeholder="账号">
        </div>
    </div>
    <div class="form-group required">
        <label for="inputPassword3" class="col-sm-3 control-label">请输入密码</label>
        <div class="col-sm-5">
            <input type="password" class="form-control" id="newPassword" name="mima" placeholder="Password">
        </div>
    </div>
    <div class="form-group required">
        <label for="inputPassword3" class="col-sm-3 control-label">请确认密码</label>
        <div class="col-sm-5">
            <input type="password" class="form-control" id="newPasswordAgain" name="mima1" placeholder="Password Again">
        </div>
    </div>
    <div class="col-sm-offset-3 col-sm-5">
        <p><a href="/login">已有账号？点击登陆</a></p>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-3 col-sm-5">
            <button type="submit" class="btn btn-default">注册</button>
        </div>
    </div>
</form>


</body>
</html>