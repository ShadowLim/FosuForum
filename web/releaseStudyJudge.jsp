<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>标题判空</title>
    <script type="text/javascript" src="js/jquery-1.11.2.js"></script>
</head>
<body>

    <script type="text/javascript">
        // TODO 学习专区帖子发表标题判空
        function titleEmpty(){
            alert("标题不能为空！！！");
        }
    </script>

    <%
        // TODO 注意：alert弹框 写在重定向页面不会弹出
        // TODO 原因：因为重定向是在服务器端执行的动作，而Alert()是客户端的动作，所以即使alert()写在重定向语句之前其实也是没有效果的。
        /**
         * out.println("<script>titleEmpty();</script>");
         *         // TODO 重定向到新地址
         *         String site = new String("study.jsp");
         *         response.setStatus(response.SC_MOVED_TEMPORARILY);
         *         response.setHeader("Location", site);
         */

        // TODO 正确做法
        out.println("<script>titleEmpty();window.location='MUserListServlet'</script>");
    %>


</body>
</html>
