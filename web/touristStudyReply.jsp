<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.List,cn.lbj.forum.entity.*"%>
<%@ page import="cn.lbj.forum.entity.UserEntity" %>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>回复信息</title>
    <link rel="stylesheet" type="text/css" href="css/forum.css">
    <style>
        .replytable{
            margin-left:50px;
        }
    </style>
    <style>
        .bk{
            background-image: url(images/bg3.jpeg);
            background-repeat: no-repeat;
            /*background-size: 100% auto;*/
            background-size:cover;
        }
    </style>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body class="bk">
<nav class="navbar navbar-inverse" role="navigation">
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
<div class="container">
    <nav class="navbar navbar-default" role="navigation">
        <div>
            <img src="images/logo.png" class="img-circle">
        </div>
        <%
            StudyEntity touristStudy = (StudyEntity) request.getAttribute("touristStudy");
        %>
        <div class="panel panel-default">
            <div class="panel-body">
                <form name="form1" method="post" action="TouristStudyReplyServlet">
                    <table class="table table-bordered"  >
                        <tr class="ttr">
                            <td width="95">标题</td>
                            <td width="397"><%=touristStudy.getTitle() %></td>
                        </tr>
                        <tr class="ttr">
                            <td><%=touristStudy.getAuthor().getUser_name() %></td>
                            <td>发表于&nbsp;&nbsp;<%=touristStudy.getCreateTime() %></td>
                        </tr>
                        <tr class="ttr">
                            <td height="92"><img src="<%=touristStudy.getAuthor().getUser_face() %>" class="img-circle">
                            </td>
                            <td>&nbsp;<%=touristStudy.getContent() %></td>
                        </tr>
                        <%
                            List<StudyReplyEntity> replyList = touristStudy.getStudyReplyList();
                            for(StudyReplyEntity reply : replyList){
                        %>
                        <tr class="ttr">
                            <td><%=reply.getUser().getUser_name() %></td>
                            <td>回复于&nbsp;&nbsp;<%=reply.getStudyReplyTime() %></td>
                        </tr>
                        <tr class="ttr">
                            <td height="101" class="td1"> <img src="<%=reply.getUser().getUser_face() %>" class="img-circle">
                            </td>
                            <td class="td2">&nbsp;<%=reply.getContent() %></td>
                        </tr>
                        <%} %>
                    </table>

                    <div class="form-group">
                        <div class="col-sm-10">
                            <p align="center">您还没有登录，暂时无法回复！&nbsp&nbsp&nbsp<a href="login.jsp">请登录</a></p>
                        </div>

                       <div class="col-sm-5">
                           <button type="button" value="返回" onclick="location.href='${pageContext.request.contextPath}/TouristStudyListServlet'" class="btn btn-default">返回</button>
                           <input type="hidden" name="sid" value="<%=touristStudy.getSid()%>"/>
                       </div>
                    </div>

                </form>
            </div>
        </div>
    </nav>
</div>

</body>
</html>
