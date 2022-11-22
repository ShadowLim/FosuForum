<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ page import="java.util.List,cn.lbj.forum.entity.*" %>
<%@ page import="cn.lbj.forum.entity.ForumEntity" %>
<%@ page import="cn.lbj.forum.entity.UserEntity" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>发表学习专帖</title>
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
            width: 75%;
        }

        /* 右侧栏 */
        .rightcolumn {
            float: left;
            width: 25%;
            background-color: #f1f1f1;
            padding-left: 0px;
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

<div class="header">
    <h1>Fosu学习专区</h1>
    <h3><b>Talk is cheap, show me the code!</b></h3>
</div>



<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title"><b>「发表学习专帖」</b></h3>
        </div>
        <div class="panel-body">
            <form class="form-horizontal" role="form" name="form1" method="post" action="StudyReleaseServlet">
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
                        <textarea class="form-control" id="name" rows="10" name="content"></textarea></div>
                </div>

                <div class="form-group">
                    <label for="textface" class="col-sm-2 control-label">封面</label>
                    <div class="col-sm-10">
                        <div>
                            <img src="${pageContext.request.contextPath}/images/cover/001.jpg" width="920" height="200" id="textface">
                        </div>

                        <select class="form-control" placeholder=".col-lg-4" name="cover" onchange="document.images['textface'].src=options[selectedIndex].value;">
                            <option value="${pageContext.request.contextPath}/images/cover/001.jpg">cover1</option>
                            <option value="${pageContext.request.contextPath}/images/cover/002.png">cover2</option>
                            <option value="${pageContext.request.contextPath}/images/cover/003.jpg">cover3</option>
                            <option value="${pageContext.request.contextPath}/images/cover/004.jpg">cover4</option>
                            <option value="${pageContext.request.contextPath}/images/cover/005.jpg">cover5</option>
                            <option value="${pageContext.request.contextPath}/images/cover/006.jpg">cover6</option>
                            <option value="${pageContext.request.contextPath}/images/cover/007.jpg">cover7</option>
                            <option value="${pageContext.request.contextPath}/images/cover/008.jpg">cover8</option>
                            <option value="${pageContext.request.contextPath}/images/cover/009.jpg">cover9</option>
                            <option value="${pageContext.request.contextPath}/images/cover/010.jpg">cover10</option>
                            <option value="${pageContext.request.contextPath}/images/cover/011.jpg">cover11</option>
                            <option value="${pageContext.request.contextPath}/images/cover/012.jpg">cover12</option>
                            <option value="${pageContext.request.contextPath}/images/cover/013.jpg">cover13</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-default" width="100px">
                            <a href="StudyListServlet" style="color: black">
                                返回
                            </a>
                        </button>
                        <button type="submit" class="btn btn-default" width="100px">发表</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

</body>

</html>
