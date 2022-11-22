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
import java.util.List;

@SuppressWarnings("serial")
@WebServlet("/MdeleteUserStudyServlet")
public class MdeleteUserStudyServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String uid = req.getParameter("uid");
        String studyid = req.getParameter("sid");
        int sid =Integer.parseInt(studyid);

        StudyServiceInf service = new StudyServiceImpl();
        service.deleteStudyReplyBySid(sid);
        service.deleteStudyBySid(sid);


        List<StudyEntity> deleteStudyList = service.findStudyList();

        req.setAttribute("deleteStudyList", deleteStudyList);
        req.getRequestDispatcher("page/manager/deleteStudyList.jsp").forward(req, resp);


//        req.setAttribute("deleteStudyList", deleteStudyList);
//        req.getRequestDispatcher("studyListServlet").forward(req, resp);


//        req.setAttribute("uid", uid);
//        req.getRequestDispatcher("MSeeUserForumServlet").forward(req, resp);

    }
}
