package cn.lbj.forum.servlet;

import cn.lbj.forum.entity.ForumEntity;
import cn.lbj.forum.service.ForumServiceImpl;
import cn.lbj.forum.service.ForumServiceInf;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@SuppressWarnings("serial")
@WebServlet("/TouristFindReplyServlet")
public class TouristFindReplyServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        int fid = Integer.parseInt(req.getParameter("fid"));
        ForumServiceInf service = new ForumServiceImpl();
        // TODO 查询所有的回复
        ForumEntity forum = service.findReplyList(fid);
        req.setAttribute("forum", forum);
        req.getRequestDispatcher("page/tourist/replyinfo.jsp").forward(req, resp);
    }
}
