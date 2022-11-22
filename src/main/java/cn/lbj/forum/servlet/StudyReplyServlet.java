package cn.lbj.forum.servlet;

import cn.lbj.forum.entity.StudyEntity;
import cn.lbj.forum.entity.StudyReplyEntity;
import cn.lbj.forum.entity.UserEntity;
import cn.lbj.forum.service.StudyServiceImpl;
import cn.lbj.forum.service.StudyServiceInf;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@SuppressWarnings("serial")
@WebServlet("/StudyReplyServlet")
public class StudyReplyServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");

        int sid = Integer.parseInt(req.getParameter("sid"));
        int uid = Integer.parseInt(req.getParameter("uid"));
        String replyContent = req.getParameter("content");

        StudyEntity study = new StudyEntity();
        study.setSid(sid);

        UserEntity user = new UserEntity();
        user.setUser_id(uid);

        StudyReplyEntity reply = new StudyReplyEntity();
        reply.setStudy(study);
        reply.setUser(user);
        reply.setContent(replyContent);
        reply.setStudyReplyTime(new java.sql.Timestamp(new java.util.Date().getTime()));

        StudyServiceInf service = new StudyServiceImpl();
        service.createStudyReply(reply);

        resp.sendRedirect("StudyReplyListServlet?sid=" + sid);
    }
}

