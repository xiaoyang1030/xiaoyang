<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<center>
当前第${pageInfo.pageNum}页，总共${pageInfo.pages}页，总共条${pageInfo.total}记录

<c:if test="${pageInfo.hasPreviousPage}">
    <a href="${pageInfo.url}&page=1">首页</a>
</c:if>

<c:if test="${not pageInfo.hasPreviousPage}">
    首页
</c:if>

<c:if test="${pageInfo.hasPreviousPage}">
    <a href="${pageInfo.url}&page=${pageInfo.pageNum - 1}">上一页</a>
</c:if>

<c:if test="${not pageInfo.hasPreviousPage}">
    上一页
</c:if>


<c:if test="${pageInfo.hasNextPage }">
    <a href="${pageInfo.url}&page=${pageInfo.pageNum + 1}">下一页</a>
</c:if>

<c:if test="${not pageInfo.hasNextPage }">
    下一页
</c:if>


<c:if test="${pageInfo.hasNextPage }">
    <a href="${pageInfo.url}&page=${pageInfo.pages}">尾页</a>
</c:if>

<c:if test="${not pageInfo.hasNextPage }">
    尾页
</c:if>

去 <input onchange="changePage(this);"/>页

去<select onchange="window.location.href='${pageInfo.url}&page=' + this.value">

<c:forEach var="i" begin="1" end="${pageInfo.pages}">
    <option value="${i}" ${pageInfo.pageNum eq i ? "selected='selected'" : ""}>${i}</option>
</c:forEach>

</select>页

<script>
    function changePage(input){

        //1.确保用户输入的页号是纯数字: /^\d+$/

        //2.确保用户输入的页号介于第1-最后一页之间

        //3.跳转
        window.location.href = "${pageInfo.url}&page=" + input.value;

    }

</script>
</center>

