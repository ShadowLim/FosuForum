package cn.lbj.forum.servlet;

import cn.lbj.forum.entity.UserEntity;
import cn.lbj.forum.service.UserServiceImpl;
import cn.lbj.forum.service.UserServiceInf;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@SuppressWarnings("serial")
@WebServlet("/TouristFindUserByIdServlet")
public class TouristFindUserByIdServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");

        String u_id = req.getParameter("uid");
        int uid = Integer.parseInt(u_id);

        UserServiceInf service=new UserServiceImpl();
        UserEntity user=service.findUser(uid);
        req.setAttribute("user",user);

        req.getRequestDispatcher("page/tourist/userinfo.jsp").forward(req, resp);
    }
}
