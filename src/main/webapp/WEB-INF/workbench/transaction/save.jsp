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
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/jquery/bs_typeahead/bootstrap3-typeahead.min.js"></script>

</head>
<body>

<!-- 查找市场活动 -->
<div class="modal fade" id="findMarketActivity" role="dialog">
    <div class="modal-dialog" role="document" style="width: 80%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title">查找市场活动</h4>
            </div>
            <div class="modal-body">
                <div class="btn-group" style="position: relative; top: 18%; left: 8px;">
                        <div class="form-group has-feedback">
                            <input type="text" class="form-control" id="searchActivity" style="width: 300px;"
                                   placeholder="请输入市场活动名称，支持模糊查询">
                            <span class="glyphicon glyphicon-search form-control-feedback"></span>
                        </div>
                </div>
                <table id="activityTable3" class="table table-hover"
                       style="width: 900px; position: relative;top: 10px;">
                    <thead>
                    <tr style="color: #B3B3B3;">
                        <td></td>
                        <td>名称</td>
                        <td>开始日期</td>
                        <td>结束日期</td>
                        <td>所有者</td>
                    </tr>
                    </thead>
                    <tbody id="activityTbody">

                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" onclick="bindguanxi()" class="btn btn-primary" data-dismiss="modal">关联</button>
            </div>
        </div>
    </div>
</div>

<!-- 查找联系人 -->
<div class="modal fade" id="findContacts" role="dialog">
    <div class="modal-dialog" role="document" style="width: 80%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title">查找联系人</h4>
            </div>
            <div class="modal-body">
                <div class="btn-group" style="position: relative; top: 18%; left: 8px;">
                    <form class="form-inline" role="form">
                        <div class="form-group has-feedback">
                            <input type="text" class="form-control" style="width: 300px;" placeholder="请输入联系人名称，支持模糊查询">
                            <span class="glyphicon glyphicon-search form-control-feedback"></span>
                        </div>
                    </form>
                </div>
                <table id="activityTable" class="table table-hover" style="width: 900px; position: relative;top: 10px;">
                    <thead>
                    <tr style="color: #B3B3B3;">
                        <td></td>
                        <td>名称</td>
                        <td>邮箱</td>
                        <td>手机</td>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td><input type="radio" name="activity"/></td>
                        <td>李四</td>
                        <td>lisi@bjpowernode.com</td>
                        <td>12345678901</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="activity"/></td>
                        <td>李四</td>
                        <td>lisi@bjpowernode.com</td>
                        <td>12345678901</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>


<div style="position:  relative; left: 30px;">
    <h3>创建交易</h3>
    <div style="position: relative; top: -40px; left: 70%;">
        <button type="button" onclick="createTrans()" class="btn btn-primary">保存</button>
        <button type="button" class="btn btn-default">取消</button>
    </div>
    <hr style="position: relative; top: -40px;">
</div>
<form class="form-horizontal" id="createTransForm" action="${pageContext.request.contextPath}/transaction/createTransaction" role="form" style="position: relative; top: -30px;">
    <div class="form-group">
        <label for="create-transactionOwner" class="col-sm-2 control-label">所有者<span
                style="font-size: 15px; color: red;">*</span></label>
        <div class="col-sm-10" style="width: 300px;">
            <select class="form-control" name="owner" id="create-transactionOwner">
                <c:forEach items="${users}" var="user">
                    <option id="${user.id}">${user.name}</option>
                </c:forEach>
            </select>
        </div>
        <label for="create-amountOfMoney" class="col-sm-2 control-label">金额</label>
        <div class="col-sm-10" style="width: 300px;">
            <input type="text" class="form-control" name="money" id="create-amountOfMoney">
        </div>
    </div>

    <div class="form-group">
        <label for="create-transactionName" class="col-sm-2 control-label">名称<span style="font-size: 15px; color: red;">*</span></label>
        <div class="col-sm-10" style="width: 300px;">
            <input type="text" class="form-control" name="name" id="create-transactionName">
        </div>
        <label for="create-expectedClosingDate" class="col-sm-2 control-label">预计成交日期<span
                style="font-size: 15px; color: red;">*</span></label>
        <div class="col-sm-10" style="width: 300px;">
            <input type="text" class="form-control" name="expecteddate" id="create-expectedClosingDate">
        </div>
    </div>

    <div class="form-group">
        <label for="create-accountName" class="col-sm-2 control-label">客户名称<span
                style="font-size: 15px; color: red;">*</span></label>
        <div class="col-sm-10" style="width: 300px;">
            <input type="hidden" name="customerid" id="customerId">
            <input type="text" class="form-control" id="create-accountName" placeholder="支持自动补全，输入客户不存在则新建">
        </div>
        <label for="create-transactionStage" class="col-sm-2 control-label">阶段<span
                style="font-size: 15px; color: red;">*</span></label>
        <div class="col-sm-10" style="width: 300px;">
            <select class="form-control" name="stage" id="create-transactionStage">
                <c:forEach items="${dictionaryMap.stage}" var="stage">
                    <option value="${stage.value}">${stage.text}</option>
                </c:forEach>
            </select>
        </div>
    </div>

    <div class="form-group">
        <label for="create-transactionType" class="col-sm-2 control-label">类型</label>
        <div class="col-sm-10" style="width: 300px;">
            <select class="form-control" name="type" id="create-transactionType">
                <c:forEach items="${dictionaryMap.transactionType}" var="transactionType">
                    <option value="${transactionType.value}">${transactionType.text}</option>
                </c:forEach>
            </select>
        </div>
        <label for="create-possibility" class="col-sm-2 control-label">可能性</label>
        <div class="col-sm-10" style="width: 300px;">
            <input type="text" class="form-control" name="possibitility" id="create-possibility">
        </div>
    </div>

    <div class="form-group">
        <label for="create-clueSource" class="col-sm-2 control-label">来源</label>
        <div class="col-sm-10" style="width: 300px;">
            <select class="form-control" name="source" id="create-clueSource">
                <c:forEach items="${dictionaryMap.source}" var="source">
                    <option value="${source.value}">${source.text}</option>
                </c:forEach>
            </select>
        </div>
        <label for="create-activitySrc" class="col-sm-2 control-label">市场活动源&nbsp;&nbsp;
            <a href="javascript:void(0);" data-toggle="modal" data-target="#findMarketActivity">
                <span class="glyphicon glyphicon-search"></span></a></label>
        <div class="col-sm-10" style="width: 300px;">
            <input type="hidden" id="activityId" name="activityid">
            <input type="text" class="form-control"  id="create-activitySrc" readonly>
        </div>
    </div>

    <div class="form-group">
        <label for="create-contactsName" class="col-sm-2 control-label">联系人名称&nbsp;&nbsp;
            <a href="javascript:void(0);" data-toggle="modal" data-target="#findContacts"><span
                class="glyphicon glyphicon-search"></span></a></label>
        <div class="col-sm-10" style="width: 300px;">
            <input type="hidden" name="contactsid" value="07df2e7bf94c4e45aaca2d83561521ec">
            <input type="text" class="form-control"  id="create-contactsName">
        </div>
    </div>

    <div class="form-group">
        <label for="create-describe" class="col-sm-2 control-label">描述</label>
        <div class="col-sm-10" style="width: 70%;">
            <textarea class="form-control" rows="3" name="description" id="create-describe"></textarea>
        </div>
    </div>

    <div class="form-group">
        <label for="create-contactSummary" class="col-sm-2 control-label">联系纪要</label>
        <div class="col-sm-10" style="width: 70%;">
            <textarea class="form-control" rows="3" name="contactsummary" id="create-contactSummary"></textarea>
        </div>
    </div>

    <div class="form-group">
        <label for="create-nextContactTime" class="col-sm-2 control-label">下次联系时间</label>
        <div class="col-sm-10" style="width: 300px;">
            <input type="text" class="form-control" name="nextcontacttime" id="create-nextContactTime">
        </div>
    </div>

