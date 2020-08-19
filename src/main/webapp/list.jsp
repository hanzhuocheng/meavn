<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/8/12
  Time: 10:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script type="application/javascript" src="js/jquery-1.8.2.min.js"></script>
    <script type="application/javascript">
        function del(a) {
            location="del?gid="+a;
        }
        function update(a) {
            location="hx?gid="+a;
        }
    </script>
</head>
<body>

    <table border="2">
        <tr>
            <td colspan="10">
                <form action="list">
                    <input type="text" name="gname">
                    <input type="submit" value="查找">
                    <a href="add.jsp">添加</a>
                </form>
            </td>
        </tr>
        <tr>
            <td>编号</td>
            <td>名称</td>
            <td>单价</td>
            <td>图片</td>
            <td>日期</td>
            <td>操作</td>
        </tr>
        <c:forEach items="${list.list}" var="a">
            <tr>
                <td>${a.gid}</td>
                <td>${a.gname}</td>
                <td>${a.price}</td>
                <td>
                    <img alt="图片错误" src="lookImg?path=${a.photo}" width="50px" height="50px">
                </td>
                <td>${a.gdate}</td>
                <td>
                    <input type="button" value="修改" onclick="update(${a.gid})">
                    <input type="button" value="删除" onclick="del(${a.gid})">
                </td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="10">
                当前${list.pageNum}/${list.pages},共${list.total}条
                <a href="list?pageNum=1">首页</a>
                <a href="list?pageNum=${list.pageNum-1}">上一页</a>

                <c:forEach begin="1" end="${list.pages}" step="1" var="num">
                    <a href="list?pageNum=${num}">${num}</a>
                </c:forEach>

                <a href="list?pageNum=${list.pageNum+1}">下一页</a>
                <a href="list?pageNum=${list.lastPage}">末页</a>
            </td>
        </tr>
    </table>
</body>
</html>
