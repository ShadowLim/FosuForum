<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="cn.lbj.forum.util.DBUtil" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel='stylesheet' type='text/css' href='css/code.css' />
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>注册</title>
    <style type="text/css">
        .STYLE1 {
            font-size: 24px;
            color: #000000;
        }

        .bk {
            background-image: url(images/register/registerbg.jpg);
            background-repeat: no-repeat;
            background-size: 100% auto;
            /*background-size: cover;*/
        }

        .register{
            width:100%;
            height:100%;
            margin:auto;
        }
    </style>

    <script>
        var code;
        function createCode(){
            code = "";
            var codeLength = 5;
            var checkCode = document.getElementById("checkCode");
            var codeChars = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
                'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
                'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z');
            for (var i = 0; i < codeLength; i++){
                var charNum = Math.floor(Math.random() * 62);
                code += codeChars[charNum];
            }
            if (checkCode) {
                checkCode.className = "code";
                checkCode.innerHTML = code;
            }
        }


        function showHead(ico) {
            document.images['head'].src = "images/face/user/" + ico;
        }

        function isUserId(str) {
            var userid = /^\d+$/;
            return userid.test(str);
        }

        function isPhone(str){
            var phone = /^\d+$/;
            // alert("联系电话为：" + str + "\n判断联系电话中.........\n结果为：" + phone.test(str))
            return phone.test(str);
        }

        function isEmail(str){
            var email = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-]{2,3})+\.([a-zA-Z0-9_-]{2,3})+/;
            return email.test(str);
        }

        function check_login(form1){
            var user_id = document.getElementById("userid").value
            var user_name = document.getElementById("username").value;
            var user_password = document.getElementById("userpassword").value;
            var confirmPwd = document.getElementById("confirmPwd").value;


            //var user_password=document.forms.form1.user_password.value;
            //var confirmPwd=document.forms.form1.confirmPwd.value;
            var inputCode = document.forms.form1.inputCode.value;

            if(document.forms.form1.user_id.value==""){
            	alert("学号不能为空！");
            	document.forms.form1.user_id.focus();
            	return false;
            }


            if (!isUserId(user_id)) {
                alert("学号应为纯数字");
                document.getElementById("userid").focus();
                return false;
            }


            if (user_name == "") {
                alert("请输入用户名！");
                document.getElementById("username").focus();
                return false;
            }

            if (user_password == "") {
                alert("请输入密码！");
                document.forms.form1.user_password.focus();
                return false;
            }

            if (confirmPwd == "") {
                alert("请确认密码！");
                document.forms.form1.confirmPwd.focus();
                return false;
            }

            if (user_password != confirmPwd) {
                alert("两次密码不一致！请重新输入！");
                return false;
            }

            // TODO 加密
            user_password = hex_md5(document.forms.form1.user_password.value);
            document.forms.form1.md5Pwd.value = user_password;


            if (document.forms.form1.user_phone.value == ""){
            	alert("联系电话不能为空！");
                document.forms.form1.user_phone.focus();
                return false;
            }

            if (document.forms.form1.user_email.value == ""){
            	alert("电子邮箱不能为空！");
            	document.forms.form1.user_email.focus();
            	return;
            }

            if (!isPhone(document.getElementById("phone").value)){
                alert("电话格式不正确！");
                document.getElementById("phone").focus();
                return false;
            }

            if (!isEmail(document.getElementById("email").value)) {
                alert("邮箱格式不正确！");
                document.getElementById("email").focus();
                return false;
            }

            if (document.forms.form1.user_from.value == "") {
                alert("请输入地址！");
                document.forms.form1.user_from.focus();
                return false;
            }

            if (inputCode == "") {
                alert("请输入验证码！");
                document.forms.form1.inputCode.focus();
                return false;
            }

            if (inputCode.toUpperCase() != code.toUpperCase()) {
                alert("验证码有误！");
                createCode();
                document.forms.form1.inputCode.focus();
                return false;
            } else {
                return true;
            }

        }

    </script>

