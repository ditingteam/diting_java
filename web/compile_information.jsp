<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>完善个人信息</title>
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    //加载个人信息
    <script>
        $(document).ready(function () {
            $.get("/get_information", function (data) {
                var temp_json = JSON.parse(data)
                try {
                    $("#nickname")[0].value = temp_json.nickname
                    $("#p_sign")[0].value = temp_json.p_sign
                    $("#birthday")[0].value = temp_json.birth
                    $("#phone")[0].value = temp_json.phone
                    $("#email")[0].value = temp_json.email
                    $("#address")[0].value = temp_json.address
                    $("#_time")[0].value = temp_json.register_time
                    $("#info")[0].value = temp_json.introduce
                } catch (e) {
                }
                $("#username")[0].text = temp_json.username
                if (temp_json.sex == "male")
                    $("#male")[0].checked = "checked"
                else if (temp_json.sex == "female")
                    $("#sex")[0].checked = "checked"
                else
                    return
            })
        })
    </script>
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
                    <h2>您好:<span id="username"></span>请编辑 </h2>
                    <p>
                    <h3>属于你的温馨小窝</h3></p>
                </div><!-- /.col-lg-4 -->
                <form class="form-horizontal" method="post" role="form">
                    <div class="col-lg-4">
                        <div class="form-group">
                            <p>
                            <h4><label for="nickname" class="col-sm-3 control-label">昵称</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="nickname" name="nickname"
                                           placeholder="昵称">
                                </div>
                            </h4>
                            </p>
                        </div>
                        <div class="form-group">
                            <p>
                            <h4><label class="col-sm-3 control-label" id="sex">性别</label>
                                <div class="col-sm-9">
                                    <input id="male" type="radio" name="sex" value="male">男
                                    <input id="female" type="radio" name="sex" value="female">女

                                </div>
                            </h4>
                            </p>
                        </div>
                        <div class="form-group">
                            <p>
                            <h4><label class="col-sm-4 control-label">个性签名</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="p_sign" name="p_sign"
                                           placeholder="我的标签">
                                </div>
                            </h4>
                            </p>
                        </div>
                        <div class="form-group">
                            <p>
                            <h4><label for="birthday" class="col-sm-3 control-label">生日</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="birthday" name="birthday"
                                           placeholder="会有生日礼物哦！">
                                </div>
                            </h4>
                            </p>
                        </div>
                        <div class="form-group">
                            <p>
                            <h4><label for="phone" class="col-sm-3 control-label">电话</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="phone" name="phone"
                                           placeholder="常用电话">
                                </div>
                            </h4>
                            </p>
                        </div>

                    </div><!-- /.col-lg-4 -->
                    <div class="col-lg-4">
                        <div class="form-group">
                            <p>
                            <h4><label for="email" class="col-sm-3 control-label">Email</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="email" name="email"
                                           placeholder="常用邮箱">
                                </div>
                            </h4>
                            </p>
                        </div>
                        <div class="form-group">
                            <p>
                            <h4><label for="address" class="col-sm-3 control-label">所在地</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="address" name="address"
                                           placeholder="住址">
                                </div>
                            </h4>
                            </p>
                        </div>
                        <div class="form-group">
                            <p>
                            <h4><label for="information" class="col-sm-4 control-label">个人简介</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="info" name="info"
                                           placeholder="描述自己，吸引异性吧！">
                                </div>
                            </h4>
                            </p>
                        </div>
                        <div class="col-sm-6">
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <h1>
                                    <button type="submit" class="btn btn-default"><h4>完成</h4></button>
                                </h1>
                            </div>
                        </div>
                    </div><!-- /.col-lg-4 -->
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>