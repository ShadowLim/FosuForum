<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*,cn.lbj.forum.entity.*" %>
<%@ page import="cn.lbj.forum.entity.ForumEntity" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>个人帖子</title>
	<script type="text/javascript" src="../../js/jquery-1.11.2.js"></script>

	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
		<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style>
		.bk {
			background-image: url(../../images/bg3.jpeg);
			background-repeat: no-repeat;
			background-size: 100% auto;
		}

		body {
			font-family: Arial;
		}

		* {
			box-sizing: border-box;
		}

		form.example input[type=text] {
			padding: 10px;
			font-size: 17px;
			border: 1px solid grey;
			float: left;
			width: 80%;
			background: #f1f1f1;
		}

		form.example button {
			float: left;
			width: 20%;
			padding: 10px;
			background: #2196F3;
			color: white;
			font-size: 17px;
			border: 1px solid grey;
			border-left: none;
			cursor: pointer;
		}

		form.example button:hover {
			background: #0b7dda;
		}

		form.example::after {
			content: "";
			clear: both;
			display: table;
		}
		/*不换行*/
		.mynowarp{
			display:inline;
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
		  	<li><a href="TouristHomeServlet"><span class="glyphicon glyphicon-user"></span> 退出论坛</a></li>
		</ul>
	  </div>
	</nav>

	<div class="container" style="position:relative; left: 910px">
		<script type="text/javascript">
			function query(getkw) {
				var kw = ${pageContext.request.getParameter("keywords")};
				// console.log(getkw);
				alert(getkw);
				window.location.href="UPersonForumListByKeyWordServlet?uid=${user.user_id}&keywords=" + getkw;
			}
		</script>

		<form name="myform" action="UPersonForumListByKeyWordServlet?uid=${user.user_id}" method="post">
<%--		<form name="myform" action="UPersonForumListByKeyWordServlet?uid=${user.user_id}&keyword=${pageContext.request.getParameter("keywords")}" method="post">--%>
			<input class="mynowarp" type="text" placeholder="搜索..." name="keywords">
<%--				<button onclick="query(${pageContext.request.getParameter("keyword")})">查询</button>--%>
			<input class="mynowarp" type="submit" style="color: black; background-color: #288bc4" value="查询">
		</form>

<%--		<input type="text" placeholder="搜索..." name="keyword" id="kw">--%>

<%--		<script type="text/javascript">--%>
<%--			var getValue1 = document.getElementById("kw")--%>
<%--			var getValue = $("input[name='keyword']").val();--%>
<%--		</script>--%>

<%--		<script type="text/javascript">--%>
<%--			function query(getkw) {--%>
<%--				// console.log(getkw);--%>
<%--				alert(getkw);--%>
<%--				window.location.href="UPersonForumListByKeyWordServlet?uid=${user.user_id}&keywords=" + getkw;--%>
<%--			}--%>
<%--		</script>--%>

<%--		<button onclick="query(getValue)">查询</button>--%>
	</div>


	<div class="container">
		<nav class="navbar navbar-default" role="navigation">
			<% List<ForumEntity> pForumListByKeyWord = (List<ForumEntity>)request.getAttribute("perForumListByKeyWord"); %>
			<table class="table table-bordered">
				<tr>
					<td>标题</td>
					<td>内容</td>
					<td>发帖时间</td>
					<td>操作</td>
				</tr>

				<% for (ForumEntity forumList : pForumListByKeyWord) {
					String content = forumList.getContent();
					String showContent = "";
					if (content.length() > 20) {
						showContent = content.substring(0, 20) + ".......";
					} else {
						showContent = content;
					}
				%>
				<tr>
					<td><%=forumList.getTitle() %></td>
					<td><%=showContent%></td>
					<td><%=forumList.getCreateTime() %></td>
					<td>
						<button><a href="UPfindReplyByIdServlet?fid=<%=forumList.getFid()%>" style="color: lightskyblue">查看</a></button>
						<button><a href="${pageContext.request.contextPath}/UPersonDeleteForumServlet?fid=<%=forumList.getFid()%>&uid=<%=forumList.getAuthor().getUser_id()%>" style="color: red">删除</a></button>
					</td>
				</tr>
				<%} %>
			</table>

			<button><a href="${pageContext.request.contextPath}/ForumListServlet">返回</a></button>
		</nav>
	</div>


</body>
</html>