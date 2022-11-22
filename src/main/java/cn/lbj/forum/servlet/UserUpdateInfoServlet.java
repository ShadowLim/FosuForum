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

@WebServlet("/UserUpdateInfoServlet")
public class UserUpdateInfoServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String userid = req.getParameter("user_id");
        int user_id = Integer.parseInt(userid);
        String user_name = req.getParameter("user_name");
        String user_password = req.getParameter("md5Pwd");
        String user_sex = req.getParameter("user_sex");
        String user_face = req.getParameter("user_face");
        String user_phone = req.getParameter("user_phone");
        String user_email = req.getParameter("user_email");
        String user_from = req.getParameter("user_from");

        UserEntity user = new UserEntity();
        user.setUser_id(user_id);
        user.setUser_name(user_name);
        user.setUser_password(user_password);
        user.setUser_sex(user_sex);
        user.setUser_face(user_face);
        user.setUser_phone(user_phone);
        user.setUser_email(user_email);
        user.setUser_from(user_from);

        UserServiceInf service = new UserServiceImpl();
        service.updateUser(user);

        UserEntity userinfo=service.findUser(user_id);
        req.setAttribute("userinfo", userinfo);
        req.getRequestDispatcher("page/user/individualinfo.jsp").forward(req,resp);
    }
}
