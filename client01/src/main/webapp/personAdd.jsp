
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>无标题文档</title>
<%--    <base href="https://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/">--%>
    <base href="https://www.maxinyu.wang/">
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery.js"></script>
    <script src="js/autocomplete.js"> </script>
</head>

<body>

<div class="formbody">

    <div class="formtitle"><span>基本信息</span></div>
    <form action="https://www.maxinyu.wang/save" method="post">
        <ul class="forminfo">
            <li><label>姓名</label><input name="name" id="name" type="text" class="dfinput" /> </li>
            <li>
                <label>性别</label>
                <input name="gender" type="radio" value="男" checked="checked"/>男
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input name="gender" type="radio" value="女"/>女
            </li>
            <li><label>年龄</label><input name="age" id="age" type="text" class="dfinput"/> </li>
            <li><label>身份证号</label><input id="idCard" id="idCard" name="idCard" type="text" class="dfinput" pattern="^\d{15}|\d{18}$" placeholder=""/></li>
            <li><label>电话号</label><input name="phone" type="text" class="dfinput" pattern="^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$" placeholder=""/></li>
            <li><label>所在区域</label>
                <select id="province" onchange="findcity()"  class="dfinput" style="width: 100px"></select>&nbsp;
                <select id="cityname" onchange="findcounty()"  class="dfinput" style="width: 100px"><option value="请选择城市">张家口市</option></select>&nbsp;
                <select id="county"  class="dfinput" onchange="changcity()" style="width: 100px"><option value="请选择区县">张北县</option></select>
                <input name="city" id="city" type="hidden" id="city"/>
            </li>

            <li><label>详细地址</label><input name="address" type="text" class="dfinput" /></li>
            <li>
                <label>是否外出</label>
                <input name="isOut" type="radio" value="是" checked="checked"/>是
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input name="isOut" type="radio" value="否"/>否
            </li>
            <li>
                <label>是否户主</label>
                <input name="isHost" type="radio" value="是" onclick="delteli()"/>是
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input name="isHost" type="radio" value="否"  checked="checked" onclick="showli()"/>否
            </li>
            <li id="hostli"><label>所属户主</label>
<%--                <td><input id="hostNum" name="hostNum" type="text " class="dfinput" onchange="find()"></td>--%>
                <td><input class="dfinput" id="hostNum" name="hostNum" type="text"
                           onkeyup="getLinkData();" />
                    <div id="popup" style="position: absolute;">
                        <table width="100%" bgcolor="#fffafa">
                            <tbody id="popupBody"></tbody>
                        </table>
                    </div>
                </td>
            </li>
            <li><label>&nbsp;</label><input name="" type="submit" class="btn" value="确认保存" onclick="return isempty()"/></li>
        </ul>
    </form>
