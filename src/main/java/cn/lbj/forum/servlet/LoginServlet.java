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
import java.io.PrintWriter;


@SuppressWarnings("serial")
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        String user_id = request.getParameter("user_id");
        String user_password = request.getParameter("md5Pwd");

        System.out.println(user_id);
        System.out.println(user_password);

        UserServiceInf service = new UserServiceImpl();
        UserEntity user = service.login(user_id, user_password);

        // TODO 防止out.println()方法出现乱码
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();


        out.println("<link rel='stylesheet' type='text/css' href='css/easyui.css' />");
        out.println("<link rel='stylesheet' type='text/css' href='css/icon.css' />");
        out.println("<script type='text/javascript' src='js/jquery-1.11.2.js'></script>");
        out.println("<script type='text/javascript' src='js/jquery.easyui.min.js'></script>");


        if (user != null) {
            request.getSession().setAttribute("user", user);
            response.sendRedirect("forumlist.jsp");
        } else {
            String html = "<div id='confirmdialog' class='easyui-dialog' title='消息确认' style='width:300px;height:160px;padding:10px'";
            html = html + "data-options=\"iconCls: 'icon-no',buttons: [{text:'确定',iconCls:'icon-ok',handler:function(){$('#confirmdialog').dialog('close');window.location.href='login.jsp';}}]\"";
            html = html + ">用户名或密码有错！</div>";
            out.print(html);
        }

        out.flush();
        out.close();
    }

}

