<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <link href="${pageContext.request.contextPath}/jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css"
          rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/jquery/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css"
          type="text/css" rel="stylesheet"/>

    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery/jquery-1.11.1-min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/jquery/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/jquery/bootstrap-datetimepicker-master/locale/bootstrap-datetimepicker.zh-CN.js"></script>

    <script type="text/javascript">

        $(function () {


        });

    </script>
</head>
<body>


<div>
    <div style="position: relative; left: 10px; top: -10px;">
        <div class="page-header">
            <h3>交易列表</h3>
        </div>
    </div>
</div>

<div style="position: relative; top: -20px; left: 0px; width: 100%; height: 100%;">

    <div style="width: 100%; position: absolute;top: 5px; left: 10px;">

        <div class="btn-toolbar" role="toolbar" style="height: 80px;">
            <form class="form-inline" id="tranForm"  role="form" style="position: relative;top: 8%; left: 5px;">

                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon">所有者</div>
                        <input class="form-control" name="owner" type="text">
                    </div>
                </div>

                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon">名称</div>
                        <input class="form-control" name="name" type="text">
                    </div>
                </div>

                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon">客户名称</div>
                        <input class="form-control" name="customerName" type="text">
                    </div>
                </div>

                <br>

                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon">阶段</div>
                        <select name="stage" class="form-control">
                            <option></option>
                         <c:forEach items="${dictionaryMap.stage}" var="stage">
                             <option value="${stage.value}">${stage.text}</option>
                         </c:forEach>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon">类型</div>
                        <select name="type" class="form-control">
                            <option></option>
                          <c:forEach var="transactionType" items="${dictionaryMap.transactionType}">
                              <option value="${transactionType.value}">
                                  ${transactionType.text}
                              </option>
                          </c:forEach>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon">来源</div>
                        <select name="source" class="form-control" id="create-clueSource">
                            <option></option>
                         <c:forEach items="${dictionaryMap.source}" var="source">
                             <option value="${source.value}">
                                 ${source.text}
                             </option>
                         </c:forEach>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon">联系人名称</div>
                        <input name="contactName" class="form-control" type="text">
                    </div>
                </div>

                <button type="button" onclick="refresh()" class="btn btn-default">查询</button>

            </form>
        </div>
        <div class="btn-toolbar" role="toolbar"
             style="background-color: #F7F7F7; height: 50px; position: relative;top: 10px;">
            <div class="btn-group" style="position: relative; top: 18%;">
                <button type="button" class="btn btn-primary"
                        onclick="window.location.href='${pageContext.request.contextPath}/transaction/save';"><span
                        class="glyphicon glyphicon-plus"></span> 创建
                </button>
                <button type="button" class="btn btn-default" onclick="window.location.href='edit.html';"><span
                        class="glyphicon glyphicon-pencil"></span> 修改
                </button>
                <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-minus"></span> 删除</button>
            </div>


        </div>
        <div style="position: relative;top: 10px;">
            <table class="table table-hover">
                <thead>
                <tr style="color: #B3B3B3;">
                    <td><input type="checkbox"/></td>
                    <td>名称</td>
                    <td>客户名称</td>
                    <td>阶段</td>
                    <td>类型</td>
                    <td>所有者</td>
                    <td>来源</td>
                    <td>联系人名称</td>
                </tr>
                </thead>
                <tbody id="tranBody">

                </tbody>
            </table>
        </div>

        <div style="height: 50px; position: relative;top: 20px;">
            <div>
                <button type="button" class="btn btn-default" style="cursor: default;">共<b>50</b>条记录</button>
            </div>
            <div class="btn-group" style="position: relative;top: -34px; left: 110px;">
                <button type="button" class="btn btn-default" style="cursor: default;">显示</button>
                <div class="btn-group">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                        10
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#">20</a></li>
                        <li><a href="#">30</a></li>
                    </ul>
                </div>
                <button type="button" class="btn btn-default" style="cursor: default;">条/页</button>
            </div>
            <div style="position: relative;top: -88px; left: 285px;">
                <nav>
                    <ul class="pagination">
                        <li class="disabled"><a href="#">首页</a></li>
                        <li class="disabled"><a href="#">上一页</a></li>
                        <li class="active"><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li><a href="#">下一页</a></li>
                        <li class="disabled"><a href="#">末页</a></li>
                    </ul>
                </nav>
            </div>
        </div>

    </div>

</div>
</body>
</html>
<script>
    //第一次进入到列表页面，要查询第一页数据
    refresh();

    //刷新页面的方法
    function refresh() {
        //异步查询所有市场活动信息
        $.ajax({
            url: '${pageContext.request.contextPath}/transaction/listTran',
            data:
                $('#tranForm').serialize()
            ,
            type: 'get',
            dataType: 'json',
            success: function (data) {
                $('#tranBody').html("");
                for (var i = 0; i < data.length; i++) {
                    $('#tranBody').append("   <tr class=\"active\">\n" +
                        "                            <td><input type=\"checkbox\" /></td>\n" +
                        "                            <td><a style=\"text-decoration: none; cursor: pointer;\" href='${pageContext.request.contextPath}/transaction/detail?tranId="+data[i].id+"' \">" + data[i].name + "</a></td>\n" +
                        "                            <td>" + data[i].customerid + "</td>\n" +
                        "                            <td>" + data[i].stage + "</td>\n" +
                        "                            <td>" + data[i].type + "</td>\n" +
                        "                             <td>" + data[i].owner + "</td>\n" +
                        "                            <td>" + data[i].source + "</td>\n" +
                        "                            <td>" + data[i].createby + "</td>\n" +
                        "                        </tr>");
                }
            }
        });
    }
</script>