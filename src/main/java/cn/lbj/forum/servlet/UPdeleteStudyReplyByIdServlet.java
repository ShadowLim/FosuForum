package cn.lbj.forum.servlet;

import cn.lbj.forum.service.StudyServiceImpl;
import cn.lbj.forum.service.StudyServiceInf;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@SuppressWarnings("serial")
@WebServlet("/UPdeleteStudyReplyByIdServlet")
public class UPdeleteStudyReplyByIdServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String replyid = req.getParameter("rid");
        int rid = Integer.parseInt(replyid);
        String studyid = req.getParameter("sid");

        StudyServiceInf service = new StudyServiceImpl();
        service.deleteStudyReplyByRid(rid);

//        req.setAttribute("studyid", studyid);
//        req.getRequestDispatcher("UPfindStudyReplyByIdServlet").forward(req, resp);

        resp.sendRedirect("StudyReplyListServlet?sid=" + studyid);

    }
}

