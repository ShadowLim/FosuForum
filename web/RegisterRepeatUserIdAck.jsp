<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户注册学号重复</title>
</head>

<body>
<script type="text/javascript">
    // TODO 用户注册学号重复判段
    function ackInfo(){
        alert("您注册的学号已存在！！！");
    }
</script>

<%
    // TODO 注意：alert弹框 写在重定向页面不会弹出
    // TODO 原因：因为重定向是在服务器端执行的动作，而Alert()是客户端的动作，所以即使alert()写在重定向语句之前其实也是没有效果的。
    /**
     * out.println("<script>ackInfo();</script>");
     *         // TODO 重定向到新地址
     *         String site = new String("study.jsp");
     *         response.setStatus(response.SC_MOVED_TEMPORARILY);
     *         response.setHeader("Location", site);
     */

    // TODO 正确做法
    out.println("<script>ackInfo();window.location='register.jsp'</script>");
%>
</body>
</html>
