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
import java.io.PrintWriter;

@SuppressWarnings("serial")
@WebServlet("/UPfindReplyByIdServlet")
public class UPfindReplyByIdServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String forumid = req.getParameter("fid");

        if (forumid == null) {
            String fid = (String)req.getAttribute("forumid");
            int f_id = Integer.parseInt(fid);

            PrintWriter out= resp.getWriter();
            out.println(f_id + "ewrew");

            ForumServiceInf service = new ForumServiceImpl();
            //查询所有的回复
            ForumEntity forum = service.findReplyList(f_id);
            req.setAttribute("forum", forum);
            req.getRequestDispatcher("page/user/preplyinfo.jsp").forward(req, resp);

        } else {

            int fid = Integer.parseInt(forumid);

            PrintWriter out = resp.getWriter();
            out.println(fid + "ewrew");

            ForumServiceInf service = new ForumServiceImpl();
            //查询所有的回复
            ForumEntity forum = service.findReplyList(fid);
            req.setAttribute("forum", forum);
            req.getRequestDispatcher("page/user/preplyinfo.jsp").forward(req, resp);
        }
    }
}
