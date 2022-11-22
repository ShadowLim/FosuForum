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
		<form action="UPersonForumListByKeyWordServlet?uid=${user.user_id}&keyword=${pageContext.request.getParameter("keywords")}" method="post">
			<input type="text" placeholder="搜索..." name="keywords">
			<input type="submit" style="color: black; background-color: #288bc4" value="查询">
		</form>
	</div>


	<div class="container"><!-- 中间的 -->
		<nav class="navbar navbar-default" role="navigation">
			<%
				List<ForumEntity> pForumList = (List<ForumEntity>)request.getAttribute("perForumList");
			%>
		<table class="table table-bordered">
			<tr>
				<td>标题</td>
				<td>内容</td>
				<td>发帖时间</td>
				<td>操作</td>
			</tr>

		<% for (ForumEntity forumList : pForumList) {
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
					<button><a href="${pageContext.request.contextPath}/UPersonDeleteForumServlet?fid=<%=forumList.getFid()%>&uid=<%=forumList.getAuthor().getUser_id()%>" style="color: red">删除</a></button>
					<button><a href="UPfindReplyByIdServlet?fid=<%=forumList.getFid()%>" style="color: lightskyblue">查看</a></button>
				</td>
			</tr>
		<%} %>
		</table>

		<button style=""><a href="${pageContext.request.contextPath}/ForumListServlet">返回</a></button>
		</nav>


		<nav class="navbar navbar-default" role="navigation" style="text-align: center">

			<%

				pageContext.setAttribute("pageNum", pageList.getCurrentPage());
				pageContext.setAttribute("startPos", pageList.getStartRecord());
				pageContext.setAttribute("endPos", pageList.getStartRecord() + pageList.getRows());
				pageContext.setAttribute("totalPage", pageList.getTotalPage());
				request.setAttribute("rows", pageList.getRows());
			%>

			<%--        <p>--%>
			<%--            uid获取：<c:out value="<%=request.getAttribute(\"myuid\")%>"></c:out>--%>
			<%--        </p>--%>



			<ul class="pagination center">
				<a href="${pageContext.request.contextPath}/UPersonPageForumListServlet?uid=${user.user_id}&pageNum=1">「首页」</a>
				<%-- TODO 如果当前页为第一页时，就没有上一页这个超链接显示 --%>
				<c:if test="${pageNum == 1}">
					<c:forEach begin="${startPos+1}" end="${totalPage}" step="1" var="i">
						<c:if test="${pageNum == i}">
							「${i}」
						</c:if>
						<c:if test="${pageNum != i}">
							<a href="${pageContext.request.contextPath}/UPersonPageForumListServlet?uid=${user.user_id}&pageNum=${i}">「${i}」</a>
						</c:if>
					</c:forEach>
					<a href="${pageContext.request.contextPath}/UPersonPageForumListServlet?uid=${user.user_id}&pageNum=${pageNum+1}"
					   aria-label="Next">
						<span aria-hidden="true" style="font-size: 20px">&raquo;</span>
					</a>
				</c:if>

				<%-- TODO 如果当前页不是第一页也不是最后一页，则有上一页和下一页这个超链接显示 --%>
				<c:if test="${pageNum > 1 && pageNum < totalPage}">
					<a href="${pageContext.request.contextPath}/UPersonPageForumListServlet?uid=${user.user_id}&pageNum=${pageNum-1}"
					   aria-label="Previous">
						<span aria-hidden="true" style="font-size: 20px">&laquo;</span>
					</a>
					<c:forEach begin="${startPos}" end="${totalPage}" step="1" var="i">
						<c:if test="${pageNum == i}">
							「${i}」
						</c:if>
						<c:if test="${pageNum != i}">
							<a href="${pageContext.request.contextPath}/UPersonPageForumListServlet?uid=${user.user_id}&pageNum=${i}">「${i}」</a>
						</c:if>
					</c:forEach>
					<a href="${pageContext.request.contextPath}/UPersonPageForumListServlet?uid=${user.user_id}&pageNum=${pageNum+1}"
					   aria-label="Next">
						<span aria-hidden="true" style="font-size: 20px">&raquo;</span>
					</a>
				</c:if>

				<%-- TODO 如果当前页是最后一页，则只有上一页这个超链接显示，下一页没有 --%>
				<c:if test="${pageNum == totalPage}">
					<a href="${pageContext.request.contextPath}/UPersonPageForumListServlet?uid=${user.user_id}&pageNum=${pageNum-1}"
					   aria-label="Previous">
						<span aria-hidden="true" style="font-size: 20px">&laquo;</span>
					</a>
					<c:forEach begin="${startPos}" end="${totalPage}" step="1" var="i">
						<c:if test="${pageNum == i}">
							<button>「${i}」</button>
						</c:if>
						<c:if test="${pageNum != i}">
							<a href="${pageContext.request.contextPath}/UPersonPageForumListServlet?uid=${user.user_id}&pageNum=${i}">「${i}」</a>
						</c:if>
					</c:forEach>
				</c:if>

				<%-- TODO 尾页 --%>
				<a href="${pageContext.request.contextPath}/UPersonPageForumListServlet?uid=${user.user_id}&pageNum=${totalPage}">「尾页」</a>


				</br>

				<button><span style="font-size: 15px ;margin-left: 5px">总帖子数：<%=pageList.getTotalCount()%>条，共<%=pageList.getTotalPage()%>页</span></button>

			</ul>

		</nav>

	</div>


</body>
</html>