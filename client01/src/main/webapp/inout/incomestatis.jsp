<%--
  Created by IntelliJ IDEA.
  User: JackW
  Date: 2019/7/6
  Time: 11:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  style="height: 100%">
<head>
    <base href="<%=request.getScheme()%>://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>无标题文档</title>

</head>

<body style="height: 100%; margin: 0">
<div >
    <h1 align="center">公司收入统计柱状图</h1>
</div>
<div id="container" style="height: 90%"></div>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/echarts.min.js"></script>
<script type="text/javascript">
    $(function () {
        $.ajax({
            type:"POST",
            url:"servlet/InoutServlet?method=getIncome",
            success:function (result) {
                eval("var arr="+result);
                var dom = document.getElementById("container");
                var myChart = echarts.init(dom);
                var app = {};
                option = null;
                option = {
                    xAxis: {
                        type: 'category',
                        data: arr[0]
                    },
                    yAxis: {
                        type: 'value'
                    },
                    series: [{
                        data:arr[1],
                        type: 'bar'
                    }]
                };
                ;
                if (option && typeof option === "object") {
                    myChart.setOption(option, true);
                }
            }
        })

    })

</script>
</body>
</html>
