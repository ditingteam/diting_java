<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html lang="zh-CN">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>谛听</title>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js" ></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
      <![endif]-->
    <!-- 字符串转JSON -->
    <script>
        $(document).ready(function () {
            $.get("/main_page_data", function (data) {
                var temp_json = JSON.parse(data)
                var play_address = "/video_play_homepage"
                //黄金档加载
                var picture1Array = $("img.picture1")
                var name1Array = $("a.name1")
                var info1Array = $("a.information1")

                for (var i = 0; i < name1Array.length; i++) {
                    name1Array[i].text = temp_json.黄金档[i].title;
                    info1Array[i].text = temp_json.黄金档[i].info;
                    picture1Array[i].src = temp_json.黄金档[i].img;
                    name1Array[i].href = play_address + "?playAddress=" + temp_json.黄金档[i].link
                    info1Array[i].href = play_address + "?playAddress=" + temp_json.黄金档[i].link
                    picture1Array[i].parentNode.href = play_address + "?playAddress=" + temp_json.黄金档[i].link
                }
                //热剧榜单加载
                var name2Array = $("a.name2")
                var play_timesArray = $("a.play_times")
                for (var i = 0; i < name2Array.length; i++) {
                    name2Array[i].text = temp_json.热剧榜单[i].name
                    play_timesArray[i].text = temp_json.热剧榜单[i].play_times
                    name2Array[i].href = play_address + "?playAddress=" + temp_json.热剧榜单[i].link
                    play_timesArray[i].href = play_address + "?playAddress=" + temp_json.热剧榜单[i].link
                }
                //超级网剧加载
                var picture3Array = $("img.picture3")
                var name3Array = $("a.name3")
                var info3Array = $("a.information3")
                for (var i = 0; i < name3Array.length; i++) {
                    name3Array[i].text = temp_json.超级网剧[i].title;
                    info3Array[i].text = temp_json.超级网剧[i].info;
                    picture3Array[i].src = temp_json.超级网剧[i].img;
                    name3Array[i].href = play_address + "?playAddress=" + temp_json.超级网剧[i].link
                    info3Array[i].href = play_address + "?playAddress=" + temp_json.超级网剧[i].link
                    picture3Array[i].parentNode.href = play_address + "?playAddress=" + temp_json.超级网剧[i].link
                }
                //独家策划加载
                var picture4Array = $("img.picture4")
                var name4Array = $("a.name4")
                var info4Array = $("a.information4")
                for (var i = 0; i < name4Array.length; i++) {
                    name4Array[i].text = temp_json.独家策划[i].title;
                    info4Array[i].text = temp_json.独家策划[i].info;
                    picture4Array[i].src = temp_json.独家策划[i].img;
                    name4Array[i].href = play_address + "?playAddress=" + temp_json.独家策划[i].link
                    info4Array[i].href = play_address + "?playAddress=" + temp_json.独家策划[i].link
                    picture4Array[i].parentNode.href = play_address + "?playAddress=" + temp_json.独家策划[i].link
                }
                var name4_1Array = $("a.name4_1")
                for (var i = 0; i < name4_1Array.length; i++) {
                    name4_1Array[i].text = temp_json.独家策划[i + 6].title
                    name4_1Array[i].href = play_address + "?playAddress=" + temp_json.独家策划[i].link
                }
                //独家视频官网加载
                var picture5Array = $("img.picture5")
                var name5Array = $("a.name5")
                var info5Array = $("a.information5")
                for (var i = 0; i < name5Array.length; i++) {
                    name5Array[i].text = temp_json.独家视频官网[i].title
                    info5Array[i].text = temp_json.独家视频官网[i].info
                    picture5Array[i].src = temp_json.独家视频官网[i].img
                    name5Array[i].href = play_address + "?playAddress=" + temp_json.独家视频官网[i].link
                    info5Array[i].href = play_address + "?playAddress=" + temp_json.独家视频官网[i].link
                }
            });
        });

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
<div class="row">
    <div class="col-md-1">
    </div>
    <div class="col-md-9">
        <div class="page-header">
        </div>
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img src="http://r1.ykimg.com/05100000591EECABADB91240EF0B77A6" alt="First slide">
                </div>
                <div class="item">
                    <img src="http://r1.ykimg.com/0510000059263E6AADB912584109BB3B" alt="Second slide">
                </div>
                <div class="item">
                    <img src="http://r1.ykimg.com/05100000591441A08B6C58044E0A8AE1" alt="Third slide">
                </div>
            </div>
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>
    <div class="col-md-2">
    </div>
