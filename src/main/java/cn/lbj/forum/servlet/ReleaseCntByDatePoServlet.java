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
@WebServlet("/ReleaseCntByDatePoServlet")
public class ReleaseCntByDatePoServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");

        String u_id = req.getParameter("uid");
        int uid = Integer.parseInt(u_id);

        PoServiceInf poService = new PoServiceImpl();

        // TODO 按时间（月份）分组统计帖子发表数量
        // {"2022年9月", 1, "2022年10月", 3}
        List<Object> barData = poService.releaseCntByDate(u_id);

        // TODO 返回barData
        resp.setContentType("text/html;charset=utf-8");
        resp.getWriter().println(barData);

        req.setAttribute("releasePoList", barData);
        req.getRequestDispatcher("releaseCntPo.jsp").forward(req, resp);
    }
}
