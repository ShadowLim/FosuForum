package cn.lbj.forum.servlet;

import cn.lbj.forum.service.ForumServiceImpl;
import cn.lbj.forum.service.ForumServiceInf;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@SuppressWarnings("serial")
@WebServlet("/MdeleteUserForumServlet")
public class MdeleteUserForumServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String forumid = req.getParameter("fid");
        int fid = Integer.parseInt(forumid);
        String uid = req.getParameter("uid");

        ForumServiceInf service = new ForumServiceImpl();
        service.deleteReplyByFid(fid);
        service.deleteForumByFid(fid);

        req.setAttribute("uid", uid);
        req.getRequestDispatcher("MSeeUserForumServlet").forward(req, resp);
    }
}
