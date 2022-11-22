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
@WebServlet("/TouristStudyListServlet")
public class TouristStudyListServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        StudyServiceInf service = new StudyServiceImpl();
        List<StudyEntity> touristStudyList = service.findStudyList();

        req.setAttribute("touristStudyList", touristStudyList);
        req.getRequestDispatcher("touristStudyList.jsp").forward(req, resp);
    }
}
