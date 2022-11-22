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


@WebServlet("/UPersonForumListByKeyWordServlet")
@SuppressWarnings("serial")
public class UPersonForumListByKeyWordServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String user_id = req.getParameter("uid");
        String keyword = req.getParameter("keywords");
        System.out.println("keyword: " + keyword);

        if (keyword == "") {
//            req.getRequestDispatcher("page/user/pageForum.jsp").forward(req, resp);
            req.getRequestDispatcher("UPersonPageForumListServlet").forward(req, resp);
        }

        if (user_id == null) {
            String uid = (String)req.getAttribute("uid");
            System.out.println(uid);    // 20201001
            int pid = Integer.parseInt(uid);
            ForumServiceInf service = new ForumServiceImpl();
            List<ForumEntity> personList = new ArrayList<ForumEntity>();

            if (keyword != "") {
                personList = service.findForumListByKeyWord(pid, keyword);
                req.setAttribute("perForumListByKeyWord", personList);
                req.getRequestDispatcher("page/user/myForumWithKeyWord.jsp").forward(req, resp);
            } else {
//                personList = service.personForum(pid);
//                req.setAttribute("perForumList", personList);
//                req.getRequestDispatcher("page/user/myforum.jsp").forward(req, resp);
            }
        } else {
            int pid = Integer.parseInt(user_id);

            ForumServiceInf service = new ForumServiceImpl();
            List<ForumEntity> personList = new ArrayList<ForumEntity>();

            if (keyword != "") {
                personList = service.findForumListByKeyWord(pid, keyword);
                req.setAttribute("perForumListByKeyWord", personList);
                req.getRequestDispatcher("page/user/myForumWithKeyWord.jsp").forward(req, resp);
            } else {
//                personList = service.personForum(pid);
//                req.setAttribute("perForumList", personList);
//                req.getRequestDispatcher("page/user/myforum.jsp").forward(req, resp);
            }
        }


        PrintWriter out = resp.getWriter();
        out.println(user_id);

    }
}

