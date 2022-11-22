package cn.lbj.forum.servlet;

import cn.lbj.forum.entity.ForumEntity;
import cn.lbj.forum.entity.ReplyEntity;
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
@WebServlet("/ReplyServlet")
public class ReplyServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");

        int fid = Integer.parseInt(req.getParameter("fid"));
        int uid = Integer.parseInt(req.getParameter("uid"));
        String replyContent = req.getParameter("content");

        ForumEntity forum = new ForumEntity();
        forum.setFid(fid);

        UserEntity user = new UserEntity();
        user.setUser_id(uid);

        ReplyEntity reply = new ReplyEntity();
        reply.setForum(forum);
        reply.setUser(user);
        reply.setContent(replyContent);
        reply.setReplyTime(new java.sql.Timestamp(new java.util.Date().getTime()));

        ForumServiceInf service = new ForumServiceImpl();
        service.createReply(reply);

//        resp.sendRedirect("replyList?fid=" + fid);
        resp.sendRedirect("ReplyListServlet?fid=" + fid);
    }
}

