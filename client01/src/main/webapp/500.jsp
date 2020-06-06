<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>错误提示页面</title>
  </head>
  <body>
  <div style="margin-bottom: 300px;margin-left: 300px">
    <p style="color: red">系统出错 ,请返回重试</p>
    <a href="personList.jsp">返回</a>
    <p>${code}</p>
    <p>${msg}</p>
  </div>
  </body>
</html>
