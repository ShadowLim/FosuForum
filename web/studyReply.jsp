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
            /*background-repeat: no-repeat;*/
            background-size: 100% auto;
            /*background-size:cover;*/
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

            <li><a href="${pageContext.request.contextPath}/TouristHomeServlet"><span class="glyphicon glyphicon-user"></span> 退出论坛</a></li>
        </ul>
    </div>
</nav>
<div class="container">
    <nav class="navbar navbar-default" role="navigation">
        <div>
            <img src="images/logo.png" class="img-circle">

            <%
                UserEntity getUser = (UserEntity)request.getSession().getAttribute("user");
                int userId = getUser.getUser_id();
                System.out.println("学习帖子发表用户userId为：" + userId);
            %>
            <script type="text/javascript">
                function judge() {
                    var currentUid = ${user.user_id};
                    var userId = '<%=userId%>';
                    var flag = false;
                    if (currentUid == userId) {
                        flag = true;
                    }
                    return flag;
                }
            </script>

            <span style="font-size:24px">欢迎你，${user.user_name}</span>
            <%
                StudyEntity getStudy = (StudyEntity) request.getAttribute("study");
                int user_id = getStudy.getAuthor().getUser_id();    // 查看的帖子的发表用户
                System.out.println("学习帖子发表用户：" + user_id);
            %>

            <%
                UserEntity user = (UserEntity)request.getSession().getAttribute("user");
                int uid = user.getUser_id();
                System.out.println("当前用户uid为：" + uid);

//                <script>judge()</script>
//                out.println("<script>judge()</script>");

                if(user.getIsAdmin() == 1 || uid == user_id){
            %>


            <script type="text/javascript">
                function isCurrentUser() {
                    var currentUid = ${user.user_id};
                    // alert("当前用户id:" + currentUid)
                    var uid = '<%=uid%>';
                    var flag = false;
                    if (currentUid == uid) {
                        flag = true;
                    }
                    if (flag) {
                        // alert("准备跳转")
                        alert("删除成功！")
                        <%--<a href="MdeleteUserForumServlet?fid=<%=forumList.getFid()%>&uid=<%=forumList.getAuthor().getUser_id()%>">「删帖」</a>--%>
                        window.location.href = "MdeleteUserStudyServlet?sid=<%=getStudy.getSid()%>&uid=<%=getStudy.getAuthor().getUser_id()%>";
                        // window.location.href = "page/manager/deleteStudyList.jsp";
                        // alert("跳转成功")
                    }
                }
            </script>


            <button style="color: #288bc4">
                <a href="javascript:void(0)" onclick="isCurrentUser()">
<%--                <a href="${pageContext.request.contextPath}/page/manager/deleteStudyList.jsp">--%>
                    「删除本帖」
                </a>
            </button>
            <%} %>
        </div>



        <%
            StudyEntity study = (StudyEntity) request.getAttribute("study");
        %>


        <div class="panel panel-default">
            <div class="panel-body">
                <form name="form1" method="post" action="StudyReplyServlet">
                    <table class="table table-bordered"  >
                        <tr class="ttr">
                            <td width="95"><b>标题</b></td>
                            <td width="397"><b><%=study.getTitle() %></b></td>
                        </tr>
                        <tr class="ttr">
                            <td><%=study.getAuthor().getUser_name() %></td>
                            <td>发表于&nbsp;&nbsp;<%=study.getCreateTime() %></td>
                        </tr>
                        <tr class="ttr">
                            <td height="92"><img src="<%=study.getAuthor().getUser_face() %>" class="img-circle">
                            </td>
                            <td>&nbsp;<%=study.getContent() %></td>
                        </tr>
                        <%
                            List<StudyReplyEntity> replyList = study.getStudyReplyList();
                            for(StudyReplyEntity reply : replyList){
                        %>

                        <script type="text/javascript">
                            function isCurrentUser1() {
                                var currentUid = ${user.user_id};
                                // alert("当前用户id:" + currentUid)
                                var uid = '<%=uid%>';
                                var flag = false;
                                if (currentUid == uid) {
                                    flag = true;
                                }
                                if (flag) {
                                    // alert("准备跳转")
                                    alert("删除成功！")
                                    window.location.href = "UPdeleteStudyReplyByIdServlet?rid=<%=reply.getRid() %>&sid=<%=study.getSid() %>";
                                    // alert("跳转成功")
                                }
                            }
                        </script>

                        <tr class="ttr">
                            <td><%=reply.getUser().getUser_name() %></td>
                            <td>回复于&nbsp;&nbsp;<%=reply.getStudyReplyTime() %></td>
                        </tr>
                        <tr class="ttr">
                            <td height="101" class="td1"> <img src="<%=reply.getUser().getUser_face() %>" class="img-circle">
                            </td>
                            <td class="td2">&nbsp;<%=reply.getContent() %>
                                <%
                                    if(uid == user_id){
                                %>
                                <a href="javascript:void(0)" onclick="isCurrentUser1()">
                                    「删除回帖」
                                </a>
                            </td>
                            <%} %>
                        </tr>
                        <%} %>
                    </table>

                    <div class="form-group">
                        <div class="col-sm-10">
                            <textarea class="form-control" rows="5" name="content"></textarea>
                            <button type="submit" name="Submit" value="回复" class="btn btn-default">回复</button>
                            <button type="button" value="返回" onclick="location.href='${pageContext.request.contextPath}/StudyListServlet'" class="btn btn-default">返回</button>
                            <input type="hidden" name="sid" value="<%=study.getSid()%>"/>
                            <!-- TODO 回复人就是当前登录的用户 -->
                            <%UserEntity replyUser = (UserEntity)session.getAttribute("user"); %>
                            <input type="hidden" name="uid" value="<%=replyUser.getUser_id()%>"/>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </nav>
</div>

</body>
</html>