</div>
<div class="row">
    <div class="col-lg-8">
        <p>
        <h2>黄金档</h2></p>
        <div class="row">
            <div class="col-md-3">
                <div class="thumbnail">
                    <a href="/play_before_login.html"><img class="picture1"
                                                           src="http://r1.ykimg.com/0515000059358795ADB912073302DD6A"></a>
                    <div class="caption">
                        <p><a myAttr="http://player.youku.com/player.php/sid/XMjgzNjE1NTU2NA==/v.swf"
                              href="/play_before_login.html" class="name1"
                        >ju
                        </a></p>
                        <p><a myAttr="123" class="information1" href="/play_before_login.html">简介</a></p>
                    </div>
                </div>

            </div>
            <div class="col-md-3">
                <div class="thumbnail">
                    <a href="/play_before_login.html"><img class="picture1"
                                                           src="http://r1.ykimg.com/0515000059358795ADB912073302DD6A"></a>
                    <div class="caption">
                        <p><a class="name1" href="/play_before_login.html">ju</a></p>
                        <p><a class="information1" href="/play_before_login.html">简介</a></p>
                    </div>
                </div>
                </a>
            </div>
            <div class="col-md-3">
                <div class="thumbnail">
                    <a href="/play_before_login.html"><img class="picture1"
                                                           src="http://r1.ykimg.com/0515000059358795ADB912073302DD6A"></a>
                    <div class="caption">
                        <p><a class="name1" href="/play_before_login.html">ju</a></p>
                        <p><a class="information1" href="/play_before_login.html">简介</a></p>
                    </div>
                </div>
                </a>
            </div>
            <div class="col-md-3">
                <div class="thumbnail">
                    <a href="/play_before_login.html"><img class="picture1"
                                                           src="http://r1.ykimg.com/0515000059358795ADB912073302DD6A"></a>
                    <div class="caption">
                        <p><a class="name1" href="/play_before_login.html">ju</a></p>
                        <p><a class="information1" href="/play_before_login.html">简介</a></p>
                    </div>
                </div>
                </a>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
                <a href="/play_before_login.html">
                    <div class="thumbnail">
                        <img class="picture1" src="http://r1.ykimg.com/0515000059358795ADB912073302DD6A">
                        <div class="caption">
                            <p><a class="name1" href="/play_before_login.html">ju</a></p>
                            <p><a class="information1" href="/play_before_login.html">简介</a></p>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-md-3">
                <div class="thumbnail">
                    <a href="/play_before_login.html"><img class="picture1"
                                                           src="http://r1.ykimg.com/0515000059358795ADB912073302DD6A"></a>
                    <div class="caption">
                        <p><a class="name1" href="/play_before_login.html">ju</a></p>
                        <p><a class="information1" href="/play_before_login.html">简介</a></p>
                    </div>
                </div>
                </a>
            </div>
            <div class="col-md-3">
                <div class="thumbnail">
                    <a href="/play_before_login.html"><img class="picture1"
                                                           src="http://r1.ykimg.com/0515000059358795ADB912073302DD6A"></a>
                    <div class="caption">
                        <p><a class="name1" href="/play_before_login.html">ju</a></p>
                        <p><a class="information1" href="/play_before_login.html">简介</a></p>
                    </div>
                </div>
                </a>
            </div>
            <div class="col-md-3">
                <div class="thumbnail">
                    <a href="/play_before_login.html"><img class="picture1"
                                                           src="http://r1.ykimg.com/0515000059358795ADB912073302DD6A"></a>
                    <div class="caption">
                        <p><a class="name1" href="/play_before_login.html">ju</a></p>
                        <p><a class="information1" href="/play_before_login.html">简介</a></p>
                    </div>
                </div>
                </a>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
                <div class="thumbnail">
                    <a href="/play_before_login.html"><img class="picture1"
                                                           src="http://r1.ykimg.com/0515000059358795ADB912073302DD6A"></a>
                    <div class="caption">
                        <p><a class="name1" href="/play_before_login.html">ju</a></p>
                        <p><a class="information1" href="/play_before_login.html">简介</a></p>
                    </div>
                </div>
                </a>
            </div>
            <div class="col-md-3">
                <div class="thumbnail">
                    <a href="/play_before_login.html"><img class="picture1"
                                                           src="http://r1.ykimg.com/0515000059358795ADB912073302DD6A"></a>
                    <div class="caption">
                        <p><a class="name1" href="/play_before_login.html">ju</a></p>
                        <p><a class="information1" href="/play_before_login.html">简介</a></p>
                    </div>
                </div>
                </a>
            </div>
            <div class="col-md-3">
                <div class="thumbnail">
                    <a href="/play_before_login.html"><img class="picture1"
                                                           src="http://r1.ykimg.com/0515000059358795ADB912073302DD6A"></a>
                    <div class="caption">
                        <p><a class="name1" href="/play_before_login.html">ju</a></p>
                        <p><a class="information1" href="/play_before_login.html">简介</a></p>
                    </div>
                </div>
                </a>
            </div>
            <div class="col-md-3">
                <div class="thumbnail">
                    <a href="/play_before_login.html"><img class="picture1"
                                                           src="http://r1.ykimg.com/0515000059358795ADB912073302DD6A"></a>
                    <div class="caption">
                        <p><a class="name1" href="/play_before_login.html">ju</a></p>
                        <p><a class="information1" href="/play_before_login.html">简介</a></p>
                    </div>
                </div>
                </a>
            </div>
        </div>
    </div>
    <div class="col-lg-4">
        <p>
        <h2>热剧榜单</h2></p>
        <table width="450">
            <tr>
                <td><h3><span class="label label-success">1</span></h3></td>
                <td><h3><a class="name2" href="/play_before_login.html"></a></h3></td>
                <td><h3><a class="play_times"></a></h3></td>
            </tr>
            <tr>
                <td><h3><span class="label label-success">2</span></h3></td>
                <td><h3><a class="name2" href="/play_before_login.html">jian</a></h3></td>
                <td><h3><a class="play_times"></a></h3></td>
            </tr>
            <tr>
                <td><h3><span class="label label-success">3</span></h3></td>
                <td><h3><a class="name2" href="/play_before_login.html">jian</a></h3></td>
                <td><h3><a class="play_times"></a></h3></td>
            </tr>
            <tr>
                <td><h3><span class="label label-success">4</span></h3></td>
                <td><h3><a class="name2" href="/play_before_login.html">jian</a></h3></td>
                <td><h3><a class="play_times"></a></h3></td>
            </tr>
            <tr>
                <td><h3><span class="label label-success">5</span></h3></td>
                <td><h3><a class="name2" href="/play_before_login.html">jian</a></h3></td>
                <td><h3><a class="play_times"></a></h3></td>
            </tr>
            <tr>
                <td><h3><span class="label label-success">6</span></h3></td>
                <td><h3><a class="name2" href="/play_before_login.html">jian</a></h3></td>
                <td><h3><a class="play_times"></a></h3></td>
            </tr>
            <tr>
                <td><h3><span class="label label-success">7</span></h3></td>
                <td><h3><a class="name2" href="/play_before_login.html">jian</a></h3></td>
                <td><h3><a class="play_times"></a></h3></td>
            </tr>
            <tr>
                <td><h3><span class="label label-success">8</span></h3></td>
                <td><h3><a class="name2" href="/play_before_login.html">jian</a></h3></td>
                <td><h3><a class="play_times"></a></h3></td>
            </tr>
            <tr>
                <td><h3><span class="label label-success">9</span></h3></td>
                <td><h3><a class="name2" href="/play_before_login.html">jian</a></h3></td>
                <td><h3><a class="play_times"></a></h3></td>
            </tr>
            <tr>
                <td><h3><span class="label label-success">10</span></h3></td>
                <td><h3><a class="name2" href="/play_before_login.html">jian</a></h3></td>
                <td><h3><a class="play_times"></a></h3></td>
            </tr>
            <tr>
                <td><h3><span class="label label-success">11</span></h3></td>
                <td><h3><a class="name2" href="/play_before_login.html">jian</a></h3></td>
                <td><h3><a class="play_times"></a></h3></td>
            </tr>
        </table>
    </div>
