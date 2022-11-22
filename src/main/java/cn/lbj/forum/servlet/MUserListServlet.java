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
import java.util.List;

@SuppressWarnings("serial")
@WebServlet("/MUserListServlet")
public class MUserListServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        UserServiceInf service = new UserServiceImpl();
        List<UserEntity> userList = service.findUserList();

        req.setAttribute("userList", userList);
        req.getRequestDispatcher("page/manager/userlist.jsp").forward(req, resp);
    }
}
