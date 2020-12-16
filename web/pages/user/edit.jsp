<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2020/12/8
  Time: 16:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<center>
    <form action="${pageContext.request.contextPath}/user/save" method="post">
        <table border="1px" cellspacing="0" cellpadding="20px">
            <input type="hidden" name="id" value="${user.id}">
            <tr>
                <td>用户名<input type="text" name="userName" value="${user.userName}"></td>
            </tr>
            <tr>
                <td>真实姓名<input type="text" name="realName" value="${user.realName}"></td>
            </tr>
            <tr>
                <td>用户性别<input type="radio" name="sex" value="男"${user.sex eq '男' ? "checked='checked'":""}>男
                    <input type="radio" name="sex" value="女"${user.sex eq '女' ? "checked='checked'":""}>女
                </td>
            </tr>
            <tr>
                <td>手机号<input type="text" name="mobile" value="${user.mobile}"></td>
            </tr>
            <tr>
                <td>邮箱<input type="text" name="email" value="${user.email}"></td>
            </tr>
            <tr>
                <td><select name="positionId">
                    <option value="0">请选择地区</option>
                    <c:forEach var="province" items="${provinceList}">
                        <option value="${province.pid}" ${user.positionId eq province.pid ? "selected='selected'" : ""} >${province.pname} </option>
                    </c:forEach>
                </select>
                </td>
            </tr>
            <tr>
                <td align="center"><input type="submit" value="提交"></td>
            </tr>
        </table>
    </form>

</center>
</body>
</html>
