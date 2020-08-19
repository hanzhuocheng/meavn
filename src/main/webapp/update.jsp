<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/8/13
  Time: 9:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="update" method="post" enctype="multipart/form-data">
            <input type="hidden" name="gid" value="${list.gid}">
        名称：<input type="text" name="gname" value="${list.gname}"><br>
        价格：<input type="text" name="price" value="${list.price}"><br>
        照片：<input type="file" name="myfile" value="${list.photo}"><br>
        <img alt="图片错误" src="lookImg?path=${list.photo}" width="50px" height="50px">
        <br>
        日期：<input type="date" name="gdate" value="${list.gdate}"><br>
        <input type="submit" value="修改">
    </form>
</body>
</html>
