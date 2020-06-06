<%--
  Created by IntelliJ IDEA.
  User: JackW
  Date: 2019/6/30
  Time: 14:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>无标题文档</title>
    <base href="<%=request.getScheme()%>://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/">
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        function isdelete() {
            if(confirm('确定要执行此操作吗?'))
            {
                return true;
            }
            return false;
        }
    </script>

</head>

<body>

<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li><a href="#">人事管理</a></li>
        <li><a href="#">员工管理</a></li>
    </ul>
</div>

<div class="rightinfo">
    <form action="servlet/EmployeeServlet?method=find" method="post">
        <ul class="prosearch">
            <li>
                <label>查询：</label><i>用户名</i>
                <a>
                    <c:if test="${requestScope.empId == empId}">
                        <input name="empId" type="text" class="scinput"  value="${requestScope.empId}"/>
                    </c:if>
                    <c:if test="${requestScope.empId != empId}">
                        <input name="empId" type="text" class="scinput"/>
                    </c:if>
                </a><i>所属部门</i>
                <a>
                    <select class="select1" name="deptno">
                            <option value="0">--不限--</option>
                            <c:forEach items="${requestScope.dept}" var="dept">
                                <c:if test="${dept.deptno == deptno}">
                                    <option value="${dept.deptno}" selected>${dept.deptname}</option>
                                </c:if>
                                <c:if test="${dept.deptno != deptno}">
                                    <option value="${dept.deptno}">${dept.deptname}</option>
                                </c:if>
                            </c:forEach>
                    </select>

                </a>

            </li>
            <li>
                <label>是否在职：</label>
                <c:if test="${onDuty == 1}">
                    <input name="onDuty" type="radio" value="-1" />&nbsp;所有&nbsp;&nbsp;
                    <input name="onDuty" type="radio" value="1" checked/>&nbsp;是&nbsp;&nbsp;
                    <input name="onDuty" type="radio" value="0" />&nbsp;否
                </c:if>
                <c:if test="${onDuty == 0}">
                    <input name="onDuty" type="radio" value="-1" />&nbsp;所有&nbsp;&nbsp;
                    <input name="onDuty" type="radio" value="1" />&nbsp;是&nbsp;&nbsp;
                    <input name="onDuty" type="radio" value="0" checked />&nbsp;否
                </c:if>
                <c:if test="${onDuty !=1 && onDuty!=0}">
                    <input name="onDuty" type="radio" value="-1" checked/>&nbsp;所有&nbsp;&nbsp;
                    <input name="onDuty" type="radio" value="1" />&nbsp;是&nbsp;&nbsp;
                    <input name="onDuty" type="radio" value="0" />&nbsp;否
                </c:if>
            </li>
            <li>
                <label>入职时间：</label>
                <a>
                    <c:if test="${requestScope.hireDate == hireDate}">
                        <input name="hireDate" type="text" class="scinput" value="${requestScope.hireDate}" />
                    </c:if>
                    <c:if test="${requestScope.hireDate != hireDate}">
                        <input name="hireDate" type="text" class="scinput" />
                    </c:if>
                </a>
            </li>
            <a>
                <input name="" type="submit" class="sure" value="查询" />
            </a>
        </ul>
    </form>


    <div class="formtitle1"><span>员工列表</span></div>

    <table class="tablelist">
        <thead>
        <tr>
            <th>
                <input name="" type="checkbox" value="" checked="checked" />
            </th>
            <th>用户名<i class="sort"><img src="images/px.gif" /></i></th>
            <th>真实姓名</th>
            <th>所属部门</th>
            <th>所属岗位</th>
            <th>入职时间</th>
            <th>联系方式</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${empBean.list}" var="emp">
            <tr>
                <td>
                    <input name="" type="checkbox" value="" />
                </td>
                <td>${emp.empId}</td>
                <td>${emp.realName}</td>
                <td>${emp.dept.deptname}</td>
                <td>${emp.position.pname}</td>
                <td>${emp.hireDate}</td>
                <td>${emp.phone}</td>
                <td>
                    <a href="servlet/EmployeeServlet?method=show&empId=${emp.empId}" class="tablelink">查看</a>
                    <a href="servlet/EmployeeServlet?method=info&empId=${emp.empId}" class="tablelink">修改</a>
                    <a href="servlet/EmployeeServlet?method=delete&empId=${emp.empId}" class="tablelink click" onclick="return isdelete()"> 删除</a>
                    <a href="servlet/EmployeeServlet?method=reset&empId=${emp.empId}" class="tablelink"> 重置密码</a>
                </td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
    ${success}
    ${error}
    <div class="pagin">
        <div class="message">共<i class="blue">${empBean.totalCount}</i>条记录，
            <a href="servlet/EmployeeServlet?method=find&index=1">首页</a>
            <a href="servlet/EmployeeServlet?method=find&index="+${empBean.totalPageCount}>末页</a>
            当前显示第&nbsp;
            <c:forEach items="${empBean.numbers}" var="num">
                <c:if test="${empBean.index == num}">
                    ${num}
                </c:if>
                <c:if test="${empBean.index != num}">
                    <a href="servlet/EmployeeServlet?method=find&index="+${num}>${num}</a>
                </c:if>
            </c:forEach>
            <i class="blue">&nbsp;</i>页</div>
        <ul class="paginList">
            <li class="paginItem"><a href="javascript:;"><span class="pagepre"></span></a></li>
        </ul>
    </div>

<script type="text/javascript">
    $('.tablelist tbody tr:odd').addClass('odd');
</script>

</body>

</html>