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
@WebServlet("/StudyListServlet")
public class StudyListServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        StudyServiceInf service = new StudyServiceImpl();
        List<StudyEntity> studyList = service.findStudyList();

        req.setAttribute("studyList", studyList);
        req.getRequestDispatcher("studyList.jsp").forward(req, resp);
    }
}
