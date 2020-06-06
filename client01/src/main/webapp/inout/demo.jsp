<%--
  Created by IntelliJ IDEA.
  User: JackW
  Date: 2019/7/6
  Time: 9:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="js/echarts.min.js"></script>
    <script src="js/jquery.js"></script>
    <script >
        $(function () {
            //初始化cchars实例
            var mychart=echarts.init(document.getElementById("main"));
            //指定图表的配置项和数据
            var option={
                title:{
                    text:'Echars 入门'
                },
                tooltip:{},
                legend:{
                    data:['销量']
                },
                xAxis:{
                    data:["衬衫","羊毛衫","雪纺衫","牛仔裤","高跟鞋","袜子"]
                },
                yAxis:{

                },
                serves:[{
                    name:'销量',
                    type:'bar',
                    data:[5,20,36,10,10,20]
                }]
            };
            //使用刚指定的配置项和数据显示图表
            mychart.setOption(option);

        })
    </script>
</head>
<body>
    <%-- 为echars准备一个具备大小的DOM--%>
    <div id="main" style="width: 1000px;height: 1200px">

    </div>
</body>
</html>
