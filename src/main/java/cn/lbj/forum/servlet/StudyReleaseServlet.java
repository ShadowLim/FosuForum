package cn.lbj.forum.servlet;

import cn.lbj.forum.entity.StudyEntity;
import cn.lbj.forum.entity.UserEntity;
import cn.lbj.forum.service.StudyServiceImpl;
import cn.lbj.forum.service.StudyServiceInf;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

@SuppressWarnings("serial")
@WebServlet("/StudyReleaseServlet")
public class StudyReleaseServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");

        String title = req.getParameter("title");
        String content = req.getParameter("content");
        String cover = req.getParameter("cover");

//        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//        Date date = new Date();
//        Timestamp timestamp = new Timestamp(date.getTime());
//        String format = formatter.format(timestamp);

        UserEntity user = (UserEntity)req.getSession().getAttribute("user");
        StudyEntity study = new StudyEntity();

        System.out.println("title: " + title);

        if (title != "") {
            study.setTitle(title);
            study.setContent(content);
            study.setCover(cover);
            study.setCreateTime(new Timestamp(new Date().getTime()));
            study.setAuthor(user);
            StudyServiceInf service = new StudyServiceImpl();
            service.createStudy(study);
            resp.sendRedirect("StudyListServlet");
        }
        else {
//            // 1. 获取脚本引擎
//            ScriptEngineManager scriptEngineManager = new ScriptEngineManager();
//            ScriptEngine nashorn = scriptEngineManager.getEngineByName("nashorn");
//
//            try {
//
//                // 2. 读取js文件内容
//                nashorn.eval(new FileReader("js/releaseStudy.js"));
//
//                // 3. 调用js代码
//                Object eval = nashorn.eval("titleEmpty()");
//                System.out.println(eval);
//            } catch (Exception e) {
//                e.printStackTrace();
//            }

            resp.sendRedirect("releaseStudyJudge.jsp");

        }

    }
}
