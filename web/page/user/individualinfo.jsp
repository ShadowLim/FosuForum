<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="cn.lbj.forum.entity.*"%>
<%@ page import="cn.lbj.forum.entity.UserEntity" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>个人信息</title>
<link rel="stylesheet" type="text/css" href="css/message.css"> 
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
	<div class="container"><!-- 中间的 -->
		<nav class="navbar navbar-default" role="navigation">
			<div class="panel panel-default">
				<div class="panel-body" style="background: url(../../images/bg3.jpeg)">
					<table class="table table-bordered"  >
						<% UserEntity user = (UserEntity)request.getAttribute("userinfo"); %>
						<caption><b>「个人信息」</b></caption>
						<tbody>
						<tr>
							<th><span class="glyphicon glyphicon-picture"></span>「头像」</th>
							<td><img src="<%=user.getUser_face()%>"/></td>
						</tr>
						<tr>
							<th><span class="glyphicon glyphicon-tag"></span>「学号」</th>
							<td><%=user.getUser_id()%></td>
						</tr>
						<tr>
							<th><span class="glyphicon glyphicon-user"></span>「姓名」</th>
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
					<div class="form-group" align="center">
						<input type="button"  class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/page/user/updateinfo.jsp'" value="修改资料" class="button">
						<input type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/forumlist.jsp'" value="返回主页" class="button" >
					</div>
				</div>
			</div>
		</nav>
	</div>
</body>
</html>