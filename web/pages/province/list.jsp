<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2020/12/12
  Time: 20:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="${pageContext.request.contextPath}js/jquery-3.5.1.min.js"></script>
<html>
<head>
    <title>Title</title>
</head>
<body>

    <c:forEach var="province" items="${provinceList}">
        ${province.pid} ${province.pname}  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a onclick='del( "${province.pid}","${province.pname}")' >删除</a><br/>
    </c:forEach>
<script>
    function del(pid,pname) {
        if(confirm("确定删除"+pname+"吗？")){
            location.href="${pageContext.request.contextPath}/province/delete?id="+pid+""
        }
    }

</script>
</body>
</html>
