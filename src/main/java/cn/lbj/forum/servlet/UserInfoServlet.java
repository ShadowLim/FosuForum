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

@WebServlet("/UserInfoServlet")
public class UserInfoServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String userid = req.getParameter("uid");
        int user_id = Integer.parseInt(userid);
        UserServiceInf service = new UserServiceImpl();
        UserEntity userinfo = service.findUser(user_id);

        req.setAttribute("userinfo", userinfo);
        req.getRequestDispatcher("page/user/individualinfo.jsp").forward(req, resp);
    }
}
