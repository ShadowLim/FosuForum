package cn.lbj.forum.servlet;

import cn.lbj.forum.entity.ForumEntity;
import cn.lbj.forum.entity.UserEntity;
import cn.lbj.forum.service.ForumServiceImpl;
import cn.lbj.forum.service.ForumServiceInf;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@SuppressWarnings("serial")
@WebServlet("/ReleaseServlet")
public class ReleaseServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");

        String title = req.getParameter("title");
        String content = req.getParameter("content");

        UserEntity user = (UserEntity)req.getSession().getAttribute("user");

        ForumEntity forum = new ForumEntity();
        forum.setTitle(title);
        forum.setContent(content);
        forum.setAuthor(user);
        forum.setCreateTime(new java.sql.Timestamp(new java.util.Date().getTime()));
        ForumServiceInf service = new ForumServiceImpl();
        service.createForum(forum);
        resp.sendRedirect("ForumListServlet");
    }
}
