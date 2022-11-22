<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8"%>
<%@ page import="cn.lbj.forum.entity.UserEntity" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>查看用户信息</title>
    <link rel="stylesheet" type="text/css" href="css/message.css">

    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <style>
        .bk{
            background-image: url(http://mpic.tiankong.com/561/5d6/5615d6afeeaf9e8f4bef8367f0984a39/4251r-2786.jpg);
            background-repeat: no-repeat;
            background-size: 100% auto;
        }
    </style>

</head>

<body class="bk">
<nav class="navbar navbar-inverse" role="navigation"><!-- 顶部的菜单栏 -->
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href=ForumListServlet>「Fosu Forum」</a>
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

            <li><a href="TouristHomeServlet"><span class="glyphicon glyphicon-user"></span> 退出论坛</a></li>
        </ul>
    </div>
</nav>
<div  class="container"><!-- 中间的 -->
    <nav class="navbar navbar-default" role="navigation">
        <div class="panel panel-default">
            <div class="panel-body">
                <table class="table table-bordered">
                    <% UserEntity user=(UserEntity)request.getAttribute("user"); %>
                    <caption><b>「用户信息」</b></caption>
                    <tbody>
                        <tr>
                            <th><span class="glyphicon glyphicon-picture"></span>「用户头像」</th>
                            <td><img src="<%=user.getUser_face()%>"/></td>
                        </tr>
                        <tr>
                            <th><span class="glyphicon glyphicon-user"></span>「用户名」</th>
                            <td><%=user.getUser_name()%></td>
                        </tr>
                        <tr>
                            <th><span class="glyphicon glyphicon-stats"></span>「性别」</th>
                            <td><%=user.getUser_sex()%></td>
                        </tr>
                        <tr>
                            <th><span class="glyphicon glyphicon-phone"></span>「联系电话」</th>
                            <td><%=user.getUser_phone()%></td>
                        </tr>
                        <tr>
                            <th><span class="	glyphicon glyphicon-envelope"></span>「电子邮箱」</th>
                            <td><%=user.getUser_email()%></td>
                        </tr>
                        <tr>
                            <th><span class="glyphicon glyphicon-map-marker"></span>「地址」</th>
                            <td><%=user.getUser_from()%></td>
                        </tr>
                    </tbody>
                </table>
<%--                <button type="button" class="btn btn-primary" onclick="location.href='forumList'"  >返回</button>--%>
                <button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/ForumListServlet'"  >返回</button>
            </div>
        </div>
    </nav>
</div>

</body>
</html>
