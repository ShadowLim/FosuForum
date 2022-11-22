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
@WebServlet("/TouristStudyReplyListServlet")
public class TouristStudyReplyListServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");

        int sid = Integer.parseInt(req.getParameter("sid"));

        StudyServiceInf service = new StudyServiceImpl();
        StudyEntity touristStudy = service.findStudyReplyList(sid);
        req.setAttribute("touristStudy", touristStudy);

        req.getRequestDispatcher("touristStudyReply.jsp").forward(req, resp);
    }
}
