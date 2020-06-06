<%--
  Created by IntelliJ IDEA.
  User: JackW
  Date: 2019/6/29
  Time: 15:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>无标题文档</title>
    <base href="https://www.maxinyu.wang/">
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <script src="js/jquery.js"></script>
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


</head>


<body>

<div class="place">
<%--    <span>位置：</span>--%>
<%--    <ul class="placeul">--%>
<%--        <li><a href="#">人员列表</a></li>--%>
<%--    </ul>--%>
</div>

<div class="rightinfo">


    <div class="formtitle1"><span>人员列表</span></div>
        <div>
            姓名<input type="text" id="name" name="name" style="border: 1px solid black;width: 200px" class="dfinput"/>
            年龄<input type="text" id="age" name="age" style="border: 1px solid black;width: 200px" class="dfinput"/>
            电话<input type="text" id="phone" name="phone" style="border: 1px solid black;width: 200px" class="dfinput"/>
            身份证<input type="text" id="idCard" name="idCard" style="border: 1px solid black;width: 200px" class="dfinput"/>
<%--            是否外出<input type="text" id="isOut" name="isOut" style="border: 1px solid black" class="dfinput"/>--%>
            <input type="button" value="搜索" onclick="search()" class="btn"/>
        </div>
    <br>
    <br>
    <br>
    <table class="tablelist" >
        <thead>
        <tr>
<%--            <th><input name="" type="checkbox" value="" checked="checked"/></th>--%>
            <th>姓名</th>
            <th>年龄</th>
            <th>性别</th>
            <th>电话</th>
            <th>身份证号</th>
            <th>地址</th>
            <th>是否外出</th>
            <th>是否户主</th>
            <th>操作</th>
        </tr>
        </thead>

        <tbody id="tbody">

        </tbody>
    </table>
    <div class="tip">
        <div class="tiptop"><span>提示信息</span><a></a></div>

        <div class="tipinfo">
            <span><img src="images/ticon.png" /></span>
            <div class="tipright">
                <p>是否确认对信息的修改 ？</p>
                <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
            </div>
        </div>
        <div class="tipbtn">
            <input name="" type="button"  class="sure" value="确定" />&nbsp;
            <input name="" type="button"  class="cancel" value="取消" />
        </div>

    </div>
    <br>
    <br>
</div>
    <div>
        当前是第<input id="pageNum" value="0" type="button" style="color: #66c9f3"></input>   共<input type="button" id="pages" value="0"></input>页
        <input type="button" class="btn"  value="下一页" onclick="jumpNextPage()"/>
        <input type="button" class="btn" value="上一页" onclick="jumpUpPage()"/>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        <a href="https://www.maxinyu.wang/exportInfo"><input type="button" value="导出全部数据" class="btn"/></a>
    </div>
<script type="text/javascript">
    $('.tablelist tbody tr:odd').addClass('odd');
</script>
    <div>
        <input id="text" type="text"/>
        <input type="button" onclick="send()"/>
    </div>
</body>
<script type="text/javascript">
    $(function () {
        findInfo(0);
    })

    function search() {
        findInfo();
    }

    function findInfo(e) {
        var name=$("#name").val();
        var phone=$("#phone").val();
        var age=$("#phone").val();
        var idCard=$("#idCard").val();
        var pageNum=e;
        if(pageNum==null || pageNum==""){
            pageNum=0;
        }
        $.ajax({
            type:"POST",
            url:"https://www.maxinyu.wang/find",
            data:{"pageNum":pageNum,"name":name,"phone":phone,"age":age,"idCard":idCard},
            success:function (result) {
                var str="";
                if(result==null || result==""){
                    str="查无数据";
                }
                for(var i=0;i<result.length;i++){
                    str+='<tr id="'+result[i].idNum+'">\n' +
                        '                <td>'+result[i].name+'</td>\n' +
                        '                <td>'+result[i].age+'</td>\n' +
                        '                <td>'+result[i].gender+'</td>\n' +
                        '                <td>'+result[i].phone+'</td>\n' +
                        '                <td>'+result[i].idCard+'</td>\n' +
                        '                <td>'+result[i].city+''+result[i].address+'</td>\n' +
                        '                <td>'+result[i].isOut+'</td>\n' +
                        '                <td>'+result[i].isHost+'</td>\n' +
                        '                <td>\n' +
                        '                    <a href="personUpdate.jsp?idCard='+result[i].idCard+'">修改</a>\n' +
                        '                    <input type="button" onclick="isdelete('+result[i].idNum+')" value="删除"></input>\n' +
                        '                </td>\n' +
                        '            </tr>\n' +
                                            '<hr>';
                }
                $("#tbody").html(str);

                //分页
                $("#pageNum").attr("value",result[0].pageNum);
                $("#pages").attr("value",result[0].page)
            }
        })
    }

    function isdelete(e) {
        var isdelete=confirm("您确定删除吗?")
        if(isdelete==true){
            $.ajax({
                type:"POST",
                url:"https://www.maxinyu.wang/deleteByIdNum/"+e,
                success:function (result) {
                   if(result>0){
                       alert("删除成功")
                       $("#"+e+"").remove();
                   }
                }
            })
        }
    }

    function jumpNextPage() {
        var nextpage=$("#pageNum").val();
        var pages=$("#pages").val();
        if(nextpage==pages){
            alert("当前已经是最后一页");
            return;
        }
        findInfo(nextpage);
    }

    function jumpUpPage() {
        var uppage=$("#pageNum").val();
        if(uppage==1){
            alert("当前已经是第一页");
            return
        }
        findInfo(uppage-1);
    }

    function exportInfo() {

    }
    //=========================================websocket
    // var websocket = null;
    //
    // //判断当前浏览器是否支持WebSocket  ,主要此处要更换为自己的地址
    // if('WebSocket' in window){
    //     websocket = new WebSocket("ws://127.0.0.1:8082/wsdemo");
    // }
    // else{
    //     alert('Not support websocket')
    // }
    //
    // //连接发生错误的回调方法
    // websocket.onerror = function(){
    //     alert("发生错误")
    // };
    //
    // //连接成功建立的回调方法
    // websocket.onopen = function(event){
    //     alert("链接成功")
    // }
    //
    // //接收到消息的回调方法
    // websocket.onmessage = function(event){
    //     alert("收到消息"+event.data)
    // }
    //
    // //连接关闭的回调方法
    // websocket.onclose = function(){
    //    alert("连接关闭")
    // }
    //
    // //监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
    // window.onbeforeunload = function(){
    //     websocket.close();
    // }
    //
    // //将消息显示在网页上
    // // function setMessageInnerHTML(innerHTML){
    // //     document.getElementById('message').innerHTML += innerHTML + '<br/>';
    // // }
    //
    // //关闭连接
    // function closeWebSocket(){
    //     websocket.close();
    // }
    //
    // //发送消息
    // function send(){
    //     var message = document.getElementById('text').value;
    //     websocket.send(message);
    // }
</script>
</html>

