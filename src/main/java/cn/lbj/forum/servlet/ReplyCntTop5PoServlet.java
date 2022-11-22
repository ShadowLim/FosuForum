package cn.lbj.forum.servlet;

import cn.lbj.forum.service.PoServiceImpl;
import cn.lbj.forum.service.PoServiceInf;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@SuppressWarnings("serial")
@WebServlet("/ReplyCntTop5PoServlet")
public class ReplyCntTop5PoServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("utf-8");

        String u_id = req.getParameter("uid");
        int uid = Integer.parseInt(u_id);

        PoServiceInf poService = new PoServiceImpl();

        // TODO 统计回帖数量前5的帖子
        // {Java,3,全流程调度,1}
        List<Object> barData = poService.replyCntTop5(u_id);

        // TODO 返回barData
        resp.setContentType("text/html;charset=utf-8");
        resp.getWriter().println(barData);

//        for (Object barDatum : barData) {
//            System.out.println(barDatum);
//        }

        req.setAttribute("replyCntList", barData);
        req.getRequestDispatcher("replyCntPo.jsp").forward(req, resp);
    }
}
