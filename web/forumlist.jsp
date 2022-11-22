<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ page import="java.util.List,cn.lbj.forum.entity.*" %>
<%@ page import="cn.lbj.forum.entity.ForumEntity" %>
<%@ page import="cn.lbj.forum.entity.UserEntity" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>查看帖子</title>
    <link rel="stylesheet" type="text/css" href="css/forum.css">
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style type="text/css">
        .bk{
            background-image: url(https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1511274382471&di=65c54247e54e9895084042b3e3da5ba1&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2Fe850352ac65c10387071c8f8b9119313b07e89f8.jpg);
            background-repeat: no-repeat;
            background-size: 140% 140%;
        }
        /*返回顶部*/
        #myBtn {
            display: none;
            position: fixed;
            bottom: 20px;
            right: 30px;
            z-index: 99;
            border: none;
            outline: none;
            background-color: #bcdff1;
            color: black;
            cursor: pointer;
            padding: 15px;
            border-radius: 10px;
        }

        #myBtn:hover {
            background-color: #555;
        }
    </style>
</head>

<body class="bk">
    <nav class="navbar navbar-inverse" role="navigation"><!-- 顶部的菜单栏 -->
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="ForumListServlet">「Fosu Forum」</a>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="fosuhobby.jsp"><span class="glyphicon glyphicon-flag"></span> 佛大周边</a></li>
            <li><a href="po.jsp"><span class="glyphicon glyphicon-user"></span> 数据报表</a></li>
            <li><a href="StudyListServlet"><span class="glyphicon glyphicon-edit"></span> 考研学习</a></li>
            <li><a href="${pageContext.request.contextPath}/UserInfoServlet?uid=${user.user_id}"><span class="glyphicon glyphicon-user"></span> 个人信息</a></li>
            <li><a href="${pageContext.request.contextPath}/UPersonPageForumListServlet?uid=${user.user_id}"><span class="glyphicon glyphicon-book"></span> 我的帖子</a></li>
            <%
                UserEntity admin = (UserEntity)request.getSession().getAttribute("user");
                if(admin.getIsAdmin() == 1){
            %>

            <li><a href="MUserListServlet"><span class="glyphicon glyphicon-user"></span>用户管理</a></li>

            <%} %>
            <li><a href="${pageContext.request.contextPath}/home.jsp"><span class="glyphicon glyphicon-user"></span> 退出论坛</a></li>

        </ul>
    </div>
</nav>

    <div class="container"><!-- 轮播-->
        <div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="4000">
        <!-- 轮播（Carousel）指标 -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
        <!-- 轮播（Carousel）项目 -->
        <div class="carousel-inner" style="width:100%;height:200px;">
            <div class="item active" >
                <img src="images/bg3.jpg" alt="First slide" style="width:1300px;height:200px;">
            </div>
            <div class="item">
                <img src="images/bg1.jpg" alt="Second slide" style="width:1300px;height:200px;">
            </div>
            <div class="item">
                <img src="images/bg2.png" alt="Third slide" style="width:1300px;height:200px;">
            </div>
        </div>
        <!-- 轮播（Carousel）导航 -->
        <a class="carousel-control left" href="#myCarousel"
           data-slide="prev">&lsaquo;</a>
        <a class="carousel-control right" href="#myCarousel"
           data-slide="next">&rsaquo;</a>
    </div>
    </div>


    <div class="container"><!-- 中间 -->
        <nav class="navbar navbar-default" role="navigation">
        <div>
            <img src="images/logo.png" class="img-circle">
            <span style="font-size:24px">欢迎你，${user.user_name}</span>
        </div>
        <ul class="nav nav-tabs">
            <li class="active"><a href="#">主页</a></li>
        </ul>
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
                            for(ForumEntity forum : list) {
                    %>
                    <tbody>
                    <tr>
                        <td><a href="ReplyListServlet?fid=<%=forum.getFid()%>"> <%=forum.getTitle()%> </a></td>
                        <td><%=forum.getCreateTime()%></td>
                        <td><img src="<%=forum.getAuthor().getUser_face() %> " class="img-circle">
                            <a href="FindUserByIdServlet?uid=<%=forum.getAuthor().getUser_id()%>"> <%=forum.getAuthor().getUser_name()%> </a></td>
                    </tr>
                    </tbody>
                    <%}}%>
                </table>
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">
                    <b>「发帖」</b>
                </h3>
            </div>
            <div class="panel-body">
                <form class="form-horizontal" role="form" name="form1" method="post" action="ReleaseServlet">
                    <div class="form-group">
                        <label for="firstname" class="col-sm-2 control-label">标题</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="firstname"
                                   placeholder="请输入标题" name="title">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">内容</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" id="name" rows="3" name="content"></textarea></div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-default">发表</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </nav>

        <button onclick="topFunction()" id="myBtn" title="回顶部">返回顶部</button>

        <script>
        // 当网页向下滑动 20px 出现"返回顶部" 按钮
        window.onscroll = function() {scrollFunction()};

        function scrollFunction() {
            console.log(121);
            if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                document.getElementById("myBtn").style.display = "block";
            } else {
                document.getElementById("myBtn").style.display = "none";
            }
        }

        // 点击按钮，返回顶部
        function topFunction() {
            document.body.scrollTop = 0;
            document.documentElement.scrollTop = 0;
        }
    </script>

    </div>


    <div id="footer" >
        <nav class="navbar navbar-inverse navbar-staic-bottom" style="border-radius: 4px;padding-top:30px;margin-bottom:0px;height:100px;">
            <div class="navbar-inner navbar-content-center">
                <p style="color:#ffffff;"align=center>© 2022 Fosu_20BigData_lbj, Create</p >
                <p style="color:#ffffff;"align=center>Contact Information: <a href="https://github.com/ShadowLim">GitHub Page</a></p >
            </div>
        </nav>
    </div>

</body>
</html>
