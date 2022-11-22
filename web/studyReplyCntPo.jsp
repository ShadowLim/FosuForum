<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ page import="cn.lbj.forum.entity.UserEntity" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>统计学习专区回帖数量前5的帖子</title>

<%--    <script type="text/javascript" src="js/jquery-1.11.2.js"></script>--%>
    <!-- 引入 echarts.min.js -->
    <script src="statics/echarts/echarts.min.js"></script>

    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/forum.css">

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




    <div class="container">
        <div style="width: 600px;height:100px;">
            <nav class="navbar navbar-default" role="navigation" style="float: right; width: 1125px; position:absolute; margin:0px 0 0 200px ">
                <h3><b><center>统计学习专区回帖数量前5的帖子</center></b></h3>
                <%
                    List<Object> replyCntList = (List<Object>) request.getAttribute("studyReplyCntList");
                %>
            </nav>
        </div>


        <!-- TODO 为ECharts准备一个具备大小（宽高）的Dom -->
        <div id="main1" style="width: 600px;height:400px; float: right"></div>

        <script type="text/javascript">
            var chartDom = document.getElementById('main1');
            var myChart = echarts.init(chartDom);
            var option;
            var XYidx1 = 0;

            // prettier-ignore
            let dataAxis1 = [];
            // prettier-ignore
            let data1 = [];

            var size1 = "<%=replyCntList.size()%>";
            // alert(size1);         // 2

            var list1 = "<%=replyCntList%>";    //  [JavaWeb,1]
            var realList1 = list1.substring(1, list1.length - 1);   //  JavaWeb,1
            var arr1 = realList1.split(',');


            for (var i = 0; i < size1; ) {
                dataAxis1[XYidx1] = arr1[i++];
                data1[XYidx1] = arr1[i++];
                XYidx1 = XYidx1 + 1;
            }

            let yMax1 = 500;
            let dataShadow1 = [];
            for (let i = 0; i < data1.length; i++) {
                dataShadow1.push(yMax1);
            }
            option = {
                title: {
                    text: '统计学习专区回帖数量前5的帖子',
                    subtext: '特性：渐变色 阴影 点击缩放'
                },
                xAxis: {
                    data: dataAxis1,
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
                tooltip : {
                    trigger: 'axis',
                    axisPointer: {
                        type: 'cross',
                        label: {
                            backgroundColor: '#6a7985'
                        }
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
                        data: data1
                    }
                ]
            };
            // Enable data zoom when user click bar.
            const zoomSize1 = 6;
            myChart.on('click', function (params) {
                console.log(dataAxis1[Math.max(params.dataIndex - zoomSize1 / 2, 0)]);
                myChart.dispatchAction({
                    type: 'dataZoom',
                    startValue: dataAxis1[Math.max(params.dataIndex - zoomSize1 / 2, 0)],
                    endValue:
                        dataAxis1[Math.min(params.dataIndex + zoomSize1 / 2, data1.length - 1)]
                });
            });

            option && myChart.setOption(option);
    </script>


    </div>


</body>
</html>
