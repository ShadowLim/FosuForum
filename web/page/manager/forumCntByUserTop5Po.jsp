<%@ page import="cn.lbj.forum.entity.UserEntity" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>普通用户发帖统计</title>

    <script type="text/javascript" src="../../js/jquery-1.11.2.js"></script>
    <!-- 引入 echarts.min.js -->
    <script src="statics/echarts/echarts.min.js"></script>

    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../../css/forum.css">

    <style type="text/css">
        .bk{
            background-image: url(https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1511274382471&di=65c54247e54e9895084042b3e3da5ba1&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2Fe850352ac65c10387071c8f8b9119313b07e89f8.jpg);
            background-repeat: no-repeat;
            background-size: 140% 140%;
        }

        myul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            width: 25%;
            background-color: #f1f1f1;
            position: fixed;
            height: 100%;
            overflow: auto;
        }

        myli a {
            display: block;
            color: #000;
            padding: 8px 16px;
            text-decoration: none;
        }

        myli a.active {
            background-color: #4CAF50;
            color: white;
        }

        myli a:hover:not(.active) {
            background-color: #555;
            color: white;
        }
    </style>

</head>

<body class="bk">

<nav class="navbar navbar-inverse" role="navigation">   <!-- TODO 顶部的菜单栏 -->
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

<!--  TODO 子级导航栏 -->
<div>
    <myul class="nav navbar-nav navbar-right">
        <myli><a href="${pageContext.request.contextPath}/ReleaseCntByDatePoServlet?uid=${user.user_id}"><span class="	glyphicon glyphicon-signal"></span> 发帖统计</a></myli>
        <myli><a href="${pageContext.request.contextPath}/ReplyCntTop5PoServlet?uid=${user.user_id}"><span class="	glyphicon glyphicon-signal"></span> 回帖统计</a></myli>
        <myli><a href="${pageContext.request.contextPath}/StudyReleaseCntByDatePoServlet?uid=${user.user_id}"><span class="	glyphicon glyphicon-signal"></span> 学习专区发帖统计</a></myli>
        <myli><a href="${pageContext.request.contextPath}/StudyReplyCntTop5PoServlet?uid=${user.user_id}"><span class="	glyphicon glyphicon-signal"></span> 学习专区回帖统计</a></myli>
        <%
            UserEntity curUser = (UserEntity)request.getSession().getAttribute("user");
            if(curUser.getIsAdmin() == 1){
        %>
        <myli><a href="${pageContext.request.contextPath}/ForumCntByUserTop5PoServlet?uid=${user.user_id}"><span class="	glyphicon glyphicon-signal"></span> 普通用户发帖统计</a></myli>
        <myli><a href="${pageContext.request.contextPath}/StudyCntByUserTop5PoServlet?uid=${user.user_id}"><span class="glyphicon glyphicon-signal"></span> 普通用户学习发帖统计</a></myli>

        <%} %>
    </myul>
</div>


<div class="container">
    <div style="width: 600px;height:100px;">
        <nav class="navbar navbar-default" role="navigation" style="float: right; position:absolute; width:1125px; margin:0px 0 0 200px ">

            <h3><b><center>统计普通用户帖子发表数量</center></b></h3>

            <%
                List<Object> poList = (List<Object>) request.getAttribute("forumCntByUserList");
            %>
        </nav>
    </div>



    <!-- TODO 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="main" style="width: 600px;height:400px; float: right"></div>

    <script type="text/javascript">
        var chartDom = document.getElementById('main');
        var myChart = echarts.init(chartDom);
        var option;
        var XYidx = 0;

        // prettier-ignore
        let dataAxis = [];
        // prettier-ignore
        let data = [];

        var size = "<%=poList.size()%>";
        // alert(size);         // 6

        // var list = "[20201001, 8, 20201002, 3, 20201004, 1]";
        var list = "<%=poList%>";
        var realList = list.substring(1, list.length - 1);
        var arr = realList.split(',');

        for (var i = 0; i < size; ) {
            dataAxis[XYidx] = arr[i++];
            data[XYidx] = arr[i++]
            XYidx = XYidx + 1;
        }

        // for (var i = 0; i < dataAxis.length; i++) {
        //     console.log(dataAxis[i]);
        // }
        // for (var i = 0; i < data.length; i++) {
        //     console.log(data[i]);
        // }

        let yMax = 500;

        let dataShadow = [];
        for (let i = 0; i < data.length; i++) {
            dataShadow.push(yMax);
        }
        option = {
            title: {
                text: '普通用户发帖Top5统计',
                subtext: '特性：渐变色 阴影 点击缩放'
            },
            xAxis: {
                data: dataAxis,
                axisLabel: {
                    inside: true,
                    color: '#fff',
                    interval: 0
                },
                axisTick: {
                    show: false
                },
                axisLine: {
                    show: false
                },
                z: 10
            },
            yAxis: {
                axisLine: {
                    show: false
                },
                axisTick: {
                    show: false
                },
                axisLabel: {
                    color: '#999'
                }
            },
            dataZoom: [
                {
                    type: 'inside'
                }
            ],
            series: [
                {
                    type: 'bar',
                    showBackground: true,
                    itemStyle: {
                        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                            { offset: 0, color: '#83bff6' },
                            { offset: 0.5, color: '#188df0' },
                            { offset: 1, color: '#188df0' }
                        ])
                    },
                    emphasis: {
                        itemStyle: {
                            color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                                { offset: 0, color: '#2378f7' },
                                { offset: 0.7, color: '#2378f7' },
                                { offset: 1, color: '#83bff6' }
                            ])
                        }
                    },
                    data: data
                }
            ]
        };
        // Enable data zoom when user click bar.
        const zoomSize = 6;
        myChart.on('click', function (params) {
            console.log(dataAxis[Math.max(params.dataIndex - zoomSize / 2, 0)]);
            myChart.dispatchAction({
                type: 'dataZoom',
                startValue: dataAxis[Math.max(params.dataIndex - zoomSize / 2, 0)],
                endValue:
                    dataAxis[Math.min(params.dataIndex + zoomSize / 2, data.length - 1)]
            });
        });

        option && myChart.setOption(option);
    </script>

</div>



</body>


</html>
