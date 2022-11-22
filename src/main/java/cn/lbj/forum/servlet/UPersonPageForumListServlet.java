package cn.lbj.forum.servlet;

import cn.lbj.forum.entity.ForumEntity;
import cn.lbj.forum.entity.PageEntity;
import cn.lbj.forum.service.PageServiceImpl;
import cn.lbj.forum.service.PageServiceInf;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@SuppressWarnings("serial")
@WebServlet("/UPersonPageForumListServlet")

public class UPersonPageForumListServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        // TODO 获取数据
        String user_id = req.getParameter("uid");
        String currentPage = req.getParameter("pageNum");
        String rows = req.getParameter("rows");

        /**
         * TODO 不可加上下面注释的内容
         *  中文会有乱码
         */
//        PrintWriter out = resp.getWriter();
//        out.println(user_id);
//        out.println(currentPage);
//        out.println(rows);

        System.out.println("user_id1: " + user_id);
        System.out.println("currentPage1: " + currentPage);
        System.out.println("rows1: " + rows);

        if (null == currentPage || "".equals(currentPage)) {
            currentPage = "1";
        }
        if (null == rows || "".equals(rows)) {
//            rows = "3";             // 每页显示3条数据
            rows = "5";             // 每页显示5条数据
        }

        System.out.println("user_id2: " + user_id);
        System.out.println("currentPage2: " + currentPage);
        System.out.println("rows2: " + rows);

        if (user_id == null) {
            int curPage = Integer.parseInt(currentPage);
            int rs = Integer.parseInt(rows);
            System.out.println("--------------------");
            System.out.println(curPage + "--->" + rs);

            String uid = (String)req.getAttribute("uid");
            int pid = Integer.parseInt(uid);
            System.out.println("--------------------");
            System.out.println("pid: " + pid);


            // TODO 调用service
            PageServiceInf pageService = new PageServiceImpl();
            PageEntity<ForumEntity> pageForumList = pageService.findForumByPage(currentPage, rows, pid);
            req.setAttribute("pageForumList", pageForumList);

            // TODO 转发
            req.getRequestDispatcher("page/user/pageForum.jsp").forward(req, resp);

        } else {
            int curPage = Integer.parseInt(currentPage);
            int rs = Integer.parseInt(rows);
            System.out.println("==================");
            System.out.println(curPage + "===>" + rs);

            int pid = Integer.parseInt(user_id);
            System.out.println("==================");
            System.out.println("pid: " + pid);

            // TODO 调用service
            PageServiceInf pageService = new PageServiceImpl();
            PageEntity<ForumEntity> pageForumList = pageService.findForumByPage(currentPage, rows, pid);
            req.setAttribute("pageForumList", pageForumList);

            // TODO 转发
            req.getRequestDispatcher("page/user/pageForum.jsp").forward(req, resp);
        }

    }
}
