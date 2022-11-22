<%@ page import="cn.lbj.forum.entity.UserEntity" %>
<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
    <%-- TODO 官网开发文档：http://lbs.amap.com/api/javascript-api/summary/--%>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">

    <title>高德地图展示</title>

    <link rel="stylesheet" href="http://cache.amap.com/lbs/static/main1119.css"/>
    <script src="http://cache.amap.com/lbs/static/es5.min.js"></script>
    <!-- TODO 这里要配置参数key,将其值设置为高德官网开发者获取的key -->
    <script src="http://webapi.amap.com/maps?v=1.3&key=9b2c5c13a6501227c97613b559324a12"></script>
    <script type="text/javascript" src="http://cache.amap.com/lbs/static/addToolbar.js"></script>

    <link rel="stylesheet" type="text/css" href="css/forum.css">
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <style type="text/css">
        .bk{
            background-image: url(https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1511274382471&di=65c54247e54e9895084042b3e3da5ba1&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2Fe850352ac65c10387071c8f8b9119313b07e89f8.jpg);
            background-repeat: no-repeat;
            background-size: 140% 140%;
        }

        #myamap{
            margin-left:13%;
            margin-top:3%;
            width:910px;
            height:400px;
        }

        /* 头部标题 */
        .header {
            padding: 30px;
            text-align: left;
            background: white;
        }

        .header h2 {
            font-size: 40px;
        }

        .myfirstbtn {
            background-color: #3498DB;
            margin-left: 13%;
            width: 20%;
            font-size: 14px;
            border: none;
            outline: none;
            cursor: pointer;
            height: 50px;
        }

        .mybtn {
            background-color: #3498DB;
            width: 20%;
            font-size: 14px;
            border: none;
            outline: none;
            cursor: pointer;
            height: 50px;
        }
        /*解决button之间的空隙问题*/
        .parentbtn {
            font-size: 0px;
        }

        .btnshow {
            margin-left: 13%;
            width: 800px;
            /*height: 100px;*/
            font-size: 14px;
        }

        /*img {*/
        /*    display:none;*/
        /*    margin-left: 13%;*/
        /*    margin-top: 10%;*/
        /*    width: 800px;*/
        /*}*/

    </style>
</head>

