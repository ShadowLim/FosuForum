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
import java.util.ArrayList;
import java.util.List;


@WebServlet("/UPersonForumListServlet")
@SuppressWarnings("serial")
public class UPersonForumListServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String user_id = req.getParameter("uid");

        if (user_id == null) {
            String uid = (String)req.getAttribute("uid");
            int pid = Integer.parseInt(uid);
            System.out.println(uid);

            ForumServiceInf service = new ForumServiceImpl();
            List<ForumEntity> personList = new ArrayList<ForumEntity>();
            personList = service.personForum(pid);
            req.setAttribute("perForumList", personList);
//            req.getRequestDispatcher("page/user/pageForum.jsp").forward(req, resp);
            req.getRequestDispatcher("page/user/myforum.jsp").forward(req, resp);
        } else {
            int pid = Integer.parseInt(user_id);

            ForumServiceInf service = new ForumServiceImpl();
            List<ForumEntity> personList = new ArrayList<ForumEntity>();
            personList = service.personForum(pid);
            req.setAttribute("perForumList", personList);
//            req.getRequestDispatcher("page/user/pageForum.jsp").forward(req, resp);
            req.getRequestDispatcher("page/user/myforum.jsp").forward(req, resp);
        }


        PrintWriter out = resp.getWriter();
        out.println(user_id);

    }
}



