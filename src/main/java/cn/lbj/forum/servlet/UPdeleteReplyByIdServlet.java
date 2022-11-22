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
@WebServlet("/UPdeleteReplyByIdServlet")
public class UPdeleteReplyByIdServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String replyid = req.getParameter("rid");
        int rid = Integer.parseInt(replyid);
        String forumid = req.getParameter("fid");

        ForumServiceInf service = new ForumServiceImpl();
        service.deleteReplyByRid(rid);

        req.setAttribute("forumid", forumid);
        req.getRequestDispatcher("UPfindReplyByIdServlet").forward(req, resp);
    }
}

