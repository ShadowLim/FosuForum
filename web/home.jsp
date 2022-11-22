<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, cn.lbj.forum.entity.*"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>欢迎来到「校园论坛」</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/forum.css">

    <style type="text/css">
        .bk{
            background-image: url(https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1511274382471&di=65c54247e54e9895084042b3e3da5ba1&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2Fe850352ac65c10387071c8f8b9119313b07e89f8.jpg);
            background-repeat: no-repeat;
            background-size: 140% 140%;
        }
    </style>

</head>
<body class="bk">
    <nav class="navbar navbar-inverse" role="navigation">   <!-- TODO 顶部的菜单栏 -->
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="TouristHomeServlet">「Fosu Forum」</a>
            </div>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="touristFosuhobby.jsp"><span class="glyphicon glyphicon-flag"></span> 佛大周边</a></li>
                <li><a href="touristPo.jsp"><span class="glyphicon glyphicon-user"></span> 报表统计</a></li>
                <li><a href="TouristStudyListServlet"><span class="glyphicon glyphicon-edit"></span> 考研学习</a></li>
                <li><a href="register.jsp"><span class="glyphicon glyphicon-user"></span> 注册</a></li>
                <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
            </ul>
        </div>
    </nav>

    <div class="container">
        <div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="4000">
            <!-- TODO 轮播（Carousel）指标 -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>
            <!-- TODO 轮播（Carousel）项目 -->
            <div class="carousel-inner" >
                <div class="item active">
                    <img src="images/bg3.jpg" alt="First slide" style="width:1300px;height:200px;">
                </div>
                <div class="item">
                    <img src="images/bg1.jpg" alt="Second slide" style="width:1300px;height:200px;">
                </div>
                <div class="item">
                    <img src="images/bg2.png" alt="Third slide" style="width:1300px;height:200px;">
                </div>
            </div>
            <!-- TODO 轮播（Carousel）导航 -->
            <a class="carousel-control left" href="#myCarousel"
               data-slide="prev">&lsaquo;</a>
            <a class="carousel-control right" href="#myCarousel"
               data-slide="next">&rsaquo;</a>
        </div>
    </div>

    <div class="container">     <!-- TODO 中间的 -->
        <nav class="navbar navbar-default" role="navigation">
            <div>
                <img src="images/logo.png" class="img-circle">
            </div>
            <div>
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#home" data-toggle="tab">主页</a></li>
                </ul>
            </div>

            <div class="tab-pane fade in active" id="home">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>标题</th>
                                <th>时间</th>
                                <th>发帖人</th>
                            </tr>
                            </thead>
                            <%
                                // TODO 从作用域取出帖子列表,进行循环遍历
                                List<ForumEntity> list = (List<ForumEntity>)request.getAttribute("forumList");
                                if (list == null) {
                                    out.println("恭喜您是第一个新用户，赶紧去发帖吧！");
                                } else {
                                    for(ForumEntity forum : list){
                            %>
                            <tbody>
                            <tr>
                                <td><a href="TouristFindReplyServlet?fid=<%=forum.getFid()%>"> <%=forum.getTitle()%> </a></td>
                                <td><%=forum.getCreateTime()%></td>
                                <td><img src="<%=forum.getAuthor().getUser_face() %>" class="img-circle">
                                    <a href="TouristFindUserByIdServlet?uid=<%=forum.getAuthor().getUser_id()%>"> <%=forum.getAuthor().getUser_name()%> </a></td>
                            </tr>

                            </tbody><%}}%>
                        </table>
                    </div>
                </div>
            </div>

        </nav>
    </div>

    <div id="footer" >
        <nav class="navbar navbar-inverse navbar-staic-bottom" style="border-radius: 4px;padding-top:30px;margin-bottom:0px;height:100px;">
            <div class="navbar-inner navbar-content-center">
                <p style="color:#ffffff;"align=center>Copyright© 2022 Fosu_20BigData_lbj. All rights reserved.</p>
                <p style="color:#ffffff;"align=center>Contact Information: <a href="https://github.com/ShadowLim">GitHub Page</a></p >
            </div>
        </nav>
    </div>
</body>
</html>