</form>
</body>
</html>
<script>
    function bindguanxi() {
        //获取勾中的市场活动
        //1把狗中的市场活动名称显示在页面上给用户看
        //2把勾中的市场活动主键放在隐藏域中
        $('#activityId').val($('.son:checked')[0].value)
        $('#create-activitySrc').val($($('.son:checked')[0]).parent().next().text())
    }
    $('#searchActivity').keypress(function (event) {
        if(event.keyCode==13){
            $.ajax({
                url: '${pageContext.request.contextPath}/clue/searchAllActivity',
                data: {
                    'name': $('#searchActivity').val()
                },
                type: 'post',
                dataType: 'json',
                success: function (data) {
                    var dataList = data.list
                    $('#activityTbody').html("")
                    for (var i = 0; i < dataList.length; i++) {
                        $('#activityTbody').append("<tr>\n" +
                            "\t\t\t\t\t\t\t\t<td><input type=\"radio\" name=\"name\" class='son' value=\""+dataList[i].id+"\"> </td>\n" +
                            "\t\t\t\t\t\t\t\t<td>" + dataList[i].name + "</td>\n" +
                            "\t\t\t\t\t\t\t\t<td>" + dataList[i].startDate + "</td>\n" +
                            "\t\t\t\t\t\t\t\t<td>" + dataList[i].endDate + "</td>\n" +
                            "\t\t\t\t\t\t\t\t<td>" + dataList[i].owner + "</td>\n" +
                            "\t\t\t\t\t\t\t</tr>")
                    }
                }

            });
        }
    })
    function createTrans() {
        $('#createTransForm').submit();
    }

    $('#create-transactionStage').change(function () {
        $.post(
            "${pageContext.request.contextPath}/transaction/queryPossibility",
            {"stage": $(this).val()},
            function (data) {
                $('#create-possibility').val(data)
            },
            "json"
        );
    });
    //自动补全功能
    $("#create-accountName").typeahead({
        source: function (customerName, process) {
            $.post(
                "${pageContext.request.contextPath}/workbench/transaction/queryCustomerName",
                {"customerName": customerName},
                function (data) {
                    //alert(data);
                    process(data);
                },
                "json"
            );
        },
        //输入内容后延迟多长时间弹出提示内容
        delay: 1000
    });

    $('#create-accountName').blur(function () {
        $.post(
            "${pageContext.request.contextPath}/transaction/queryIdByName",
            {"customerName": $(this).val()},
            function (data) {
                $('#customerId').val(data.id)
            },
            "json"
        )
    })

    $("#create-expectedClosingDate").datetimepicker({
        language: "zh-CN",
        format: "yyyy-mm-dd",//显示格式
        minView: "month",//设置只显示到月份
        initialDate: new Date(),//初始化当前日期
        autoclose: true,//选中自动关闭
        todayBtn: true, //显示今日按钮
        clearBtn: true,
        pickerPosition: "bottom-left"
    });
    $("#create-nextContactTime").datetimepicker({
        language: "zh-CN",
        format: "yyyy-mm-dd",//显示格式
        minView: "month",//设置只显示到月份
        initialDate: new Date(),//初始化当前日期
        autoclose: true,//选中自动关闭
        todayBtn: true, //显示今日按钮
        clearBtn: true,
        pickerPosition: "bottom-left"
    });
</script>