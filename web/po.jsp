<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ page import="cn.lbj.forum.entity.UserEntity" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>报表统计</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/forum.css">

    <style type="text/css">
        myul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            width: 25%;
            background-color: #f1f1f1;
            position: fixed;
            height: 100%;
            overflow: auto;
        }

        .bk{
            background-image: url(https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1511274382471&di=65c54247e54e9895084042b3e3da5ba1&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2Fe850352ac65c10387071c8f8b9119313b07e89f8.jpg);
            background-repeat: no-repeat;
            background-size: 140% 140%;
        }

        myli a {
            display: block;
            color: #000;
            padding: 8px 16px;
            text-decoration: none;
        }

        myli a.active {
            background-color: #4CAF50;
            color: white;
        }

        myli a:hover:not(.active) {
            background-color: #555;
            color: white;
        }
    </style>

</head>

<body class="bk">

<div>
    <nav class="navbar navbar-inverse" role="navigation">   <!-- TODO 顶部的菜单栏 -->
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

    <!--  TODO 子级导航栏 -->
    <div>
        <myul class="nav navbar-nav navbar-right">
            <myli><a href="${pageContext.request.contextPath}/ReleaseCntByDatePoServlet?uid=${user.user_id}"><span class="	glyphicon glyphicon-signal"></span> 发帖统计</a></myli>
            <myli><a href="${pageContext.request.contextPath}/ReplyCntTop5PoServlet?uid=${user.user_id}"><span class="	glyphicon glyphicon-signal"></span> 回帖统计</a></myli>
            <myli><a href="${pageContext.request.contextPath}/StudyReleaseCntByDatePoServlet?uid=${user.user_id}"><span class="	glyphicon glyphicon-signal"></span> 学习专区发帖统计</a></myli>
            <myli><a href="${pageContext.request.contextPath}/StudyReplyCntTop5PoServlet?uid=${user.user_id}"><span class="	glyphicon glyphicon-signal"></span> 学习专区回帖统计</a></myli>
            <%
                UserEntity curUser = (UserEntity)request.getSession().getAttribute("user");
                if(curUser.getIsAdmin() == 1){
            %>
            <myli><a href="${pageContext.request.contextPath}/ForumCntByUserTop5PoServlet?uid=${user.user_id}"><span class="	glyphicon glyphicon-signal"></span> 普通用户发帖统计</a></myli>
            <myli><a href="${pageContext.request.contextPath}/StudyCntByUserTop5PoServlet?uid=${user.user_id}"><span class="glyphicon glyphicon-signal"></span> 普通用户学习发帖统计</a></myli>

            <%} %>
        </myul>
    </div>

</div>


</body>
</html>
