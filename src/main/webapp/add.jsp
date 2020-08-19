<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/8/12
  Time: 13:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="add" method="post" enctype="multipart/form-data">
        名称：<input type="text" name="gname"><br>
        价格：<input type="text" name="price"><br>
        照片：<input type="file" name="myfile"><br>
        日期：<input type="date" name="gdate"><br>
        <input type="submit" value="添加">
    </form>
</body>
</html>
