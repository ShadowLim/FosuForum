<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ page import="java.util.List,cn.lbj.forum.entity.*" %>
<%@ page import="cn.lbj.forum.entity.ForumEntity" %>
<%@ page import="cn.lbj.forum.entity.UserEntity" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>考研学习</title>
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
        /* 头部标题 */
        .header {
            padding: 30px;
            text-align: center;
            background: white;
        }

        .header h1 {
            font-size: 50px;
        }

        /* 导航条 */
        .topnav {
            overflow: hidden;
            background-color: #96bef0;
            text-indent: 186px;     /* 导航栏选项之间的间距  */
            display: inline-block;
            text-align: center;
        }

        /* 导航条链接 */
        .topnav a {
            float: left;
            display: inline-block;
            color: #f2f2f2;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
            text-align: center;
        }

        /* 链接颜色修改 */
        .topnav a:hover {
            background-color: #ddd;
            color: black;
        }

        /* 创建两列 */
        /* Left column */
        .leftcolumn {
            float: left;
            width: 85%;
        }

        /* 右侧栏 */
        .rightcolumn {
            float: left;
            width: 15%;
            background-color: white;
            padding-left: 0px;
            position: relative;
        }

        /* 左栏图像部分 */
        .leftfakeimg {
            background-color: #aaa;
            width: 100%;
            padding: 0px;
        }

        /* 右栏图像部分 */
        .rightfakeimg {
            background-color: #aaa;
            width: 20%;
            padding: 0px;
            float: left;
            height: 80%;
        }

        /*右栏文章介绍 */
        .intro {
            float:right;
            width:60%;
        }

        /* 文章卡片效果 */
        .card {
            background-color: white;
            padding: 20px;
            margin-top: 20px;
        }

        /* 热门文章卡片效果 */
        .cpcard {
            background-color: white;
            padding: 20px;
            margin-top: 20px;
            height: 80px;
        }

        /* 列后面清除浮动 */
        .row:after {
            content: "";
            display: table;
            clear: both;
        }

        /* 底部 */
        .footer {
            padding: 20px;
            text-align: center;
            background: #ddd;
            margin-top: 20px;
        }

        /* 响应式布局 - 屏幕尺寸小于 800px 时，两列布局改为上下布局 */
        @media screen and (max-width: 800px) {
            .leftcolumn, .rightcolumn {
                width: 100%;
                padding: 0;
            }
        }

        /* 响应式布局 -屏幕尺寸小于 400px 时，导航等布局改为上下布局 */
        @media screen and (max-width: 400px) {
            .topnav a {
                float: none;
                width: 100%;
            }
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
            <a class="navbar-brand" href="TouristHomeServlet">「Fosu Forum」</a>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="touristFosuhobby.jsp"><span class="glyphicon glyphicon-flag"></span> 佛大周边</a></li>
            <li><a href="touristPo.jsp"><span class="glyphicon glyphicon-user"></span> 数据报表</a></li>
            <li><a href="TouristStudyListServlet"><span class="glyphicon glyphicon-edit"></span> 考研学习</a></li>
            <li><a href="register.jsp"><span class="glyphicon glyphicon-user"></span> 注册</a></li>
            <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
        </ul>
    </div>
</nav>

<div class="header">
    <h1>Fosu学习专区</h1>
    <h3><b>Talk is cheap, show me the code!</b></h3>
</div>

<div class="container">
        <div class="leftcolumn">
            <div class="panel-body">
            <%
                // TODO 从作用域取出帖子列表,进行循环遍历
                List<StudyEntity> list = (List<StudyEntity>)request.getAttribute("touristStudyList");
                if (list == null) {
                    out.println("恭喜您是第一个新用户，赶紧去发帖吧！");
                } else {
                    for(StudyEntity study : list) {
                        // TODO /MyForum/images/cover/002.png
                        String cover = study.getCover();
                        int startIdx = cover.lastIndexOf('/');
//                        System.out.println("startIdx:" + startIdx);
                        String url = cover.substring(startIdx + 1);
                        String realCoverURL = "images/cover/" + url;

                        String prefixContent = "";
                        if (study.getContent().length() > 20) {
                            prefixContent = study.getContent().substring(0, 20) + "...";
                        } else {
                            prefixContent = study.getContent();
                        }
            %>

            <a href="TouristStudyReplyListServlet?sid=<%=study.getSid()%>"> <h2><%=study.getTitle()%></h2> </a>

            <p>
                Created By
                <a href="TouristFindUserByIdServlet?uid=<%=study.getAuthor().getUser_id()%>">
                    <%=study.getAuthor().getUser_name()%>
                </a>
                <img src="<%=study.getAuthor().getUser_face() %> " class="img-circle">
                On
                <%=study.getCreateTime()%>
            </p>

            <div class="leftfakeimg" style="height:200px;">
                <img src=<%=realCoverURL%> width="1120" height="200">
            </div>

            <p><%=prefixContent%></p>

            <%}}%>
        </div>

        </div>


<%--    <div class="container">--%>
        <div class="rightcolumn">
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <a href="${pageContext.request.contextPath}/TouristStudy.jsp">
                        <button type="submit" class="btn btn-default" width="100px" style="background-color: #bcdff1">发表学习专帖</button>
                    </a>
                </div>
            </div>
        </div>
<%--    </div>--%>

    <button onclick="topFunction()" id="myBtn" title="回顶部">返回顶部</button>
    <script>
        // TODO 当网页向下滑动 20px 出现"返回顶部" 按钮
        window.onscroll = function() {scrollFunction()};

        function scrollFunction() {console.log(121);
            if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                document.getElementById("myBtn").style.display = "block";
            } else {
                document.getElementById("myBtn").style.display = "none";
            }
        }

        // TODO 点击按钮，返回顶部
        function topFunction() {
            document.body.scrollTop = 0;
            document.documentElement.scrollTop = 0;
        }
    </script>

</div>


<div id="footer">
    <nav class="navbar navbar-inverse navbar-staic-bottom" style="border-radius: 4px;padding-top:30px;margin-bottom:0px;height:100px;">
        <div class="navbar-inner navbar-content-center">
            <p style="color:#ffffff;"align=center>© 2022 Fosu_20BigData_lbj, Create </p >
            <p style="color:#ffffff;"align=center>Contact Information: <a href="https://github.com/ShadowLim">GitHub Page</a></p >
        </div>
    </nav>
</div>

</body>
</html>

