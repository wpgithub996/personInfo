<%--
  Created by IntelliJ IDEA.
  User: JackW
  Date: 2019/7/2
  Time: 19:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <base href="<%=request.getScheme()%>://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>无标题文档</title>
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="css/select.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="js/jquery.js"></script>

    <script type="text/javascript" src="js/jquery.idTabs.min.js"></script>
    <script type="text/javascript" src="js/select-ui.min.js"></script>
    <script type="text/javascript" src="editor/kindeditor.js"></script>
    <script type="text/javascript">
        $(document).ready(function(e) {
            $(".select1").uedSelect({
                width : 200
            });

        });
    </script>
    <script type="text/javascript">
        $(document).ready(function(){
            $(".click").click(function(){
                $(".tip").fadeIn(200);
            });

            $(".tiptop a").click(function(){
                $(".tip").fadeOut(200);
            });

            $(".sure").click(function(){
                $(".tip").fadeOut(100);
            });

            $(".cancel").click(function(){
                $(".tip").fadeOut(100);
            });

        });
    </script>
    <script type="text/javascript">
        $(function () {
           // alert("OK")
            $.ajax({
                type:"POST",
                url:"servlet/DepartmentServlet?method=findAlldept",
                dataType:"text",
                success:function (result) {
                    eval("var arr="+result)
                    var str="<option value='0'>--不限--</option>";
                    for(var i=0;i<arr.length;i++){
                        str+="<option value='"+arr[i].deptno+"'>"+arr[i].deptname+"</option>";
                    }
                    $("#deptno").html(str);
                    dutyInfo();
                }
            })

        })
        function dutyInfo() {
            var empId=$("#empId").val();
            var deptno=$("#deptno").val();
            var dtdate=$("#signin").val();
            $.ajax({
                type:"POST",
                url:"servlet/DutyServlet?method=dutyInfo",
                data:{"empId":empId,"deptno":deptno,"dtdate":dtdate},
                success:function (result) {
                   eval("var arr="+result)
                    var str="";
                   for(var i=0;i<arr.length;i++){
                       str+='<tr>' +
                           '<td>' +
                           '<input name="" type="checkbox" value="" />' +
                           '</td>' +
                           '<td>'+arr[i].empId+'</td>' +
                           '<td>'+arr[i].employee.realName+'</td>' +
                           '<td>'+arr[i].employee.dept.deptname+'</td>' +
                           '<td>'+arr[i].dtDate+'</td>' +
                           '<td>'+arr[i].signinTime+'</td>' +
                           '<td>'+arr[i].signoutTime+'</td>' +
                           '</tr>';
                   }
                   $("#tbody").html(str);
                }
            })
        }

        function exportXsl() {
            var empId=$("#empId").val();
            var deptno=$("#deptno").val();
            var dtdate=$("#signin").val();
            location.href="servlet/DutyServlet?method=exportXsl&empId="+empId+"&deptno="+deptno+"&dtdate="+dtdate;
        }
    </script>

</head>

<body>

<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li><a href="#">考勤管理</a></li>
        <li><a href="#">考勤管理</a></li>
    </ul>
</div>

<div class="rightinfo">

    <ul class="prosearch">
        <li>
            <label>查询：</label><i>用户名</i>
            <a>
                <input name="empId" id="empId" type="text" class="scinput" />
            </a><i>所属部门</i>
            <a>
                <select class="select1" name="deptno" id="deptno">

                </select>
            </a>
            <i>考勤时间</i>
            <a>
                <input name="signin" type="text" class="scinput" />
            </a>
            <a>
                <input name="" type="button" class="sure" value="查询" onclick="dutyInfo()"/>

            </a>
            <a>
                <input name="" type="button" class="scbtn2" value="导出" onclick="exportXsl()"/>

            </a>

        </li>


    </ul>

    <div class="formtitle1"><span>考勤管理</span></div>

    <table class="tablelist">
        <thead>
        <tr>
            <th>
                <input name="" type="checkbox" value="" checked="checked" />
            </th>
            <th>用户名<i class="sort"><img src="images/px.gif" /></i></th>
            <th>真实姓名</th>
            <th>所属部门</th>
            <th>出勤日期</th>
            <th>签到时间</th>
            <th>签退时间</th>
        </tr>
        </thead>
        <tbody id="tbody">

        </tbody>
    </table>

    <div class="pagin">
        <div class="message">共<i class="blue">1256</i>条记录，当前显示第&nbsp;<i class="blue">2&nbsp;</i>页</div>
        <ul class="paginList">
            <li class="paginItem"><a href="javascript:;"><span class="pagepre"></span></a></li>
            <li class="paginItem"><a href="javascript:;">1</a></li>
            <li class="paginItem current"><a href="javascript:;">2</a></li>
            <li class="paginItem"><a href="javascript:;">3</a></li>
            <li class="paginItem"><a href="javascript:;">4</a></li>
            <li class="paginItem"><a href="javascript:;">5</a></li>
            <li class="paginItem more"><a href="javascript:;">...</a></li>
            <li class="paginItem"><a href="javascript:;">10</a></li>
            <li class="paginItem"><a href="javascript:;"><span class="pagenxt"></span></a></li>
        </ul>
    </div>

    <div class="tip">
        <div class="tiptop"><span>提示信息</span>
            <a></a>
        </div>

        <div class="tipinfo">
            <span><img src="images/ticon.png" /></span>
            <div class="tipright">
                <p>是否确认对信息的修改 ？</p>
                <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
            </div>
        </div>

        <div class="tipbtn">
            <input name="" type="button" class="sure" value="确定" />&nbsp;
            <input name="" type="button" class="cancel" value="取消" />
        </div>

    </div>

</div>

<script type="text/javascript">
    $('.tablelist tbody tr:odd').addClass('odd');
</script>

</body>

</html>