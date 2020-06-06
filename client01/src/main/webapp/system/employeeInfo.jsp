<%--
  Created by IntelliJ IDEA.
  User: JackW
  Date: 2019/7/1
  Time: 21:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <base href="<%=request.getScheme()%>://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>无标题文档</title>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="css/select.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/jquery.idTabs.min.js"></script>
    <script type="text/javascript" src="js/select-ui.min.js"></script>
    <script type="text/javascript" src="editor/kindeditor.js"></script>
    <script type="text/javascript">
        $(document).ready(function(e) {
            $(".select1").uedSelect({
                width : 345
            });

        });
    </script>
</head>

<body>

<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li><a href="#">人事管理</a></li>
        <li><a href="#">员工信息详情</a></li>
    </ul>
</div>

<div class="formbody">
    <form action="servlet/EmployeeServlet?method=findAllEmp" method="post">
        <div class="formtitle"><span>基本信息</span></div>
        <c:forEach items="${requestScope.empList}" var="emp">
            <ul class="forminfo">
                <li>
                    <label>用户名</label>
                    <label>${emp.empId}</label>
                </li>
                <li>
                <li>
                    <label>真实姓名</label>
                    <label>${emp.realName}</label>
                </li>
                <li>
                    <label>性别</label>
                    <label>${emp.sex}</label>
                </li>
                <li>
                    <label>出生日期</label>
                    <label>${emp.birthDate}</label>
                </li>
                <li>
                <li>
                    <label>入职时间</label>
                    <label>${emp.hireDate}</label>
                </li>

                <li>
                    <label>离职时间</label>
                    <label>${emp.leaveDate}</label>
                </li>
                <li>
                    <label>是否在职</label>
                    <c:if test="${emp.onDuty ==1}">
                        <label>在职</label>
                    </c:if>
                    <c:if test="${emp.onDuty ==0}">
                        <label>离职</label>
                    </c:if>

                </li>
                <li>
                    <label>所属部门<b>*</b></label>
                    <label>${emp.dept.deptname}</label>

                </li>
                <li>
                    <label>直接上级<b>*</b></label>
                    <label>${emp.emp_empID}<b>*</b></label>
                </li>
                </li>
                <li>
                    <label>联系方式</label>
                    <label>${emp.phone}</label>
                </li>
                <li>
                    <label>QQ号</label>
                    <label>${emp.qq}</label>
                </li>
                <li>
                    <label>紧急联系人信息</label>
                    <label>${emp.emerContactPerson}</label>
                </li>
                <li>
                    <label>身份证号</label>
                    <label>${emp.idCard}</label>
                </li>
                <li>
                    <label>&nbsp;</label>
                    <input name="" type="submit" class="btn" value="返回" />
                </li>
            </ul>
        </c:forEach>
    </form>

</div>

</body>

</html>