package cn.lbj.forum.servlet;

import cn.lbj.forum.service.UserServiceImpl;
import cn.lbj.forum.service.UserServiceInf;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@SuppressWarnings("serial")
@WebServlet("/MdeleteUserServlet")
public class MdeleteUserServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        String uid=req.getParameter("uid");
        req.setAttribute("uid", uid);

        UserServiceInf service = new UserServiceImpl();
        service.deleteUser(Integer.parseInt(uid));

        resp.sendRedirect("page/manager/deleteUserAck.jsp");

    }
}
