<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="cn.lbj.forum.entity.*"%>
<%@ page import="cn.lbj.forum.entity.ForumEntity" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>查看用户发帖情况</title>
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
		<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<style>
	.bk{
		background-image: url(../../images/bg3.jpeg);
		background-repeat: no-repeat;
		background-size: 100% auto;
	}
	</style>
</head>

<body class="bk">
	<nav class="navbar navbar-inverse" role="navigation"><!-- 顶部的菜单栏 -->
	  <div class="container-fluid">
		<div class="navbar-header">
		  <a class="navbar-brand" href="/ForumListServlet">「Fosu Forum」</a>
		</div>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="${pageContext.request.contextPath}/fosuhobby.jsp"><span class="glyphicon glyphicon-flag"></span> 佛大周边</a></li>
			<li><a href="${pageContext.request.contextPath}/po.jsp"><span class="glyphicon glyphicon-user"></span> 数据报表</a></li>
			<li><a href="StudyListServlet"><span class="glyphicon glyphicon-edit"></span> 考研学习</a></li>
		 	<li><a href="${pageContext.request.contextPath}/UserInfoServlet?uid=${user.user_id}"><span class="glyphicon glyphicon-user"></span> 个人信息</a></li>
		 	<li><a href="${pageContext.request.contextPath}/UPersonPageForumListServlet?uid=${user.user_id}"><span class="glyphicon glyphicon-book"></span> 我的帖子</a></li>
		 	<li><a href="${pageContext.request.contextPath}/TouristHomeServlet"><span class="glyphicon glyphicon-user"></span> 退出论坛</a></li>
		</ul>
	  </div>
	</nav>
	<div class="container"><!-- 中间的 -->
		<nav class="navbar navbar-default" role="navigation">
			<% List<ForumEntity> list = (List<ForumEntity>)request.getAttribute("forum");%>
			<table class="table table-bordered">
				<tr>
					<th>标题</th>
					<th>内容</th>
					<th>发帖时间</th>
					<th>操作</th>
				</tr>

				<% for (ForumEntity forumList : list) {
					String content = forumList.getContent();
					String showContent = "";
					if (content.length() > 20) {
						showContent = content.substring(0, 20) + ".......";
					} else {
						showContent = content;
					}
				%>
				<tr>
					<td><%=forumList.getTitle()%></td>
					<td><%=showContent%></td>
					<td><%=forumList.getCreateTime()%></td>
					<td><a href="MdeleteUserForumServlet?fid=<%=forumList.getFid()%>&uid=<%=forumList.getAuthor().getUser_id()%>">「删帖」</a></td>
				<% }%>
				</tr>
			</table>

			<button style=""><a href="${pageContext.request.contextPath}/MUserListServlet">返回</a></button>

		</nav>
	</div>
</body>
</html>