</div>
<div class="row">
    <div class="col-lg-8">
        <p>
        <h2>超级网剧</h2></p>
        <div class="row">
            <div class="col-md-6">
                <div class="thumbnail">
                    <a class="play3" href="/play_before_login.html"><img class="picture3"
                                                                         src="http:////r1.ykimg.com/050C0000592E2FF5ADC0B006C401820E">
                    </a>
                    <div class="caption">
                        <p><a class="name3" href="/play_before_login.html">剧名</a></p>
                        <p><a class="information3" href="/play_before_login.html">简介</a></p>
                    </div>
                </div>

            </div>
            <div class="col-md-6">
                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="thumbnail">
                                    <a class="play3" href="/play_before_login.html"><img class="picture3"
                                                                                         src="http:////r1.ykimg.com/050C0000592E2FF5ADC0B006C401820E">
                                    </a>
                                    <div class="caption">
                                        <p><a class="name3" href="/play_before_login.html">剧名</a></p>
                                        <p><a class="information3" href="/play_before_login.html">简介</a></p>
                                    </div>
                                </div>
                                </a>
                            </div>
                            <div class="col-sm-6">
                                <div class="thumbnail">
                                    <a class="play3" href="/play_before_login.html"><img class="picture3"
                                                                                         src="http:////r1.ykimg.com/050C0000592E2FF5ADC0B006C401820E">
                                    </a>
                                    <div class="caption">
                                        <p><a class="name3" href="/play_before_login.html">剧名</a></p>
                                        <p><a class="information3" href="/play_before_login.html">简介</a></p>
                                    </div>
                                </div>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="thumbnail">
                                    <a class="play3" href="/play_before_login.html"><img class="picture3"
                                                                                         src="http:////r1.ykimg.com/050C0000592E2FF5ADC0B006C401820E">
                                    </a>
                                    <div class="caption">
                                        <p><a class="name3" href="/play_before_login.html">剧名</a></p>
                                        <p><a class="information3" href="/play_before_login.html">简介</a></p>
                                    </div>
                                </div>
                                </a>
                            </div>
                            <div class="col-sm-6">
                                <a class="play3" href="/play_before_login.html">
                                    <img class="picture3"
                                         src="http:////r1.ykimg.com/050C0000592E2FF5ADC0B006C401820E">
                                    <div class="caption">
                                        <p><a class="name3" href="/play_before_login.html">剧名</a></p>
                                        <p><a class="information3" href="/play_before_login.html">简介</a></p>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-lg-8">
        <p>
        <h2>独家策划</h2></p>
        <div class="row">
            <div class="col-md-3">
                <div class="thumbnail">
                    <a class="play4" href="/play_before_login.html"><img class="picture4"
                                                                         src="http:////r1.ykimg.com/050C0000592E2FF5ADC0B006C401820E">
                    </a>
                    <div class="caption">
                        <p><a class="name4" href="/play_before_login.html">剧名</a></p>
                        <p><a class="information4" href="/play_before_login.html">简介</a></p>
                    </div>
                </div>
                </a>
            </div>
            <div class="col-md-3">
                <p><a class="name4_1" href="/play_before_login.html">1</a></p>
                <p><a class="name4_1" href="/play_before_login.html">2</a></p>
                <p><a class="name4_1" href="/play_before_login.html">3</a></p>
                <p><a class="name4_1" href="/play_before_login.html">4</a></p>
            </div>
            <div class="col-md-3">
                <div class="thumbnail">
                    <a class="play4" href="/play_before_login.html"><img class="picture4"
                                                                         src="http:////r1.ykimg.com/050C0000592E2FF5ADC0B006C401820E">
                    </a>
                    <div class="caption">
                        <p><a class="name4" href="/play_before_login.html">剧名</a></p>
                        <p><a class="information4" href="/play_before_login.html">简介</a></p>
                    </div>
                </div>
                </a>
            </div>
            <div class="col-md-3">
                <p><a class="name4_1" href="/play_before_login.html">1</a></p>
                <p><a class="name4_1" href="/play_before_login.html">2</a></p>
                <p><a class="name4_1" href="/play_before_login.html">3</a></p>
                <p><a class="name4_1" href="/play_before_login.html">4</a></p>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
                <div class="thumbnail">
                    <a class="play4" href="/play_before_login.html"><img class="picture4"
                                                                         src="http:////r1.ykimg.com/050C0000592E2FF5ADC0B006C401820E">
                    </a>
                    <div class="caption">
                        <p><a class="name4" href="/play_before_login.html">剧名</a></p>
                        <p><a class="information4" href="/play_before_login.html">简介</a></p>
                    </div>
                </div>
                </a>
            </div>
            <div class="col-md-3">
                <div class="thumbnail">
                    <a class="play4" href="/play_before_login.html"><img class="picture4"
                                                                         src="http:////r1.ykimg.com/050C0000592E2FF5ADC0B006C401820E">
                    </a>
                    <div class="caption">
                        <p><a class="name4" href="/play_before_login.html">剧名</a></p>
                        <p><a class="information4" href="/play_before_login.html">简介</a></p>
                    </div>
                </div>
                </a>
            </div>
            <div class="col-md-3">
                <div class="thumbnail">
                    <a class="play4" href="/play_before_login.html"><img class="picture4"
                                                                         src="http:////r1.ykimg.com/050C0000592E2FF5ADC0B006C401820E">
                    </a>
                    <div class="caption">
                        <p><a class="name4" href="/play_before_login.html">剧名</a></p>
                        <p><a class="information4" href="/play_before_login.html">简介</a></p>
                    </div>
                </div>
                </a>
            </div>
            <div class="col-md-3">
                <div class="thumbnail">
                    <a class="play4" href="/play_before_login.html"><img class="picture4"
                                                                         src="http:////r1.ykimg.com/050C0000592E2FF5ADC0B006C401820E">
                    </a>
                    <div class="caption">
                        <p><a class="name4" href="/play_before_login.html">剧名</a></p>
                        <p><a class="information4" href="/play_before_login.html">简介</a></p>
                    </div>
                </div>
                </a>
            </div>
        </div>
    </div>
    <div class="col-lg-4">
        <p>
        <h2>独家视频官网</h2></p>
        <div class="row">
            <div class="col-md-4">
                <a class="play5" href="/play_before_login.html">
                    <div class="thumbnail">
                        <img class="picture5" src="http://r1.ykimg.com/050B0000593A0988ADC0B006CD020877">
                    </div>
                </a>
            </div>
            <div class="col-md-8">
                <div class="caption">
                    <p><a class="name5" href="/play_before_login.html">剧名</a></p>
                    <p><a class="information5">简介</a></p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <a class="play5" href="/play_before_login.html">
                    <div class="thumbnail">
                        <img class="picture5" src="http://r1.ykimg.com/050B0000593A0988ADC0B006CD020877">
                    </div>
                </a>
            </div>
            <div class="col-md-8">
                <div class="caption">
                    <p><a class="name5" href="/play_before_login.html">剧名</a></p>
                    <p><a class="information5">简介</a></p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <a class="play5" href="/play_before_login.html">
                    <div class="thumbnail">
                        <img class="picture5" src="http://r1.ykimg.com/050B0000593A0988ADC0B006CD020877">
                    </div>
                </a>
            </div>
            <div class="col-md-8">
                <div class="caption">
                    <p><a class="name5" href="/play_before_login.html">剧名</a></p>
                    <p><a class="information5">简介</a></p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <a class="play5" href="/play_before_login.html">
                    <div class="thumbnail">
                        <img class="picture5" src="http://r1.ykimg.com/050B0000593A0988ADC0B006CD020877">
                    </div>
                </a>
            </div>
            <div class="col-md-8">
                <div class="caption">
                    <p><a class="name5" href="/play_before_login.html">剧名</a></p>
                    <p><a class="information5">简介</a></p>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>