</head>


<body class="bk" onload="createCode()">
<div class="register">
    <nav class="navbar " role="navigation" >
        <h2 align="center" class="STYLE1">「用户注册」</h2>
        <form class="form-horizontal" name="form1" method="post" action="RegisterServlet" onsubmit="return check_login()">
            <div class="form-group">
                <label class="col-sm-2 control-label">学号：</label>
                <div class="col-sm-4">
                    <input class="form-control" name="user_id"  id="userid" type="text"  placeholder="请输入学号...">
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">用户名：</label>
                <div class="col-sm-4">
                    <input class="form-control" name="user_name" id="username" type="text"  placeholder="请输入用户名...">
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">密 码：</label>
                <div class="col-sm-4">
                    <input name="user_password" type="password" id="userpassword" class="form-control" placeholder="请输入密码">
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">确认密码：</label>
                <div class="col-sm-4">
                    <input  name="confirmPwd" type="password" id="confirmPwd" class="form-control"  placeholder="请确认密码">
                    <input type="hidden" name="md5Pwd">
                </div>
            </div>

            <div class="form-group">
                <label for="usersex" class="col-sm-2 control-label">性别：</label>
                <div class="radio">
                    <label><input type="radio" name="user_sex" id="usersex" value="男" checked> <b>男</b> </label>
                    <label><input type="radio" name="user_sex" id="usersex" value="女"><b>女</b></label>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">联系电话：</label>
                <div class="col-sm-4">
                    <input id="phone" name="user_phone" class="form-control" type="text" maxlength=11 placeholder="请输入联系电话...">
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">电子邮箱：</label>
                <div class="col-sm-4">
                    <input id="email" name="user_email" class="form-control" type="text" maxlength=20 placeholder="请输入邮箱...">
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">来自哪里：</label>
                <div class="col-sm-4">
                    <input id="userfrom" name="user_from" class="form-control" type="text"  placeholder="请输入地址...">
                </div>
            </div>

            <div class="form-group">
                <label for="idface" class="col-sm-2 control-label">选择头像:</label>
                <div class="col-sm-4">
                    <div>
                        <img src="images/userface/01.jpg" width="70" height="70" id="idface">
                    </div>
                    <select class="form-control" placeholder=".col-lg-4" name="user_face" onchange="document.images['idface'].src=options[selectedIndex].value;">
                        <option value="${pageContext.request.contextPath}/images/userface/01.jpg" selected>user1</option>
                        <option value="images/userface/02.jpg">user2</option>
                        <option value="images/userface/03.jpg">user3</option>
                        <option value="images/userface/04.jpg">user4</option>
                        <option value="images/userface/05.jpg">user5</option>
                        <option value="images/userface/06.jpg">user6</option>
                        <option value="images/userface/07.jpg">user7</option>
                        <option value="images/userface/08.jpg">user8</option>
                        <option value="images/userface/09.jpg">user9</option>
                        <option value="images/userface/10.jpg">user10</option>
                    </select>
                </div>
            </div>


            <div class="form-group">
                <label class="col-sm-2  control-label">输入验证码:</label>
                <div class="col-sm-4">
                    <input type="text" id="inputCode" class="form-control">
                </div>
            </div>

            <table class="table">
                <tr>
                    <td>
                        <div class="form-group">
                            <label class="col-sm-2 control-label"></label>
                            <div class="col-sm-5">
                                <div class="code" id="checkCode" onclick="createCode()"></div>
                                <a href="#" onclick="createCode()">看不清换一张</a>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>


            <div class="form-group">
                <label class="col-sm-2 control-label"></label>
                <div class="col-sm-4">
                    <button type="submit" class="btn btn-primary" >注册</button>
                    <button type="reset" class="btn btn-primary">重置</button>
                    <button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/TouristHomeServlet'">返回</button>
                </div>
            </div>

        </form>
    </nav>
</div>

</body>
<script type="text/javascript" src="js/md5.js"></script>
</html>
