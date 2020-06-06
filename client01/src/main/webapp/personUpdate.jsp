<%--
  Created by IntelliJ IDEA.
  User: JackW
  Date: 2019/7/1
  Time: 22:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <base href="https://www.maxinyu.wang/">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>无标题文档</title>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="css/select.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery.js"></script>
</head>

<body>

<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li><a href="#">人员管理</a></li>
        <li><a href="#">修改人员信息</a></li>
    </ul>
</div>

<div class="formbody">

    <div class="formtitle"><span>基本信息</span></div>
    <form action="https://www.maxinyu.wang/updataInfo" method="post">
        <ul class="forminfo">
            <li><label>Id</label><input name="idNum" id="idNum" type="text" class="dfinput" value=""/> </li>
            <li><label>姓名</label><input name="name" id="name" type="text" class="dfinput" value=""/> </li>
            <li><label>年龄</label><input name="age"  id="age" type="text" class="dfinput" value=""/> </li>
            <li><label>身份证号</label><input id="idCard" value="${param.idCard}" name="idCard" value="" type="text" class="dfinput" pattern="^\d{15}|\d{18}$" placeholder=""/></li>
            <li><label>电话号</label><input name="phone"  id="phone" type="text" value="" class="dfinput" pattern="^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$" placeholder=""/></li>
            <li><label>住址</label><input name="address"  id="address" type="text" value="" class="dfinput" /></li>
            <li><label>&nbsp;</label><input name="" type="submit" class="btn" value="确认修改"/></li>
        </ul>
    </form>

</div>

</body>
<script type="text/javascript">
    $(function () {
        var idCard=$("#idCard").val();
        alert("OK")
        $.ajax({
            type:"POST",
            url:"https://www.maxinyu.wang/findOne/"+idCard,
            success:function (result) {
                alert(result[0].idNum);
                $("#idNum").attr("value",result[0].idNum);
                $("#name").attr("value",result[0].name);
                $("#age").attr("value",result[0].age);
                $("#phone").attr("value",result[0].phone);
                $("#address").attr("value",result[0].address);
            }
        })
    })
</script>
</html>