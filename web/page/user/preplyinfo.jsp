<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,cn.lbj.forum.entity.*"%>
<%@ page import="cn.lbj.forum.entity.ForumEntity" %>
<%@ page import="cn.lbj.forum.entity.ReplyEntity" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看回复</title>
<link rel="stylesheet" type="text/css" href="css/forum.css">
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
  .bk{
    background-image: url(images/bg3.jpeg);
    /*background-repeat: no-repeat;*/
    background-size: 100% auto;
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
        <li><a href="${pageContext.request.contextPath}/fosuhobby.jsp"><span class="glyphicon glyphicon-flag"></span> 佛大周边</a></li>
        <li><a href="${pageContext.request.contextPath}/po.jsp"><span class="glyphicon glyphicon-user"></span> 数据报表</a></li>
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

  <div  class="container">
    <nav class="navbar navbar-default" role="navigation">
      <div>
        <img src="images/logo.png" class="img-circle">
      </div>
      <%
        ForumEntity forum = (ForumEntity)request.getAttribute("forum");
      %>
      <div class="panel panel-default">
        <div class="panel-body">
          <form name="form1" method="post" action="/ReplyServlet">
            <table class="table table-bordered">
              <tr class="ttr">
                <td width="95"><b>标题</b></td>
                <td width="397"><b><%=forum.getTitle() %></b></td>
              </tr>
              <tr class="ttr">
                <td><%=forum.getAuthor().getUser_name() %></td>
                <td>发表于&nbsp;&nbsp;<%=forum.getCreateTime() %></td>
              </tr>
              <tr class="ttr">
                <td height="92"><img src="<%=forum.getAuthor().getUser_face() %>" class="img-circle">
                </td>
                <td>&nbsp;<%=forum.getContent() %></td>
              </tr>
              <%
                List<ReplyEntity> replyList = forum.getReplyList();
                for(ReplyEntity reply : replyList){
              %>
              <tr class="ttr">
                <td><%=reply.getUser().getUser_name() %></td>
                <td>回复于&nbsp;&nbsp;<%=reply.getReplyTime() %></td>
              </tr>
              <tr class="ttr">
                <td height="101" class="td1"> <img src="<%=reply.getUser().getUser_face() %>" class="img-circle">
                  </td>
                <td class="td2">&nbsp;<%=reply.getContent() %><a href="UPdeleteReplyByIdServlet?rid=<%=reply.getRid() %>&fid=<%=forum.getFid() %>"> 「删除回帖」</a></td>
              </tr>
              <%} %>
            </table>
            <div class="form-group">
              <div class="col-sm-10">
                <BUTTON><a href="UPersonPageForumListServlet?uid=${user.user_id}">返回</a></BUTTON>
              </div>
            </div>
          </form>
        </div>
      </div>
    </nav>
  </div>

</body>
</html>