</div>
</body>
<script type="text/javascript">
    $(function () {
        //页面加载完成之后加载省份信息
        findprovince();
    })
    //省
    function findprovince() {
        $.ajax({
            type:"POST",
            url:"https://www.maxinyu.wang/findArea",
            data:{"parentid":"0"},
            success(data){
                var opt="<option value='请选择省份'>河北省</option>";
                for(var i=0;i<data.length;i++){
                    opt+='<option value="'+data[i].areaid+'">'+data[i].areaname+'</option>';
                }
                $("#province").html(opt);
            }
        });
        // findcity();
    }
    //市
    function findcity() {
        var parentid=$("#province").val();
        $.ajax({
            type:"POST",
            url:"https://www.maxinyu.wang/findArea",
            data:{"parentid":parentid},
            success(data){
                var opt="";
                for(var i=0;i<data.length;i++){
                    opt+='<option value="'+data[i].areaid+'">'+data[i].areaname+'</option>';
                }
                $("#cityname").html(opt);
            }
        });
        // findcounty();
    }
    //县(区)
    function findcounty() {
        var parentid=$("#cityname").val();
        $.ajax({
            type:"POST",
            url:"https://www.maxinyu.wang/findArea",
            data:{"parentid":parentid},
            success(data){
                var opt="";
                for(var i=0;i<data.length;i++){
                    opt+='<option value="'+data[i].areaid+'">'+data[i].areaname+'</option>';
                }
                $("#county").html(opt);
            }
        });
    }

    function changcity() {
        var province=$("#province option:selected");
        var cityname=$("#cityname option:selected");
        var county=$("#county option:selected");
        // alert(province.text()+cityname.text()+county.text());
        $("#city").val(province.text()+cityname.text()+county.text());
    }

    function getLinkData() {
        var popupDiv = document.getElementById("popup");//获得对应的div对象
        var popupBody = document.getElementById("popupBody");//获得对应的tbody对象
        var hostNum = document.getElementById("hostNum"); //获得对应的输入框对象
        clearModels();//清除联想输入提示框的内容
        //利用ajax获取后台的模糊查询的数据，并且封装成下拉列表的形式展现出来
        $.ajax({
            type : "post",//提交的方法为post
            url : "https://www.maxinyu.wang/find",//对应的Action提交的路径
            data:{"name":hostNum.value,"pageNum":0},//从前台传递到后台的查询语句的参数
            dataType : "json",  //从Action中返回的数据的类型为json类型的
            error:function(){
                alert("没有对应的数据，请查看输入的查询条件！");
            },
            success : function(data) {//当Ajax提交成功时调用的方法
                if(data.length==0){
                    alert("找不到户主信息,请确认")
                    }
                setOffsets();//设置联想输入下拉列表提示框的位置
                var tr,td,text;
                for (var i = 0; i < data.length; i++) {//根据返回的值，手动的拼tbody的内容
                    text = document.createTextNode(data[i].name+"-"+data[i].idCard);//从Action中返回的数据中取出hostNum的值
                    td = document.createElement("td");//创建一个td的对象
                    tr = document.createElement("tr");//创建一个tr的对象
                    td.mouseOver = function(){this.className="mouseOver;"};
                    td.mouseOut = function(){this.className="mouseOut;"};
                    td.onclick = function(){populateModel(this)};//单击td是的方法为populateModel
                    td.appendChild(text);
                    tr.appendChild(td);
                    popupBody.appendChild(tr);
                }
            }});
        //点击下拉列表中的某个选项时调用的方法
        function populateModel(cell) {
            clearSelect();
            hostNum.value = cell.firstChild.nodeValue;
            //initOtherData(hostNum.value);利用输入框中的数据调用其他方法，初始化其他数据
            clearModels();//清除自动完成行
        }
        //清除自动完成行，只要tbody有子节点就删除掉，并且将将外围的div的边框属性设置为不可见的
        function clearModels() {
            while (popupBody.childNodes.length > 0) {
                popupBody.removeChild(popupBody.firstChild);
            }
            popupDiv.style.border = "none";
        }
        //设置下拉列表的位置和样式
        function setOffsets() {
            var width = hostNum.offsetWidth;//hostNum
            var left = getLeft(hostNum);
            var top = getTop(hostNum) + hostNum.offsetHeight;

            popupDiv.style.border = "black 1px solid";
            popupDiv.style.left = left + "px";
            popupDiv.style.top = top + "px";
            popupDiv.style.width = width + "px";
        }
        //获取指定元素在页面中的宽度起始位置
        function getLeft(e) {
            var offset = e.offsetLeft;
            if (e.offsetParent != null) {
                offset += getLeft(e.offsetParent);
            }
            return offset;
        }
        //获取指定元素在页面中的高度起始位置
        function getTop(e) {
            var offset = e.offsetTop;
            if (e.offsetParent != null) {
                offset += getTop(e.offsetParent);
            }
            return offset;
        }
    }

    //清空输入框中的数据
    function clearSelect() {
        $("#hostNum").html("");
    };

    function showli() {
        document.getElementById("hostli").setAttribute("style","display:block");
    };
    function delteli() {
        document.getElementById("hostli").setAttribute("style","display:none");
    };
    //判断信息是否为空
    function isempty() {
        var name=$("#name").val();
        var age=$("#age").val();
        var idCard=$("#idCard").val();
        var city=$("#city").val();

        if(name=="" && age =="" && idCard=="" && city==""){
            alert("信息不能为空,请确认")
            return false;
        }
        return true;
    }
</script>

</html>
