<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2020/12/7
  Time: 13:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生管理系统</title>
</head>
<script src="/ssmsecond/js/jquery-3.5.1.min.js"></script>
<body>
<a href="${pageContext.request.contextPath}/index.jsp">返回首页</a>
<table border="1px" cellspacing="0" cellpadding="30px" align="center">
    <tr>
        <th colspan="9">
            <label><h1 align="center">用户信息</h1></label>
        </th>
    </tr>

    <form action="${pageContext.request.contextPath}/user/list" method="post">
        <tr>
            <td colspan="9">
                用户名<input type="text" name="userName" value="${user.userName}">
                &nbsp&nbsp&nbsp&nbsp
                省份
                <select name="positionId">
                    <option value="0">请选择地区</option>
                    <c:forEach var="province" items="${provinces}">
                        <option value="${province.pid}" ${user.positionId eq province.pid ? "selected='selected'" : ""} >${province.pname} </option>
                    </c:forEach>
                </select>
                &nbsp&nbsp&nbsp&nbsp
                用户性别<input type="radio" name="sex" value=""  ${empty user.sex ?"checked='checked'":""}  />不限
                <input type="radio" name="sex" value="男" ${user.sex eq '男' ? "checked='checked'":""}>男
                <input type="radio" name="sex" value="女" ${user.sex eq '女' ? "checked='checked'":""}>女
                &nbsp&nbsp&nbsp&nbsp
                手机号<input type="text" name="mobile" value="${user.mobile}">
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                <input type="submit" value="提交">
            </td>
        </tr>
    </form>

    <tr>
        <td>
            <button onclick="delBatch1()">批量删除</button>
        </td>
        <th>用户名</th>
        <th>真实姓名</th>
        <th>用户性别</th>
        <th>手机号</th>
        <th>邮箱</th>
        <th>地区</th>
        <th colspan="2">操作</th>
    </tr>
    <form id="userForm" action="${pageContext.request.contextPath}/user/delBatch" method="post">
    <c:forEach var="user" items="${pageInfo.list}">
        <tr>

            <td><input type="checkbox" class="son" name=ids value="${user.id}"></td>
            <td>${user.userName}</td>
            <td>${user.realName}</td>
            <td>${user.sex}</td>
            <td>${user.mobile}</td>
            <td>${user.email}</td>
            <td>${user.province.pname}</td>
            <td><a href="${pageContext.request.contextPath}/user/edit?id=${user.id}">修改</a></td>
            <td><a class=deleteClass onclick='del("${user.id}","${user.realName}")'>删除</a></td>
        </tr>
    </c:forEach>
    </form>
    <tr>

        <td ></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td colspan="2"><a href="${pageContext.request.contextPath}/user/edit">添加用户</a></td>
    </tr>
</table>


</center>
<%@include file="/inc/pager2.jsp"%>
<%--分页条的结束--%>
</body>
<script>
    function delBatch1() {
        <%--var cids = [];--%>
          <%--if ($('.son:checked').val() > 0) {--%>
              <%--if (confirm("你确定删除吗？")) {--%>
                  <%--$('.son:checked').each(function () {--%>
                      <%--cids.push($(this).val());--%>
                  <%--});--%>
                  <%--location.href = "${pageContext.request.contextPath}/user/delBatch?cids=" + cids.join();--%>
            <%--}--%>
        if ($('[name="ids"]:checked').length > 0) {
            if (confirm("你确定删除吗？")) {
                $("#userForm").submit()
            }
        } else {
            alert("你他妈倒是选一个啊！！！")
        }

    }

    function del(id1, name) {
        if (confirm("你确定删除" + name + "吗？")) {
            location.href = "${pageContext.request.contextPath}/user/del?id=" + id1;
        }
    }
</script>

</html>
