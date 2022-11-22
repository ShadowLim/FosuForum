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


@WebServlet("/StudyCntByUserTop5PoServlet")
public class StudyCntByUserTop5PoServlet extends HttpServlet {

    /**TODO SQL:
     * select si.user_id, count(*) cnt
     * from study_info si join user_info ui
     * on si.user_id = ui.user_id
     * where ui.isAdmin != 1
     * GROUP BY si.user_id
     * LIMIT 5;
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("utf-8");

        String u_id = req.getParameter("uid");
        int uid = Integer.parseInt(u_id);

        PoServiceInf poService = new PoServiceImpl();

        // TODO 普通用户发帖统计Top5
        //
        List<Object> barData = poService.studyCntByUserTop5(u_id);

        // TODO 返回barData
        resp.setContentType("text/html;charset=utf-8");
        resp.getWriter().println(barData);

//        for (Object barDatum : barData) {
//            System.out.println(barDatum);
//        }

        req.setAttribute("studyCntByUserList", barData);
        req.getRequestDispatcher("page/manager/studyCntByUserTop5Po.jsp").forward(req, resp);

    }
}
