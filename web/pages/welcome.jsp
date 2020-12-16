<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2020/12/15
  Time: 8:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>welcome</title>
</head>
<body>
<c:if test="${empty LOGIN_USER}">
    <a href="${pageContext.request.contextPath}/login">登录</a><br/>
</c:if>
<c:if test="${not empty LOGIN_USER}">

    您好，欢迎${LOGIN_USER.userName}使用草泥马人员管理系统！
    <a href="${pageContext.request.contextPath}/logout">退出</a><br/>
</c:if>
    <a href="${pageContext.request.contextPath}/user/list">学生管理系统</a><br/>
    <a href="${pageContext.request.contextPath}/province/list">地区系统</a>


</body>
</html>
