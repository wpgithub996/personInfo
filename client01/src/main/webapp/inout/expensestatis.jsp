<%--
  Created by IntelliJ IDEA.
  User: JackW
  Date: 2019/7/6
  Time: 15:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" style="height: 100%">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>无标题文档</title>
    <base href="<%=request.getScheme()%>://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/">
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="css/select.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/jquery.idTabs.min.js"></script>
    <script type="text/javascript" src="js/select-ui.min.js"></script>
    <script type="text/javascript" src="editor/kindeditor.js"></script>
    <script type="text/javascript" src="js/echarts.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function(e) {
            $(".select1").uedSelect({
                width : 345
            });

            $("#select1").change();
        });
        $(function () {
            $.ajax({
                type:"POST",
                url:"servlet/InoutServlet?method=getPayment",
                success:function (result) {
                    eval("var arr="+result)
                    var dom = document.getElementById("container");
                    var myChart = echarts.init(dom);
                    var app = {};
                    option = null;
                    option = {
                        title : {
                            text: '尚学堂支出统计',
                            x:'center'
                        },
                        tooltip : {
                            trigger: 'item',
                            formatter: "{a} <br/>{b} : {c} ({d}%)"
                        },
                        legend: {
                            orient: 'vertical',
                            left: 'left',
                            data: arr[0]
                        },
                        series : [
                            {
                                name: '访问来源',
                                type: 'pie',
                                radius : '55%',
                                center: ['50%', '60%'],
                                data:arr[1],
                                itemStyle: {
                                    emphasis: {
                                        shadowBlur: 10,
                                        shadowOffsetX: 0,
                                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                                    }
                                }
                            }
                        ]
                    };
                    ;
                    if (option && typeof option === "object") {
                        myChart.setOption(option, true);
                    }
                }
            })
        })
    </script>
</head>

<body style="height: 100%; margin: 0">
<div style="height: 10%; width: 500px;  margin:0px auto;">
    
</div>

<div id="container" style="height: 85%"></div>


</body>
</html>
