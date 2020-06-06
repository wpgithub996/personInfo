<%--
  Created by IntelliJ IDEA.
  User: JackW
  Date: 2019/7/4
  Time: 14:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <base href="<%=request.getScheme()%>://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>审核报销单</title>
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript">
        function submitForm(){
            window.close();
        }

    </script>
    <script type="text/javascript">
        function audit() {
            //获得页面数据
            var expId=$("#expId").val();
            var auditDesc=$("#auditDesc").val();
            var result="";
            var arr=$("input[name=result]");
            for(var i=0;i<arr.length;i++){
                var flag=arr[i].checked;
                if(flag){
                    result=$(arr[i]).val();
                    break;
                }
            }
            $.ajax({
                type:"POST",
                url:"servlet/ExpenseServlet?method=audit",
                data:{expId:expId,result:result,auditDesc:auditDesc},// 21  '同意打款'  '同意'
                dataType:"text",
                success:function (result) {
                    alert("OK");
                    alert(result)
                    window.close();
                    window.opener.location.reload();

                },

            })

        }
    </script>
</head>

<body>

<div class="formtitle"><span>审核报销单</span></div>
<form action="#" onsubmit="return submitForm()">
    <ul class="forminfo">
        <li>
            <span id="span1"></span>
            <label>审核报销单编号</label>
            <input name="expId" id="expId" type="text" class="dfinput" value="${param.expId}"/>
        </li>
        <li>
            <label>审核结果</label>
            <input name="result" type="radio" value="通过"/>通过
            <input name="result" type="radio" value="拒绝"/>拒绝
            <input name="result" type="radio"value="打回"/>打回
        </li>
        <li>
            <label>审核意见</label>
            <input name="auditDesc" type="text" class="dfinput" id="auditDesc"/>
        </li>
        <li>
            <label>&nbsp;</label>
            <input name="" type="submit" class="btn" value="确认保存" onclick="audit()"/>
        </li>
    </ul>
</form>
</body>

</html>