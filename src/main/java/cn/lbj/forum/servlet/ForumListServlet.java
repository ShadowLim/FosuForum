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
import java.util.List;

@SuppressWarnings("serial")
@WebServlet("/ForumListServlet")
public class ForumListServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        ForumServiceInf service = new ForumServiceImpl();
        List<ForumEntity> forumList = service.findForumList();

        req.setAttribute("forumList", forumList);
        req.getRequestDispatcher("forumlist.jsp").forward(req, resp);
    }
}