<body class="bk">
<div>
    <nav class="navbar navbar-inverse" role="navigation"><!-- 顶部的菜单栏 -->
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="ForumListServlet">「Fosu Forum」</a>
            </div>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="fosuhobby.jsp"><span class="glyphicon glyphicon-flag"></span> 佛大周边</a></li>
                <li><a href="po.jsp"><span class="glyphicon glyphicon-user"></span> 数据报表</a></li>
                <li><a href="StudyListServlet"><span class="glyphicon glyphicon-edit"></span> 考研学习</a></li>
                <li><a href="${pageContext.request.contextPath}/UserInfoServlet?uid=${user.user_id}"><span class="glyphicon glyphicon-user"></span> 个人信息</a></li>
                <li><a href="${pageContext.request.contextPath}/UPersonPageForumListServlet?uid=${user.user_id}"><span class="glyphicon glyphicon-book"></span> 我的帖子</a></li>

                <%
                    UserEntity admin = (UserEntity)request.getSession().getAttribute("user");
                    if(admin.getIsAdmin() == 1){
                %>
                <li><a href="MUserListServlet"><span class="glyphicon glyphicon-user"></span>用户管理</a></li>
                <%} %>

                <li><a href="${pageContext.request.contextPath}/home.jsp"><span class="glyphicon glyphicon-user"></span> 退出论坛</a></li>

            </ul>
        </div>
    </nav>


    <div style="margin-left: 200px">
        <h2><b>欢迎进入佛大周边，${user.user_name}</b></h2>
    </div>

    <hr style="margin-left: 200px; height:2px; background-color: #3498DB";  width="130px"; color="#3498DB">


    <div id="myamap"></div>


    <script>
        // TODO 创建地图,设定地图的中心点和级别
        var map = new AMap.Map('myamap', {
            resizeEnable: false,
            zoom:18,
            center: [113.097749, 23.024117]             // 江湾校区
            // center: [113.097092, 23.022034]         // 中门
        });

        /*  AMap.plugin(['AMap.ToolBar','AMap.Scale'],function(){
             //TODO  创建控件并添加
             alert("dddd");
         }) */

        // TODO 信息窗体的创建与设定
        var infowindow = new AMap.InfoWindow({
            content: '<h3>高德地图</h3><div>高德是中国领先的数字地图内容、导航和位置服务解决方案提供商。</div>',
            offset: new AMap.Pixel(0, -30),
            size:new AMap.Size(230,0)
        });

        // TODO 点标记的创建与添加
        var marker = new AMap.Marker({
            position:[113.097749, 23.024117],
            map:map
        });


        var info = [];
        info.push("<div class=\"amp-clearfix\">" +
            "<img class=\"amp-logo\" src=\"images/logo.png\" style=\"width: 70px; height: 60px\">" +
             "<span style=\"font-size:27px\"><b>佛大校训</b></span>" +
            "</div>");
        info.push("<div style=\"padding:0px 0px 0px 4px; font-size: 20px\"><b>明德博学 自强有为</b></div>");
        info.push("<div><div><img src=\"http://webapi.amap.com/images/autonavi.png\"/></dvi>");

        infoWindow = new AMap.InfoWindow({
            content: info.join("<br/>"),
            // content: ' ',
            offset: new AMap.Pixel(0, -30),
            size: new AMap.Size(300, 0)
        });
        infoWindow.open(map, map.getCenter());

    </script>

    <hr style="margin-left: 200px; height:2px; background-color: #3498DB";  width="130px"; color="#3498DB">



    <div class="parentbtn">

        <input id="north" type="button" value="北门" class="myfirstbtn" onclick="northRoad()">
        <script>
            document.getElementById('north').style.border= '2px blue solid'
        </script>

        <input id="south" type="button" value="东南门" class="mybtn" onclick="southRoad()">
        <script>
            document.getElementById('south').style.border= '2px blue solid'
        </script>

        <input id="center" type="button" value="中门" class="mybtn" onclick="centerRoad()">
        <script>
            document.getElementById('center').style.border= '2px blue solid'
        </script>

        <div class="btnshow">
            <font id="poemsi"></font>
        </div>

        <script>
            function northRoad() {
                poemsi = "<p style='font-size: 20px;'><b>📍科技学院北门站</b></br></p>" +
                    "⚫158路</br>" +
                    "✅佛山西站 --> 岭南大道公交枢纽站</br>" +
                    "✅首06:00 末22:30 | 12min/趟 | 全程：22.6公里 | 票价：2元</br>" +
                    "</br>" +
                    "⚫173路</br>" +
                    "✅张槎村头 --> 万科水晶城</br>" +
                    "首06:15 末22:30 | 15min/趟 | 全程：18.0公里 | 票价：2元</br>" +
                    "</br>" +
                    "⚫121路</br>" +
                    "✅塱沙一路 --> 星晖园</br>" +
                    "首06:15 末22:00 | 8min/趟 | 全程：18.2公里 | 票价：2元</br>" +
                    "</br>" +
                    "⚫242路/242（临）路</br>" +
                    "✅佛山科技学院北门 --> 佛科院南海仙溪校区西门站</br>" +
                    "✅首06:30 末19:30 | 35min/趟 | 全程：25.2公里 | 票价：4元</br>" +
                    "✅佛科院南海仙溪校区西门站 --> 佛山科技学院北门</br>" +
                    "✅首06:30 末19:30 | 60min/趟 | 全程：23.9公里 | 票价：4元</br>"
                    + "</br>";
                $('#poemsi').html(poemsi);
            }

            function southRoad() {
                poemsi = "<p style='font-size: 20px;'><b>📍佛山科学技术学院站</b></br></p>" +
                    "⚫101路</br>" +
                    "✅石头村 --> 中山路临时总站</br>" +
                    "✅首06:00 末22:30 | 9min/趟 | 全程：14.2公里 | 票价：2元</br>" +
                    "✅中山路临时总站--> 石头村</br>" +
                    "✅首06:00 末22:30 | 9min/趟 | 全程：14.9公里 | 票价：2元</br>" +
                    "</br>" +

                    "⚫G9路</br>" +
                    "✅岭南酒文化博物馆 --> 平洲江滨公园</br>" +
                    "✅首06:30 末22:30 | 15min/趟 | 全程：16.8公里 | 票价：2元</br>" +
                    "✅平洲江滨公园 --> 岭南酒文化博物馆</br>" +
                    "✅首06:30 末22:30 | 15min/趟 | 全程：16.1公里 | 票价：2元</br>" +
                    "</br>" +

                    "⚫佛山城巴滘口-高明线</br>" +
                    "✅高明客运站 --> 芳村大道西总站 </br>" +
                    "✅首06:05 末 18:50 | 90min/趟 | 全程：56.9公里 | 票价：2-13元</br>" +
                    "✅芳村大道西总站 --> 高明客运站</br>" +
                    "✅首08:20 末 21:00 | 90min/趟 | 全程：59.6公里 | 票价：2-13元</br>" +
                    "</br>" +

                    "⚫206路/206路（干）</br>" +
                    "✅石湾客运站 --> 官窑车站</br>" +
                    "✅首06:00 末22:30 | 15min/趟 | 全程：31.7公里 | 票价：4元</br>" +
                    "✅官窑车站 --> 石湾客运站</br>" +
                    "✅首06:00 末22:30 | 15min/趟 | 全程：31.9公里 | 票价：4元</br>" +
                    "</br>" +

                    "⚫140路</br>" +
                    "✅南风古灶站 --> 桂城员工村 </br>" +
                    "✅首06:30 末22:30 | 15min/趟 | 全程：13.7公里 | 票价：2元</br>" +
                    "✅桂城员工村 --> 南风古灶站</br>" +
                    "✅首06:30 末22:30 | 15min/趟 | 全程：14.8公里 | 票价：2元</br>" +
                    "</br>" +

                    "⚫176路</br>" +
                    "✅智慧新城 --> 桂城益禾公寓站 </br>" +
                    "✅首06:30 末19:00 | 15min/趟 | 全程：16.4公里 | 票价：2元</br>" +
                    "✅桂城益禾公寓站 --> 智慧新城</br>" +
                    "✅首06:30 末19:00 | 15min/趟 | 全程：16.2公里 | 票价：2元</br>" +
                    "</br>" +

                    "⚫134路</br>" +
                    "✅南庄沥滘 --> 火车站（江边村）</br>" +
                    "✅首06:00 末22:00 | 12min/趟 | 全程：27.8公里 | 票价：2元</br>" +
                    "✅火车站（江边村）--> 南庄沥滘 </br>" +
                    "✅首06:00 末22:00 | 12min/趟 | 全程：28.5公里 | 票价：2元</br>" +
                    "</br>" +

                    "⚫164路C线</br>" +
                    "✅禅城区中心医院临时总站 --> 奇槎公交枢纽站</br>" +
                    "✅全程：16.7公里</br>" +
                    "✅奇槎公交枢纽站 --> 禅城区中心医院临时总站</br>" +
                    "✅全程：14.8公里</br>" +
                    "</br>" +

                    "⚫157路</br>" +
                    "✅张槎大道 --> 璀璨天城公交枢纽站</br>" +
                    "✅首06:30 末22:30 | 12min/趟 | 全程：16.5公里 | 票价：2元</br>" +
                    "✅璀璨天城公交枢纽站  --> 张槎大道</br>" +
                    "✅首06:30 末22:30 | 12min/趟 | 全程：14.9公里 | 票价：2元</br>" +
                    "</br>" +


                    "⚫143路</br>" +
                    "✅胡涌村 --> 东方广场总站</br>" +
                    "✅首06:30 末22:30 | 20min/趟 | 全程：22.0公里 | 票价：2元</br>" +
                    "✅东方广场总站 --> 湖涌村 </br>" +
                    "✅首06:30 末22:30 | 20min/趟 | 全程：25.3公里 | 票价：2元</br>" +
                    "</br>" +


                    "⚫G11路</br>" +
                    "✅江堤路 --> 镇安公交首末站</br>" +
                    "✅首06:30 末22:30 | 12min/趟 | 全程：16.9公里 | 票价：2元</br>" +
                    "✅镇安公交首末站 --> 江堤路 </br>" +
                    "✅首06:30 末22:30 | 15min/趟 | 全程：15.5公里 | 票价：2元</br>" +
                    "</br>" +


                    "⚫163路</br>" +
                    "✅绿岛湖公交枢纽站 --> 世纪莲公交枢纽站</br>" +
                    "✅首06:30 末19:00 | 15min/趟 | 全程：19.1公里 | 票价：2元</br>" +
                    "✅世纪莲公交枢纽站 --> 绿岛湖公交枢纽站</br>" +
                    "✅首06:30 末19:00 | 15min/趟 | 全程：21.6公里 | 票价：2元</br>" +
                    "</br>" +

                    "⚫佛251路</br>" +
                    "✅西樵城区(官山二桥) --> 芳村大道西总站 </br>" +
                    "✅首06:00 末21:30 | 15min/趟 | 全程：40.2公里 | 票价：4元</br>" +
                    "✅芳村大道西总站 --> 西樵城区(官山二桥)</br>" +
                    "✅首06:00 末21:30 | 15min/趟 | 全程：42.5公里 | 票价：4元</br>" +
                    "</br>" +

                    "⚫高明——禅城（普通）</br>" +
                    "✅高明客运站 --> 佛山城巴总站</br>" +
                    "✅首06:00 末19:45 | 120min/趟 | 全程：35.9公里 | 票价：9元</br>" +
                    "</br>" +

                    "⚫禅城——高明 </br>" +
                    "✅佛山城巴总站 --> 高明客运站</br>" +
                    "✅首06:00 末20:30 | 120min/趟 | 全程：37.1公里 | 票价：2-9元</br>" +
                    "</br>";

                $('#poemsi').html(poemsi);
            }

            function centerRoad() {
                poemsi = "<p style='font-size: 20px;'><b>📍中门附近地铁</br></b></p>" +
                    "⚫广佛地铁（佛山地铁1号线）</br>" +
                    "✅线路：新城东站⇌沥滘站</br>" +
                    "新城东站 --> 东平站 --> 世纪莲站 --> 澜石站 --> 东平站 --> 魁奇路站 --> 季华园站" +
                    " --> 同济路站 --> 祖庙站 --> 普君北路站 --> 朝安站 --> 桂城站 --> 南桂路站 --> 𧒽岗站" +
                    " --> 千灯湖站 --> 金融高新区站 --> 龙溪站 --> 菊树站 --> 西塱站 --> 鹤洞站 --> 沙涌站" +
                    " --> 沙园站 --> 燕岗站 --> 石溪站 --> 南洲站 --> 沥滘站</br>" +
                    "✅首06:00 末23:56(截至2020年3月) | 120min/趟 | 线路长度：37.96 km(2018年12月) | 最高速度：80千米/时</br>" +
                    "</br>" +

                    "⚫佛山地铁2号线</br>" +
                    "✅线路：南庄站⇌广州南站</br>" +
                    "✅南庄站 --> 湖涌站 --> 绿岛湖站 --> 智慧新城站 --> 张槎站 --> 石湾站 " +
                    "--> 沙岗站 --> 魁奇路站 --> 石梁站 --> 湾华站 --> 登洲站 --> 花卉世界站 " +
                    "--> 仙涌站 --> 石洲站 --> 林岳西站 --> 林岳东站 --> 广州南站 </br>" +
                    "✅首06:00 末23:30 | 120min/趟 | 线路长度：32.4 km | 最高速度：100千米/时</br>" +
                    "</br>";

                $('#poemsi').html(poemsi);
            }
        </script>
    </div>


    <div class="parentbtn">
        <hr style="margin-left: 13%; height:2px; background-color: #3498DB";  width="130px"; color="#3498DB">
    </div>


    <div id="footer" >
        <nav class="navbar navbar-inverse navbar-staic-bottom" style="border-radius: 4px;padding-top:30px;margin-bottom:0px;height:100px;">
            <div class="navbar-inner navbar-content-center">
                <p style="color:#ffffff;"align=center>Copyright© 2022 Fosu_20BigData_lbj. All rights reserved.</p>
                <p style="color:#ffffff;"align=center>Contact Information: <a href="https://github.com/ShadowLim">GitHub Page</a></p >
            </div>
        </nav>
    </div>

</div>
</body>
</html>

