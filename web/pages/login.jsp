
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
</head>
<body>


<div style="color: red">${msg}</div>

<form action="${pageContext.request.contextPath}/saveLogin" method="post">

    用户名:<input name="userName" type="text"/><br/>
    密码:<input name="password" type="password"/><br/>

    <input type="submit" value="登录"/>


</form>

</body>
</html>
