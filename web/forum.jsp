<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="css/background.css" />
    <title>「发帖」</title>
    <style type="text/css">
        <!--
        .STYLE5 {
            color: #FF0000;
            font-size: 24px;
        }
        -->
    </style>
</head>
<body class="bk">
<div align="center">
    <p class="STYLE5"><b>「发表帖子」</b></p>
    <form name="form1" method="post" action="release">
        <table width="399" border="1">
            <tr>
                <td width="86">标题</td>
                <td width="297"><input name="title" type="text" size="52"></td>
            </tr>
            <tr>
                <td height="111">内容</td>
                <td><textarea name="content" cols="40" rows="8"></textarea></td>
            </tr>
            <tr>
                <td colspan="2"><div align="right">
                    <input type="submit" value="发表">
                    <input type="button" value="返回" onclick="history.back();">
                </div></td>
            </tr>
        </table>
    </form>
    <p class="STYLE5">&nbsp;  </p>
</div>
</body>
</html>
