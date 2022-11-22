package cn.lbj.forum.servlet;

import cn.lbj.forum.entity.StudyEntity;
import cn.lbj.forum.service.StudyServiceImpl;
import cn.lbj.forum.service.StudyServiceInf;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@SuppressWarnings("serial")
@WebServlet("/StudyReplyListServlet")
public class StudyReplyListServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");

        int sid = Integer.parseInt(req.getParameter("sid"));

        StudyServiceInf service = new StudyServiceImpl();
        StudyEntity study = service.findStudyReplyList(sid);
        req.setAttribute("study", study);

        req.getRequestDispatcher("studyReply.jsp").forward(req, resp);
    }
}
