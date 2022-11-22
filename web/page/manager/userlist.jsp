<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="cn.lbj.forum.entity.UserEntity" %>
<%@ page import="java.util.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户信息列表</title>
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/background.css" />
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

		<li><a href="${pageContext.request.contextPath}/TouristHomeServlet"><span class="glyphicon glyphicon-user"></span> 退出论坛</a></li>
    </ul>
  </div>
</nav>
<div  class="container"><!-- 中间的 -->
	<nav class="navbar navbar-default" role="navigation">
		<% List<UserEntity> userList = (List<UserEntity>)request.getAttribute("userList");%>
		<table class="table table-bordered" style="width: 1200px;border-collapse: collapse">
			<tr>
				<th>学号</th>
				<th>姓名</th>
				<th>性别</th>
				<th>联系电话</th>
				<th>电子邮箱</th>
				<th>地址</th>
				<th>操作</th>
			</tr>

			<% for(UserEntity user: userList){ %>
			<tr>
				<td><%=user.getUser_id() %></td>
				<td><%=user.getUser_name() %></td>
				<td><%=user.getUser_sex() %></td>
				<td><%=user.getUser_phone() %></td>
				<td><%=user.getUser_email() %></td>
				<td><%=user.getUser_from() %></td>
				<td>
					<a href="MSeeUserForumServlet?uid=<%=user.getUser_id() %>">「查看发帖」</a>
					<a href="MdeleteUserServlet?uid=<%=user.getUser_id() %>">「注销」</a><br>
				</td>
			</tr>
			<%} %>

		</table>
		<button><a href="ForumListServlet">返回</a></button>
	</nav>
</div>

</body>
</html>