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
@WebServlet("/UPersonDeleteForumServlet")
public class UPersonDeleteForumServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

//		PrintWriter out = resp.getWriter();
//		out.println(forumid);

        String forumid = req.getParameter("fid");
        int fid = Integer.parseInt(forumid);
        String uid = req.getParameter("uid");

//		int userid = Integer.parseInt(uid);
//		out.println(userid);

        ForumServiceInf service = new ForumServiceImpl();
        service.deleteReplyByFid(fid);
        service.deleteForumByFid(fid);

        req.getRequestDispatcher("UPersonPageForumListServlet").forward(req, resp);
//        req.getRequestDispatcher("UPersonForumListServlet").forward(req, resp);
    }
}

