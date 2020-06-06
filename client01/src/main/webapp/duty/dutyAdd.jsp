<%--
  Created by IntelliJ IDEA.
  User: JackW
  Date: 2019/7/2
  Time: 14:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <base href="<%=request.getScheme()%>://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>无标题文档</title>
    <script type="text/javascript" src="js/jquery.js"></script>
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function signin() {
            $.ajax({
                type:"POST",
                url:"servlet/DutyServlet?method=singin",
                success:function (result) {
                    if(result ==1){
                        $("#tip1").html("签到成功")
                    }else if(result ==2){
                        $("#tip1").html("您已签到 无需重复签到")
                    }else {
                        $("#tip1").html("签到失败 ,请联系系统管理员")
                    }
                },
                error:function (xhr) {
                    alert(xhr.statusText+" "+xhr.status)
                }
            })
        }
        function signout() {
            $.ajax({
                type:"POST",
                url:"servlet/DutyServlet?method=signout",
                success:function (result) {
                    if(result ==1){
                        $("#tips2").html("签退成功")
                    }else if(result!=0){
                        $("#tips2").html("签退失败 请确认是否已经签到或联系管理员")
                    }
                },
                error:function (xhr) {
                    alert(xhr.statusText+" "+xhr.status)
                }
            })
        }
    </script>
</head>

<body>

<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li><a href="#">考勤管理</a></li>
        <li><a href="#">签到签退</a></li>
    </ul>
</div>

<div class="formbody">

    <div class="formtitle"><span>基本信息</span></div>

    <ul class="forminfo">
        <li><label>&nbsp;</label><input name="" type="button" class="btn" value="签到" onclick="signin()"/> 每天签到一次，不可重复签到</li>
        <li><label id="tip1">&nbsp;</label></li>
        <li><label>&nbsp;</label></li>
        <li><label>&nbsp;</label><input name="" type="button" class="btn" value="签退" onclick="signout()"/>可重复签退，以最后一次签退为准</li>
        <li><span id="tips2"></span></li>
    </ul>


</div>


</body>

</html>
